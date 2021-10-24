local e_stop = rc:find_channel_for_option(31)
local sw = rc:find_channel_for_option(300)
local speed_sw = rc:find_channel_for_option(301)
local axis_sw = rc:find_channel_for_option(302)

local active = false

local roll = 0
local pitch = 0
local count = 0
local axis = "roll"

function wrap_180(angle)
    if angle > 180 then
        angle = angle - 360
    end
    if angle < -180 then
        angle = angle + 360
    end
    return angle
end

function update() -- this is the loop which periodically runs

  -- motor state
  local current_active = false

  if arming:is_armed() then
    -- if armed then motors are active
    current_active = true
  end

  if e_stop then
    -- if E-stop switch is setup
    if e_stop:get_aux_switch_pos() == 2 then
      -- E-stop on
      current_active = false
    end
  end

  local speed = 0.05
  if speed_sw then
      speed = speed_sw:norm_input() + 1.05 -- convert +- 1 to 0.25 to 2.25
  end
  speed = speed * 0.8

  if not active and current_active then
    -- Just armed or removed E-stop
    roll = 0
    pitch = 0
    attitude_control:set_offset_roll_pitch(roll,pitch)

    gcs:send_text(0, string.format("Set Offsets Roll: %0.1f, Pitch: %0.1f, %s: Speed %0.2f",roll,pitch,axis,speed))
  end
  active = current_active

  if sw and current_active then
    if sw:get_aux_switch_pos() == 2 then

        if axis == "roll" then
            roll = roll + speed
            pitch = 0
        elseif axis == "pitch" then
            roll = 0
            pitch =  math.sin(math.rad(count*0.3927*speed)) * 80
        else
            -- rotate in roll and pitch to give a 'random' effect
            -- never go over +- 80 deg in pitch to avoid euler angle yaw invert
            pitch =  (math.sin(math.rad(count*0.3927*speed)) * 80) * (0.75 + math.sin(math.rad(count* 0.05*speed))*0.25)
            roll = roll + (math.cos(math.rad(count*0.1*speed)) * 0.55 * speed + math.cos(math.rad(count*0.6665*speed))*0.45) * speed + 0.3750 * speed
        end
        roll = wrap_180(roll)
        pitch = wrap_180(pitch)

        count = count + 1
    else
        -- decay back to 0 roll and pitch
        local decay = 0.995
        roll = roll * decay
        pitch = pitch * decay
        count = 0

        if axis_sw then
            local switch_pos = axis_sw:get_aux_switch_pos()
            if switch_pos == 0 then
                if not(axis == "roll") then
                    axis = "roll"
                    gcs:send_text(0, string.format("Axis: %s",axis))
                end
            elseif  switch_pos == 1 then
                if not(axis == "pitch") then
                    axis = "pitch"
                    gcs:send_text(0, string.format("Axis: %s",axis))
                end
            else
                if not(axis == "both") then
                    axis = "both"
                    gcs:send_text(0, string.format("Axis: %s",axis))
                end
            end
        end
    end
    attitude_control:set_offset_roll_pitch(roll,pitch)
  end

  return update, 10 -- 10ms - 100Hz
end

return update()
