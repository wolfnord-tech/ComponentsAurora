TARGET = pro.wolfnord.SilicaTest

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/Component2.qml \
    rpm/pro.wolfnord.SilicaTest.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/pro.wolfnord.SilicaTest.ts \
    translations/pro.wolfnord.SilicaTest-ru.ts \
