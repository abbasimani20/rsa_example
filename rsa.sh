#!/bin/bash
# This script is to show how RSA key pairs are calculated.
# The key pairs are calculated for small prime numbers provided by user
# The prime numbers p and q, provided by the user! 
# The script does not check the inputs and assumes the user inputs prime numbers!
# The script should not be used to encrypt and decrypt a real scenario as 
# in real scenarios very large prime numbers should be randomly generated to make
# cracking keys almost impossible. 


# Greatest Common Denominator calculed based on Euclidean algorithm: 

gcd() {
    ! (( $1 % $2 )) && return $2 || gcd $2 $(( $1 % $2 ))
}
showcoprimes() {
    echo "Choose one of the following coprimes to $1:  "
    for (( i=1; i <=$1; i++)) 
    do 
        (( $1 % $i )) && echo -n  $i "   "
    done
    echo
    read -p "Enter the number you selected from the above...    "  e 
    echo
}

ecludeanmod1() {
    rn=$(($1%$2));
    mmm=$(($1/$2));
    rr[$i]=$rn; echo "rr $rn $i  rr ${rr[$i]}"
    mm[$i]=$mmm; echo "mmm $mmm  $i    mm  ${mm[$i]}"
    i=$((i+1))


    if ((rn == 1 ))
        then  
            echo $1 $2 $rn
            mm[$i]=$mmm
        else 
            echo $2 $rn 

            ecludeanmod1 $2 $rn 
    fi 
}


rsa()
{
p1=$(($p-1))
q1=$(($q-1))
n=$(($1*$2));

gcd p1 q1
gg=$?
echo $gg
nn=$(($p1*$q1/$gg))
showcoprimes $nn

unset aa
unset bb
unset mm 
declare -a mm
declare  -a aa
declare -a bb

i=0
ecludeanmod1 $nn $e 
unset mm[-1];
l1=$((${#mm[@]}-1))
for i in $(eval echo {0..$l1})
    do 
        echo $i "----" ${mm[$i]} "  --- " ${rr[$i]}
    done 

echo
echo "e is: " $e
echo $nn
return $gg
}


read -p "What is the 1st primary number...   " p 
read -p "What is the 2nd primary number...   " q 

rsa $p $q
echo $? 
exit 0
