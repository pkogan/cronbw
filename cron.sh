#!/bin/bash

SCRIPT=`realpath $0`
CARPETA=`dirname $SCRIPT`
echo $CARPETA
cd $CARPETA

TSTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

RESULTADO=$(/usr/bin/speedtest-cli --simple)

ELPING=$(awk -v var="$RESULTADO" 'BEGIN {print var}' | sed -n 1p | awk '{print $2}')
BAJADA=$(awk -v var="$RESULTADO" 'BEGIN {print var}' | sed -n 2p | awk '{print $2}')
SUBIDA=$(awk -v var="$RESULTADO" 'BEGIN {print var}' | sed -n 3p | awk '{print $2}')

if [ -z "$ELPING" ]; then
    ELPING=0
fi
if [ -z "$BAJADA" ]; then
    BAJADA=0
fi

if [ -z "$SUBIDA" ]; then
    SUBIDA=0
fi

echo "['$TSTAMP',$BAJADA,$SUBIDA]," >> registro-speedtest.log
echo "['$TSTAMP',$BAJADA,$SUBIDA]," >> registro-speedtest-hoy.log
echo "['$TSTAMP',$BAJADA,$SUBIDA]," >> registro-speedtest-semana.log
echo "['$TSTAMP',$ELPING,$BAJADA,$SUBIDA]," >> registro-speedtest-con-ping.log

