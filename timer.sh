#!/bin/bash
if [[ "$1" =~ ^[0-9]+:[0-9]+:[0-9]+$ ]]
then
    totSec=`echo $1 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
    if [ $# -gt 1 ]
    then
        stringa=$2
    else
        stringa="Tempo completato"
    fi
    echo "Comando lanciato:"; date; echo "Attendo $1 (h:m:s)."; sleep $totSec; `dirname $0`/parla.sh "$stringa"; echo $stringa
else
  echo "Non hai specificato bene il tempo! Usa:"
  echo "$0 h:m:s [\"frase da dire\"]"
  `dirname $0`/parla.sh "dammi il tempo!"
fi
