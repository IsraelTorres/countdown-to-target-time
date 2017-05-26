#!/bin/bash
# Israel Torres
# 20170420 - v5 (gTfo)
# ./countdown-to-target-time.sh
# 4:30PM countdown timer
# counts down to (target time) 4:30pm in seconds regardless 
# of what time the shell file is started.
# special shoutz to ph4nt4zm & trash1e
#
time_target=$(( 16 * 3600 + 30 * 60 )) # 59400, 16:30, 4:30PM
#
while [[ 1 ]]
	do
	# added checks so null errors don't come up
	cHr=$(date +%H); fxdcHr=$(echo $((10#$cHr)) )
	cMn=$(date +%M); fxdcMn=$(echo $((10#$cMn)) )
	cSc=$(date +%S); fxdcSs=$(echo $((10#$cSc)) )
	# no more need for playful second (+1)
	time_countd=$(( $fxdcHr * 3600 + $fxdcMn * 60 + $fxdcSs ))
		if [[ "$time_countd" -ge "$time_target" ]]
			then
				echo -en "It's 4:30PM, GTFO!\n"
				exit 0
			else
				countdown=$(($time_target - $time_countd))
				#echo -ne "gTfo-$countdown\n" # scrolling style
				echo -en "\033[2K\r"       #single line style 1 of 2
				echo -en "gTfo-$countdown" #single line style 2 of 2
		fi
		sleep 1
	done
#EOF