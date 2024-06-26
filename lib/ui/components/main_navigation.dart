import 'package:flutter/material.dart';
import 'package:logprota/ui/views/home/home_page.dart';
import 'package:logprota/ui/views/logbook/logbook_page.dart';
import 'package:logprota/ui/views/berita/berita_page.dart';
import 'package:logprota/ui/views/tugas_akhir.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentPageIndex = 0;
  //sign out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const [
          Text("Home"),
          Text("Tugas Akhir"),
          Text("Logbook"),
          Text("Berita"),
        ][currentPageIndex],
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.book_outlined),
            label: 'Tugas Akhir',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.note_outlined),
            label: 'Logbook',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.newspaper),
            label: 'Berita',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const TugasAkhir(),
        const LogbookPage(),
        const BeritaPage()
      ][currentPageIndex],
    );
  }
}
