import CoreBluetooth

struct ScanItem {
    let name: String
    let rssi: Int
    let peripheral: CBPeripheral
}

enum ScanError {
    case noCbCentralManager
    case bluetoothUnavailable(CBManagerState)

    var describe: String {
        switch self {
        case .noCbCentralManager:
            return "No CBCentralManager available"
        case let .bluetoothUnavailable(state):
            switch state {
            case .poweredOff:
                return String(
                    localized: "Bluetooth is turned off. Turn on Bluetooth to find your transmitter.",
                    comment: "Scan error when Bluetooth is off"
                )
            case .unauthorized:
                return String(
                    localized: "Bluetooth access is not allowed. Allow Bluetooth for this app in Settings to find your transmitter.",
                    comment: "Scan error when Bluetooth permission is denied"
                )
            case .unsupported:
                return String(
                    localized: "This device does not support Bluetooth.",
                    comment: "Scan error when Bluetooth is unsupported, e.g. the iOS Simulator"
                )
            default:
                return String(
                    localized: "Bluetooth is not available.",
                    comment: "Scan error for any other unavailable Bluetooth state"
                )
            }
        }
    }
}
