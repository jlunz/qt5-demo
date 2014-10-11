import QtQuick 2.3
import QtQuick.Particles 2.0

Rectangle {
    id: background
    color: "#000000"
    anchors.topMargin: 0
    anchors.fill: parent

    ParticleSystem {
        id: particleSystem
        running: true
    }
    Emitter {
        id: emitter
        system: particleSystem
        anchors.centerIn: background
        width: parent.width
        height: parent.height
        emitRate: 1000
        lifeSpan: 1000
        lifeSpanVariation: 500
        size: 16
        endSize: 320
    }

    ItemParticle {
        id: particle
        system: particleSystem
        delegate: itemDelegate
    }
    Component {
        id: itemDelegate
        Rectangle {
            id: container
            width: 1
            height: 1
            color: 'white'
        }
    }
    Attractor {
        id:blackhole
        system: particleSystem
        x: 0
        y: 0
        width: background.width
        height: background.height
        pointX: background.width/2
        pointY: background.height/2
        strength: 1.0
    }
}

