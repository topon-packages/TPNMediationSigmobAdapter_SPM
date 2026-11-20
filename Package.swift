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
        .package(url: "https://github.com/Sigmob/sigmob-adsdk-ios-spm.git", exact: "5.2.3")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkSigmobAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkSigmobAdapter/50203.2.10/AnyThinkSigmobAdapter-50203.2.10.zip",
            // NOTE: Checksum should be updated with `swift package compute-checksum <zip>` once adapter 5.2.0.2.0 is packaged and uploaded to OSS.
            checksum: "483e2a5be8ba6787bba74b0e4f5e8301f3876faf3873bd6d8a49c0661560de34"
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
