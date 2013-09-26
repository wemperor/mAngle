mAngle
======

Creating multiangular flight patterns for rotary wing UAVs

mAngle is written in processing.org and based on some simple geography mathematics.
The program calculates a hemisphere around center GPS coordinate and places a waypoint pattern on the hemisphere.
The angle of view on each point is set to focus the center point of the hemisphere. Number of waypoint, start angle, etc.
can be defined by the user.

Output files are *.kml for view in Google Earth and *.csv which have the layout for the Falcon-8 UAV by Ascending Technology,
but can easily be adapted to other flight planning software.



Was coded in Processing 1.5.1 with G4P library for the user Interface
