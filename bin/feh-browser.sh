  #!/bin/bash
  
  # Change the input field separator to avoid problems with spaces.
  IFS='
  '
  # Get the target file, its name, directory, and the other files in the
  directory.
  _fpath="${1/%\/}"
  _fname="$(basename "$_fpath")"
  _dpath="$(dirname "$_fpath")"
  _flist=($(ls "$_dpath"))
  
  
  # Determine the index of the target file in the file list array.
  _i=0
  for _file in "${_flist[@]}"; do
    [ "$_file" == "$_fname" ] && break
    _i=$(($_i + 1))
  done
  
  # Remove the target file from the arguments, leaving any eventual arguments to
  # feh.
  shift
  
  # Change to the directory and launch feh with the target file as the first
  # argument, and the rest of the files in their normal order.
  cd "$_dpath"
  feh "$@"  "${_flist[@]:$_i}" "${_flist[@]:0:$_i}"
