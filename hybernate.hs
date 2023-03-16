#!/bin/sh

# Usage: hybernate.sh 10 -- echo 1

HYBERNATE=1

echoerr() {
  if [ "$HYBERNATE" -ne 1 ]; then printf "%s\n" "$*" 1>&2; fi
}

usage() {
  exitcode="$1"
  cat << USAGE >&2
Usage:
  $cmdname hybernate
USAGE
  exit "$exitcode"
}

hybernate_for() {
  echo "Hybernating for $HYBERNATE seconds"
  for i in `seq $HYBERNATE` ; do
    echo "$i/$HYBERNATE"
    sleep 1
  done
  shift 2
  exec "$@"
}

HYBERNATE=$1
hybernate_for "$@"
