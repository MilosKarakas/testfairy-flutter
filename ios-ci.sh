set -e

# prepare
yes | gem uninstall --all cocoapods
gem install -n /usr/local/bin cocoapods -v 1.7.5
alias pod="pod _1.7.5_"
pod --version
pip install six
brew update
brew install --HEAD libimobiledevice
brew install ideviceinstaller
brew install ios-deploy
git clone https://github.com/flutter/flutter.git -b dev --depth 1

# build
cd example
../flutter/bin/flutter -v build ios --simulator --no-codesign || echo Failing on purpose
mv ios/Podfile ios/_podfile
echo "use_frameworks!" > ios/Podfile
cat ios/_podfile >> ios/Podfile
cat ios/Podfile
rm ios/_podfile
pod --version
pod repo update
cd ios
pod install
cd ..
../flutter/bin/flutter -v build ios --simulator --no-codesign