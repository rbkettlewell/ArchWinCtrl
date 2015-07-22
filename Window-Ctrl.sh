window_size=$(xrandr | grep '*' | awk '{ print $1 }')

width_init=$(echo $window_size | grep -oE '[0-9]+' | head -n 1)
height_init=$(echo $window_size | grep -oE '[0-9]+' | tail -n 1)
height_full=$((height_init - 75))
height=$((height_init - 125))
width=$((width_init - 10))

let width_by_two=$((width/2)) 
let width_by_two_init=$((width_init/2)) 
let height_by_two=$((height/2)) 
let height_by_two_init=$((height_init/2)) 
let window_var=$(xdotool getactivewindow)

wmctrl -ia $window_var
if [ "$1" == "-tr" ];then 
    wmctrl -ir $window_var -e 0,$width_by_two_init,0,$width_by_two,$height_by_two
elif [ "$1" == "-t" ];then 
    wmctrl -ir $window_var -e 0,0,0,$width_init,$height_full
elif [ "$1" == "-tl" ];then
    wmctrl -ir $window_var -e 0,0,0,$width_by_two,$height_by_two
elif [ "$1" == "-br" ];then
    wmctrl -ir $window_var -e 0,$width_by_two_init,$height_by_two_init,$width_by_two,$height_by_two
elif [ "$1" == "-bl" ];then
    wmctrl -ir $window_var -e 0,0,$height_by_two_init,$width_by_two,$height_by_two 
elif [ "$1" == "-l" ];then
    wmctrl -ir $window_var -e 0,0,0,$width_by_two,$height_full
elif [ "$1" == "-r" ];then
    wmctrl -ir $window_var -e 0,$width_by_two_init,0,$width_by_two,$height_full 
else
    echo "No match"
fi
