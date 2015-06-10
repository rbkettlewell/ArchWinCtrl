window_size=$(xrandr | grep '*' | awk '{ print $1 }')

width=$(echo $window_size | grep -oE '[0-9]+' | head -n 1)
height=$(echo $window_size | grep -oE '[0-9]+' | tail -n 1)

let width_by_two=$((width/2)) 
let height_by_two=$((height/2)) 
let window_var=$(xdotool getactivewindow)

wmctrl -ia $window_var
if [ "$1" == "-tr" ];then 
    wmctrl -ir $window_var -e 0,$width_by_two,0,$width_by_two,$height_by_two
elif [ "$1" == "-tl" ];then
    wmctrl -ir $window_var -e 0,0,0,$width_by_two,$height_by_two
elif [ "$1" == "-br" ];then
    wmctrl -ir $window_var -e 0,$width_by_two,$height_by_two,$width_by_two,$height_by_two
elif [ "$1" == "-bl" ];then
    wmctrl -ir $window_var -e 0,0,$height_by_two,$width_by_two,$height_by_two 
elif [ "$1" == "-l" ];then
    wmctrl -ir $window_var -e 0,0,0,$width_by_two,$height
elif [ "$1" == "-r" ];then
    wmctrl -ir $window_var -e 0,$width_by_two,0,$width_by_two,$height 
else
    echo "No match"
fi
