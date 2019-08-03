# auto active dir same name pyenv
cd() {
  builtin cd "$@"
  local_dir=$(pwd | awk -F/ '{print $NF}')
  for i in $(pyenv virtualenvs --bare) ; do
    if [ $i = $local_dir ] ;
	then
	  pyenv activate $i
	  printf "Activate pyenv %s" $i
	fi
  done
}
