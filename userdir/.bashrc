# refs to not used but really cool stuff about git prompts ;-)
# ref1: http://volnitsky.com/project/git-prompt/
# ref2: https://gist.github.com/47267
# ref3: https://gist.github.com/3848872
# ref4: https://gist.github.com/4383597

# some utf chars -_-
# ↑ ↓ ↕ ➔

source git-prompt.sh
source git-completion.bash
source colors.sh

alias ls="ls --color=auto"
alias dir="ls"

# ripple
alias ripple-sr="ripple start release"
alias ripple-fr="ripple finish release"
alias ripple-sf="ripple start feature"
alias ripple-ff="ripple finish feature"

alias rsr="ripple start release"
alias rfr="ripple finish release"
alias rsf="ripple start feature"
alias rff="ripple finish feature"
# /ripple

export EDITOR='subl -w'

PathShort="\w"
PathFull="\W"

# aktualny czas
Time="\T"

# ?
Jobs="\j"

# historia polecen
Hist="\!"

# nowa linia
EOL="\n"

# w zaleznosci od uzytkownika (root bedzie czerwony, user zielony)
UHost="$(if [[ ${EUID} == 0 ]]; then echo $BRed'\h'$BBlue' \W'; else echo $BGreen'\u@\h'$BBlue' \w'; fi)"

# opis zawartosci aktualnego katalogu - ilosc plikow oraz rozmiar (bez katalogow)
# DStat="$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep total | sed 's/total //')"
DStat="$(ls -1 | wc -l | sed 's: ::g') files"

# czy ostatnie polecenie bylo bledne?
LError="\$([[ \$? != 0 ]] && echo \"$BRed:($BBlue \")"

GITB='$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status`|grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then echo "'$Yellow'"; fi)"$(__git_ps1 "(%s)")" "; \
fi)'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

bind '"\e[1~": beginning-of-line' # home key
bind '"\e[4~": end-of-line'       # end key
bind '"\e[3~": delete-char'       # delete key

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export PS1="$BBlack[$Time] [$$:$PPID] $UHost $LError[$DStat] $Cyan[$Jobs:$Hist] $BRed$GITB$Color_Off$EOL$ "
export HOME=%HOMEDIR%

cd $HOME
