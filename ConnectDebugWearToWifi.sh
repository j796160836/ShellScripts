#!/bin/bash
DEVICE=`adb devices | grep localhost:4444 | head -n 1 | awk '{print $1}'` 
if [ "$DEVICE" == "" ]; then
	echo "Please conntect devices!"
	exit 0
else 
	echo "Devices:  "$DEVICE
fi

IP_ADDR=`adb -s localhost:4444 shell netcfg | grep UP | awk '{print $3}' | sed '/127.0.0.1/d' | sed 's/\/.*//g'`
adb -s localhost:4444 tcpip 5555&
adb connect $IP_ADDR:5555
echo $IP_ADDR
