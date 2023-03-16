#!/bin/sh

MAX_CHILDREN=4

parallel() {
  local time1=$(date +"%H:%M:%S")
  local time2=""

  echo "starting $2 ($time1)..."
  "$@" && time2=$(date +"%H:%M:%S") && echo "finishing $2 ($time1 -- $time2)..." &

  local my_pid=$$
  local children=$(ps -eo ppid | grep -w $my_pid | wc -w)
  children=$((children-1))
  if [[ $children -ge $MAX_CHILDREN ]]; then
    wait -n
  fi
}

parallel echo 1
parallel echo 2
parallel echo 3
wait
