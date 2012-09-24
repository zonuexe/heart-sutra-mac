#!/bin/zsh
default=japanese

_parseopt_ () {
    while getopts "jts" opt
    do
        case $opt in
            j) echo japanese    ;;
	    s) echo simplified  ;;
	    t) echo traditional ;;
	esac
    done
}

_switch_style_by_env () {
    lang=$(printenv LANG | tr 'A-Z' 'a-z')
    echo $lang >&2
    case $lang in
        ja*)    echo japanese ;;
        ko*)    echo traditional ;;
        zh-tw*) echo traditional ;;
        zh*)    echo simplified ;;
        *)      echo $default ;;
    esac
}

_parseopt_ $@
echo 
_switch_style_by_env
