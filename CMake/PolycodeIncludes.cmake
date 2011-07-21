# platform specific defines and include directories for win and sdl
IF(MSVC)
    ADD_DEFINITIONS(/D_UNICODE /DUNICODE)
    INCLUDE_DIRECTORIES(${Polycode_SOURCE_DIR}/Core/Build/MSVC/Polycore)
ELSEIF(APPLE)
    ADD_DEFINITIONS(-DGL_GLEXT_PROTOTYPES)
    INCLUDE_DIRECTORIES("${Polycode_SOURCE_DIR}/Core/Build/Mac OS X")
ELSE(MSVC)
    ADD_DEFINITIONS(-DGL_GLEXT_PROTOTYPES)
    INCLUDE_DIRECTORIES(${Polycode_SOURCE_DIR}/Core/Build/Linux)
ENDIF(MSVC)

FIND_PACKAGE(OpenGL REQUIRED)
FIND_PACKAGE(ZLIB REQUIRED)
FIND_PACKAGE(PNG REQUIRED)
FIND_PACKAGE(PhysFS REQUIRED)
FIND_PACKAGE(OpenAL REQUIRED)
FIND_PACKAGE(Freetype REQUIRED)
FIND_PACKAGE(Ogg REQUIRED)
FIND_PACKAGE(Vorbis REQUIRED)
FIND_PACKAGE(VorbisFile REQUIRED)

# Use SDL on non-Apple unixes
IF(UNIX AND NOT APPLE)
    FIND_PACKAGE(SDL REQUIRED)
ENDIF(UNIX AND NOT APPLE)

#
# Set up common include directories
INCLUDE_DIRECTORIES(
    ${Polycode_SOURCE_DIR}/Core/Contents/Include
    ${OPENGL_INCLUDE_DIR}
    ${OPENAL_INCLUDE_DIR}
    ${FREETYPE_INCLUDE_DIRS}
    ${PHYSFS_INCLUDE_DIR}
    ${OGG_INCLUDE_DIR}
    ${VORBISFILE_INCLUDE_DIR}
    ${PNG_INCLUDE_DIR}
    ${OPENGLEXT_INCLUDE_DIR}
)
