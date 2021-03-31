# ~/bin/tmux-myproject shell script
# The Project name is also used as a session name (usually shorter)
PROJECT_NAME=$(whoami)
PROJECT_DIR="~"

tmux has-session -t $PROJECT_NAME 2>/dev/null
if [ "$?" -eq 1 ] ; then
 echo"No Session found. Creating and configuring."
 pushd $PROJECT_DIR
 tmux new-session -d -s $PROJECT_NAME
 tmux source-file ~/bin/tmux-${PROJECT_NAME}.conf
 popd
else
 echo"Session found. Connecting."
fi
tmux attach-session -t $PROJECT_NAME
