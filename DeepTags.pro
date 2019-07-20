#-------------------------------------------------
#
# Project created by QtCreator 2019-07-14T23:10:28
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = DeepTags
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++17 -lstdc++fs -pthread
#LIBS += -L/usr/local/lib -lyaml-cpp		# These would probably have to be changed
#INCLUDEPATH = -I/usr/local/include

SUBDIRS = src src/back
PARENT_DIR = $${PWD}/
SRC_DIR = $${PARENT_DIR}/src
GUI_DIR = $${SRC_DIR}/gui
BACK_DIR = $${SRC_DIR}/back/

BACK_HEADERS =  $${BACK_DIR}/common.h $${BACK_DIR}/element.h \
                $${BACK_DIR}/extract.h $${BACK_DIR}/fetch.h \
                $${BACK_DIR}/headers.h $${BACK_DIR}/yaml.h
BACK_SOURCES =  $${BACK_DIR}/element.cpp $${BACK_DIR}/extract.cpp \
                $${BACK_DIR}/fetch.cpp $${BACK_DIR}/headers.cpp \
                $${BACK_DIR}/yaml.cpp
GUI_HEADERS  =  $${GUI_DIR}/fileitem.h $${GUI_DIR}/filescontainer.h \
                $${GUI_DIR}/mainwindow.h $${GUI_DIR}/opendirs.h \
                $${GUI_DIR}/tagitem.h $${GUI_DIR}/tagscontainer.h
GUI_SOURCES  =  $${GUI_DIR}/fileitem.cpp $${GUI_DIR}/filescontainer.cpp \
                $${GUI_DIR}/mainwindow.cpp $${GUI_DIR}/opendirs.cpp \
                $${GUI_DIR}/tagitem.cpp $${GUI_DIR}/tagscontainer.cpp


SOURCES += $${SRC_DIR}/main.cpp $${BACK_SOURCES} $${GUI_SOURCES}

HEADERS += $${BACK_HEADERS} $${GUI_HEADERS}

DESTDIR = $${PARENT_DIR}/tmp_bin
OBJECTS_DIR = $${PARENT_DIR}/tmp_obj
MOC_DIR = $${OBJECTS_DIR}/tmp_moc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    DeepTags.qrc
