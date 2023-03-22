# :rocket: rocksdb.swift

This is a fork of koraykoska's rocksdb.swift. It updates RocksDB to 6.29.5 to compile on Apple Silicon, and comes with a prebuilt binary xcframework to reduce compile times. In our project, RocksDB was responsible for around 70% of build
times.

This library provides Swift bindings for rocksdb as well as Swifty bindings.

## Compatibility

You can use this library with Swift Package Manager and Cocoapods on iOS, macOS, tvOS, watchOS and Linux.

## Installation

### CocoaPods

koraykoska's version has support for CocoaPods, but this fork doesn't. If you require it, it should be relatively
straightforward to add by diffing the changes this fork has done to Package.swift with koraykoska's branch and changing
the podspec files accordingly.

### Swift Package Manager

RocksDB is compatible with Swift Package Manager (Swift 5 and above). Simply add it to the dependencies in your Package.swift.

```Swift
dependencies: [
    .package(url: "https://github.com/TapeIt/rocksdb.swift.git", from: "6.29.5")
]
```

And then add it to your target dependencies:

```Swift
targets: [
    .target(
        name: "MyProject",
        dependencies: ["RocksDB"]),
    .testTarget(
        name: "MyProjectTests",
        dependencies: ["MyProject"])
]
```

After the installation you can import RocksDB in your .swift files.

```Swift
import RocksDB
```

## Usage

For now, check out the tests for examples on how to use this wrapper. Contributions to add more examples are happily welcome.

## Generating the binary xcframework
1. Install [https://swiftpackageindex.com/unsignedapps/swift-create-xcframework](swift-create-xcframework).
2. Run

```sh
swift create-xcframework --xc-setting HEADER_SEARCH_PATHS='$(HEADER_SEARCH_PATHS) $(SRCROOT)/Sources/librocksdb/upstream $(SRCROOT)/Sources/librocksdb/upstream/include'
```

The additional header search path settings are necessary because of a bug in how Xcode creates a project from
the Package.swift file - the headerSearchPath directive isn't expanded properly, so we redefine them here.

We didn't need watchOS or tvOS, so we omitted them in the framework to reduce download size (by specifying `--platform ios --platform macos --platform maccatalyst`).

## Versioning

Major and Minor Version numbers are kept in sync with the upstream rocksdb library. Patch version varies.

## License

rocksdb.swift is available under the MIT license. Copyright for rocksdb belongs to facebook.
