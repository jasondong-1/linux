#!/bin/bash

file=/home/databus/workspace/ext_jars

sepa="_DFRA_"

users[0]="user${sepa}ip${sepa}passwd${sepa}path"
users[1]="user${sepa}ip${sepa}passwd${sepa}path"

function transfer(){
 for useri in ${users[@]};do
  haha=${useri}
  #对IFS变量 进行替换处理
  OLD_IFS="$IFS"
  IFS="${sepa}"
  array=($haha)
  IFS="$OLD_IFS"
  user=$(echo ${useri} | awk -F "${sepa}" '{print $1}')
  host=$(echo ${useri} | awk -F "${sepa}" '{print $2}')
  passwd=$(echo ${useri} | awk -F "${sepa}" '{print $3}')
  dir=$(echo ${useri} | awk -F "${sepa}" '{print $4}')
  expect scp_jars.exp $user $host $passwd $file $dir
 done
}

transfer