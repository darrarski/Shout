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
      url: "https://github.com/IBM-Swift/BlueSocket.git",
      .upToNextMajor(from: "1.0.46")
    ),
  ],
  targets: [
    .target(
      name: "Shout",
      dependencies: [
        .target(
          name: "CSSH"
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
    .binaryTarget(
      name: "CSSH",
      url: "https://github.com/DimaRU/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/CSSH-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
      checksum: "ede00ee2151b2f29b48caf38aab1534e72a83c6c148d9ee05782e79a9e313e21"
    ),
  ]
)
