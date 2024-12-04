import 'package:flutter/material.dart';
import 'package:tourism_app/list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<Room> rooms = [
    Room(
        name: "Ocean View Room",
        price: 150,
        image: "assets/pexels-pixabay-271618.jpg"),
    Room(
        name: "Mountain Cabin",
        price: 120,
        image: "assets/pexels-enginakyurt-1579253.jpg"),
    Room(
        name: "City Center Suite",
        price: 200,
        image: "assets/pexels-lamiko-3754595.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Rooms'),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomCard(room: rooms[index]);
        },
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(room.image, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              room.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${room.price}/night'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement booking logic here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Booking Confirmation"),
                      content: Text("You have booked the ${room.name}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
