@echo off
mxmlc -source-path+=lib\starling\src -library-path+=lib\CGSCommon.swc -frame two, Main -incremental=false -static-link-runtime-shared-libraries=true src\Preloader.as -output ymtd.swf
