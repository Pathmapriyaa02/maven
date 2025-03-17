trigger:
  branches:
    include:
      - main   # Trigger pipeline for changes to the 'main' branch

pool:
  vmImage: 'ubuntu-latest'  # Use the latest Ubuntu agent from Azure DevOps

steps:
- task: UseJavaToolInstaller@1
  inputs:
    versionSpec: '11'  # Specify Java version (e.g., 11 or 17)
    jdkArchitecture: 'x64'

- task: Maven@3
  inputs:
    mavenPomFile: 'pom.xml'  # Path to your pom.xml file
    goals: 'clean install'   # Goals to run during the build
    options: '-X'            # Optional additional Maven options (e.g., verbose output)
    javaHomeOption: 'JDKVersion'
    jdkVersionOption: '11'   # Use JDK 11, ensure this matches the Java version
    mavenVersionOption: 'Default'
    options: '-DskipTests'  # Optional: Skip tests if desired
