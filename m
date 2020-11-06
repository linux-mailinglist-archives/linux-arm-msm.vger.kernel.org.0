Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FD82A8D3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 03:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgKFC4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 21:56:52 -0500
Received: from z5.mailgun.us ([104.130.96.5]:28209 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgKFC4v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 21:56:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604631410; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9MQz0tAGsEZJw9iqvJvbEiXLV/HhkINlrjIrKI1wD7U=; b=kxz1E9gub3e8a7xsoW0yr6mg59QqbfMZwIGCN4EUYZHCgMoKzzsW8CvOJgnWUMlyOAxLEx8K
 KNc5c0JGRDXJUsyVU2l1cdQwicQ6mE5x5oBNEp/sEhMYU0Esf4D+nM/irBGh11ceeA78whqr
 FmsJjHNLBn+fU8X/qiDDaKBv7Gc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa4bb6ea39cfb5f6caab956 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 02:56:46
 GMT
Sender: psodagud=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9906EC433CB; Fri,  6 Nov 2020 02:56:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: psodagud)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19C5FC433CB;
        Fri,  6 Nov 2020 02:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19C5FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=psodagud@codeaurora.org
From:   Prasad Sodagudi <psodagud@codeaurora.org>
To:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        catalin.marinas@arm.com, saiprakash.ranjan@codeaurora.org,
        will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, ccross@android.com,
        jbaron@akamai.com, jim.cromie@gmail.com, joe@perches.com,
        joel@joelfernandes.org, Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH v2] tracing: Add register read and write tracing support
Date:   Thu,  5 Nov 2020 18:56:26 -0800
Message-Id: <1604631386-178312-2-git-send-email-psodagud@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
References: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add register read/write operations tracing support.
ftrace events helps to trace register read and write
location details of memory mapped IO registers.
These trace logs helps to debug un clocked access
of peripherals.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
---
 arch/arm64/include/asm/io.h    |  9 ++++++++
 arch/arm64/kernel/image-vars.h |  8 +++++++
 include/linux/iorw.h           | 38 +++++++++++++++++++++++++++++++
 include/trace/events/rwio.h    | 51 ++++++++++++++++++++++++++++++++++++++++++
 kernel/trace/Kconfig           | 11 +++++++++
 kernel/trace/Makefile          |  1 +
 kernel/trace/trace_readwrite.c | 31 +++++++++++++++++++++++++
 7 files changed, 149 insertions(+)
 create mode 100644 include/linux/iorw.h
 create mode 100644 include/trace/events/rwio.h
 create mode 100644 kernel/trace/trace_readwrite.c

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index fd172c4..bcfc65c 100644
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
@@ -83,6 +91,7 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 static inline u64 __raw_readq(const volatile void __iomem *addr)
 {
 	u64 val;
+	log_read_io(addr);
 	asm volatile(ALTERNATIVE("ldr %0, [%1]",
 				 "ldar %0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c615b28..6a70d91 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -103,6 +103,14 @@ KVM_NVHE_ALIAS(gic_nonsecure_priorities);
 KVM_NVHE_ALIAS(__start___kvm_ex_table);
 KVM_NVHE_ALIAS(__stop___kvm_ex_table);
 
+/* raw_read/write logging */
+#if IS_ENABLED(CONFIG_TRACE_RW)
+KVM_NVHE_ALIAS(__log_write_io);
+KVM_NVHE_ALIAS(__log_read_io);
+KVM_NVHE_ALIAS(__tracepoint_rwio_read);
+KVM_NVHE_ALIAS(__tracepoint_rwio_write);
+#endif
+
 #endif /* CONFIG_KVM */
 
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
diff --git a/include/linux/iorw.h b/include/linux/iorw.h
new file mode 100644
index 0000000..6b571b4
--- /dev/null
+++ b/include/linux/iorw.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ */
+#ifndef __LOG_IORW_H__
+#define __LOG_IORW_H__
+
+#include <linux/types.h>
+#include <linux/atomic.h>
+#include <linux/tracepoint-defs.h>
+
+#if IS_ENABLED(CONFIG_TRACE_RW)
+DECLARE_TRACEPOINT(rwio_write);
+DECLARE_TRACEPOINT(rwio_read);
+
+void __log_write_io(volatile void __iomem *addr);
+void __log_read_io(const volatile void __iomem *addr);
+
+#define log_write_io(addr)			\
+do {						\
+	if (tracepoint_enabled(rwio_write))	\
+		__log_write_io(addr);		\
+} while (0)
+
+#define log_read_io(addr)			\
+do {						\
+	if (tracepoint_enabled(rwio_read))	\
+		__log_read_io(addr);		\
+} while (0)
+
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
index 0000000..b26bcaf
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
+TRACE_EVENT(rwio_write,
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
+TRACE_EVENT(rwio_read,
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
index a4020c0..f0408f9 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -81,6 +81,17 @@ config RING_BUFFER_ALLOW_SWAP
 	 Allow the use of ring_buffer_swap_cpu.
 	 Adds a very slight overhead to tracing when enabled.
 
+config TRACE_RW
+	bool "Register read/write tracing"
+	select TRACING
+	depends on ARM64
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
index e153be3..69edfe50 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_DYNAMIC_EVENTS) += trace_dynevent.o
 obj-$(CONFIG_PROBE_EVENTS) += trace_probe.o
 obj-$(CONFIG_UPROBE_EVENTS) += trace_uprobe.o
 obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
+obj-$(CONFIG_TRACE_RW) += trace_readwrite.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 
diff --git a/kernel/trace/trace_readwrite.c b/kernel/trace/trace_readwrite.c
new file mode 100644
index 0000000..d107134
--- /dev/null
+++ b/kernel/trace/trace_readwrite.c
@@ -0,0 +1,31 @@
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
+#ifdef CONFIG_TRACEPOINTS
+void __log_write_io(volatile void __iomem *addr)
+{
+	trace_rwio_write(CALLER_ADDR0, addr);
+}
+EXPORT_SYMBOL_GPL(__log_write_io);
+EXPORT_TRACEPOINT_SYMBOL_GPL(rwio_write);
+
+void __log_read_io(const volatile void __iomem *addr)
+{
+	trace_rwio_read(CALLER_ADDR0, addr);
+}
+EXPORT_SYMBOL_GPL(__log_read_io);
+EXPORT_TRACEPOINT_SYMBOL_GPL(rwio_read);
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

