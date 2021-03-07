#setopt SOURCE_TRACE

### ZSH
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.local/bin:$GOBIN:$HOME/.gem/ruby/2.7.0/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=14
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

### NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

### PYENV
eval "$(pyenv init -)"

### Antigen

# Load antigen
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle colorize
antigen bundle colorized-man-pages
antigen bundle copydir
antigen bundle cp
antigen bundle extract
antigen bundle history
antigen bundle redis-cli
antigen bundle themes

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Theme
#POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
#POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context dir vcs)
#antigen theme bhilburn/powerlevel9k powerlevel9k

antigen theme https://gitlab.theedgeofrage.com/TheEdgeOfRage/boban-zsh

# Tell antigen that you're done.
antigen apply


# Functions
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }



### Aliases
alias audio=pavucontrol
alias bt=blueman-manager
alias ls='ls -lah'
alias cp='cp -avr'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias i3-conf='vim $HOME/.config/i3/config'
alias i3-dual='exec xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1'
alias i3-dual-right='exec xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1'
alias i3-reset="exec xrandr --output eDP1 --auto"

# Docker aliases
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dce="docker-compose exec"
alias db="docker build -t"
alias dps="docker ps"
alias de="docker exec -it"
alias dr="docker run --rm"

# Git aliases
alias ga="git add"
alias gc="git commit -m"
alias gcl="git clone"
alias gps="git push"
alias gpl="git pull"
alias gr="git reset"
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gch="git checkout"

# Service aliases
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias sen="sudo systemctl enable"
alias sdi="sudo systemctl disable"

# Package aliases
alias install="sudo pacman -S"
alias sysupdate="sudo pacman -Syyu"

# Util aliases
alias weather='curl http://wttr.in/Novi_Sad'
alias json='python -m json.tool'
alias rsync-a='rsync -alPvz'
alias cat='bat --paging never --style=plain'


alias yt-dl="youtube-dl -x --embed-thumbnail --add-metadata --audio-format mp3 --audio-quality 0"
alias sstop='sudo systemctl stop'
alias sstart='sudo systemctl start'
alias srestart='sudo systemctl restart'
alias gs='git status'
alias gch='git checkout'
alias gps='git push'
alias gpl='git pull'
alias ga='git add'
alias gc='git commit -m'

# K8s
alias k='kubectl'
alias kctg='kubectl get'
alias kctd='kubectl describe'
alias kctdel='kubectl delete'
alias kctl='kubectl logs -f'

# Clooes
alias cl-db-ssh='ssh i-007148e4f81c51f58'
alias cl-db-proxy='ssh i-007148e4f81c51f58 -L 27117:localhost:27017'
