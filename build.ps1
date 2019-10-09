
if (Test-Path "./dist")
{
    rm -r ./dist
}
if (Test-Path "./resources")
{
    rm -r ./resources
}
if (Test-Path "./pkg")
{
    rm -r ./pkg
}
mkdir pkg
cp package.json ./pkg/package.json

echo "@@@ Building components"
./node_modules/.bin/ngc -p tsconfig-release.json
echo "@@@ Building scss"
./node_modules/.bin/sass --update src/assets/components
echo "@@@ Building assets"
gulp build-assets
mv ./resources ./pkg/resources
echo "@@@ Building exports"
gulp build-exports
Move-Item -Path ./pkg/primeng-*.tgz -Destination ./

cd pkg
npm pack
cd ..

