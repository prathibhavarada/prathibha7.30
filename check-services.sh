#!/bin/bash

echo "============================="
echo " Service Status Report"
echo " Hostname: $(hostname)"
echo " Date: $(date)"
echo "============================="

for svc in sshd crond firewalld; do
  echo -e "\n>>> Checking: $svc"
  systemctl is-active --quiet $svc
  if [ $? -eq 0 ]; then
    echo "$svc is running ✅"
  else
    echo "$svc is NOT running ❌"
  fi
done
