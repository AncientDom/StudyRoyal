# StudyRoyal

A comprehensive study management application designed to help students organize their academic work, track progress, and achieve their learning goals efficiently.

## Table of Contents

- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [APK Download](#apk-download)
- [Project Structure](#project-structure)
- [Build Commands](#build-commands)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Roadmap](#roadmap)

## Features

- **Study Session Management**: Create, manage, and track study sessions with customizable durations
- **Progress Tracking**: Monitor your academic progress with visual analytics and statistics
- **Subject Organization**: Organize subjects and topics with hierarchical categorization
- **Notes Management**: Create and manage notes for each subject with rich text formatting
- **Task Scheduling**: Schedule assignments, quizzes, and exams with deadline tracking
- **Study Reminders**: Get notifications for upcoming study sessions and deadlines
- **Performance Analytics**: View detailed insights into your study patterns and performance
- **Offline Support**: Access your data offline with automatic sync when online
- **User Authentication**: Secure login and multi-device synchronization
- **Dark Mode**: Eye-friendly dark theme option for extended study sessions

## Setup Instructions

### Prerequisites

Before you begin, ensure you have the following installed:

- **Android Studio** (Latest version recommended)
- **Java Development Kit (JDK)** 11 or higher
- **Android SDK** (API level 24 and above)
- **Gradle** (Usually bundled with Android Studio)
- **Git** for version control

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/AncientDom/StudyRoyal.git
   cd StudyRoyal
   ```

2. **Open in Android Studio**
   - Launch Android Studio
   - Click "File" → "Open"
   - Navigate to the cloned repository and select it
   - Wait for Gradle sync to complete

3. **Configure Local Properties**
   - Create or update `local.properties` in the project root:
   ```properties
   sdk.dir=/path/to/your/android/sdk
   ```

4. **Sync Gradle Files**
   - Android Studio will automatically prompt to sync Gradle files
   - If not, go to "File" → "Sync Now"

5. **Connect Android Device or Start Emulator**
   - For physical device: Enable USB debugging and connect
   - For emulator: Create and start a virtual device from AVD Manager

6. **Run the Application**
   - Click the "Run" button (green play icon) or press `Shift + F10`
   - Select your target device
   - Wait for the app to build and deploy

### Development Setup

1. **Install Dependencies**
   ```bash
   ./gradlew dependencies
   ```

2. **Set Up Firebase** (if applicable)
   - Download `google-services.json` from Firebase Console
   - Place it in the `app/` directory
   - Sync Gradle files

3. **Configure API Keys** (if applicable)
   - Create a `keys.properties` file in the project root
   - Add your API keys following the template in `keys.properties.example`

## APK Download

### Official Releases

Download the latest stable APK from the following sources:

- **GitHub Releases**: [Latest Release](https://github.com/AncientDom/StudyRoyal/releases/latest)
- **Google Play Store**: [StudyRoyal on Play Store](https://play.google.com/store/apps/details?id=com.ancientdom.studyroyal) (Coming soon)

### Installation Instructions

1. **For APK File**
   - Download the APK file to your Android device
   - Go to Settings → Security → Enable "Unknown Sources"
   - Open the file manager and tap the APK file
   - Follow the installation prompts

2. **For Play Store**
   - Open Google Play Store app
   - Search for "StudyRoyal"
   - Tap "Install"
   - Wait for installation to complete

### System Requirements

- **Android Version**: 5.0 (API 21) or higher
- **RAM**: Minimum 2 GB (4 GB recommended)
- **Storage**: Minimum 50 MB free space
- **Permissions**: Camera, Microphone, Storage, Calendar, Notifications

## Project Structure

```
StudyRoyal/
├── app/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/ancientdom/studyroyal/
│   │   │   │       ├── activities/          # UI Activities
│   │   │   │       ├── fragments/           # UI Fragments
│   │   │   │       ├── adapters/            # RecyclerView Adapters
│   │   │   │       ├── models/              # Data Models
│   │   │   │       ├── viewmodels/          # ViewModel Classes
│   │   │   │       ├── database/            # Database Classes (Room)
│   │   │   │       ├── network/             # Network/API Classes
│   │   │   │       ├── repositories/        # Data Repositories
│   │   │   │       ├── utils/               # Utility Classes
│   │   │   │       ├── services/            # Background Services
│   │   │   │       └── MainActivity.kt      # Main Entry Point
│   │   │   ├── res/
│   │   │   │   ├── layout/                  # XML Layouts
│   │   │   │   ├── drawable/                # Drawable Resources
│   │   │   │   ├── values/                  # String, Color, Dimension Resources
│   │   │   │   ├── values-night/            # Dark Theme Resources
│   │   │   │   ├── anim/                    # Animation Files
│   │   │   │   └── menu/                    # Menu Resources
│   │   │   └── AndroidManifest.xml
│   │   ├── test/                            # Unit Tests
│   │   └── androidTest/                     # Instrumented Tests
│   ├── build.gradle                         # App-level Build Configuration
│   └── proguard-rules.pro                   # ProGuard Configuration
├── gradle/
│   └── wrapper/                             # Gradle Wrapper Files
├── build.gradle                             # Project-level Build Configuration
├── settings.gradle                          # Gradle Settings
├── gradle.properties                        # Gradle Properties
├── local.properties                         # Local SDK Configuration (not in Git)
├── README.md                                # This File
├── LICENSE                                  # License Information
├── .gitignore                               # Git Ignore Rules
└── .github/
    └── workflows/                           # CI/CD Workflows
```

## Build Commands

### Basic Build Commands

1. **Build Debug APK**
   ```bash
   ./gradlew assembleDebug
   ```
   Output: `app/build/outputs/apk/debug/app-debug.apk`

2. **Build Release APK**
   ```bash
   ./gradlew assembleRelease
   ```
   Output: `app/build/outputs/apk/release/app-release.apk`

3. **Run Tests**
   ```bash
   ./gradlew test
   ```

4. **Run Instrumented Tests**
   ```bash
   ./gradlew connectedAndroidTest
   ```

5. **Build and Run on Connected Device**
   ```bash
   ./gradlew installDebug
   ./gradlew installRelease
   ```

### Advanced Build Commands

1. **Clean Build**
   ```bash
   ./gradlew clean build
   ```

2. **Build with Custom Signing Configuration**
   ```bash
   ./gradlew assembleRelease -PkeyStore=/path/to/keystore \
     -PkeyStorePassword=password -PkeyAlias=alias \
     -PkeyPassword=keypassword
   ```

3. **Generate Build Report**
   ```bash
   ./gradlew build --scan
   ```

4. **Check Dependencies**
   ```bash
   ./gradlew dependencies
   ```

5. **Update Dependencies**
   ```bash
   ./gradlew dependencyUpdates
   ```

### Gradle Wrapper Usage

All commands can be run using the Gradle wrapper (./gradlew on Unix/Mac, gradlew.bat on Windows) to ensure consistency across environments.

## Troubleshooting Guide

### Common Issues and Solutions

#### 1. Gradle Sync Failures

**Problem**: "Failed to sync Gradle"

**Solutions**:
- Update Gradle: `./gradlew wrapper --gradle-version=latest`
- Clear Gradle cache: `rm -rf ~/.gradle/caches`
- Invalidate Android Studio cache: File → Invalidate Caches → Restart
- Check internet connection for dependency downloads

#### 2. Build Failures

**Problem**: "Build failed with an exception"

**Solutions**:
- Check Java version: `java -version` (Should be 11+)
- Update Android SDK: Open SDK Manager in Android Studio
- Clear build directory: `./gradlew clean`
- Rebuild project: `./gradlew clean build`

#### 3. Emulator Not Showing App

**Problem**: App doesn't appear on emulator after installation

**Solutions**:
- Restart emulator: Close and reopen from AVD Manager
- Clear app data: `adb shell pm clear com.ancientdom.studyroyal`
- Reinstall: `./gradlew uninstallDebug installDebug`
- Check emulator specifications (RAM, disk space)

#### 4. Firebase Configuration Issues

**Problem**: "google-services.json not found"

**Solutions**:
- Download `google-services.json` from Firebase Console
- Place in `app/` directory (not in version control)
- Sync Gradle files after placement
- Verify Firebase plugin in `build.gradle`

#### 5. Permission Denied Errors

**Problem**: "Permission denied" when running gradle commands

**Solutions**:
- Make gradle executable: `chmod +x gradlew` (Unix/Mac)
- Run with appropriate permissions
- Check file ownership in project directory

#### 6. Memory Issues

**Problem**: "OutOfMemoryError" during build

**Solutions**:
- Increase Gradle heap: Add to `gradle.properties`:
   ```properties
   org.gradle.jvmargs=-Xmx2048m
   ```
- Close other applications
- Use `--parallel` flag: `./gradlew build --parallel`

#### 7. Dependency Version Conflicts

**Problem**: "Version conflict in dependencies"

**Solutions**:
- Check `build.gradle` for conflicting versions
- Use `./gradlew dependencies` to view dependency tree
- Add explicit version constraints in `build.gradle`
- Update conflicting libraries to compatible versions

#### 8. APK Installation Failure on Device

**Problem**: "Installation failed" when installing APK

**Solutions**:
- Increase timeout: `adb install -l app-debug.apk` (install with 180s timeout)
- Free up device storage
- Clear app cache: `adb shell pm clear com.ancientdom.studyroyal`
- Uninstall previous version: `adb uninstall com.ancientdom.studyroyal`
- Restart device

#### 9. Database Migration Errors

**Problem**: "Database migration failed"

**Solutions**:
- Check Room database migration classes
- Ensure migration path is defined for each version bump
- Clear app data and reinstall
- Review database schema changes

#### 10. Network Connectivity Issues

**Problem**: "Unable to connect to network resources"

**Solutions**:
- Check internet connection on device/emulator
- Verify API endpoints in configuration
- Check proxy settings if behind corporate network
- Review network security configuration
- Enable network logging for debugging

### Getting Help

- **Check Documentation**: Review inline code comments and class documentation
- **Search Issues**: Look for similar issues in [GitHub Issues](https://github.com/AncientDom/StudyRoyal/issues)
- **Create New Issue**: If problem persists, create a detailed issue with:
  - Android version and device model
  - Error logs and stack traces
  - Steps to reproduce
  - Screenshots or videos if applicable

## Roadmap

### Current Version (v1.0)

- [x] Core study session management
- [x] Subject and topic organization
- [x] Notes creation and management
- [x] Basic progress tracking
- [x] User authentication
- [x] Dark mode support

### Upcoming Features (v1.1)

- [ ] Enhanced analytics dashboard with charts and graphs
- [ ] Study group collaboration features
- [ ] Pomodoro timer integration
- [ ] Custom study reminders and notifications
- [ ] Export study data (PDF, CSV)
- [ ] Multi-language support

### Future Roadmap (v2.0)

- [ ] AI-powered study recommendations
- [ ] Integration with educational platforms (Coursera, Udemy)
- [ ] Spaced repetition algorithm for flashcards
- [ ] Video lecture management and notes
- [ ] Peer review system
- [ ] Gamification features (badges, achievements)
- [ ] Advanced scheduling with conflict detection
- [ ] Cloud backup and sync improvements
- [ ] Web application companion
- [ ] API for third-party integrations

### Long-Term Vision (v3.0+)

- [ ] Machine learning for study pattern analysis
- [ ] Virtual study companion with AI chatbot
- [ ] Integration with wearable devices
- [ ] Advanced biometric analytics
- [ ] Social learning network
- [ ] Subscription-based premium features
- [ ] Enterprise solutions for educational institutions

## Contributing

We welcome contributions from the community! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure your code follows our coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please:

- Open an issue on [GitHub Issues](https://github.com/AncientDom/StudyRoyal/issues)
- Contact the development team at support@studyroyal.com
- Join our community discussions

## Acknowledgments

- Android Development Team for excellent documentation
- Contributors and community members
- All users providing valuable feedback

---

**Last Updated**: January 3, 2026

For the latest updates and news, follow us on:
- [GitHub](https://github.com/AncientDom/StudyRoyal)
- [Twitter](https://twitter.com/StudyRoyal) (Coming soon)
- [Email Newsletter](https://studyroyal.com/newsletter) (Coming soon)
