:: cmd


:: Isolate the build.
mkdir Build
cd Build
if errorlevel 1 exit 1


:: Generate the build files.
cmake .. -G"Ninja" %CMAKE_ARGS% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DSPDLOG_FMT_EXTERNAL=ON ^
      -DSPDLOG_BUILD_SHARED=ON ^
      -DSPDLOG_BUILD_TESTS=ON ^
      -DCMAKE_BUILD_TYPE=Release


:: Build.
ninja
if errorlevel 1 exit 1


:: Perforem tests.
ninja test
if errorlevel 1 exit 1


:: Build and install.
ninja install
if errorlevel 1 exit 1


:: Error free exit.
exit 0
