#!/bin/bash

port=$1

read -p "ssh password:" password

while true
do
  time=`date +%Y-%m-%d-%H:%M:%S`
  netstat -lpnt 2>/dev/null |grep $port
  if [ $? -ne 0 ]; then
    sshpass -p $password -C -f -N -g -L $port:10.248.64.118:$port cmchain@10.248.64.118 
    echo start 3922 $time >> monitor-$port.log
  fi
  sleep 10
done
