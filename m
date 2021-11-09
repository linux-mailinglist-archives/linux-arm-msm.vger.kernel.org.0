Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5919A44AD2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 13:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239253AbhKIMMC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 07:12:02 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18507 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239237AbhKIMMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 07:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636459756; x=1667995756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=obBQXVkM0WWKYo8La3SxX6cusWUwv133/rdShvGShE4=;
  b=U8wM0Kgs0mIaQewFqSD7Gys8jEPC+gJl5wOB/2F28gVP1u7Pi7CsVVzL
   Yvd5qgoVbOG8++qvc9cmMC1lJBkzilHiGoicbuBFiW+zOSR5QapZBkvtB
   zLy22xgj33mPlQOTDufIIj9upghK8AiIFESJRYy+0lQXHYAkHkRY9QCL1
   4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Nov 2021 04:09:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:09:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:15 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:10 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>
CC:     Marc Zyngier <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>,
        "Prasad Sodagudi" <psodagud@codeaurora.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [PATCHv3 1/3] tracing: Add register read/write tracing support
Date:   Tue, 9 Nov 2021 17:38:19 +0530
Message-ID: <d127fdaf198f5766ffe021430cf848e64b4fdf84.1636452784.git.quic_saipraka@quicinc.com>
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

From: Prasad Sodagudi <psodagud@codeaurora.org>

Generic MMIO read/write i.e., __raw_{read,write}{b,l,w,q} accessors
are typically used to read/write from/to memory mapped registers
and can cause hangs or some undefined behaviour in following few
cases,

* If the access to the register space is unclocked, for example: if
  there is an access to multimedia(MM) block registers without MM
  clocks.

* If the register space is protected and not set to be accessible from
  non-secure world, for example: only EL3 (EL: Exception level) access
  is allowed and any EL2/EL1 access is forbidden.

* If xPU(memory/register protection units) is controlling access to
  certain memory/register space for specific clients.

and more...

Such cases usually results in instant reboot/SErrors/NOC or interconnect
hangs and tracing these register accesses can be very helpful to debug
such issues during initial development stages and also in later stages.

So use ftrace trace events to log such MMIO register accesses which
provides rich feature set such as early enablement of trace events,
filtering capability, dumping ftrace logs on console and many more.

Sample output:

rwmmio_read: gic_peek_irq+0xd0/0xd8 readl addr=0xffff800010040104
rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184 val=0x40
rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130 val=0x500

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
[saiprakash: Rewrote commit msg and trace event field edits]
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---
 include/trace/events/rwmmio.h  | 61 ++++++++++++++++++++++++++++++++++
 kernel/trace/Kconfig           |  7 ++++
 kernel/trace/Makefile          |  1 +
 kernel/trace/trace_readwrite.c | 28 ++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 include/trace/events/rwmmio.h
 create mode 100644 kernel/trace/trace_readwrite.c

diff --git a/include/trace/events/rwmmio.h b/include/trace/events/rwmmio.h
new file mode 100644
index 000000000000..cb5261a559f8
--- /dev/null
+++ b/include/trace/events/rwmmio.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rwmmio
+
+#if !defined(_TRACE_MMIO_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MMIO_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(rwmmio_write,
+
+	TP_PROTO(unsigned long fn, const char *width, u64 val, volatile void __iomem *addr),
+
+	TP_ARGS(fn, width, val, addr),
+
+	TP_STRUCT__entry(
+		__field(u64, fn)
+		__string(width, width)
+		__field(u64, val)
+		__field(u64, addr)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__assign_str(width, width);
+		__entry->val = val;
+		__entry->addr = (u64)addr;
+	),
+
+	TP_printk("%pS %s addr=%#llx val=%#llx",
+		(void *)__entry->fn, __get_str(width), __entry->addr, __entry->val)
+);
+
+TRACE_EVENT(rwmmio_read,
+
+	TP_PROTO(unsigned long fn, const char *width, const volatile void __iomem *addr),
+
+	TP_ARGS(fn, width, addr),
+
+	TP_STRUCT__entry(
+		__field(u64, fn)
+		__string(width, width)
+		__field(u64, addr)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__assign_str(width, width);
+		__entry->addr = (u64)addr;
+	),
+
+	TP_printk("%pS %s addr=%#llx",
+		 (void *)__entry->fn, __get_str(width), __entry->addr)
+);
+
+#endif /* _TRACE_MMIO_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 420ff4bc67fd..9f55bcc51de1 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -95,6 +95,13 @@ config RING_BUFFER_ALLOW_SWAP
 	 Allow the use of ring_buffer_swap_cpu.
 	 Adds a very slight overhead to tracing when enabled.
 
+config TRACE_MMIO_ACCESS
+	bool "Register read/write tracing"
+	depends on TRACING
+	help
+	  Create tracepoints for MMIO read/write operations. These trace events
+	  can be used for logging all MMIO read/write operations.
+
 config PREEMPTIRQ_TRACEPOINTS
 	bool
 	depends on TRACE_PREEMPT_TOGGLE || TRACE_IRQFLAGS
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index bedc5caceec7..a3d16e1a5abd 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -99,5 +99,6 @@ obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
 obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
+obj-$(CONFIG_TRACE_MMIO_ACCESS) += trace_readwrite.o
 
 libftrace-y := ftrace.o
diff --git a/kernel/trace/trace_readwrite.c b/kernel/trace/trace_readwrite.c
new file mode 100644
index 000000000000..8fccb64a8c32
--- /dev/null
+++ b/kernel/trace/trace_readwrite.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Register read and write tracepoints
+ *
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/ftrace.h>
+#include <linux/module.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/rwmmio.h>
+
+#ifdef CONFIG_TRACE_MMIO_ACCESS
+void log_write_mmio(const char *width, u64 val, volatile void __iomem *addr)
+{
+	trace_rwmmio_write(CALLER_ADDR0, width, val, addr);
+}
+EXPORT_SYMBOL_GPL(log_write_mmio);
+EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_write);
+
+void log_read_mmio(const char *width, const volatile void __iomem *addr)
+{
+	trace_rwmmio_read(CALLER_ADDR0, width, addr);
+}
+EXPORT_SYMBOL_GPL(log_read_mmio);
+EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_read);
+#endif /* CONFIG_TRACE_MMIO_ACCESS */
-- 
2.29.0

