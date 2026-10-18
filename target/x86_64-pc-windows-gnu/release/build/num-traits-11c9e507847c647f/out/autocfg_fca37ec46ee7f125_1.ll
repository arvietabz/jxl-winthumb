; ModuleID = 'autocfg_fca37ec46ee7f125_1.e19937ec4506fcb2-cgu.0'
source_filename = "autocfg_fca37ec46ee7f125_1.e19937ec4506fcb2-cgu.0"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-gnu"

@alloc_f93507f8ba4b5780b14b2c2584609be0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?", align 8, !guid !0
@alloc_ef0a1f828f3393ef691f2705e817091c = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@", align 8, !guid !1

; autocfg_fca37ec46ee7f125_1::probe
; Function Attrs: uwtable
define void @_RNvCsjmR2OWquuWY_26autocfg_fca37ec46ee7f125_15probe() unnamed_addr #0 !guid !5 {
start:
; call <f64>::total_cmp
  %_1 = call i8 @_RNvMNtCs2Ja4erDm0Jl_4core3f64d9total_cmpCsjmR2OWquuWY_26autocfg_fca37ec46ee7f125_1(ptr align 8 @alloc_f93507f8ba4b5780b14b2c2584609be0, ptr align 8 @alloc_ef0a1f828f3393ef691f2705e817091c) #3
  ret void
}

; <f64>::total_cmp
; Function Attrs: inlinehint uwtable
define internal i8 @_RNvMNtCs2Ja4erDm0Jl_4core3f64d9total_cmpCsjmR2OWquuWY_26autocfg_fca37ec46ee7f125_1(ptr align 8 %self, ptr align 8 %other) unnamed_addr #1 !guid !6 {
start:
  %_6 = alloca [8 x i8], align 8
  %_3 = alloca [8 x i8], align 8
  %_5 = load double, ptr %self, align 8
  %_4 = bitcast double %_5 to i64
  store i64 %_4, ptr %_3, align 8
  %_8 = load double, ptr %other, align 8
  %_7 = bitcast double %_8 to i64
  store i64 %_7, ptr %_6, align 8
  %_13 = load i64, ptr %_3, align 8
  %_12 = ashr i64 %_13, 63
  %_10 = lshr i64 %_12, 1
  %0 = load i64, ptr %_3, align 8
  %1 = xor i64 %0, %_10
  store i64 %1, ptr %_3, align 8
  %_18 = load i64, ptr %_6, align 8
  %_17 = ashr i64 %_18, 63
  %_15 = lshr i64 %_17, 1
  %2 = load i64, ptr %_6, align 8
  %3 = xor i64 %2, %_15
  store i64 %3, ptr %_6, align 8
  %4 = load i64, ptr %_3, align 8
  %5 = load i64, ptr %_6, align 8
  %_0 = call i8 @llvm.scmp.i8.i64(i64 %4, i64 %5)
  ret i8 %_0
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i64(i64, i64) #2

attributes #0 = { uwtable "target-cpu"="x86-64" "target-features"="+cx16,+sse,+sse2,+sse3,+sahf" }
attributes #1 = { inlinehint uwtable "target-cpu"="x86-64" "target-features"="+cx16,+sse,+sse2,+sse3,+sahf" }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { inlinehint }

!llvm.module.flags = !{!2, !3}
!llvm.ident = !{!4}

!0 = !{i64 -3124435115120253256}
!1 = !{i64 -5332677177684760356}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"rustc version 1.99.1 (58cf8f9c3 2026-10-13)"}
!5 = !{i64 -2490004111520386371}
!6 = !{i64 3370773172381217954}
