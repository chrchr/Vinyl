To build Vinyl, you'll need a recent build of Clay from
bitbucket (http://bitbucket.org/kssreeram/clay/) or
Github (http://github.com/jckarter/clay/). The precompiled
binaries at http://tachyon.in/clay/ have outdated libraries.

Once Clay is installed, the Xcode project should work
out of the box. If you installed Clay to a location other than
/usr/local, you'll need to edit the "Rules" tab of the
"Vinyl" target so that the "Custom script" rule for *.clay
files points to the correct location of clay-xcodebuild. You'll
also need to modify the header and library search paths if you
want to use ICU installed in a system path instead of within the
Vinyl project directory.
