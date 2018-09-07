#!/bin/bash

#thought for the day
fortune | cowsay
echo ""


#custom BASH aliases/exports
export PS1='\[\e[1;36m\][\h: \W]#\[\e[0m\] '
export PAGER=less
export EDITOR=vim
export YANG_MODPATH=/usr/local/share/yang/modules
export SSHPASS=versa123

#handy aliases
alias scp="scp -o cipher=none -o compression=no"
alias ps="ps aux"
alias gdb="gdb -q"
alias mk="make 2> /tmp/errors"
alias idx="$HOME/cscope/cscope-indexer -r -v"
alias bugz="bugz --connection bugzilla"

#waf aliases
alias wcfg-debug='waf configure --debug --optflags="-O0"'
alias wcfg-je='waf configure --jemalloc-debug --jemalloc-tcache-disable'
alias wcfg='waf configure'
alias wmk='waf build'
alias wcld='waf clean distclean'


# --------------------
# HANDY BASH FUNCTIONS
# --------------------

#Build cscope from scratch
csin() {
    rm -f $WS/cscope.files
    $HOME/cscope/cscope-indexer -r -v
}

pkgscp() {
    if [[ $# > 0 ]]; then
        for file in "$@"; do
            scp "$file" gotham:/home/versa/packages/
           #scp "$file" vsn1:/home/versa/packages/
        done
    fi
}
dlcore() {
    if [[ $# == 1 ]]; then
        mkdir -p $1
        scp nfs:/home/versa/cores/$1/* $1/
    fi
}
sshv() {
    sshpass -e ssh versa@$1
}
ssha() {
    sshpass -e ssh admin@$1
}
sshr() {
    sshpass -e ssh root@$1
}
scpv() {
    sshpass -e scp versa@$1
}
scpa() {
    sshpass -e scp admin@$1
}
rmssh() { 
    sed -i "$1d" $HOME/.ssh/known_hosts
}

workon () {
    #Workspace settings
    export WS=$1
    alias src="cd $WS"
    alias adc="cd $WS/usr/module/adc"
    alias glb="cd $WS/usr/module/adc/glb"
    alias nat="cd $WS/usr/module/cgnat"
    alias lib="cd $WS/usr/lib"
    alias sbin="cd $WS/usr/sbin"
    alias vmod="cd $WS/usr/sbin/vmod"
    alias rfd="cd $WS/usr/sbin/rfd"

    alias clean-config="rm -fr $WS/build/config"
    alias clean-vmod="rm -fr $WS/build/usr/sbin/vmod"
    alias clean-vsmd="rm -fr $WS/build/usr/sbin/vsm"
    alias clean-adc="rm -fr $WS/build/usr/module/adc"
    alias clean-nat="rm -fr $WS/build/usr/module/cgnat $WS/build/usr/lib/libcgnat"
    alias clean-rfd="rm -fr $WS/build/usr/sbin/rfd"
    alias clean-rfm="rm -fr $WS/build/usr/lib/librfm"
    alias clean-inf="rm -fr $WS/build/usr/sbin/infmgr"
    alias clean-meta="rm -fr $WS/build/vendor/metacli"
    cd $WS
}

#Default workspace
workon $HOME/trees/161R2
