#!/bin/sh
#
# Description: Adjust brightness of backlights based on power source
# Reference: http://unix.stackexchange.com/questions/110280/bash-script-to-adjust-brightness-when-battery-unplugged
#
# Save that file at: /etc/pm/power.d/autobright.sh
# Remember to use chmod +x to make it runnable

case $1 in
    # On battery
    true)
        bright=$(cat /sys/class/backlight/nv_backlight/brightness)
        bright=$(($bright-10))
        if [ "1" -gt "$bright" ]; then
                bright="1"
        fi
        echo $bright > /sys/class/backlight/nv_backlight/brightness
    ;;

    # On AC
    false)
        bright=$(cat /sys/class/backlight/nv_backlight/brightness)
        bright=$(($bright+10))
        if [ "$bright" -gt "100" ]; then
                bright="100"
        fi
        echo $bright > /sys/class/backlight/nv_backlight/brightness
    ;;
esac

return 0
