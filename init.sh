#!/bin/bash

NODE_VERSION=0.12.7
RUBY_VERSION=2.2.3


echo "Checking for Node version ${NODE_VERSION}"
node -v | grep ${NODE_VERSION} >/dev/null 2>&1
if [[ $? != 0 ]]; then
    echo -n "Node version ${NODE_VERSION} is not installed"
    exit
fi


echo "Checking for Ruby version ${RUBY_VERSION}"
ruby -v | grep ${RUBY_VERSION} >/dev/null 2>&1
if [[ $? != 0 ]]; then
    echo -n "Ruby version ${RUBY_VERSION} is not installed"
    exit
fi



p=$(eval npm list -g | grep grunt-cli)

echo "Checking for grunt-cli"
npm -v grunt-cli >/dev/null 2>&1
if [[ $? != 0 ]]; then
    echo -n "grunt-cli is not installed"
elif [[ ${p//[^0-9_.]/} = 0 ]]; then2
  echo "grunt-cli isn't installed globally"

  npm install -g grunt-cli
fi


#TODO
# check if package dependencies are indeed installed

# install remaining modules locally
npm install


echo 'Checking for bundler gem'
if ! [ $(gem list bundler -i) ]; then
  gem install bundler
fi
