#     author : shrk
#
#     input 1st arg : filepath
#     input 2nd arg : starting pattern
#     input 3rd arg : [-p : pattern] || [-n : number]

#     sample fomat: .logread.sh "starting_pattern" -p "ending_pattern" (prints all the lines found between starting and ending pattern)
#                   .logread.sh "starting_pattern" -n 20 (prints all the lines found between starting pattern and subsequent 20 lines)
#                   





log_file=$1

# default directory for storing generated logs
HOME=/home/user/

start_time=`date +%s`

_from_line=$(grep -n -m 1 $2 $log_file |cut -f1 -d:)
_to_line=""
case $3 in
        -p)
                _to_line=$(grep -n -m 1 $4 $log_file |cut -f1 -d:)
                ;;
        -n)
                _to_line=`expr $_from_line + $4`
                ;;
        *)
                echo "Specify 3rd parameter as number '-n' or pattern '-p'"
                exit
                ;;
esac

echo "start at:${_from_line} end at:${_to_line}"

log_duration=$(echo "${2}_>_${4}" | sed 's|/|_|g')

echo "-----------------------------$log_duration----------------------------" > ~/temp.log
sed -n "${_from_line},${_to_line}p" $log_file >> ~/temp.log
mv ~/temp.log "$HOME/$log_duration.log"
echo run time is $(expr `date +%s` - $start_time)s

cat  "$HOME/$log_duration.log"
