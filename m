Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5411E45038D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 12:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhKOLib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 06:38:31 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1967 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhKOLhm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 06:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636976087; x=1668512087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=101wOyEPbUZrWpHIZ5ePYaJysu4mVoyEqkZLxb8U9UM=;
  b=iXAIBf45laVxRqjgzy3weY3+xbdNIF4Oh8z//tt/HK02+B4WdM2kPAgv
   PF3Sgk5fLYp+a/Q6/emeoC6sapXTDrWYR2EzN2WcslBsLV4epTIfq+y7j
   iYsP394s1QWV6GaXk1OqjDNgQ28A1gP5VpcAd4iqxEZWwlc8O5bfQldN5
   g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 15 Nov 2021 03:34:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 03:34:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 03:34:20 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 03:34:16 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>
CC:     Marc Zyngier <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, Prasad Sodagudi <psodagud@codeaurora.org>,
        "Sai Prakash Ranjan" <quic_saipraka@quicinc.com>
Subject: [PATCHv4 1/2] tracing: Add register read/write tracing support
Date:   Mon, 15 Nov 2021 17:03:29 +0530
Message-ID: <4bd519d008cac6b319be7c5ce144e741f7210031.1636973694.git.quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1636973694.git.quic_saipraka@quicinc.com>
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184
rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
[saiprakash: Rewrote commit msg and trace event field edits]
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---

Have dropped value parameter for mmio write trace event as that
was causing hangs in strange ways, i.e., if we pass any other
64bit value, it works fine but passing value would just hang.
Not just using the log apis, even simple trace_printk with value
printed would cause hang. It wasn't noticed in early version
because dyndbg would filter the logging in my system (I had
set it to trace only specific qcom directory) but once this
version starts recording all the reads/writes with value passed,
it just hangs system when rwmmio write event tracing is enabled.

Reason why we wouldn't need value along with mmio write log is
that value can be easily deduced from the caller_name+offset which is
printed already by the rwmmio trace events which gives the exact
location of mmio writes and the value is easily known from the driver.
So trace event fields will be only the required ones and rest which
can be deduced from userspace with GDB like application can be skipped.

---
 include/trace/events/rwmmio.h  | 59 ++++++++++++++++++++++++++++++++++
 kernel/trace/Kconfig           |  7 ++++
 kernel/trace/Makefile          |  1 +
 kernel/trace/trace_readwrite.c | 29 +++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 include/trace/events/rwmmio.h
 create mode 100644 kernel/trace/trace_readwrite.c

diff --git a/include/trace/events/rwmmio.h b/include/trace/events/rwmmio.h
new file mode 100644
index 000000000000..1687abf8e7a3
--- /dev/null
+++ b/include/trace/events/rwmmio.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rwmmio
+
+#if !defined(_TRACE_RWMMIO_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RWMMIO_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(rwmmio_write,
+
+	TP_PROTO(unsigned long fn, const char *width, volatile void __iomem *addr),
+
+	TP_ARGS(fn, width, addr),
+
+	TP_STRUCT__entry(
+		__field(u64, fn)
+		__field(u64, addr)
+		__string(width, width)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__entry->addr = (u64)(void *)addr;
+		__assign_str(width, width);
+	),
+
+	TP_printk("%pS %s addr=%#llx",
+		(void *)(unsigned long)__entry->fn, __get_str(width), __entry->addr)
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
+		__field(u64, addr)
+		__string(width, width)
+	),
+
+	TP_fast_assign(
+		__entry->fn = fn;
+		__entry->addr = (u64)(void *)addr;
+		__assign_str(width, width);
+	),
+
+	TP_printk("%pS %s addr=%#llx",
+		 (void *)(unsigned long)__entry->fn, __get_str(width), __entry->addr)
+);
+
+#endif /* _TRACE_RWMMIO_H */
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
index 000000000000..334e21f70c62
--- /dev/null
+++ b/kernel/trace/trace_readwrite.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Register read and write tracepoints
+ *
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/ftrace.h>
+#include <linux/mmio-instrumented.h>
+#include <linux/module.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/rwmmio.h>
+
+#ifdef CONFIG_TRACE_MMIO_ACCESS
+void log_write_mmio(const char *width, volatile void __iomem *addr)
+{
+	trace_rwmmio_write(CALLER_ADDR0, width, addr);
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
2.33.1

