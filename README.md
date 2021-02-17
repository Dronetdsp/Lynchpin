# Intro
The is repo will contain all the build, scripts and params needed to build your own Lynchpin drone.

# Components

[![](http://img.youtube.com/vi/bsiZ6G9d1Ag/0.jpg)](http://www.youtube.com/watch?v=bsiZ6G9d1Ag "")

These are all the components you will need, this is not a exhaustive list, general consumables are not included (such as zip ties and heat shrink). For the most part similar alternatives can be used but motors and props should exactly match for the Lynchpin PIDs and mixer to be used. Likewise a drone of identical layout but different scale will need a new mixer.

* Flight controller - [Cube Orange](https://cubepilot.org/#/cube/features)
* Props 3x CW, 3x CCW - Gemfan 5" 3D (ZoeFPV)
* Lipos 2x - [Tattu R-Line 1050mAh 6S](https://www.genstattu.com/ta-rl3-120c-1050-6s1p.html)
* GPS - [Here2/Here2](https://cubepilot.org/#/here/here3)
* Fishing Line - braided 0.36mm/22.6kg or similar
* Recever - [FrSky - R-XSR](https://www.frsky-rc.com/product/r-xsr/)
* Motors 6x - [T-Motor F40PRO IV 1950kv](https://store-en.tmotor.com/goods.php?id=1011)
* ESCs 6x - Cloud Phoenix 50A BLHeli32 with telem pad
* Low ESR caps 6x - 50v 330uf
* PDB - [Matek Mini Power Hub](http://www.mateksys.com/?portfolio=hub5v12v)
* Standoffs 4x - M3 with bolt and nuts
* Wire - 14AWG for power and thinner for telem pads
* Bolts
    * 24x M3 14mm
    * 3x M3 10mm
    * 3x M3 washers
    * 3x M4 heat-set inserts
* ESP8266 - [Adafruit Huzzah](https://www.adafruit.com/product/2471)
* Carbon Tube 4x - [10mm OD, 9mm ID, 1m](https://www.easycomposites.co.uk/10mm-9mm-woven-finish-carbon-fibre-tube), to be cut into lengths of:
    * 4x 100mm
    * 18x 115mm
    * 6x 182mm

# 3D prints

For best results load [Frame.3mf](https://github.com/IamPete1/Lynchpin/blob/main/Frame.3mf) for pre-setup supports and layout.

![](https://github.com/IamPete1/Lynchpin/blob/main/Build%20Plate.PNG)

Structural components are printed in PTEG with 5 perimeters and 15% infill. See above image for ideal layout and part orientations. Some parts require supports this should be from the build plate only and have a maximum Z height blocker such that supports are not added to the internal holes.

* [Bottom Node](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Bottom%20Node.stl) x 3 - requires support
* [Top Node](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Top%20Node.stl) - requires support
* [Center Node](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Center%20Node.stl) - requires support
* [Corner Node](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Corner%20Node.stl) x 12
* [Motor Mount](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Motor%20Mount.stl) x 6

Optional, but very useful, tube cutting guides can be printed from any material with standard settings.
* [Long](https://github.com/IamPete1/Lynchpin/blob/main/STLs/long%20guide.stl) (182mm)
* [Medium](https://github.com/IamPete1/Lynchpin/blob/main/STLs/middle%20guide.stl) (115mm)
* [Short](https://github.com/IamPete1/Lynchpin/blob/main/STLs/short%20guide.stl) (100mm)

# Laser Cut

The base plate is designed for laser cutting, any material of about 3mm thickness, Acriylic looks cool. Alternatively the plate can be printed.
* [Base - DXF](https://github.com/IamPete1/Lynchpin/blob/main/base%20plate.dxf)
* [Base - STL](https://github.com/IamPete1/Lynchpin/blob/main/STLs/Base%20Plate.stl)

# Building the frame

[![](http://img.youtube.com/vi/Yiew8CDSbIk/0.jpg)](http://www.youtube.com/watch?v=Yiew8CDSbIk "")

# Wiring

[![](http://img.youtube.com/vi/npzUJ9enRJU/0.jpg)](http://www.youtube.com/watch?v=npzUJ9enRJU "")

[Cube Pinouts](https://docs.cubepilot.org/user-guides/autopilot/the-cube-module-overview)

[Flashing the ESP8266 for WiFi telemetry](https://ardupilot.org/copter/docs/common-esp8266-telemetry.html)

Close up pictures:

![](https://github.com/IamPete1/Lynchpin/blob/main/Wireing%20diagram.jpg)

![](https://github.com/IamPete1/Lynchpin/blob/main/front.jpg)

![](https://github.com/IamPete1/Lynchpin/blob/main/left%20side.jpg)

![](https://github.com/IamPete1/Lynchpin/blob/main/right%20side.jpg)

# ArduPilot setup

ArduPilot setup is much like a normal copter. Param set [here](https://github.com/IamPete1/Lynchpin/blob/main/Lynchpin%20CubeOrange.param). You will also need a [lua script](https://github.com/IamPete1/Lynchpin/blob/main/Motors_6DoF_LynchPin.lua) to tell AP the location and directions of each motor. Optionally an [additional script](https://github.com/IamPete1/Lynchpin/tree/main/scripts) can be added to give control over the roll and pitch axis.

[![](http://img.youtube.com/vi/iq5y_lpEIGQ/0.jpg)](http://www.youtube.com/watch?v=iq5y_lpEIGQ "")
