// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLibModbus",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CModbus",
            targets: ["CModbus"]),
        .library(
            name: "SwiftLibModbus",
            targets: ["SwiftLibModbus"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(name:"CModbus",path:"../CModbus")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CModbus",
            linkerSettings: [.unsafeFlags(["-lbsd"])]
        ),
        .target(
            name: "SwiftLibModbus",
            dependencies: ["CModbus"]),
        .testTarget(
            name: "SwiftLibModbusTests",
            dependencies: ["SwiftLibModbus"]),
    ]
)
