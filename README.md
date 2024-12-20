# GuessTheFlag Game

**GuessTheFlag** is an engaging and interactive flag-guessing game built using SwiftUI. The game challenges players to identify the correct flag from three displayed options based on the country name provided. It's a fun way to test and improve your knowledge of world flags while enjoying a smooth and visually appealing user experience.

## Features

- **Interactive Gameplay**: Tap on one of the three displayed flags to guess the correct one.
- **Stunning UI Design**: 
  - Radial gradient background for an eye-catching look.
  - Flags are displayed in a capsule shape with shadow effects for a polished appearance.
- **Animations**: 
  - 3D rotation animation for the selected flag.
  - Opacity changes to emphasize the chosen option.
- **Scoring System**: Keeps track of your current score and displays it at the bottom of the screen.
- **Game Progress**: Shows the current question number and stops the game after 8 questions.
- **Alerts**:
  - Immediate feedback for correct and incorrect answers.
  - Game over alert with your final score.
- **Dynamic Content**: Flags and their positions are shuffled after each question to keep the game fresh.

## How to Play

1. **Objective**: Identify the flag of the country displayed at the top of the screen.
2. **Select**: Tap on one of the three flags displayed.
3. **Feedback**: 
   - If correct, your score increases, and you proceed to the next question.
   - If incorrect, you'll be informed of the correct answer.
4. **Complete**: The game ends after 8 questions, and your final score is displayed.
5. **Restart**: Start a new game after completion by tapping "Continue."

## Tech Stack

- **Language**: Swift
- **Framework**: SwiftUI
- **Features Used**:
  - `@State` properties for managing state.
  - Animations for interactivity.
  - Alerts for feedback.
  - `ForEach` for dynamically generating views.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/GuessTheFlag.git
   ```
2. Open the project in Xcode.
3. Build and run the app on your simulator or a physical device.

## Customization

- **Questions Count**: Modify the number of questions by changing the condition in the `flagTapped` method:
  ```swift
  if questionsNumber == <your desired count> {
  ```
- **Country Flags**: Update the `countries` array with your own set of country names and corresponding flag images.


