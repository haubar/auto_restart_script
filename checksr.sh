#!/bin/bash
#check host
HOSTS="google.com"
COUNT=5
for myHost in $HOSTS
do

  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ];
  then
    # failed
    #echo "host : $myHost is down (ping failed) at $(date) "
    /etc/init.d/nginx restart
  else

    echo "host :$myHost is up at $(date) "

  fi

done
