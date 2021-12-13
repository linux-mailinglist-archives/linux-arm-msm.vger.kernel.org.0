Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF5A472E91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 15:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237623AbhLMOKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 09:10:40 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:26770 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231394AbhLMOKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 09:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639404639; x=1670940639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vqM9fSIdoWdqg4zybd9Gi6IM3ieGDxtQMzw6LA6D9s4=;
  b=Y71newvPXMQD3vFRpcWBW1041a7rM8dOnivlXwOyk/1LvLA1msjJub/q
   ilaJyzyLbOlvhr4m3BCP3tMmljI7gSv+yKCAXebfYttCis2qdx/PN77Fv
   QH2/LvySu0ZJqLnKzK8YoNe+UK8clwPXDEkXiXaNgBQ7B4rTL022j5kOU
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Dec 2021 06:10:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 06:10:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 13 Dec 2021 06:10:39 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 13 Dec 2021 06:10:34 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_eberman@quicinc.com>, <quic_tsoni@quicinc.com>,
        Shanker Donthineni <shankerd@codeaurora.org>,
        "Adam Wallis" <awallis@codeaurora.org>,
        Timur Tabi <timur@codeaurora.org>,
        "Elliot Berman" <eberman@codeaurora.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [PATCHv3] tty: hvc: dcc: Bind driver to core0 for reads and writes
Date:   Mon, 13 Dec 2021 19:40:13 +0530
Message-ID: <20211213141013.21464-1-quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shanker Donthineni <shankerd@codeaurora.org>

Some debuggers, such as Trace32 from Lauterbach GmbH, do not handle
reads/writes from/to DCC on secondary cores. Each core has its
own DCC device registers, so when a core reads or writes from/to DCC,
it only accesses its own DCC device. Since kernel code can run on
any core, every time the kernel wants to write to the console, it
might write to a different DCC.

In SMP mode, Trace32 creates multiple windows, and each window shows
the DCC output only from that core's DCC. The result is that console
output is either lost or scattered across windows.

Selecting this option will enable code that serializes all console
input and output to core 0. The DCC driver will create input and
output FIFOs that all cores will use. Reads and writes from/to DCC
are handled by a workqueue that runs only core 0.

Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
Acked-by: Adam Wallis <awallis@codeaurora.org>
Signed-off-by: Timur Tabi <timur@codeaurora.org>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---

Changes in v3:
 * Handle case where core0 is not online.

Changes in v2:
 * Checkpatch warning fixes.
 * Use of IS_ENABLED macros instead of ifdefs.

---
 drivers/tty/hvc/Kconfig   |  20 +++++
 drivers/tty/hvc/hvc_dcc.c | 161 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 8d60e0ff67b4..c0754a2e3fe4 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -87,6 +87,26 @@ config HVC_DCC
 	  driver. This console is used through a JTAG only on ARM. If you don't have
 	  a JTAG then you probably don't want this option.
 
+config HVC_DCC_SERIALIZE_SMP
+	bool "Use DCC only on core 0"
+	depends on SMP && HVC_DCC
+	help
+	  Some debuggers, such as Trace32 from Lauterbach GmbH, do not handle
+	  reads/writes from/to DCC on more than one core. Each core has its
+	  own DCC device registers, so when a core reads or writes from/to DCC,
+	  it only accesses its own DCC device. Since kernel code can run on
+	  any core, every time the kernel wants to write to the console, it
+	  might write to a different DCC.
+
+	  In SMP mode, Trace32 creates multiple windows, and each window shows
+	  the DCC output only from that core's DCC. The result is that console
+	  output is either lost or scattered across windows.
+
+	  Selecting this option will enable code that serializes all console
+	  input and output to core 0. The DCC driver will create input and
+	  output FIFOs that all cores will use. Reads and writes from/to DCC
+	  are handled by a workqueue that runs only core 0.
+
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
 	depends on RISCV_SBI_V01
diff --git a/drivers/tty/hvc/hvc_dcc.c b/drivers/tty/hvc/hvc_dcc.c
index 8e0edb7d93fd..24e3770219bc 100644
--- a/drivers/tty/hvc/hvc_dcc.c
+++ b/drivers/tty/hvc/hvc_dcc.c
@@ -2,9 +2,12 @@
 /* Copyright (c) 2010, 2014 The Linux Foundation. All rights reserved.  */
 
 #include <linux/console.h>
+#include <linux/cpumask.h>
 #include <linux/init.h>
+#include <linux/kfifo.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
+#include <linux/spinlock.h>
 
 #include <asm/dcc.h>
 #include <asm/processor.h>
@@ -67,26 +70,182 @@ static int hvc_dcc_get_chars(uint32_t vt, char *buf, int count)
 	return i;
 }
 
+/*
+ * Check if the DCC is enabled.  If CONFIG_HVC_DCC_SERIALIZE_SMP is enabled,
+ * then we assume then this function will be called first on core 0.  That
+ * way, dcc_core0_available will be true only if it's available on core 0.
+ */
 static bool hvc_dcc_check(void)
 {
 	unsigned long time = jiffies + (HZ / 10);
+	static bool dcc_core0_available;
+
+	/*
+	 * If we're not on core 0, but we previously confirmed that DCC is
+	 * active, then just return true.
+	 */
+	if (IS_ENABLED(CONFIG_HVC_DCC_SERIALIZE_SMP) && smp_processor_id() &&
+	    dcc_core0_available)
+		return true;
 
 	/* Write a test character to check if it is handled */
 	__dcc_putchar('\n');
 
 	while (time_is_after_jiffies(time)) {
-		if (!(__dcc_getstatus() & DCC_STATUS_TX))
+		if (!(__dcc_getstatus() & DCC_STATUS_TX)) {
+			if (IS_ENABLED(CONFIG_HVC_DCC_SERIALIZE_SMP))
+				dcc_core0_available = true;
 			return true;
+		}
 	}
 
 	return false;
 }
 
+#if defined(CONFIG_HVC_DCC_SERIALIZE_SMP)
+
+static void dcc_put_work_fn(struct work_struct *work);
+static void dcc_get_work_fn(struct work_struct *work);
+static DECLARE_WORK(dcc_pwork, dcc_put_work_fn);
+static DECLARE_WORK(dcc_gwork, dcc_get_work_fn);
+static DEFINE_SPINLOCK(dcc_lock);
+static DEFINE_KFIFO(inbuf, unsigned char, 128);
+static DEFINE_KFIFO(outbuf, unsigned char, 1024);
+
+/*
+ * Workqueue function that writes the output FIFO to the DCC on core 0.
+ */
+static void dcc_put_work_fn(struct work_struct *work)
+{
+	unsigned char ch;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&dcc_lock, irqflags);
+
+	/* While there's data in the output FIFO, write it to the DCC */
+	while (kfifo_get(&outbuf, &ch))
+		hvc_dcc_put_chars(0, &ch, 1);
+
+	/* While we're at it, check for any input characters */
+	while (!kfifo_is_full(&inbuf)) {
+		if (!hvc_dcc_get_chars(0, &ch, 1))
+			break;
+		kfifo_put(&inbuf, ch);
+	}
+
+	spin_unlock_irqrestore(&dcc_lock, irqflags);
+}
+
+/*
+ * Workqueue function that reads characters from DCC and puts them into the
+ * input FIFO.
+ */
+static void dcc_get_work_fn(struct work_struct *work)
+{
+	unsigned char ch;
+	unsigned long irqflags;
+
+	/*
+	 * Read characters from DCC and put them into the input FIFO, as
+	 * long as there is room and we have characters to read.
+	 */
+	spin_lock_irqsave(&dcc_lock, irqflags);
+
+	while (!kfifo_is_full(&inbuf)) {
+		if (!hvc_dcc_get_chars(0, &ch, 1))
+			break;
+		kfifo_put(&inbuf, ch);
+	}
+	spin_unlock_irqrestore(&dcc_lock, irqflags);
+}
+
+/*
+ * Write characters directly to the DCC if we're on core 0 and the FIFO
+ * is empty, or write them to the FIFO if we're not.
+ */
+static int hvc_dcc0_put_chars(u32 vt, const char *buf, int count)
+{
+	int len;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&dcc_lock, irqflags);
+	if (smp_processor_id() || (!kfifo_is_empty(&outbuf))) {
+		len = kfifo_in(&outbuf, buf, count);
+		spin_unlock_irqrestore(&dcc_lock, irqflags);
+
+		if (!cpu_online(0))
+			return 0;
+		/*
+		 * We just push data to the output FIFO, so schedule the
+		 * workqueue that will actually write that data to DCC.
+		 */
+		schedule_work_on(0, &dcc_pwork);
+		return len;
+	}
+
+	/*
+	 * If we're already on core 0, and the FIFO is empty, then just
+	 * write the data to DCC.
+	 */
+	len = hvc_dcc_put_chars(vt, buf, count);
+	spin_unlock_irqrestore(&dcc_lock, irqflags);
+
+	return len;
+}
+
+/*
+ * Read characters directly from the DCC if we're on core 0 and the FIFO
+ * is empty, or read them from the FIFO if we're not.
+ */
+static int hvc_dcc0_get_chars(u32 vt, char *buf, int count)
+{
+	int len;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&dcc_lock, irqflags);
+
+	if (smp_processor_id() || (!kfifo_is_empty(&inbuf))) {
+		len = kfifo_out(&inbuf, buf, count);
+		spin_unlock_irqrestore(&dcc_lock, irqflags);
+
+		if (!cpu_online(0))
+			return 0;
+		/*
+		 * If the FIFO was empty, there may be characters in the DCC
+		 * that we haven't read yet.  Schedule a workqueue to fill
+		 * the input FIFO, so that the next time this function is
+		 * called, we'll have data.
+		 */
+		if (!len)
+			schedule_work_on(0, &dcc_gwork);
+
+		return len;
+	}
+
+	/*
+	 * If we're already on core 0, and the FIFO is empty, then just
+	 * read the data from DCC.
+	 */
+	len = hvc_dcc_get_chars(vt, buf, count);
+	spin_unlock_irqrestore(&dcc_lock, irqflags);
+
+	return len;
+}
+
+static const struct hv_ops hvc_dcc_get_put_ops = {
+	.get_chars = hvc_dcc0_get_chars,
+	.put_chars = hvc_dcc0_put_chars,
+};
+
+#else
+
 static const struct hv_ops hvc_dcc_get_put_ops = {
 	.get_chars = hvc_dcc_get_chars,
 	.put_chars = hvc_dcc_put_chars,
 };
 
+#endif
+
 static int __init hvc_dcc_console_init(void)
 {
 	int ret;
-- 
2.33.1

