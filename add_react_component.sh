#!/bin/sh

# Author : nitnub
# Copyright (c) nitnub

# Populate boilerplate for a React Component

echo "Path to desired parent component folder:"
read PROJECT_PATH

echo "Component name:"
read NAME

echo "Is this a TypeScript project? (y/n)"
read TS_RESPONSE

echo "Create module.css file? (y/n)"
read MODULE_RESPONSE

EXT="jsx"

if [ "$TS_RESPONSE" = "y" ]; then 
  EXT="tsx"
fi

C_PATH=$PROJECT_PATH/$NAME/
mkdir -p $C_PATH

MODULE_IMPORT="import styles from './$NAME.module.css'
"

C_BODY="export default function $NAME(props) {

  return (
    <>

    </>
  )
}" 

I_BODY="import $NAME from './$NAME';

export default $NAME;"

# Create and import module if requested
if [ "$MODULE_RESPONSE" = "y" ]; then 
  echo "$MODULE_IMPORT" >> $C_PATH/$NAME.$EXT

  touch $C_PATH/$NAME.module.css
fi

echo "$C_BODY" >> $C_PATH/$NAME.$EXT
echo "$I_BODY" >> $C_PATH/index.$EXT

echo "Files created at $C_PATH"
