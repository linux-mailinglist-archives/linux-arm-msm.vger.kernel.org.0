Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12EC2415387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238255AbhIVWit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:38:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:44257 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229506AbhIVWis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1632350237; x=1663886237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IUILjFnK96TJzDPo37VTYUqLcB78Wz8SZJQRvuttGYk=;
  b=CL6vl4/KMT5hNYqfyyEmYROHFcREFHTglVo/VauNBxfulSz9XQ/n4R8S
   KUsBFDoyVy/mWlMBYu9kIUUZpsBxBbCsRfCwu7FuHnVeiMsJCV6GflwoA
   KKh7mtSAP4BLv/LCmqVILQ7uoov2hHja7i0BW01evxZhJ1jwcKbafdrb9
   g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Sep 2021 15:37:17 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 15:37:17 -0700
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 22 Sep 2021 15:37:17 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 1/1] firmware: smccc: Add tracepoints when SMCCC calls are made
Date:   Wed, 22 Sep 2021 15:37:00 -0700
Message-ID: <20210922223701.17521-1-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add trace events for SMCCC calls. These traces allow for convenient
mechanism for kernel to log SMC/HVC instructions without requiring
extracting traces from firmware. SMCCC spec currently [1] allows for 7
argument registers and 4 result registers. The first argument should
always be a function identifier, so use that to match the exit trace.

[1]: ARM DEN 0028D (https://developer.arm.com/documentation/den0028/d/)

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/smccc/Kconfig            |  8 ++
 drivers/firmware/smccc/Makefile           |  1 +
 drivers/firmware/smccc/arm-smccc-traces.c | 14 ++++
 include/linux/arm-smccc.h                 | 38 +++++++--
 include/trace/events/arm_smccc.h          | 99 +++++++++++++++++++++++
 5 files changed, 154 insertions(+), 6 deletions(-)
 create mode 100644 drivers/firmware/smccc/arm-smccc-traces.c
 create mode 100644 include/trace/events/arm_smccc.h

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a6..fb7d2da1558e 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
 	help
 	  Include support for the SoC bus on the ARM SMCCC firmware based
 	  platforms providing some sysfs information about the SoC variant.
+
+config TRACE_ARM_SMCCC
+	bool "Trace ARM SMCCC Calls"
+	depends on HAVE_ARM_SMCCC
+	depends on TRACEPOINTS
+	default y
+	help
+	  Enable trace events to log SMC and HVC service calls.
diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
index 40d19144a860..be50ae665040 100644
--- a/drivers/firmware/smccc/Makefile
+++ b/drivers/firmware/smccc/Makefile
@@ -2,3 +2,4 @@
 #
 obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
 obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
+obj-$(CONFIG_TRACE_ARM_SMCCC) += arm-smccc-traces.o
diff --git a/drivers/firmware/smccc/arm-smccc-traces.c b/drivers/firmware/smccc/arm-smccc-traces.c
new file mode 100644
index 000000000000..9c6282644c02
--- /dev/null
+++ b/drivers/firmware/smccc/arm-smccc-traces.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM SMCCC Trace points
+ *
+ * Copyright (C) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/export.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/arm_smccc.h>
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(arm_smccc_start);
+EXPORT_TRACEPOINT_SYMBOL_GPL(arm_smccc_end);
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 7d1cabe15262..c214cebb1603 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -190,6 +190,7 @@
 
 #include <linux/linkage.h>
 #include <linux/types.h>
+#include <trace/events/arm_smccc.h>
 
 enum arm_smccc_conduit {
 	SMCCC_CONDUIT_NONE,
@@ -343,13 +344,25 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 			unsigned long a5, unsigned long a6, unsigned long a7,
 			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
 
-#define arm_smccc_smc(...) __arm_smccc_smc(__VA_ARGS__, NULL)
+#define __arm_smccc(call, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, res, quirk) \
+	do { \
+		trace_arm_smccc_start(tracepoint_string(#call), \
+				(arg0), (arg1), (arg2), (arg3), (arg4), \
+				(arg5), (arg6), (arg7)); \
+		__arm_smccc_##call((arg0), (arg1), (arg2), (arg3), (arg4), (arg5), (arg6), (arg7),\
+				   (res), (quirk)); \
+		trace_arm_smccc_end(tracepoint_string(#call), (arg0), \
+				(res)->a0, (res)->a1, (res)->a2, (res)->a3); \
+	} while (0)
+
 
-#define arm_smccc_smc_quirk(...) __arm_smccc_smc(__VA_ARGS__)
+#define arm_smccc_smc(...) __arm_smccc(smc, __VA_ARGS__, NULL)
 
-#define arm_smccc_hvc(...) __arm_smccc_hvc(__VA_ARGS__, NULL)
+#define arm_smccc_smc_quirk(...) __arm_smccc(smc, __VA_ARGS__)
 
-#define arm_smccc_hvc_quirk(...) __arm_smccc_hvc(__VA_ARGS__)
+#define arm_smccc_hvc(...) __arm_smccc(hvc, __VA_ARGS__, NULL)
+
+#define arm_smccc_hvc_quirk(...) __arm_smccc(hvc, __VA_ARGS__)
 
 /* SMCCC v1.1 implementation madness follows */
 #ifdef CONFIG_ARM64
@@ -450,22 +463,35 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 	: smccc_sve_clobbers "memory"
 #define __constraints(count)	___constraints(count)
 
+#define __trace_arg_0	((unsigned long)arg0)
+#define __trace_arg_1	__trace_arg_0, ((unsigned long)arg1)
+#define __trace_arg_2	__trace_arg_1, ((unsigned long)arg2)
+#define __trace_arg_3	__trace_arg_2, ((unsigned long)arg3)
+#define __trace_arg_4	__trace_arg_3, ((unsigned long)arg4)
+#define __trace_arg_5	__trace_arg_4, ((unsigned long)arg5)
+#define __trace_arg_6	__trace_arg_5, ((unsigned long)arg6)
+#define __trace_arg_7	__trace_arg_6, ((unsigned long)arg7)
+#define ___trace_args(count)	__trace_arg_##count
+#define __trace_args(count)	___trace_args(count)
+
 /*
  * We have an output list that is not necessarily used, and GCC feels
  * entitled to optimise the whole sequence away. "volatile" is what
  * makes it stick.
  */
-#define __arm_smccc_1_1(inst, ...)					\
+#define __arm_smccc_1_1(inst, a0, ...)					\
 	do {								\
 		register unsigned long r0 asm("r0");			\
 		register unsigned long r1 asm("r1");			\
 		register unsigned long r2 asm("r2");			\
 		register unsigned long r3 asm("r3"); 			\
 		__declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);	\
+		trace_arm_smccc_start_vargs(tracepoint_string(inst), __trace_args(__count_args(a0, __VA_ARGS__))); \
 		asm volatile(SMCCC_SVE_CHECK				\
 			     inst "\n" :				\
 			     "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)	\
-			     __constraints(__count_args(__VA_ARGS__)));	\
+			     __constraints(__count_args(a0, __VA_ARGS__)));	\
+		trace_arm_smccc_end(tracepoint_string(inst), a0, r0, r1, r2, r3); \
 		if (___res)						\
 			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
 	} while (0)
diff --git a/include/trace/events/arm_smccc.h b/include/trace/events/arm_smccc.h
new file mode 100644
index 000000000000..533377d2d066
--- /dev/null
+++ b/include/trace/events/arm_smccc.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#if IS_REACHABLE(CONFIG_TRACE_ARM_SMCCC) && !defined(__KVM_NVHE_HYPERVISOR__)
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM arm_smccc
+
+#if !defined(_TRACE_ARM_SMCCC_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_ARM_SMCCC_H
+
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(arm_smccc_start,
+	TP_PROTO(const char *call, unsigned long a0, unsigned long a1, unsigned long a2,
+		unsigned long a3, unsigned long a4, unsigned long a5, unsigned long a6,
+		unsigned long a7),
+
+	TP_ARGS(call, a0, a1, a2, a3, a4, a5, a6, a7),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, a0)
+		__field(unsigned long, a1)
+		__field(unsigned long, a2)
+		__field(unsigned long, a3)
+		__field(unsigned long, a4)
+		__field(unsigned long, a5)
+		__field(unsigned long, a6)
+		__field(unsigned long, a7)
+		__string(call, call)
+	),
+
+	TP_fast_assign(
+		__entry->a0 = a0;
+		__entry->a1 = a1;
+		__entry->a2 = a2;
+		__entry->a3 = a3;
+		__entry->a4 = a4;
+		__entry->a5 = a5;
+		__entry->a6 = a6;
+		__entry->a7 = a7;
+
+		__assign_str(call, call);
+	),
+
+	TP_printk("call=%s fn=%04x args={%0lx %0lx %0lx %0lx %0lx %0lx %0lx}",
+		__get_str(call), __entry->a0, __entry->a1, __entry->a2,
+		__entry->a3, __entry->a4, __entry->a5, __entry->a6, __entry->a7)
+);
+
+TRACE_EVENT(arm_smccc_end,
+	TP_PROTO(const char *call, unsigned long a0, unsigned long r0, unsigned long r1,
+		unsigned long r2, unsigned long r3),
+
+	TP_ARGS(call, a0, r0, r1, r2, r3),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, a0)
+		__field(unsigned long, r0)
+		__field(unsigned long, r1)
+		__field(unsigned long, r2)
+		__field(unsigned long, r3)
+		__string(call, call)
+	),
+
+	TP_fast_assign(
+		__entry->a0 = a0;
+		__entry->r0 = r0;
+		__entry->r1 = r1;
+		__entry->r2 = r2;
+		__entry->r3 = r3;
+
+		__assign_str(call, call);
+	),
+
+	TP_printk("call=%s fn=%04x res={%0lx %0lx %0lx %0lx}",
+		__get_str(call), __entry->a0, __entry->r0, __entry->r1,
+		__entry->r2, __entry->r3)
+);
+
+#define _trace_arm_smccc_start(call, a0, a1, a2, a3, a4, a5, a6, a7, ...) \
+	trace_arm_smccc_start(call, a0, a1, a2, a3, a4, a5, a6, a7)
+
+#define trace_arm_smccc_start_vargs(call, ...) \
+	_trace_arm_smccc_start(call, __VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0)
+
+#endif
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
+
+#else
+#define trace_arm_smccc_start(...)
+#define trace_arm_smccc_end(...)
+
+#define trace_arm_smccc_start_vargs(...)
+#endif
-- 
2.33.0

