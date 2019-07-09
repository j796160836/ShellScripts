#!/bin/bash
DEVICE=`adb devices -l | sed '/List of devices/d' | sed '/clockwork/d' | head -n 1 | awk '{print $1}'` 
adb -s $DEVICE -d forward tcp:5601 tcp:5601
