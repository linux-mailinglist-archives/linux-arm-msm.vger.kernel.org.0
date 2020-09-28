Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A425D27A4E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 02:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgI1AhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 20:37:22 -0400
Received: from z5.mailgun.us ([104.130.96.5]:36806 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgI1AhT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 20:37:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601253438; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fJo1952L2QX2vLQjS3dhBlwLR9a3Ra2MXfWzPx41YsQ=; b=J0BmZMiXLM51Cdl3HciUtigbSkrtRPBu9YESp8PopdEYkAmWT4w55mTUmgmsGDEERDrEhXeL
 S5PUi/6NOg4m3mx7ycDelajzDYaJqIxxNjOw9rpKS4TniGHF/+lJNu99WVZT/qQIY3hrkPRp
 5W9lm1TKiHvQeCMiwOvkAdBcqHk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f712fc0557d03a9f4010295 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 00:35:12
 GMT
Sender: psodagud=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97F4FC433AF; Mon, 28 Sep 2020 00:35:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: psodagud)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D784DC433FF;
        Mon, 28 Sep 2020 00:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D784DC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=psodagud@codeaurora.org
From:   Prasad Sodagudi <psodagud@codeaurora.org>
To:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, catalin.marinas@arm.com,
        ccross@android.com, jbaron@akamai.com, jim.cromie@gmail.com,
        joe@perches.com, joel@joelfernandes.org, psodagud@codeaurora.org
Subject: [PATCH] tracing: Add register read and write tracing support
Date:   Sun, 27 Sep 2020 17:34:50 -0700
Message-Id: <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
References: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add register read/write operations tracing support.
ftrace events helps trace register read and write
location details of memory mapped IO registers. Also
add _no_log variants the writel_relaxed/readl_relaed
APIs to avoid excessive logging for certain register
operations.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
---
 arch/arm64/include/asm/io.h    | 117 ++++++++++++++++++++++++++++++++++++++---
 include/linux/iorw.h           |  20 +++++++
 include/trace/events/rwio.h    |  51 ++++++++++++++++++
 kernel/trace/Kconfig           |  11 ++++
 kernel/trace/Makefile          |   1 +
 kernel/trace/trace_readwrite.c |  30 +++++++++++
 6 files changed, 222 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/iorw.h
 create mode 100644 include/trace/events/rwio.h
 create mode 100644 kernel/trace/trace_readwrite.c

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index ff50dd7..db5acff 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -9,6 +9,7 @@
 #define __ASM_IO_H
 
 #include <linux/types.h>
+#include <linux/iorw.h>
 #include <linux/pgtable.h>
 
 #include <asm/byteorder.h>
@@ -24,24 +25,28 @@
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
+	log_write_io(addr);
 	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writew __raw_writew
 static inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
+	log_write_io(addr);
 	asm volatile("strh %w0, [%1]" : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writel __raw_writel
 static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
+	log_write_io(addr);
 	asm volatile("str %w0, [%1]" : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writeq __raw_writeq
 static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
+	log_write_io(addr);
 	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
 }
 
@@ -49,6 +54,7 @@ static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 static inline u8 __raw_readb(const volatile void __iomem *addr)
 {
 	u8 val;
+	log_read_io(addr);
 	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
 				 "ldarb %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -61,6 +67,7 @@ static inline u16 __raw_readw(const volatile void __iomem *addr)
 {
 	u16 val;
 
+	log_read_io(addr);
 	asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
 				 "ldarh %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -72,6 +79,7 @@ static inline u16 __raw_readw(const volatile void __iomem *addr)
 static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 {
 	u32 val;
+	log_read_io(addr);
 	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
 				 "ldar %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -83,6 +91,79 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 static inline u64 __raw_readq(const volatile void __iomem *addr)
 {
 	u64 val;
+	log_read_io(addr);
+	asm volatile(ALTERNATIVE("ldr %0, [%1]",
+				 "ldar %0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_writeb_no_log __raw_writeb_no_log
+static inline void __raw_writeb_no_log(u8 val, volatile void __iomem *addr)
+{
+	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+#define __raw_writew_no_log __raw_writew_no_log
+static inline void __raw_writew_no_log(u16 val, volatile void __iomem *addr)
+{
+	asm volatile("strh %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+#define __raw_writel_no_log __raw_writel_no_log
+static inline void __raw_writel_no_log(u32 val, volatile void __iomem *addr)
+{
+	asm volatile("str %w0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+#define __raw_writeq_no_log __raw_writeq_no_log
+static inline void __raw_writeq_no_log(u64 val, volatile void __iomem *addr)
+{
+	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
+}
+
+#define __raw_readb_no_log __raw_readb_no_log
+static inline u8 __raw_readb_no_log(const volatile void __iomem *addr)
+{
+	u8 val;
+
+	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
+				 "ldarb %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readw_no_log __raw_readw_no_log
+static inline u16 __raw_readw_no_log(const volatile void __iomem *addr)
+{
+	u16 val;
+
+	asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
+				 "ldarh %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readl_no_log __raw_readl_no_log
+static inline u32 __raw_readl_no_log(const volatile void __iomem *addr)
+{
+	u32 val;
+
+	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
+				 "ldar %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readq_no_log __raw_readq_no_log
+static inline u64 __raw_readq_no_log(const volatile void __iomem *addr)
+{
+	u64 val;
+
 	asm volatile(ALTERNATIVE("ldr %0, [%1]",
 				 "ldar %0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -121,10 +202,20 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #define readl_relaxed(c)	({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
 #define readq_relaxed(c)	({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
 
-#define writeb_relaxed(v,c)	((void)__raw_writeb((v),(c)))
-#define writew_relaxed(v,c)	((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
-#define writel_relaxed(v,c)	((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
-#define writeq_relaxed(v,c)	((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
+#define writeb_relaxed(v, c)	((void)__raw_writeb((v), (c)))
+#define writew_relaxed(v, c)	((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
+#define writel_relaxed(v, c)	((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
+#define writeq_relaxed(v, c)	((void)__raw_writeq((__force u64)cpu_to_le64(v), (c)))
+
+#define readb_relaxed_no_log(c)	({ u8  __r = __raw_readb_no_log(c); __r; })
+#define readw_relaxed_no_log(c)	({ u16 __r = le16_to_cpu((__force __le16)__raw_readw_no_log(c)); __r; })
+#define readl_relaxed_no_log(c)	({ u32 __r = le32_to_cpu((__force __le32)__raw_readl_no_log(c)); __r; })
+#define readq_relaxed_no_log(c)	({ u64 __r = le64_to_cpu((__force __le64)__raw_readq_no_log(c)); __r; })
+
+#define writeb_relaxed_no_log(v, c)	((void)__raw_writeb_no_log((v), (c)))
+#define writew_relaxed_no_log(v, c)	((void)__raw_writew_no_log((__force u16)cpu_to_le16(v), (c)))
+#define writel_relaxed_no_log(v, c)	((void)__raw_writel_no_log((__force u32)cpu_to_le32(v), (c)))
+#define writeq_relaxed_no_log(v, c)	((void)__raw_writeq_no_log((__force u64)cpu_to_le64(v), (c)))
 
 /*
  * I/O memory access primitives. Reads are ordered relative to any
@@ -136,10 +227,20 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #define readl(c)		({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
 #define readq(c)		({ u64 __v = readq_relaxed(c); __iormb(__v); __v; })
 
-#define writeb(v,c)		({ __iowmb(); writeb_relaxed((v),(c)); })
-#define writew(v,c)		({ __iowmb(); writew_relaxed((v),(c)); })
-#define writel(v,c)		({ __iowmb(); writel_relaxed((v),(c)); })
-#define writeq(v,c)		({ __iowmb(); writeq_relaxed((v),(c)); })
+#define writeb(v, c)		({ __iowmb(); writeb_relaxed((v), (c)); })
+#define writew(v, c)		({ __iowmb(); writew_relaxed((v), (c)); })
+#define writel(v, c)		({ __iowmb(); writel_relaxed((v), (c)); })
+#define writeq(v, c)		({ __iowmb(); writeq_relaxed((v), (c)); })
+
+#define readb_no_log(c)		({ u8  __v = readb_relaxed_no_log(c); __iormb(__v); __v; })
+#define readw_no_log(c)		({ u16 __v = readw_relaxed_no_log(c); __iormb(__v); __v; })
+#define readl_no_log(c)		({ u32 __v = readl_relaxed_no_log(c); __iormb(__v); __v; })
+#define readq_no_log(c)		({ u64 __v = readq_relaxed_no_log(c); __iormb(__v); __v; })
+
+#define writeb_no_log(v, c)	({ __iowmb(); writeb_relaxed_no_log((v), (c)); })
+#define writew_no_log(v, c)	({ __iowmb(); writew_relaxed_no_log((v), (c)); })
+#define writel_no_log(v, c)	({ __iowmb(); writel_relaxed_no_log((v), (c)); })
+#define writeq_no_log(v, c)	({ __iowmb(); writeq_relaxed_no_log((v), (c)); })
 
 /*
  *  I/O port access primitives.
diff --git a/include/linux/iorw.h b/include/linux/iorw.h
new file mode 100644
index 0000000..c7087b4
--- /dev/null
+++ b/include/linux/iorw.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ */
+#ifndef __LOG_IORW_H__
+#define __LOG_IORW_H__
+
+#include <linux/types.h>
+
+#if IS_ENABLED(CONFIG_TRACE_RW)
+void log_write_io(volatile void __iomem *addr);
+void log_read_io(const volatile void __iomem *addr);
+#else
+static inline void log_write_io(volatile void __iomem *addr)
+{ }
+static inline void log_read_io(const volatile void __iomem *addr)
+{ }
+#endif /* CONFIG_TRACE_RW */
+
+#endif /* __LOG_IORW_H__  */
diff --git a/include/trace/events/rwio.h b/include/trace/events/rwio.h
new file mode 100644
index 0000000..b829629
--- /dev/null
+++ b/include/trace/events/rwio.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rwio
+
+#if !defined(_TRACE_RWIO_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RWIO_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(raw_write,
+
+	TP_PROTO(unsigned long fn, volatile void __iomem *addr),
+
+	TP_ARGS(fn, addr),
+
+	TP_STRUCT__entry(
+		__field(u64, fn)
+		__field(u64, addr)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__entry->addr = (u64)addr;
+	),
+
+	TP_printk("%pS write addr=%p\n", __entry->fn, __entry->addr)
+);
+
+TRACE_EVENT(raw_read,
+
+	TP_PROTO(unsigned long fn, const volatile void __iomem *addr),
+
+	TP_ARGS(fn, addr),
+
+	TP_STRUCT__entry(
+		__field(u64, fn)
+		__field(u64, addr)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__entry->addr = (u64)addr;
+	),
+
+	TP_printk("%pS read addr=%p\n", __entry->fn, __entry->addr)
+);
+
+#endif /* _TRACE_PREEMPTIRQ_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0..e07bbfd 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -81,6 +81,17 @@ config RING_BUFFER_ALLOW_SWAP
 	 Allow the use of ring_buffer_swap_cpu.
 	 Adds a very slight overhead to tracing when enabled.
 
+config TRACE_RW
+	bool "Register read/write tracing"
+	select TRACING
+	default n
+	help
+	  Create tracepoints for IO read/write operations, so that
+	  modules can register hooks to use them.
+
+	  Disable this option, when there is support from corresponding
+	  architecture.
+
 config PREEMPTIRQ_TRACEPOINTS
 	bool
 	depends on TRACE_PREEMPT_TOGGLE || TRACE_IRQFLAGS
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index e153be3..3a09cc2 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -95,4 +95,5 @@ obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 
+obj-$(CONFIG_TRACE_RW) += trace_readwrite.o
 libftrace-y := ftrace.o
diff --git a/kernel/trace/trace_readwrite.c b/kernel/trace/trace_readwrite.c
new file mode 100644
index 0000000..37fb67d
--- /dev/null
+++ b/kernel/trace/trace_readwrite.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Register read and write tracepoints
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kallsyms.h>
+#include <linux/uaccess.h>
+#include <linux/module.h>
+#include <linux/ftrace.h>
+#include <linux/iorw.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/rwio.h>
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(raw_write);
+EXPORT_TRACEPOINT_SYMBOL_GPL(raw_read);
+
+void log_write_io(volatile void __iomem *addr)
+{
+	trace_raw_write(CALLER_ADDR0, addr);
+}
+EXPORT_SYMBOL_GPL(log_write_io);
+
+void log_read_io(const volatile void __iomem *addr)
+{
+	trace_raw_read(CALLER_ADDR0, addr);
+}
+EXPORT_SYMBOL_GPL(log_read_io);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

