// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "Shout",
  platforms: [
    .iOS(.v14),
  ],
  products: [
    .library(
      name: "Shout",
      targets: ["Shout"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/DimaRU/Libssh2Prebuild.git",
      branch: "1.10.0+OpenSSL_1_1_1o"
    ),
    .package(
      url: "https://github.com/IBM-Swift/BlueSocket.git",
      .upToNextMajor(from: "1.0.46")
    ),
  ],
  targets: [
    .target(
      name: "Shout",
      dependencies: [
        .product(
          name: "CSSH",
          package: "Libssh2Prebuild"
        ),
        .product(
          name: "Socket",
          package: "BlueSocket"
        ),
      ]
    ),
    .testTarget(
      name: "ShoutTests",
      dependencies: [
        .target(name: "Shout"),
      ]
    ),
  ]
)
