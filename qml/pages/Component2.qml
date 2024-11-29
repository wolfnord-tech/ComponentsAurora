import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: componentRect
    color: 'orange'
    implicitWidth: 200
    implicitHeight: 50

    signal deleteThis (var obj)

    Text {
        id: innerText
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: "text"
    }

    function setCurrentText(textName) {
        innerText.text = textName
    }

    Button {
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: "Удалить"

        onClicked: {
            componentRect.deleteThis(componentRect)
        }
    }
}
