import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Rectangle {
        id: mainrect
        anchors.fill: parent
        property var mainRectComponent: null

        Column {
            id: mainColumn
            spacing: 5
            width: parent.width


            property real count: 0

            function deleteItems(obj) {
                obj.destroy()
            }

            function createItem() {
                var color = "lightblue"
                if (mainColumn.count % 3 == 1) {
                    color = "lightgreen"
                } else if (mainColumn.count % 3 == 2) {
                    color = "lightyellow"
                }
                mainColumn.count++
                var obj = itemComponent.createObject(mainColumn,
                                                     {"color": color,
                                                      "width": mainrect.width
                                                     })
                obj.setCurrentText("Component: " + mainColumn.count.toString())
                obj.deleteThis.connect(mainColumn.deleteItems)

                var obj2 = itemComponent.createObject(mainColumn,
                                                     {"color": "orange",
                                                      "width": mainrect.width
                                                     })
                obj2.setCurrentText("Component: " + mainColumn.count.toString() + " из файла")
                obj2.deleteThis.connect(mainColumn.deleteItems)
            }
        }

        Button {
            anchors.top: mainColumn.bottom
            anchors.topMargin: 10
            anchors.right: mainrect.right
            anchors.rightMargin: 10
            text: "Добавить"

            onClicked: {
                mainColumn.createItem()
            }
        }

        Component.onCompleted: {
            if (mainRectComponent === null) {
                mainRectComponent = Qt.createComponent("Component2.qml")
            }
        }

        Component {
            id: itemComponent
            Rectangle {
                id: componentRect
                color: 'lightblue'
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
        }
    }
}
