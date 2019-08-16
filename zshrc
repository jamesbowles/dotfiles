# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-flow-avh)

source $ZSH/oh-my-zsh.sh

if [[ `uname` == 'Darwin' ]]
then
  alias ctags="`brew --prefix`/bin/ctags"
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

alias dco="docker-compose"
alias dcr="docker-compose run"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dps="docker ps"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias be="bundle exec"
alias bes="bundle exec spring"

export EDITOR=vim
export LC_CTYPE=en_US.UTF-8

ctrlp() {
  </dev/tty vim -c CtrlP
}
zle -N ctrlp

bindkey "^p" ctrlp

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=~/.npm-global/bin:$PATH

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
