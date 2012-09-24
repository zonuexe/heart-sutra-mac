#!/bin/zsh
default=japanese
#export LANG=ko_KR.utf-8
#export LANG=zh_CN.utf-8
#export LANG=zh_TW.utf-8
#export LANG=zh_HK.utf-8
#export LANG=en_US.utf-8

_parseopt_ () {
    while getopts "jts" opt
    do
        case $opt in
            j) lang=japanese    ;;
	    s) lang=simplified  ;;
	    t) lang=traditional ;;
	esac
    done
    echo $lang
}

_switch_style_by_shellenv () {
    L=$(printenv LANG | tr 'A-Z' 'a-z')
    case $L in
        ja*)    lang=japanese ;;
        ko*)    lang=traditional ;;
        zh-tw*) lang=traditional ;;
        zh-hk*) lang=traditional ;;
        zh*)    lang=simplified ;;
        *)      lang=$default ;;
    esac
    echo $lang
}

switch_hanzi () {
    option=$(_parseopt_ $@)
    # echo option: $option >&2
    if [[ $option != "" ]]
    then
	echo $option
    else
	_switch_style_by_shellenv
    fi
}
