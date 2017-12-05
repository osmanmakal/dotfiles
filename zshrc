export ZSH=/Users/$USER/.oh-my-zsh
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Alias Lists
alias build-source='./configure && make && sudo make install'
alias untar='tar -zxvf'
alias untarxz='tar -xJf'

alias subl='open -a Sublime\ Text'
alias vscode='open -a Visual\ Studio\ Code'

alias br='bee run'

alias git-discard='git clean -df; git checkout -- .'
alias gita='git add .'
alias gitp='git push'
alias gits='git status'

# Function Lists
function gitc(){
  git commit -m "$@"
}

function gitall()
{
  git add -A
  git commit -m "$@"
  git push
}

function go-run(){
  go run "$@"
}

function go-dir(){
  cd $(go env GOPATH)/src/$@
}

function serve(){
  php -S localhost:"$@"
}

function ydl(){
  youtube-dl --extract-audio --audio-format mp3 "$@" --ignore-errors
}

function docker-removeall () {
  docker ps -a --format {{.ID}} | xargs docker stop
  docker ps -a --format {{.ID}} | xargs docker rm
}

function docker-startall () {
  docker ps -a --format {{.ID}} | xargs docker start
}

function makedir() {
  mkdir -p "$@" && cd "$@"
}

function zombie() {
  ps aux | awk '{if ($8=="Z") { print $2 }}'
}

function ssh-key() {
  key=$(cat $HOME/.ssh/id_rsa.pub)
  echo "cd;echo \"$key\" >> .ssh/authorized_keys"
}

# Include ENV
. $HOME/.zshenv
