#!/bin/bash



SI=$(pacmd list-sink-inputs | grep -m 1 index | egrep -o "[[:digit:]]+")



echo · Loading module-null-sink
pactl load-module module-null-sink sink_name=rec


echo · Moving sink «$SI» to null sink «rec»
pactl move-sink-input $SI rec


echo · Saving sound data to «$N.flac» 
parec -d rec.monitor | oggenc -b 192 -o steam.ogg --raw -




