import 'package:bottombar_floating_button/add.dart';
import 'package:bottombar_floating_button/donation.dart';
import 'package:bottombar_floating_button/home.dart';
import 'package:bottombar_floating_button/setting.dart';
import 'package:bottombar_floating_button/shop.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: tabIndex,
          children: const [Home(), Shop(), Shop(), Donation(), Setting()]),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: tabIndex,
            onTap: changeTabIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey.shade300,
            items: [
              itemBar(Icons.home, "Home"),
              itemBar(Icons.shop, "Shop"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  label: ""),
              itemBar(Icons.volunteer_activism, "Donation"),
              itemBar(Icons.settings, "Setting")
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Add())),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

itemBar(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
