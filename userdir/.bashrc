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
alias subl="'D:/_software/Sublime Text 2/sublime_text.exe'"
alias editme="subl /d/_software/_console/userdir/.bashrc"
alias dns="subl /c/Windows/system32/drivers/etc/hosts"
alias rte="route add 10.0.0.0 mask 255.255.255.0 192.168.1.1"

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

# git config --global mergetool.sublime.cmd "subl -w \$MERGED"
git config --global mergetool.sublime.cmd "d:/s/subl.exe -w \$MERGED"
git config --global mergetool.sublime.trustExitCode false
git config --global merge.tool sublime

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias bsl="cd ~/tradero/bookmarks"
alias bsldeploy="bsl && yeoman build && cd temp && af update bsl"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias deploy-webui='cd /d/_projects/tradero/webui/source;yeoman build;dest="/home/workers/xk/projects/public/web-app/htdocs/tests/webui3"; ssh xk@10.0.0.2 "rm -rf $dest; mkdir $dest"; scp -r dist/* xk@10.0.0.2:$dest'

#

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
export PATH=$PATH:"/c/Program Files/Git/bin":"/c/Program Files/Git/libexec/git-core":/d/_software/_console/bin:/d/_software/_console/unix:/d/xampp/php
export PATH=$PATH:/d/_projects/tests/yeoman/yeoman-custom/cli/bin
export HOME=/d/_projects

cd $HOME
