#!/bin/bash

baylang-nodejs make_all

rm -rf baylang/core-php/src/Runtime
rm -rf baylang/core-php/src/Runtime.Console
rm -rf baylang/core-php/src/Runtime.Crypt
rm -rf baylang/core-php/src/Runtime.ORM
rm -rf baylang/core-php/src/Runtime.Test
rm -rf baylang/core-php/src/Runtime.Unit
rm -rf baylang/core-php/src/Runtime.Web
rm -rf baylang/core-php/src/Runtime.Widget

cp -rf lib/Runtime/php baylang/core-php/src/Runtime
cp -rf lib/Runtime.Console/php baylang/core-php/src/Runtime.Console
cp -rf lib/Runtime.Crypt/php baylang/core-php/src/Runtime.Crypt
cp -rf lib/Runtime.ORM/php baylang/core-php/src/Runtime.ORM
cp -rf lib/Runtime.Test/php baylang/core-php/src/Runtime.Test
cp -rf lib/Runtime.Unit/php baylang/core-php/src/Runtime.Unit
cp -rf lib/Runtime.Web/php baylang/core-php/src/Runtime.Web
cp -rf lib/Runtime.Widget/php baylang/core-php/src/Runtime.Widget

cp lib/Runtime/bay/Loader.php baylang/core-php/src/Runtime/Loader.php

echo "Minify runtime.js"
./node_modules/.bin/uglifyjs ./baylang/core-php/assets/runtime.js \
    -o ./baylang/core-php/assets/runtime.min.js --compress --mangle

