import 'package:flutter/material.dart';

void main() {
  runApp(const StudyRoyalApp());
}

class StudyRoyalApp extends StatelessWidget {
  const StudyRoyalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Royal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // Mock data for progress tracking
  final Map<String, double> progressData = {
    'Mathematics': 0.75,
    'Science': 0.60,
    'History': 0.85,
    'English': 0.70,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Royal'),
        centerTitle: true,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildStudyMaterialsScreen(),
          _buildQuizzesScreen(),
          _buildProgressTrackingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Study Materials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quizzes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Progress',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildStudyMaterialsScreen() {
    final subjects = [
      {'title': 'Mathematics', 'icon': Icons.calculate, 'color': Colors.blue},
      {'title': 'Science', 'icon': Icons.science, 'color': Colors.green},
      {'title': 'History', 'icon': Icons.history, 'color': Colors.orange},
      {'title': 'English', 'icon': Icons.language, 'color': Colors.purple},
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Study Materials',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return StudyMaterialCard(
                  title: subject['title'] as String,
                  icon: subject['icon'] as IconData,
                  color: subject['color'] as Color,
                  onTap: () {
                    _showStudyMaterialDetail(context, subject['title'] as String);
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Featured Lessons',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildLessonTile('Introduction to Algebra', 'Mathematics', 12),
            _buildLessonTile('The Water Cycle', 'Science', 8),
            _buildLessonTile('World War II Overview', 'History', 15),
            _buildLessonTile('Shakespeare\'s Works', 'English', 10),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonTile(String title, String subject, int duration) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.video_lesson),
        title: Text(title),
        subtitle: Text('$subject • $duration min'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening lesson: $title')),
          );
        },
      ),
    );
  }

  Widget _buildQuizzesScreen() {
    final quizzes = [
      {
        'title': 'Algebra Basics Quiz',
        'subject': 'Mathematics',
        'questions': 10,
        'duration': 15,
      },
      {
        'title': 'Elements and Compounds',
        'subject': 'Science',
        'questions': 15,
        'duration': 20,
      },
      {
        'title': 'Ancient Civilizations',
        'subject': 'History',
        'questions': 12,
        'duration': 18,
      },
      {
        'title': 'Grammar Fundamentals',
        'subject': 'English',
        'questions': 10,
        'duration': 12,
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Quizzes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return QuizCard(
                  title: quiz['title'] as String,
                  subject: quiz['subject'] as String,
                  questions: quiz['questions'] as int,
                  duration: quiz['duration'] as int,
                  onTap: () {
                    _showQuizStartDialog(context, quiz['title'] as String);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressTrackingScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progress Tracking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overall Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: _calculateAverageProgress(),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(_calculateAverageProgress() * 100).toStringAsFixed(1)}% Complete',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Subject Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...progressData.entries.map((entry) {
              return ProgressTrackingCard(
                subject: entry.key,
                progress: entry.value,
              );
            }).toList(),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatWidget('Lessons', '24', Icons.video_lesson),
                  _buildStatWidget('Quizzes', '12', Icons.quiz),
                  _buildStatWidget('Days Streak', '7', Icons.local_fire_department),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatWidget(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.green),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  double _calculateAverageProgress() {
    if (progressData.isEmpty) return 0;
    final sum = progressData.values.reduce((a, b) => a + b);
    return sum / progressData.length;
  }

  void _showStudyMaterialDetail(BuildContext context, String subject) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening $subject study materials')),
    );
  }

  void _showQuizStartDialog(BuildContext context, String quizTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(quizTitle),
          content: const Text('Are you ready to start this quiz?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Starting quiz: $quizTitle')),
                );
              },
              child: const Text('Start Quiz'),
            ),
          ],
        );
      },
    );
  }
}

class StudyMaterialCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const StudyMaterialCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String title;
  final String subject;
  final int questions;
  final int duration;
  final VoidCallback onTap;

  const QuizCard({
    Key? key,
    required this.title,
    required this.subject,
    required this.questions,
    required this.duration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.quiz, color: Colors.blue.shade700),
        ),
        title: Text(title),
        subtitle: Text('$subject • $questions questions • $duration min'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class ProgressTrackingCard extends StatelessWidget {
  final String subject;
  final double progress;

  const ProgressTrackingCard({
    Key? key,
    required this.subject,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}
