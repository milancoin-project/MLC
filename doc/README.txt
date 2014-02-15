http://sourceforge.net/projects/boost/files/boost/1.54.0/
	wget http://sourceforge.net/projects/boost/files/boost/1.54.0/boost_1_54_0.tar.bz2
	wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
http://www.openssl.org/source/
	wget http://www.openssl.org/source/openssl-1.0.1e.tar.gz
http://miniupnp.free.fr/files/
	wget http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.8.20131007.tar.gz

V:\bibibi\soft\openssl-1.0.1c
<<msys shell>>
        cd /V/bibibi/soft/openssl-1.0.1c
        /v/mingw/bin/mingw-get install msys-perl
        ./config
        make

V:\bibibi\soft\db-4.8.30.NC\build_unix
<<msys shell>>
        cd /v/bibibi/soft/db-4.8.30.NC/build_unix
        ../dist/configure --disable-replication --enable-mingw --enable-cxx  {linux not --enable-mingw }
        db.h  line113: 
        typedef pthread_t db_threadid_t;
        to
        typedef u_int32_t db_threadid_t;
        make

V:\bibibi\src\siry\src\leveldb
<<msys shell>>
        cd /v/bibibi/src/siry/src/leveldb
        TARGET_OS=NATIVE_WINDOWS make libleveldb.a libmemenv.a CXX='gcc -g'

V:\bibibi\soft\miniupnpc-1.8
<<windows cmd>>
	cd V:\bibibi\soft\miniupnpc-1.8
	mkdir v:/mingw/include/miniupnpc
	cp *.h v:/mingw/include/miniupnpc
	mingw32make.bat
		CC=gcc make upnpc-static  //static
		mkdir miniupnpc
		cp *.h miniupnpc
		
		
V:\bibibi\soft\boost_1_54_0    
<<windows cmd>>
        cd V:\bibibi\soft\boost_1_54_0
        bootstrap.bat mingw
        b2 --build-type=complete --with-chrono --with-filesystem --with-program_options --with-system --with-thread toolset=gcc stage
	{{linux}}
		./bootstrap.sh
		//./bjam link=static runtime-link=static install
		./b2 link=static --with-chrono --with-filesystem --with-program_options --with-system --with-thread toolset=gcc stage

V:\bibibi\src\siry\src\
<<windows cmd>>
        cd V:\bibibi\src\siry\src\

	    //change makefile.mingw makefile.unix
		
        BOOST_SUFFIX?=-mgw46-mt-d-1_54  

        INCLUDEPATHS= \
         -I"$(CURDIR)" \
         -I"v:/bibibi/soft/boost_1_54_0" \
         -I"v:/bibibi/soft/db-4.8.30.NC/build_unix" \
         -I"v:/bibibi/soft/openssl-1.0.1c/include"

        LIBPATHS= \
         -L"$(CURDIR)/leveldb" \
         -I"v:/bibibi/soft/boost_1_54_0/stage/lib" \
         -I"v:/bibibi/soft/db-4.8.30.NC/build_unix" \
         -I"v:/bibibi/soft/openssl-1.0.1c"
	
	{{linux centos x86_64}}
        INCLUDEPATHS= \
         -I"$(CURDIR)" \
         -I"../../boost_1_54_0" \
         -I"../../db-4.8.30.NC/build_unix" \
         -I"../../openssl-1.0.1e/include"
	 -I"/root/milancoin/miniupnpc-1.8/miniupnpc"

        LIBPATHS= \
         -L"$(CURDIR)/leveldb" \
         -I"../../boost_1_54_0/stage/lib" \
         -I"../../db-4.8.30.NC/build_unix" \
         -I"../../openssl-1.0.1e"
         -I"../../miniupnpc-1.8"

V:\bibibi\src\siry\src
<<windows cmd>>
	cd V:\bibibi\src\siry\src
        mingw32-make -f makefile.mingw
        strip milancoind.exe

download qt-win-opensource-4.8.5-mingw.exe
cd V:\bibibi\src\siry\
<<windows cmd>>
	qmake milancoin-qt.pro
	mingw32-make -f Makefile.Release

lrelease milancoin-qt.pro //tsfile


hashGenesisBlock  pszTimestamp  {keyword}
main.cpp:1069line:  GetBlockValue : blook size


git clone https://github.com/milancoin-project/MLC.git
//local dev
	git checkout -b milancoin-1.0.0
	git add *
	git commit -m "README git"
	git push
//
//change branch
	git checkout milancoin-1.0.0
//

//milancoin-project dev first time
	git push origin milancoin-1.0.0
//
//How to get just one file from another branch
git checkout remotes/origin/milancoin-1.0.0 -- README
