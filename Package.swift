// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "JXPageControl",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "JXPageControl", targets: ["JXPageControl"])
    ],
    targets: [
        .target(
            name: "JXPageControl",
            path: "JXPageControl/Classes"
        )
    ],
    swiftLanguageVersions: [.v5]
)
