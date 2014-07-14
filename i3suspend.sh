#!/bin/bash

idletime=$((1000*60*60))
bufftime=$((1000*30))

while true; do
    idle=`xprintidle`
    #echo "idle for $idle ms"
    if(($idle > $idletime)); then
	echo "Time to sleep!"
	dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower "org.freedesktop.UPower.Suspend"
    fi
    sleep 60
done
