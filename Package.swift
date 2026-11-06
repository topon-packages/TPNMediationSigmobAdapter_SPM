// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TPNMediationSigmobAdapter",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "TPNMediationSigmobAdapter",
            targets: ["TPNMediationSigmobAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/topon-packages/TPNiOS_SPM.git", from: "6.5.60"),
        .package(url: "https://github.com/Sigmob/sigmob-adsdk-ios-spm", exact: "5.2.3")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkSigmobAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkSigmobAdapter/5.2.0.2.0/AnyThinkSigmobAdapter-5.2.0.2.0.zip",
            checksum: "478fd71dd56b70a90a600debd4e4e1bcfdf4339f777a690e3886b4e138a3ef47"
        ),
        .target(
            name: "TPNMediationSigmobAdapterTarget",
            dependencies: [
                "AnyThinkSigmobAdapter",
                .product(name: "TPNiOS", package: "TPNiOS_SPM"),
                .product(name: "WindSDK", package: "sigmob-adsdk-ios-spm")
            ],
            path: "Sources/TPNMediationSigmobAdapterTarget"
        )
    ]
)
