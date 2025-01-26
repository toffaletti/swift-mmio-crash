// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "swift-mmio-crash",
  products: [
    .library(
      name: "swift-mmio-crash",
      type: .static,
      targets: ["swift-mmio-crash"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio.git", from: "0.0.2")
  ],
  targets: [
    .target(
      name: "swift-mmio-crash",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      swiftSettings: [
        // https://forums.swift.org/t/embedded-swift/67057?page=2
        .enableExperimentalFeature("Embedded"),
        // https://forums.swift.org/t/pitch-low-level-operations-for-volatile-memory-accesses/69483
        // .enableExperimentalFeature("Volatile"),
        .unsafeFlags(["-Xfrontend", "-disable-stack-protector"]),
        .unsafeFlags(["-Xfrontend", "-function-sections"]),
        .unsafeFlags(["-Xfrontend", "-no-allocations"]),

      ]
    )
  ],
  swiftLanguageModes: [.v6]
)
