#   ARPACK_FOUND         : True if APPACK_INCLUDE_DIR are found
#   ARPACK_INCLUDE_DIR   : where to find argeig.h, etc.
#   ARPACK_INCLUDE_DIRS  : set when ARPACK_INCLUDE_DIR found
#   ARPACK_LIBRARIES     : libarpack.a


# Find include dir
IF(ARPACK_INCLUDE_DIRS)
  FIND_PATH(ARPACK_INCLUDE_DIR argeig.h ${ARPACK_INCLUDE_DIRS})
  FIND_LIBRARY(ARPACK_LIBRARY arpack ${ARPACK_LIBRARY_DIRS})
ELSE(ARPACK_INCLUDE_DIRS)
    SET(TRIAL_PATHS
      $ENV{HOME}/installs/include
      /usr/include
      /usr/local/include
      $ENV{HOME}/opt/arpackpp/include
    )
    SET(TRIAL_LIBRARY_PATHS
      /usr/lib
      /usr/lib64
      /usr/local/lib
      /opt/lib
      $ENV{HOME}/installs/lib
    )
    
    FIND_PATH(ARPACK_INCLUDE_DIR argeig.h ${TRIAL_PATHS})
    FIND_LIBRARY(ARPACK_LIBRARY arpack ${TRIAL_LIBRARY_PATHS})
ENDIF(ARPACK_INCLUDE_DIRS)
set(ARPACK_INCLUDE_DIRS ${ARPACK_INCLUDE_DIR} )
set(ARPACK_LIBRARIES ${ARPACK_LIBRARY} )

SET(ARPACK_FOUND FALSE)
IF(ARPACK_INCLUDE_DIR AND ARPACK_LIBRARIES)
  MESSAGE(STATUS "ARPACK_INCLUDE_DIR=${ARPACK_INCLUDE_DIR}")
  MESSAGE(STATUS "ARPACK_LIBRARIES=${ARPACK_LIBRARIES}")
  SET(ARPACK_FOUND TRUE)
ELSE()
  MESSAGE("AAAAAAAAAAAA...")
ENDIF()

MARK_AS_ADVANCED(
   ARPACK_INCLUDE_DIR
   ARPACK_LIBRARIES
   ARPACK_FOUND
)
