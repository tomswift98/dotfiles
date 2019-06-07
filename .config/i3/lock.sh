#!/bin/bash
icon=~/.config/i3/lock.jpg
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
convert convert -scale 2% -scale 5000% $tmpbg $tmpbg
convert $tmpbg $icon -gravity center -composite -matte $tmpbg
i3lock -u -i $tmpbg & sleep 5 && xset s activate
