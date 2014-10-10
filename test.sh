#! /bin/sh

for host in pi@192.168.4.5 fabs@192.168.4.4
  do echo $host 
  for a in $(ssh $host df -h | grep -v Filesystem | awk '{print $1 }'| sort | uniq)
    do b=$(ssh $host df -h | grep $a | awk '{ print $2}')
    c=$(ssh $host mount | grep $a | awk '{ print $5 }')
    echo $a $b $c
  done 
done
