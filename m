Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D86244AD30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 13:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240242AbhKIMMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 07:12:21 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18529 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241399AbhKIMMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 07:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636459770; x=1667995770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wibJ7XHVuZ+6iwinPjJS/TIrz46zXgv6aJtkV5FrU90=;
  b=PnBHDLc/05SPVbG23chrpYBsU9AVNc3is+uCD1CRImEKllg+v++JhN8V
   jcFPZaq8Ju5Rtvnk4srWxUzDF4Q7RCyp7ecHhRj/Og9myhJ0AQsCRRHJN
   59lifatFX515/X1taHQz5WQ1PQOzeTND+xN42CUgAqzGWuFGTP+u554k8
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Nov 2021 04:09:30 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:09:29 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:29 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:24 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>
CC:     Marc Zyngier <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>,
        "Sai Prakash Ranjan" <quic_saipraka@quicinc.com>
Subject: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event tracing
Date:   Tue, 9 Nov 2021 17:38:21 +0530
Message-ID: <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1636452784.git.quic_saipraka@quicinc.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Debugging a specific driver or subsystem can be a lot easier if we can
trace events specific to that driver or subsystem. This type of
filtering can be achieved using existing dynamic debug library which
provides a way to filter based on files, functions and modules.

Using this, provide an additional flag 'e' to filter event tracing to
specified input.

For example, tracing all MMIO read/write can be overwhelming and of no
use when debugging a specific driver or a subsystem. So switch to
dynamic event tracing for register accesses.

Example: Tracing register accesses for all drivers in drivers/soc/qcom/*
and the trace output is given below:

  # dyndbg="file drivers/soc/qcom/* +e" trace_event=rwmmio
    or
  # echo "file drivers/soc/qcom/* +e" > /sys/kernel/debug/dynamic_debug/control
  # cat /sys/kernel/debug/tracing/trace
    rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
    rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
    rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
    rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108

Cc: Jason Baron <jbaron@akamai.com>
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---
 include/linux/dynamic_debug.h     |  1 +
 include/linux/mmio-instrumented.h | 29 +++++++++++++++++++++++++++--
 lib/dynamic_debug.c               |  1 +
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..80a1ae234a3b 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -32,6 +32,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
+#define _DPRINTK_FLAGS_EVENT		(1<<5)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
diff --git a/include/linux/mmio-instrumented.h b/include/linux/mmio-instrumented.h
index 4304224f3be4..4ff5af4bbee8 100644
--- a/include/linux/mmio-instrumented.h
+++ b/include/linux/mmio-instrumented.h
@@ -6,6 +6,7 @@
 #ifndef _LINUX_MMIO_INSTRUMENTED_H
 #define _LINUX_MMIO_INSTRUMENTED_H
 
+#include <linux/dynamic_debug.h>
 #include <linux/tracepoint-defs.h>
 
 /*
@@ -25,7 +26,7 @@ void log_read_mmio(const char *width, const volatile void __iomem *addr);
 #define __raw_write(v, a, _l)	({				\
 	volatile void __iomem *_a = (a);			\
 	if (tracepoint_enabled(rwmmio_write))			\
-		log_write_mmio(__stringify(write##_l), v, _a);	\
+		dynamic_log_write_mmio(__stringify(write##_l), v, _a);\
 	arch_raw_write##_l((v), _a);				\
 	})
 
@@ -38,7 +39,7 @@ void log_read_mmio(const char *width, const volatile void __iomem *addr);
 	_t __a;							\
 	const volatile void __iomem *_a = (a);			\
 	if (tracepoint_enabled(rwmmio_read))			\
-		log_read_mmio(__stringify(read##_l), _a);	\
+		dynamic_log_read_mmio(__stringify(read##_l), _a);\
 	__a = arch_raw_read##_l(_a);				\
 	__a;							\
 	})
@@ -48,6 +49,26 @@ void log_read_mmio(const char *width, const volatile void __iomem *addr);
 #define __raw_readl(a)		__raw_read((a), l, u32)
 #define __raw_readq(a)		__raw_read((a), q, u64)
 
+#if defined(CONFIG_DYNAMIC_DEBUG)
+#define dynamic_log_write_mmio(width, value, addr)		\
+do {								\
+	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, width);	\
+	if (unlikely(descriptor.flags & _DPRINTK_FLAGS_EVENT))	\
+		log_write_mmio(width, value, addr);		\
+} while (0)
+
+#define dynamic_log_read_mmio(width, addr)			\
+do {								\
+	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, width);	\
+	if (unlikely(descriptor.flags & _DPRINTK_FLAGS_EVENT))	\
+		log_read_mmio(width, addr);			\
+} while (0)
+
+#else
+#define dynamic_log_write_mmio(width, val, addr)	log_write_mmio(width, val, addr)
+#define dynamic_log_read_mmio(width, addr)		log_read_mmio(width, addr)
+#endif /* CONFIG_DYNAMIC_DEBUG */
+
 #else
 
 #define __raw_writeb(v, a)	arch_raw_writeb(v, a)
@@ -64,6 +85,10 @@ static inline void log_write_mmio(const char *width, u64 val,
 				  volatile void __iomem *addr) {}
 static inline void log_read_mmio(const char *width,
 				 const volatile void __iomem *addr) {}
+static inline void dynamic_log_write_mmio(const char *width, u64 val,
+				  volatile void __iomem *addr) {}
+static inline void dynamic_log_read_mmio(const char *width,
+				 const volatile void __iomem *addr) {}
 
 #endif /* CONFIG_TRACE_MMIO_ACCESS */
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index dd7f56af9aed..a852073089d9 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -87,6 +87,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_EVENT, 'e' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
-- 
2.29.0

