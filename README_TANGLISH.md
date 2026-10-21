# Hosur City Best Taxi — Cross-platform Flutter starter

Indha source bundle Flutter use pannum. Flutter-la irundhu Android + iOS app build panna mudiyum.
Idhu current native Java source bundle-ku replacement starter; rendu platform-ku same Flutter codebase.

## Repo structure
- customer-app/lib/main.dart — customer app UI starter
- driver-app/lib/main.dart — driver app UI starter
- .github/workflows/build-android.yml — cloud-la APK + AAB build
- .github/workflows/check-ios.yml — macOS cloud runner-la unsigned iOS build check

## GitHub setup
1. GitHub-la pudhu repository create pannunga (example: hosur-city-best-taxi-flutter).
2. Indha ZIP extract pannunga.
3. ZIP contents ellathayum repository root-la upload/commit pannunga.
4. Actions tab -> Build Android Apps -> Run workflow.
5. Build successful aana `taxi-android-builds` artifact download pannunga. APK testing-ku; AAB Play Store release preparation-ku.

## Important limitations
- UI starter mattum. Login, real booking database, driver accept/reject, push notifications, GPS tracking, admin tools innum integrate/test pannanum.
- Existing website/backend automatically connect aagathu. Backend endpoint/schema/credentials-ai secure GitHub Secrets moolama configure pannanum; secret values-ai source code-la commit panna koodathu.
- iOS check workflow unsigned build mattum. App Store-la publish panna Apple Developer Program, signing certificates/provisioning, App Store Connect setup and Apple review thevai.
- App Store release/signing-ku paid Apple Developer membership generally $99/year; region/currency vary aagalam. Google Play Console registration fee separate.
