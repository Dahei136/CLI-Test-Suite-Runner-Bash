#!/bin/bash

if [ $# -ne 2 ]; then 
  echo "Error: need suite-file and program" >&2
  exit 1
fi

suite=$1
program=$2

for stem in $(cat "$suite"); do
 if [ ! -r "${stem}.expect" ]; then
   echo "Error: missing ${stem}.expect" >&2
   exit 1
 fi
 
 TEMPFILE=$(mktemp)

 args=""
 
 if [ -r "${stem}.args" ]; then
   args=$(cat "${stem}.args")
 fi

 if [ -r "${stem}.in" ]; then
   $program $args < "${stem}.in" > $TEMPFILE
 else
   $program $args  > $TEMPFILE 
 fi

 diff "$TEMPFILE" "${stem}.expect" > /dev/null
  if [ $? -ne 0 ]; then
    echo "Test failed: $stem"
    echo "Args:"
  if [ -r "${stem}.args" ]; then
    cat "${stem}.args"
  fi
  echo "Input:"
  if [ -r "${stem}.in" ]; then
    cat "${stem}.in"
  fi
  echo "Expected:"
  cat "${stem}.expect"
  echo "Actual:"
  cat "$TEMPFILE"
  fi

 rm "$TEMPFILE"

done
