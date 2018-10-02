# Setting up features (enabled/disabled)

CONFIG(minimal) {
    DEFINES += ENABLE_NETSCAPE_PLUGIN_API=0
}

CONFIG(production) {
    DEFINES += ENABLE_XSLT=0
    DEFINES += ENABLE_WEB_TIMING=0
}

meegotouch {
    DEFINES += WTF_USE_MEEGOTOUCH=1
}

## load mobilityconfig if mobility is available
load(mobilityconfig, true)

## Define default features macros for optional components
## (look for defs in config.h and included files!)
# Try to locate sqlite3 source
CONFIG(QTDIR_build) {
    SQLITE3SRCDIR = $$QT_SOURCE_TREE/src/3rdparty/sqlite/
} else {
    SQLITE3SRCDIR = $$(SQLITE3SRCDIR)
    isEmpty(SQLITE3SRCDIR) {
        SQLITE3SRCDIR = $$[QT_INSTALL_PREFIX]/src/3rdparty/sqlite/
    }
}

contains(DEFINES, ENABLE_SINGLE_THREADED=1) {
    DEFINES+=ENABLE_DATABASE=0 ENABLE_DOM_STORAGE=0 ENABLE_ICONDATABASE=0 ENABLE_WORKERS=0 ENABLE_SHARED_WORKERS=0
}

# turn off SQLITE support if we do not have sqlite3 available
!CONFIG(QTDIR_build):win32-*:!exists( $${SQLITE3SRCDIR}/sqlite3.c ): DEFINES += ENABLE_SQLITE=0 ENABLE_DATABASE=0 ENABLE_WORKERS=0 ENABLE_SHARED_WORKERS=0 ENABLE_ICONDATABASE=0 ENABLE_OFFLINE_WEB_APPLICATIONS=0 ENABLE_DOM_STORAGE=0

!contains(DEFINES, ENABLE_JAVASCRIPT_DEBUGGER=.): DEFINES += ENABLE_JAVASCRIPT_DEBUGGER=1
!contains(DEFINES, ENABLE_DATABASE=.): DEFINES += ENABLE_DATABASE=1
!contains(DEFINES, ENABLE_EVENTSOURCE=.): DEFINES += ENABLE_EVENTSOURCE=1
!contains(DEFINES, ENABLE_OFFLINE_WEB_APPLICATIONS=.): DEFINES += ENABLE_OFFLINE_WEB_APPLICATIONS=1
!contains(DEFINES, ENABLE_DOM_STORAGE=.): DEFINES += ENABLE_DOM_STORAGE=1
!contains(DEFINES, ENABLE_ICONDATABASE=.): DEFINES += ENABLE_ICONDATABASE=1
!contains(DEFINES, ENABLE_CHANNEL_MESSAGING=.): DEFINES += ENABLE_CHANNEL_MESSAGING=1
!contains(DEFINES, ENABLE_DIRECTORY_UPLOAD=.): DEFINES += ENABLE_DIRECTORY_UPLOAD=0
!contains(DEFINES, ENABLE_FILE_SYSTEM=.): DEFINES += ENABLE_FILE_SYSTEM=0
!contains(DEFINES, ENABLE_QUOTA=.): DEFINES += ENABLE_QUOTA=0 

# turn on SQLITE support if any of the dependent features are turned on
!contains(DEFINES, ENABLE_SQLITE=.) {
  contains(DEFINES, ENABLE_DATABASE=1)|contains(DEFINES, ENABLE_ICONDATABASE=1)|contains(DEFINES, ENABLE_DOM_STORAGE=1)|contains(DEFINES, ENABLE_OFFLINE_WEB_APPLICATIONS=1) {
    DEFINES += ENABLE_SQLITE=1
  } else {
    DEFINES += ENABLE_SQLITE=0
  }
}

!contains(DEFINES, ENABLE_DASHBOARD_SUPPORT=.): DEFINES += ENABLE_DASHBOARD_SUPPORT=0
!contains(DEFINES, ENABLE_FILTERS=.): DEFINES += ENABLE_FILTERS=1
!contains(DEFINES, ENABLE_XPATH=.): DEFINES += ENABLE_XPATH=1
#!contains(DEFINES, ENABLE_XBL=.): DEFINES += ENABLE_XBL=1
!contains(DEFINES, ENABLE_WCSS=.): DEFINES += ENABLE_WCSS=0
!contains(DEFINES, ENABLE_SHARED_WORKERS=.): DEFINES += ENABLE_SHARED_WORKERS=1
!contains(DEFINES, ENABLE_WORKERS=.): DEFINES += ENABLE_WORKERS=1
!contains(DEFINES, ENABLE_XHTMLMP=.): DEFINES += ENABLE_XHTMLMP=0
!contains(DEFINES, ENABLE_DETAILS=.): DEFINES += ENABLE_DETAILS=1
!contains(DEFINES, ENABLE_METER_TAG=.): DEFINES += ENABLE_METER_TAG=1
!contains(DEFINES, ENABLE_PROGRESS_TAG=.): DEFINES += ENABLE_PROGRESS_TAG=1
!contains(DEFINES, ENABLE_BLOB=.): DEFINES += ENABLE_BLOB=1
!contains(DEFINES, ENABLE_NOTIFICATIONS=.): DEFINES += ENABLE_NOTIFICATIONS=1
!contains(DEFINES, ENABLE_INPUT_SPEECH=.): DEFINES += ENABLE_INPUT_SPEECH=0
!contains(DEFINES, ENABLE_INSPECTOR=.): DEFINES += ENABLE_INSPECTOR=1
!contains(DEFINES, ENABLE_3D_RENDERING=.): DEFINES += ENABLE_3D_RENDERING=1
!contains(DEFINES, ENABLE_WEB_AUDIO=.): DEFINES += ENABLE_WEB_AUDIO=0
!contains(DEFINES, ENABLE_WEBGL=.): DEFINES += ENABLE_WEBGL=0
!contains(DEFINES, ENABLE_MEDIA_STATISTICS=.): DEFINES += ENABLE_MEDIA_STATISTICS=0
!contains(DEFINES, ENABLE_VIDEO_TRACK=.): DEFINES += ENABLE_VIDEO_TRACK=0
!contains(DEFINES, ENABLE_TOUCH_ICON_LOADING=.): DEFINES += ENABLE_TOUCH_ICON_LOADING=0
!contains(DEFINES, ENABLE_ANIMATION_API=.): DEFINES += ENABLE_ANIMATION_API=0

# SVG support
!contains(DEFINES, ENABLE_SVG=0) {
    !contains(DEFINES, ENABLE_SVG=.): DEFINES += ENABLE_SVG=1
    !contains(DEFINES, ENABLE_SVG_FONTS=.): DEFINES += ENABLE_SVG_FONTS=1
    !contains(DEFINES, ENABLE_SVG_FOREIGN_OBJECT=.): DEFINES += ENABLE_SVG_FOREIGN_OBJECT=1
    !contains(DEFINES, ENABLE_SVG_ANIMATION=.): DEFINES += ENABLE_SVG_ANIMATION=1
    !contains(DEFINES, ENABLE_SVG_AS_IMAGE=.): DEFINES += ENABLE_SVG_AS_IMAGE=1
    !contains(DEFINES, ENABLE_SVG_USE=.): DEFINES += ENABLE_SVG_USE=1
} else {
    DEFINES += ENABLE_SVG_FONTS=0 ENABLE_SVG_FOREIGN_OBJECT=0 ENABLE_SVG_ANIMATION=0 ENABLE_SVG_AS_IMAGE=0 ENABLE_SVG_USE=0
}

# HTML5 datalist support
!contains(DEFINES, ENABLE_DATALIST=.): DEFINES += ENABLE_DATALIST=1

# Tiled Backing Store support
!contains(DEFINES, ENABLE_TILED_BACKING_STORE=.): DEFINES += ENABLE_TILED_BACKING_STORE=1

# Nescape plugins support (NPAPI)
!contains(DEFINES, ENABLE_NETSCAPE_PLUGIN_API=.) {
    unix|win32-*:!embedded:!wince*: {
        DEFINES += ENABLE_NETSCAPE_PLUGIN_API=1
    } else {
        DEFINES += ENABLE_NETSCAPE_PLUGIN_API=0
    }
}

# Web Socket support.
!contains(DEFINES, ENABLE_WEB_SOCKETS=.): DEFINES += ENABLE_WEB_SOCKETS=1

# Web Timing support.
!contains(DEFINES, ENABLE_WEB_TIMING=.): DEFINES += ENABLE_WEB_TIMING=1

# XSLT support with QtXmlPatterns
!contains(DEFINES, ENABLE_XSLT=.) {
    contains(QT_CONFIG, xmlpatterns):DEFINES += ENABLE_XSLT=1
    else:DEFINES += ENABLE_XSLT=0
}

# geolocation support if QtMobility exists
!CONFIG(QTDIR_build):!contains(DEFINES, ENABLE_GEOLOCATION=.) {
    contains(MOBILITY_CONFIG, location) {
       DEFINES += ENABLE_GEOLOCATION=1
       DEFINES += ENABLE_CLIENT_BASED_GEOLOCATION=1
    }
}

# orientation support if QtMobility exists
contains(MOBILITY_CONFIG, sensors) {
   !contains(DEFINES, ENABLE_ORIENTATION_EVENTS=.): DEFINES += ENABLE_ORIENTATION_EVENTS=1
   !contains(DEFINES, ENABLE_DEVICE_ORIENTATION=.): DEFINES += ENABLE_DEVICE_ORIENTATION=1
   CONFIG *= mobility
   MOBILITY *= sensors
}

# systeminfo support if QtMobility systeminfo module exists, but only for symbian, maemo and meego
symbian|maemo5|maemo6 {
    !CONFIG(QTDIR_build):!contains(DEFINES, WTF_USE_QT_MOBILITY_SYSTEMINFO=.) {
        contains(MOBILITY_CONFIG, systeminfo) {
            DEFINES += WTF_USE_QT_MOBILITY_SYSTEMINFO=1
        }
    }
}

# Bearer management is part of Qt 4.7
# for older version, check for mobility with bearer
!contains(DEFINES, WTF_USE_QT_BEARER=.) {
     !lessThan(QT_MINOR_VERSION, 7) {
        DEFINES += WTF_USE_QT_BEARER=1
     } else {
        contains(MOBILITY_CONFIG, bearer) {
            DEFINES += WTF_USE_QT_BEARER=1
        }
    }
}

!contains(DEFINES, ENABLE_TOUCH_EVENTS=.): DEFINES += ENABLE_TOUCH_EVENTS=1

# HTML5 Media Support
# We require QtMultimedia
!contains(DEFINES, ENABLE_VIDEO=.) {
    DEFINES -= ENABLE_VIDEO=1
    DEFINES += ENABLE_VIDEO=0

    linux-*:!contains(DEFINES, USE_QTMULTIMEDIA=1) {
        !contains(QT_CONFIG, no-pkg-config):system(pkg-config --exists glib-2.0 gio-2.0 gstreamer-0.10): {
            DEFINES -= ENABLE_VIDEO=0
            DEFINES += ENABLE_VIDEO=1
            DEFINES += WTF_USE_GSTREAMER=1
            DEFINES -= WTF_USE_GSTREAMER=0
        } else {
            message("Disabling video due the lack of GLib/Gio/GStreamer.")
            DEFINES -= ENABLE_VIDEO=1
            DEFINES += ENABLE_VIDEO=0
        }
    } else: contains(MOBILITY_CONFIG, multimedia) {
        DEFINES -= ENABLE_VIDEO=0
        DEFINES += ENABLE_VIDEO=1
        DEFINES -= WTF_USE_QT_MULTIMEDIA=0
        DEFINES += WTF_USE_QT_MULTIMEDIA=1
    }
}

# Used to compute defaults for the build-webkit script
CONFIG(compute_defaults) {
    message($$DEFINES)
    error("Done computing defaults")
}

contains(DEFINES, ENABLE_WCSS=1) {
    contains(DEFINES, ENABLE_XHTMLMP=0) {
        DEFINES -= ENABLE_XHTMLMP=0
        DEFINES += ENABLE_XHTMLMP=1
    }
}

## Forward enabled feature macros to JavaScript enabled features macros
FEATURE_DEFINES_JAVASCRIPT = LANGUAGE_JAVASCRIPT=1
v8: FEATURE_DEFINES_JAVASCRIPT += V8_BINDING=1
contains(DEFINES, ENABLE_CHANNEL_MESSAGING=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_CHANNEL_MESSAGING=1
contains(DEFINES, ENABLE_ORIENTATION_EVENTS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_ORIENTATION_EVENTS=1
contains(DEFINES, ENABLE_EVENTSOURCE=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_EVENTSOURCE=1
contains(DEFINES, ENABLE_DATABASE=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_DATABASE=1
contains(DEFINES, ENABLE_DATALIST=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_DATALIST=1
contains(DEFINES, ENABLE_DOM_STORAGE=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_DOM_STORAGE=1
contains(DEFINES, ENABLE_SHARED_SCRIPT=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SHARED_SCRIPT=1
contains(DEFINES, ENABLE_WORKERS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_WORKERS=1
contains(DEFINES, ENABLE_SHARED_WORKERS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SHARED_WORKERS=1
contains(DEFINES, ENABLE_VIDEO=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_VIDEO=1
contains(DEFINES, ENABLE_XPATH=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_XPATH=1
contains(DEFINES, ENABLE_XSLT=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_XSLT=1
contains(DEFINES, ENABLE_XBL=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_XBL=1
contains(DEFINES, ENABLE_FILTERS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_FILTERS=1
contains(DEFINES, ENABLE_WCSS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_WCSS=1
contains(DEFINES, ENABLE_XHTMLMP=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_XHTMLMP=1
contains(DEFINES, ENABLE_SVG=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SVG=1
contains(DEFINES, ENABLE_SVG_ANIMATION=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SVG_ANIMATION=1
contains(DEFINES, ENABLE_SVG_FONTS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SVG_FONTS=1
contains(DEFINES, ENABLE_SVG_FOREIGN_OBJECT=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_SVG_FOREIGN_OBJECT=1
contains(DEFINES, ENABLE_JAVASCRIPT_DEBUGGER=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_JAVASCRIPT_DEBUGGER=1
contains(DEFINES, ENABLE_OFFLINE_WEB_APPLICATIONS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_OFFLINE_WEB_APPLICATIONS=1
contains(DEFINES, ENABLE_WEB_SOCKETS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_WEB_SOCKETS=1
contains(DEFINES, ENABLE_WEB_TIMING=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_WEB_TIMING=1
contains(DEFINES, ENABLE_TOUCH_EVENTS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_TOUCH_EVENTS=1
contains(DEFINES, ENABLE_TILED_BACKING_STORE=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_TILED_BACKING_STORE=1
contains(DEFINES, ENABLE_NOTIFICATIONS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_NOTIFICATIONS=1
contains(DEFINES, ENABLE_DETAILS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_DETAILS=1
contains(DEFINES, ENABLE_METER_TAG=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_METER_TAG=1
contains(DEFINES, ENABLE_PROGRESS_TAG=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_PROGRESS_TAG=1
contains(DEFINES, ENABLE_GEOLOCATION=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_GEOLOCATION=1
contains(DEFINES, ENABLE_BLOB=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_BLOB=1
contains(DEFINES, ENABLE_MEDIA_STATISTICS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_MEDIA_STATISTICS=1
contains(DEFINES, ENABLE_VIDEO_TRACK=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_VIDEO_TRACK=1
contains(DEFINES, ENABLE_DATA_TRANSFER_ITEMS=1): FEATURE_DEFINES_JAVASCRIPT += ENABLE_DATA_TRANSFER_ITEMS=1
