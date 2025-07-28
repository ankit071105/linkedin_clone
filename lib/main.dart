import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(LinkedInClone());
}

class LinkedInClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0077B5),
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0077B5),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserData {
  static String name = '';
  static String email = '';
  static String password = '';
  static String headline = '';
  static String about = '';
  static String location = 'San Francisco, CA';
  static String profileImage = 'https://randomuser.me/api/portraits/men/1.jpg';
  static List<Post> myPosts = [];
}

class Post {
  final String id;
  final String userName;
  final String userHeadline;
  final String userImage;
  final String content;
  final String? imageUrl;
  final DateTime createdAt;
  int likes;
  int comments;
  bool isLiked;

  Post({
    required this.id,
    required this.userName,
    required this.userHeadline,
    required this.userImage,
    required this.content,
    this.imageUrl,
    required this.createdAt,
    this.likes = 0,
    this.comments = 0,
    this.isLiked = false,
  });
}

class AppData {
  static List<Post> posts = [
    Post(
      id: '1',
      userName: 'Aman Singh',
      userHeadline: 'Software Engineer at Google',
      userImage: 'https://randomuser.me/api/portraits/men/1.jpg',
      content: 'Just launched a new feature for our product! So excited to see how users will react to it.',
      createdAt: DateTime.now().subtract(Duration(hours: 1)),
      likes: 24,
      comments: 5,
    ),
    Post(
      id: '2',
      userName: 'Janvi Yadav',
      userHeadline: 'Product Manager at Microsoft',
      userImage: 'https://randomuser.me/api/portraits/women/1.jpg',
      content: 'Looking for talented UX designers to join our team. If you know someone, please tag them below!',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      createdAt: DateTime.now().subtract(Duration(hours: 3)),
      likes: 42,
      comments: 12,
    ),
    Post(
      id: '3',
      userName: 'Sudeshna Das',
      userHeadline: 'Data Scientist at Amazon',
      userImage: 'https://randomuser.me/api/portraits/men/2.jpg',
      content: 'Just published my latest research paper on machine learning algorithms. Check it out and let me know what you think!',
      createdAt: DateTime.now().subtract(Duration(hours: 5)),
      likes: 18,
      comments: 7,
    ),
    Post(
      id: '4',
      userName: 'Mahi kumari',
      userHeadline: 'Marketing Director at Sora',
      userImage: 'https://randomuser.me/api/portraits/women/2.jpg',
      content: 'Our new campaign is live! So proud of my team for all their hard work on this project.',
      imageUrl: 'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5',
      createdAt: DateTime.now().subtract(Duration(hours: 8)),
      likes: 56,
      comments: 9,
    ),
    Post(
      id: '5',
      userName: 'Michael Brown',
      userHeadline: 'CEO at Startup Inc.',
      userImage: 'https://randomuser.me/api/portraits/men/3.jpg',
      content: 'Raised  5M in Series A funding today! Big thanks to our amazing team and investors who made this possible.',
      createdAt: DateTime.now().subtract(Duration(hours: 10)),
      likes: 102,
      comments: 23,
    ),
    Post(
      id: '6',
      userName: 'Sona Davis',
      userHeadline: 'HR Manager at Facebook',
      userImage: 'https://randomuser.me/api/portraits/women/3.jpg',
      content: 'We\'re hiring for multiple positions across engineering, design, and product. DM me if you\'re interested!',
      createdAt: DateTime.now().subtract(Duration(hours: 12)),
      likes: 37,
      comments: 15,
    ),
    Post(
      id: '7',
      userName: 'Alex Wilson',
      userHeadline: 'Senior Developer at Netflix',
      userImage: 'https://randomuser.me/api/portraits/men/4.jpg',
      content: 'Just open-sourced a new tool we\'ve been using internally. Hope it helps other developers out there!',
      imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c',
      createdAt: DateTime.now().subtract(Duration(hours: 15)),
      likes: 89,
      comments: 14,
    ),
    Post(
      id: '8',
      userName: 'David Taylor',
      userHeadline: 'UX Designer at Airbnb',
      userImage: 'https://randomuser.me/api/portraits/women/4.jpg',
      content: 'Design isn\'t just what it looks like and feels like. Design is how it works. - Steve Jobs',
      createdAt: DateTime.now().subtract(Duration(hours: 18)),
      likes: 64,
      comments: 8,
    ),
    Post(
      id: '9',
      userName: 'Robert Martinez',
      userHeadline: 'CTO at TechCorp',
      userImage: 'https://randomuser.me/api/portraits/men/5.jpg',
      content: 'Excited to announce our new AI-powered platform that will revolutionize the industry!',
      imageUrl: 'https://media.licdn.com/dms/image/v2/D5622AQExMKkBDXE2fg/feedshare-shrink_800/B56ZhRSgdgG4Ak-/0/1753710465511?e=1756339200&v=beta&t=FOXa6IDCFWfVap_ZpGm8YXlXPJy7b4XIM92iXWLrV1c',
      createdAt: DateTime.now().subtract(Duration(hours: 22)),
      likes: 76,
      comments: 19,
    ),
    Post(
      id: '10',
      userName: 'Lisa Anderson',
      userHeadline: 'Financial Analyst at Goldman Sachs',
      userImage: 'https://randomuser.me/api/portraits/women/5.jpg',
      content: 'Market trends are showing some interesting patterns this quarter. What are your thoughts?',
      createdAt: DateTime.now().subtract(Duration(hours: 24)),
      likes: 31,
      comments: 11,
    ),
  ];

  static void addPost(Post post) {
    posts.insert(0, post);
    if (post.userName == UserData.name) {
      UserData.myPosts.insert(0, post);
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 2),
              Image.asset(
                'assets/linkedin.png',
                height: 60,
              ),
              SizedBox(height: 40),
              Text(
                'Welcome to your professional community',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Join now',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCFECFB),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  side: BorderSide(color: Color(0xFF0077B5)),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _headlineController = TextEditingController();
  bool _isLoading = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate network delay
    Future.delayed(Duration(seconds: 2), () {
      UserData.email = _emailController.text;
      UserData.password = _passwordController.text;
      UserData.name = _nameController.text;
      UserData.headline = _headlineController.text;
      UserData.about = '${_headlineController.text}. Passionate about my work and connecting with professionals.';
      UserData.location = 'San Francisco, CA';

      setState(() => _isLoading = false);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join LinkedIn'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password (6+ characters)',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _headlineController,
                  decoration: InputDecoration(
                    labelText: 'Headline (e.g., "Software Engineer at Google")',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your headline';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                if (_isLoading)
                  Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Agree & Join'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFCFECFB),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                SizedBox(height: 16),
                Text(
                  'By clicking "Agree & Join", you agree to the LinkedIn User Agreement, Privacy Policy, and Cookie Policy.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already on LinkedIn?'),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate network delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to LinkedIn'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot password?'),
                  ),
                ),
                SizedBox(height: 24),
                if (_isLoading)
                  Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFCFECFB),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  label: Text('Continue with Google'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New to LinkedIn?'),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text('Join now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _pages = [
    FeedScreen(),
    NetworkScreen(),
    Container(), // Empty container for post screen (handled by FAB)
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/linkedin.png',
              height: 24,
            ),
            SizedBox(width: 8),
            Text(
              'LinkedIn',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatBotScreen()),
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePostScreen()),
        ),
        child: Icon(Icons.edit, color: Colors.white),
        backgroundColor: Color(0xFF0077B5),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _currentIndex == 0 ? Color(0xFF0077B5) : Colors.grey),
                onPressed: () => setState(() => _currentIndex = 0),
              ),
              IconButton(
                icon: Icon(Icons.people,
                    color: _currentIndex == 1 ? Color(0xFF0077B5) : Colors.grey),
                onPressed: () => setState(() => _currentIndex = 1),
              ),
              SizedBox(width: 40), // Space for FAB
              IconButton(
                icon: Icon(Icons.notifications,
                    color: _currentIndex == 3 ? Color(0xFF0077B5) : Colors.grey),
                onPressed: () => setState(() => _currentIndex = 3),
              ),
              IconButton(
                icon: Icon(Icons.person,
                    color: _currentIndex == 4 ? Color(0xFF0077B5) : Colors.grey),
                onPressed: () => setState(() => _currentIndex = 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Simulate refresh
        await Future.delayed(Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: AppData.posts.length,
        itemBuilder: (context, index) {
          final post = AppData.posts[index];
          return _buildPostCard(post, context);
        },
      ),
    );
  }

  Widget _buildPostCard(Post post, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.userImage),
              radius: 22,
            ),
            title: Text(
              post.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(post.userHeadline),
            trailing: PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.grey),
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('Save post')),
                PopupMenuItem(child: Text('Report post')),
              ],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              post.content,
              style: TextStyle(fontSize: 15),
            ),
          ),
          if (post.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  post.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.thumb_up, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  '${post.likes}',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  '${post.comments} comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    icon: Icon(
                      post.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                      color: post.isLiked ? Color(0xFF0077B5) : Colors.grey,
                    ),
                    label: Text(
                      'Like',
                      style: TextStyle(
                        color: post.isLiked ? Color(0xFF0077B5) : Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      // In a real app, you would update this in the database
                      post.isLiked = !post.isLiked;
                      post.likes += post.isLiked ? 1 : -1;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    icon: Icon(Icons.comment, color: Colors.grey),
                    label: Text('Comment', style: TextStyle(color: Colors.grey)),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    icon: Icon(Icons.share, color: Colors.grey),
                    label: Text('Share', style: TextStyle(color: Colors.grey)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _contentController = TextEditingController();
  final _keywordsController = TextEditingController();
  bool _isGenerating = false;
  String? _imageUrl;

  Future<void> _generateCaption() async {
    if (_keywordsController.text.isEmpty) return;
    setState(() => _isGenerating = true);

    const apiKey = 'AIzaSyA0dr_zXm5Bl-Vr1gizLi4tFBpekPpO3wA';
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final prompt =
        'Generate a professional LinkedIn post using these keywords: ${_keywordsController.text}. Make it engaging and appropriate for a business audience. Keep it under 300 characters.';

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      setState(() {
        _contentController.text = response.text ?? '';
        _isGenerating = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to generate caption: $e')));
      setState(() => _isGenerating = false);
    }
  }

  void _submitPost() {
    if (_contentController.text.isEmpty) return;

    final newPost = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userName: UserData.name,
      userHeadline: UserData.headline,
      userImage: UserData.profileImage,
      content: _contentController.text,
      imageUrl: _imageUrl,
      createdAt: DateTime.now(),
    );

    AppData.addPost(newPost);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Post published successfully'),
          behavior: SnackBarBehavior.floating,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _submitPost,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(UserData.profileImage),
                          radius: 20,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserData.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              UserData.headline,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _contentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'What do you want to talk about?',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    if (_imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(_imageUrl!),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'AI Assistant',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0077B5),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _keywordsController,
                      decoration: InputDecoration(
                        hintText: 'Enter keywords for AI caption generation...',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.auto_awesome),
                          onPressed: _isGenerating ? null : _generateCaption,
                        ),
                      ),
                    ),
                    if (_isGenerating)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: LinearProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                ActionChip(
                  avatar: Icon(Icons.image, size: 20),
                  label: Text('Photo'),
                  onPressed: () {
                    // In a real app, you would upload an image here
                    setState(() => _imageUrl =
                    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
                  },
                ),
                ActionChip(
                  avatar: Icon(Icons.videocam, size: 20),
                  label: Text('Video'),
                  onPressed: () {},
                ),
                ActionChip(
                  avatar: Icon(Icons.insert_drive_file, size: 20),
                  label: Text('Document'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFF0077B5).withOpacity(0.1),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(UserData.profileImage),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UserData.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  UserData.headline,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  UserData.location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Open to'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCFECFB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('Add section'),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  UserData.about,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('See all'),
                    ),
                  ],
                ),
                if (UserData.myPosts.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        Icon(Icons.edit, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'You haven\'t posted anything yet',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreatePostScreen()),
                          ),
                          child: Text('Create a post'),
                          style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xFFCFECFB),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      for (var post in UserData.myPosts.take(3))
                        _buildPostPreview(post, context),
                      TextButton(
                        onPressed: () {},
                        child: Text('Show all activity'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostPreview(Post post, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.content.length > 100
                  ? '${post.content.substring(0, 100)}...'
                  : post.content,
              style: TextStyle(fontSize: 15),
            ),
            if (post.imageUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    post.imageUrl!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    '${post.likes}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.comment, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    '${post.comments}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Your network will appear here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Your notifications will appear here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: UserData.name);
  final _headlineController = TextEditingController(text: UserData.headline);
  final _aboutController = TextEditingController(text: UserData.about);
  final _emailController = TextEditingController(text: UserData.email);

  @override
  void initState() {
    super.initState();
    _nameController.text = UserData.name;
    _headlineController.text = UserData.headline;
    _aboutController.text = UserData.about;
    _emailController.text = UserData.email;
  }

  void _saveProfile() {
    setState(() {
      UserData.name = _nameController.text;
      UserData.headline = _headlineController.text;
      UserData.about = _aboutController.text;
      UserData.email = _emailController.text;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF0077B5),
              child: Text(
                _nameController.text.isNotEmpty ? _nameController.text[0] : '?',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _headlineController,
              decoration: InputDecoration(labelText: 'Headline'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(labelText: 'About'),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    final userMessage = _messageController.text;
    _messageController.clear();

    setState(() {
      _messages.add(ChatMessage(text: userMessage, isUser: true));
      _isLoading = true;
    });

    const apiKey = 'AIzaSyA0dr_zXm5Bl-Vr1gizLi4tFBpekPpO3wA';
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final prompt =
        'You are a professional career assistant for LinkedIn. Help with career advice, resume tips, interview preparation, and professional networking. The user asked: $userMessage';

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      setState(() {
        _messages.add(ChatMessage(text: response.text ?? '', isUser: false));
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(
            text: 'Sorry, I encountered an error. Please try again.',
            isUser: false));
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkedIn Assistant'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isUser
                          ? Color(0xFF0077B5).withOpacity(0.1)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message.text),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ask me anything about your career...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFF0077B5)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}