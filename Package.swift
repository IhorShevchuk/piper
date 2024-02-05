
// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "piper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "piper",
            targets: ["piper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IhorShevchuk/espeak-ng-spm",
                 revision: "15b87671e3c7486b6a4404f997b1ae59a7eae441"),
        .package(url: "https://github.com/IhorShevchuk/fmt",
                 .upToNextMajor(from: "10.2.1")),
        .package(url: "https://github.com/IhorShevchuk/spdlog",
                 .upToNextMajor(from: "1.13.0")),
        .package(url: "https://github.com/IhorShevchuk/piper-phonemize",
                 revision: "6d6be72f28d811fbcfa1cecd645f009741aa9029"),
    ],
    targets: [
        .target(name: "piper",
                dependencies: [
                    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
                    .product(name: "fmt", package: "fmt"),
                    .product(name: "spdlog", package: "spdlog"),
                    .product(name: "piper_phonemize", package: "piper-phonemize"),
                ],
                path: "",
                exclude:[
                ],
                sources:[
                    "src/cpp/piper.cpp",
                ],
                publicHeadersPath:"src/cpp"
               )
    ],
    cxxLanguageStandard: .cxx17
)
