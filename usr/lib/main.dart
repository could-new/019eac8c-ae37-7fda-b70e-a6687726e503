import 'package:flutter/material.dart';

void main() {
  runApp(const StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'احمد کی کہانی',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StoryScreen(),
      },
    );
  }
}

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  final String title = 'کامیابی کا سفر';

  final List<String> storyParagraphs = const [
    'ایک گاؤں میں احمد نام کا ایک غریب لڑکا رہتا تھا۔ اس کے والد مزدوری کرتے تھے اور گھر کے حالات زیادہ اچھے نہیں تھے۔ احمد صبح اسکول جاتا اور شام کو اپنے والد کی مدد کرتا تھا۔',
    'لوگ اکثر اس کا مذاق اڑاتے اور کہتے، "تم کچھ نہیں کر سکتے۔" لیکن احمد نے ہمت نہیں ہاری۔ وہ رات کو دیر تک پڑھائی کرتا اور اپنے خوابوں کے لیے محنت کرتا رہا۔',
    'ایک دن اسکول میں سائنس کے مقابلے کا اعلان ہوا۔ احمد کے پاس نہ اچھے وسائل تھے اور نہ ہی مہنگا سامان، مگر اس نے اپنی ذہانت اور محنت سے ایک بہترین منصوبہ تیار کیا۔',
    'مقابلے کے دن سب حیران رہ گئے۔ احمد نے پہلی پوزیشن حاصل کر لی۔ اس کے اساتذہ اور والدین کی آنکھوں میں خوشی کے آنسو آ گئے۔',
    'وقت گزرتا گیا، احمد نے اپنی تعلیم مکمل کی اور ایک کامیاب انجینئر بن گیا۔ وہ اپنے گاؤں واپس آیا اور وہاں کے بچوں کے لیے ایک مفت تعلیمی مرکز قائم کیا تاکہ کوئی بھی بچہ صرف غربت کی وجہ سے اپنے خوابوں سے محروم نہ رہے۔',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double horizontalPadding = constraints.maxWidth > 600 ? constraints.maxWidth * 0.15 : 16.0;
              
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24.0),
                itemCount: storyParagraphs.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Center(
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: 80,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  }
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        storyParagraphs[index - 1],
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1.8,
                          fontFamily: 'Roboto', // Default fallback, but handles RTL well
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }
}