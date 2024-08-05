import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/theme.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsstate.dart';
import 'package:ecommerce_app/features/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencyInjection();
makeLandOrPort();
  await CacheHelper().intializeSharedPref();

   firebaseOptions();
await Firebase.initializeApp();
await EasyLocalization.ensureInitialized();
  runApp(
  EasyLocalization(
  supportedLocales: [
    const Locale('en'),
    const Locale('ar')],
  path: 'assets/Translation', // <-- change the path of the translation files
  fallbackLocale: Locale(  await
  getitinstance<CacheHelper>().getData(key:"lang")??"en"),
  child: MyApp(

  )
  ),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return
            BlocProvider(
            create: (context) => SettingsCubit(),
        child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (cubitcontext, state) => MaterialApp.router(
        locale:context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        title: 'My Stylish App',
        theme:  getitinstance<CacheHelper>().getData(key: "mode")??false?
        darkmode : lightmode,
        routerConfig: gorouter,
        debugShowCheckedModeBanner: false,
        ),
        ),
        );
      },
    );
  }
}

