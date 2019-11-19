#!/usr/bin/env bash
set -e
function info
{
  if [ -t 1 ]
  then
    echo -e "\033[0;32;1m$@\033[0m"
  else
    echo "$@"
  fi
  return
}

function error
{
  if [ -t 1 ]
  then
    echo -e "\033[0;41;1m$@\033[0m"
  else
    echo "$@"
  fi
  return
}

function warn
{
  if [ -t 1 ]
  then
    echo -e "\033[0;33;1m$@\033[0m"
  else
    echo "$@"
  fi
  return
}

function errorExit
{
  error "ERROR: script exiting"
  exit 1
}

function file_replace()
{
      oldfile=$1
#      带路径
      newfile=$2
      echo "old_file: $oldfile"
      echo "new_file: $newfile"
#      新文件不带路径
      if [ ! -f $oldfile ]; then
         warn "$oldfile not exists"
      fi
      target_dir=`echo ${oldfile%/*}`
      echo "target_dir:$target_dir"
        if [ -f $oldfile ]
        then
               echo "$oldfile exists"
               echo "rm $oldfile "
        fi
      echo "cp $newfile  $target_dir"
      cp $newfile $target_dir
}
/Library/apache-maven/bin/mvn clean package
file_replace /Library/apache-tomcat-7.0.96/webapps/springData.war  target/springData.war