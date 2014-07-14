#!/bin/bash
#This is a script that suspends the computer
#after one hour of inactivity. Uses the application
#xprintidle. Install the app using 
#"sudo apt-get install xprintidle" before running this
#script

#One hour in milliseconds
idletime=$((1000*60*60))

while true; do
    idle=`xprintidle`
    #echo "idle for $idle ms"
    if(($idle > $idletime)); then
	echo "Time to sleep!"
	#Shell command to suspend system
	dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower "org.freedesktop.UPower.Suspend"
    fi
    #Only check for inactivity once a minute.
    sleep 60
done
