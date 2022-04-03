#!/bin/bash
declare -a num
read < num1.txt num[0]
read < num2.txt num[1]

if [ $# -gt 0 ]; then
	op=$1
else
	echo "...none operator parameter..."
	PS3="select menu : "
	select op in add sub div mult
	do
		if [ -z $op ]; then
			echo "Invalid Operation"
		else
			break
		fi
	done
fi

case $op in
	add) let result=${num[0]}+${num[1]} ;;
	sub) let result=${num[0]}-${num[1]} ;;
	div) let result=${num[0]}/${num[1]} ;;
	mult) let result=${num[0]}*${num[1]} ;;
	*) echo "Invalid Operation" ; exit ;;
esac

echo
echo "num1 : ${num[0]}"
echo "num2 : ${num[1]}"
echo "op : $op"
echo "result : $result"
