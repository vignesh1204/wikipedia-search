#!/bin/bash

#in cli mode, run ./wikipedia.sh [-s <search term>] [-l <log file name>]
#for example, ./wikipedia.sh -s "batman begins" -l "new_log.txt"

#in interactive mode, simply run ./wikipedia.sh

if [ $# -eq 0 ]
then
    read -p 'Enter search term: ' keyword
    read -p 'Enter name of log file (default - logfile.txt): ' log
fi

while getopts ":s:l:" options; do
    case "${options}" in
        s)
            keyword="$OPTARG"
            ;;
        l)
            log="$OPTARG"
            ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "Script usage: $(basename $0) [-s <search term>] [-l <log file name>]" 1>&2
            exit 1
            ;;
    esac
done
shift "$(($OPTIND -1))"

if [ -z "$log" ]
then
    log=logfile.txt
fi

if [ -z "$keyword" ]
then
    echo "Keyword cannot be empty"
fi

keyword2=${keyword// /%20}

url=https://en.wikipedia.org/wiki/$keyword2

echo -ne '#######                        (25%)\r'
sleep 1
echo -ne '##############                 (50%)\r'
sleep 1
echo -ne '#####################          (75%)\r'
sleep 1
echo -ne '############################   (100%)\r'
echo -ne '\n'

echo "$(date) - $keyword - $url" >> $log

echo "done"