#!/bin/sh
#
# Description: Save brightness of computer on shutdown
# Reference: http://unix.stackexchange.com/questions/48973/execute-a-command-before-shutdown
# Reference: https://docs.oracle.com/cd/E19683-01/806-4073/6jd67r96g/index.html
#
# Save that file at: /etc/init.d/saveLastBrightLevel.sh
# Post saving commands:
# $ chmod 0744 /etc/init.d/saveLastBrightLevel.sh
# $ chown root:sys /etc/init.d/saveLastBrightLevel.sh
# $ cd /etc/init.d
# $ ln saveLastBrightLevel.sh /etc/rc0.d/saveLastBrightLevel.sh
# $ ln saveLastBrightLevel.sh /etc/rc6.d/saveLastBrightLevel.sh

bright=$(cat /sys/class/backlight/nv_backlight/brightness)
echo $bright > /sys/class/backlight/nv_backlight/last_brightness
