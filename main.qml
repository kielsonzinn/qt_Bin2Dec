import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr( "Bin2Dec" )

    Item {
        anchors.fill: parent

        Column {
            spacing: 32
            anchors.centerIn: parent

            Column {
                spacing: 24

                Column {
                    id: tflBinary
                    spacing: 4

                    Text {
                        text: "Binary"
                    }

                    TextField {
                        id: tfBinary
                        width: 320
                        height: 48

                        property bool __init: false

                        onTextChanged: {
                            __init = true;
                        }

                        background: Rectangle {
                           border.color: tfBinary.acceptableInput || !tfBinary.__init ? ( tfBinary.focus ? "#00A6E6" : "#000000" ) : "#FF6863"
                           radius: 8
                       }

                        validator: RegExpValidator {
                            regExp: /[01]{1,8}/
                        }
                    }
                }

                Column {
                    id: tflDecimal
                    spacing: 4

                    Text {
                        text: "Decimal"
                    }

                    TextField {
                        id: tfDecimal
                        width: 320
                        height: 48
                        readOnly: true
                        text: tfBinary.text !== "" ? parseInt( tfBinary.text, 2 ) : ""

                        background: Rectangle {
                           border.color: "#000000"
                           radius: 8
                       }
                    }
                }
            }
        }
    }
}
