import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/album_bloc.dart';
import 'router/app_router.dart';
import 'services/api_service.dart';
import 'data/repositories/album_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final albumRepository = AlbumRepository(apiService: apiService);

    return BlocProvider(
      create: (context) => AlbumCubit(albumRepository)..loadAlbums(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Album Viewer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2196F3), // Material Blue
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
