# prepare
yes | sdkmanager "platforms;android-28"
wget https://services.gradle.org/distributions/gradle-3.5-bin.zip
unzip -qq gradle-3.5-bin.zip
export GRADLE_HOME=$PWD/gradle-3.5
export PATH=$GRADLE_HOME/bin:$PATH
git clone https://github.com/flutter/flutter.git -b dev --depth 1

# build
cd example
../flutter/bin/flutter -v build apk
