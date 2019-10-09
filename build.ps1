echo "@@@ Building components"
./node_modules/.bin/ngc -p tsconfig-release.json
echo "@@@ Building scss"
./node_modules/.bin/sass --update src/assets/components
echo "@@@ Building assets"
gulp build-assets
echo "@@@ Building exports"
gulp build-exports
npm pack
