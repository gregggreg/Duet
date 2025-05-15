// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Duet",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "Duet",
            targets: ["Duet"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Duet",
            dependencies: []
        ),
        .testTarget(
            name: "DuetTests",
            dependencies: ["Duet"]
        ),
    ]
)
