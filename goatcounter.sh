#!/usr/bin/env bash

set -e

declare OPTS=""

OPTS="$OPTS -listen $GOATCOUNTER_LISTEN"
OPTS="$OPTS -tls none"
OPTS="$OPTS -db $GOATCOUNTER_DB"

if [ -n "$GOATCOUNTER_SMTP" ]; then
  OPTS="$OPTS -smtp $GOATCOUNTER_SMTP"
fi

if [ -n "$GOATCOUNTER_DEBUG" ]; then
  OPTS="$OPTS -debug all"
fi

goatcounter serve $OPTS
