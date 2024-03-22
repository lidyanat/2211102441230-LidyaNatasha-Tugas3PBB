// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Expanded(
            child: IntrinsicHeight(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://i.pinimg.com/564x/b5/c0/84/b5c08471295a826757515b966c909732.jpg')),
                  ),
                ),
                const ListProducts(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://i.pinimg.com/564x/18/23/56/182356a64447effcb363c70a11f96456.jpg')),
                  ),
                ),
              ]),
            ),
          ),
        );
      })),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ProductImage(),
          ProductImage(
            rndSeed: 2,
            nama: "Rainbow Cake",
            harga: 25000,
          ),
          ProductImage(
            rndSeed: 3,
          )
        ]),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage(
      {super.key,
      this.rndSeed = 1,
      this.nama = "Strawberry Cake",
      this.harga = 20000});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
              image:
                  NetworkImage('https://picsum.photos/200/?random=$rndSeed')),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(nama), Text("Rp. $harga")])
        ],
      ),
    );
  }
}