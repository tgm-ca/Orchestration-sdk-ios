# TGM iOS SDK

TGM advertising mediation framework for iOS 15.0 and later. Release version: **1.7.7**. Supports iOS devices (arm64) and Simulator (arm64 and x86_64).

## Swift Package Manager

In Xcode, choose **File → Add Package Dependencies** and enter:

```text
https://github.com/tgm-ca/Orchestration-sdk-ios
```

Select version **1.7.7** or later within the same major version, then add the **TGMAdsFramework** product to your app target. 

```swift
import TGMAdsFramework
```

The package declares Google Mobile Ads **13.2.0**, matching the framework build. Configure your Google Mobile Ads application ID and ad units in the host application.

## Custom-event mediation

Use this exact custom-event class name in your Google mediation configuration:

```text
TGMAdsFramework.MediationCustomEvent
```

Supply the configured server parameters, for example:

```json
{"placement_id":"YOUR_PLACEMENT_ID"}
```

The adapter also accepts the existing `adunit_id` and `yield_group_bid_price_range` parameters. Ad-loading behavior and SDK APIs are unchanged; direct SDK integrations continue to use APIs such as `AdSter.sharedInstance()` and `AdSterAdLoader()` from `TGMAdsFramework`.

Use the TGM framework as the replacement for the original AdsFramework distribution in your app.

## Maintaining a release

The binary is committed under `Frameworks/TGMAdsFramework.xcframework`; no download URL or external release asset is required for Swift Package Manager.

1. Build and test the client SDK in the sibling `../tgm-ios-sdk` checkout using `scripts/build-xcframework.sh`.
2. Replace this repository's `Frameworks/TGMAdsFramework.xcframework` with that build's output.
3. Update this README to match the binary's version.
4. Validate:

   ```sh
   swift package dump-package
   xcodebuild -scheme TGMAdsFramework -destination 'generic/platform=iOS Simulator' \
     -derivedDataPath /tmp/TGM-distribution-spm CODE_SIGNING_ALLOWED=NO build
   ```

5. Commit the distribution files, push the branch, and push a matching version tag to enable versioned Swift Package Manager installation. Never overwrite a published version tag.

The copied license is retained with its original attribution.
