#!/bin/bash

cd $(dirname "$0")
cd ..

rm -rf .tmp

COMMIT="bb112b5b402f2c50567c65a5e01f5fd742046320"

git clone https://github.com/microsoft/vscode-markdown-tm-grammar .tmp/vscode-markdown-tm-grammar

cd .tmp/vscode-markdown-tm-grammar

git checkout $COMMIT

cd ../../

cp -r .tmp/vscode-markdown-tm-grammar/test/colorize-fixtures .tmp/cases

cd .tmp/cases

for filename in *.md; do mv $filename vscode-markdown-${filename%.*}.md; done;

cd ../../

cp -a .tmp/cases/. test/cases/