// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GridExample(),
//     );
//   }
// }

// class GridExample extends StatelessWidget {
//   const GridExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Grid Example'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: (MediaQuery.of(context).size.width > 600) ? 4 : 2,
//         ),
//         itemCount: 8,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             color: getRandomColor(),
//             margin: EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 'Item $index',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Color getRandomColor() {
//     final Random random = Random();
//     return Color(0xFF000000 + random.nextInt(0xFFFFFF));
//   }
// }


//2

// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GridExample(),
//     );
//   }
// }

// class GridExample extends StatelessWidget {
//   const GridExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int crossAxisCount = (MediaQuery.of(context).size.width > 600) ? 4 : 2;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Grid Example'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount,
//         ),
//         itemCount: 8,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             color: getRandomColor(),
//             margin: EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 'Item $index',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Color getRandomColor() {
//     final Random random = Random();
//     return Color(0xFF000000 + random.nextInt(0xFFFFFF));
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const GridExample(),
    );
  }
}

class GridExample extends StatelessWidget {
  const GridExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveGridDelegate responsiveGridDelegate = const ResponsiveGridDelegate(
      crossAxisExtent: 200,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Example'),
      ),
      body: ResponsiveGridView.builder(
        gridDelegate: responsiveGridDelegate,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: getRandomColor(),
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(color: Color.fromARGB(255, 31, 17, 230)),
              ),
            ),
          );
        },
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color(0xFF000000 + random.nextInt(0xFFFFFF));
  }
}


