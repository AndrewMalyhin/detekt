// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "Detekt",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v13),
        .tvOS(.v13)
    ], products: [
        .library(
            name: "detekt",
            targets: ["detekt"]),
    ],
    dependencies: [
        .package(
            name: "SwiftSyntax",
            url: "https://github.com/apple/swift-syntax.git",
            .exact("0.50400.0")
        ),
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            .upToNextMinor(from: "0.4.0")
        )
    ],
    targets: [
        .target(
            name: "detekt",
            dependencies: [
                "SwiftSyntax",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "detektTests",
            dependencies: ["detekt"]),
    ]
)
