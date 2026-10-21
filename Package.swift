// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TGMAdsFramework",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "TGMAdsFramework", targets: ["TGMAdapter"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "13.2.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "TGMAdsFramework",
            path: "Frameworks/TGMAdsFramework.xcframework"
        ),
        .target(
            name: "TGMAdapter",
            dependencies: [
                "TGMAdsFramework",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("WebKit")
            ]
        )
    ]
)
