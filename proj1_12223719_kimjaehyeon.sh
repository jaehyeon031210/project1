#!/bin/bash
echo "-------------------------------"
echo "User Name: Kim jae hyeon"
echo "Student Number: 12223719"
echo "[ MENU ]"
echo "1. Get the data of the movie identified by a specific 'movie id' from u.item'"
echo "2. Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDb URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release data' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'"
echo "9. EXIT"
echo "--------------------------------"
while true; do
read -p "Enter your choice [ 1~9 ] " n
case $n in
1)
read -p "Please enter 'movie id'(1~1682):" n1
awk -v n1="$n1" -F'|' '$1 == n1 {print $0}' u.item
;;
2)
read -p "Do you want to get the data of 'action' genre movies from 'u.item'?(y/n):" reply2
if [ "$reply2" == "y" ]; then
awk -F'|' '$7 == 1 {print $1, $2}' u.item | head

fi
;;
3)
read -p "Please enter the 'movie id'(1~1682):" n3
while IFS=$'\t' read -r field1 field2 field3 field4t; do
if [ "$field1" == "$n3" ]; then
sum=$((sum + field3))
count=$((count + 1))
fi
done < u.data
average=$(awk -v sum="$sum" -v count="$count" 'BEGIN {printf "%.6f", sum/count}')
echo "average rating of $n3: $average"
;;
4)
read -p "Do you want to delete the 'IMDb URL' from 'u.item'? (y/n):" n4
if [ "$n4" == "y" ]; then
sed 's/|http[^|]*|//g' u.item | head
fi
;;
5)
read -p "Do you want to get the data about users from 'u.user'?(y/n):" reply5
if [ "$reply5" == "y" ]; then
sed 's/^\([^|]*\)|\([^|]*\)|\(M\)|\([^|]*\)|\(.*\)/\1 user is \2 years old male \4/;s/^\([^|]*\)|\([^|]*\)|\(F\)|\([^|]*\)|\(.*\)/\1 user is \2 years old female \4/' u.user | head
fi
;;
6)
read -p "Do you want to Modify the format of 'release data' in 'u.item'?(y/n):" reply6
if [ "$reply6" == "y" ]; then
echo "??"
fi
;;
7)
echo "?"
;;
8)
echo "?"
;;
9)
echo "Bye!"
break
;;
esac
done
exit 0
