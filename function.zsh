function bpcpp() {
	mkdir $1;
	cd $1;
	mkdir build;
	touch CMakeLists.txt;
	echo "cmake_minimum_required(VERSION 3.6)">>CMakeLists.txt;
	echo "project($1)">>CMakeLists.txt;
	echo "if(NOT CMAKE_BUILD_TYPE)">>CMakeLists.txt;
	echo "    set(CMAKE_BUILD_TYPE Debug CACHE STRING \"Build type\" FORCE)">>CMakeLists.txt;
	echo "endif()">>CMakeLists.txt;
	echo "add_library($1 STATIC $1.cpp $1.h)">>CMakeLists.txt;
	echo "add_executable(main main.cpp)">>CMakeLists.txt;
	echo "target_link_libraries(main $1)">>CMakeLists.txt;
	touch $1.cpp
	touch $1.h
	touch main.cpp
	echo "#include <iostream>\n#include \"$1.h\"">>main.cpp;
	echo "#pragma once\n#include<iostream>\nusing namespace std;\n">>$1.h;
	echo "#include\"$1.h\"">>$1.cpp;
}
function bpc() {
	mkdir $1;
	cd $1;
	mkdir build;
	touch CMakeLists.txt;
	echo "cmake_minimum_required(VERSION 3.6)">>CMakeLists.txt;
	echo "project($1)">>CMakeLists.txt;
	echo "if(NOT CMAKE_BUILD_TYPE)">>CMakeLists.txt;
	echo "    set(CMAKE_BUILD_TYPE Debug CACHE STRING \"Build type\" FORCE)">>CMakeLists.txt;
	echo "endif()">>CMakeLists.txt;
	echo "add_library($1 STATIC $1.c $1.h)">>CMakeLists.txt;
	echo "add_executable(main main.c)">>CMakeLists.txt;
	echo "target_link_libraries(main $1)">>CMakeLists.txt;
	touch $1.c
	touch $1.h
	touch main.c
	echo "#include <stdio.h>\n#include \"$1.h\"\n">>main.c;
    echo "void test(int argc,char**argv);\nint main(int argc,char**argv){\n    test(argc,argv);\n    return 0;\n}">>main.c;
	echo "#pragma once\n#include<stdio.h>\n">>$1.h;
	echo "#include\"$1.h\"\n">>$1.c;
    echo "void test(int argc,char**argv){\n}">>$1.c
}

function mr() {
	cd build;
	cmake ..;
	make -j10;
	./main $@;
}
function cdd(){
	cd ~/develop;
}
function fn(){
	find . -name $1;
}
