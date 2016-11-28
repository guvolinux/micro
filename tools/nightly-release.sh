# This script creates the nightly release on Github for micro
# It assumes that the binaries are in the current directory
# You must have the correct Github access token to run this script

echo "Deleting old release"
github-release delete \
    --user zyedidia \
    --repo micro \
    --tag nightly

commitID=$(git rev-parse HEAD)

echo "Moving tag"
git tag --force nightly $commitID
git push --force --tags

echo "Creating new release"
github-release release \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "Nightly build" \
    --description "Autogenerated nightly build of micro" \
    --pre-release

echo "Uploading OSX binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-osx.tar.gz" \
    --file binaries/micro-$1-osx.tar.gz

echo "Uploading Linux 64 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-linux64.tar.gz" \
    --file binaries/micro-$1-linux64.tar.gz

echo "Uploading Linux 32 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-linux32.tar.gz" \
    --file binaries/micro-$1-linux32.tar.gz

echo "Uploading Linux Arm binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-linux-arm.tar.gz" \
    --file binaries/micro-$1-linux-arm.tar.gz

echo "Uploading FreeBSD 64 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-freebsd64.tar.gz" \
    --file binaries/micro-$1-freebsd64.tar.gz

echo "Uploading FreeBSD 32 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-freebsd32.tar.gz" \
    --file binaries/micro-$1-freebsd32.tar.gz

echo "Uploading OpenBSD 64 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-openbsd64.tar.gz" \
    --file binaries/micro-$1-openbsd64.tar.gz

echo "Uploading OpenBSD 32 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-openbsd32.tar.gz" \
    --file binaries/micro-$1-openbsd32.tar.gz

echo "Uploading NetBSD 64 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-netbsd64.tar.gz" \
    --file binaries/micro-$1-netbsd64.tar.gz

echo "Uploading NetBSD 32 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-netbsd32.tar.gz" \
    --file binaries/micro-$1-netbsd32.tar.gz

echo "Uploading Windows 64 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-win64.zip" \
    --file binaries/micro-$1-win64.zip

echo "Uploading Windows 32 binary"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-win32.zip" \
    --file binaries/micro-$1-win32.zip

echo "Uploading vendored tarball"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-src.tar.gz" \
    --file binaries/micro-$1-src.tar.gz

echo "Uploading vendored zip"
github-release upload \
    --user zyedidia \
    --repo micro \
    --tag nightly \
    --name "micro-$1-src.zip" \
    --file binaries/micro-$1-src.zip
