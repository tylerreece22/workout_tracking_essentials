// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as int,
      (json['routines'] as List)
          ?.map((e) =>
              e == null ? null : Routine.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'id': instance.id, 'routines': instance.routines};