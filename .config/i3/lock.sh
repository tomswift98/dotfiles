#!/bin/bash
ICON=$HOME/Pictures/lock.jpg
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
convert convert -scale 2% -scale 5000% $tmpbg $tmpbg
convert $tmpbg $ICON -gravity center -composite -matte $tmpbg
i3lock -u -i $tmpbg
