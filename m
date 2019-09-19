Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A1BB73DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 09:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfISHQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 03:16:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:32814 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbfISHQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 03:16:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 666B6611FA; Thu, 19 Sep 2019 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568877404;
        bh=JQFYoyaucG2ekfkOC+K2lUvFy2Dt5IjOp18MuT/FXpU=;
        h=From:To:Cc:Subject:Date:From;
        b=QvR5NE7LmYhesJ4MhM/hqv2GpBl4bXbhGKxTuFXcUIzh3rwuo/4AJIzUrx3RwJaBH
         0XH4map/kbHPtcug11jxFJY5VFkhHBC7GJ/1oCN4mlP83+GvZudIW4G3mathReJQRl
         Nwy+sg7e5C1wVAghJA08iTPBCLPy9MrvAxvRNxhc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65DFD602F0;
        Thu, 19 Sep 2019 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568877403;
        bh=JQFYoyaucG2ekfkOC+K2lUvFy2Dt5IjOp18MuT/FXpU=;
        h=From:To:Cc:Subject:Date:From;
        b=OXiEGMl5BmhPi1+W+BXFhB74wyPL/3fJrGgAGs6Ff4WpCEC/C9I9UsUfMIgN9/F4V
         8iXMoUfRpkXaY0upk18SpnvvB24hc1oGJZ5wDYnQ4hpJ+gWLwpdY6y9lp1Le+jsXAz
         03otDG0F4gGiCi4QW/RcDvliHQaHXSrrseCMUDgA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65DFD602F0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     agross@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     mgautam@codeaurora.org, jslaby@suse.com,
        bjorn.andersson@linaro.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH] tty: serial: qcom_geni_serial: Wakeup over UART RX
Date:   Thu, 19 Sep 2019 12:46:06 +0530
Message-Id: <1568877366-1758-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add system wakeup capability over UART RX line for wakeup capable UART.
When system is suspended, RX line act as an interrupt to wakeup system
for any communication requests from peer.

Cleanup of IRQ registration, moving it to probe from startup function.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 73 +++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 35e5f9c..43d1da4 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -19,6 +19,8 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/irq.h>
 
 /* UART specific GENI registers */
 #define SE_UART_LOOPBACK_CFG		0x22c
@@ -98,6 +100,8 @@
 #define CONSOLE_RX_BYTES_PW 4
 #endif
 
+#define WAKEUP_EVENT_MSEC   2000
+
 struct qcom_geni_serial_port {
 	struct uart_port uport;
 	struct geni_se se;
@@ -115,6 +119,7 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
+	int wakeup_irq;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -756,6 +761,15 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		uart_write_wakeup(uport);
 }
 
+static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
+{
+	struct uart_port *uport = dev;
+
+	pm_wakeup_event(uport->dev, WAKEUP_EVENT_MSEC);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 {
 	u32 m_irq_en;
@@ -832,7 +846,7 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 	if (uart_console(uport))
 		console_stop(uport->cons);
 
-	free_irq(uport->irq, uport);
+	disable_irq(uport->irq);
 	spin_lock_irqsave(&uport->lock, flags);
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
@@ -892,21 +906,14 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	int ret;
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 
-	scnprintf(port->name, sizeof(port->name),
-		  "qcom_serial_%s%d",
-		(uart_console(uport) ? "console" : "uart"), uport->line);
-
 	if (!port->setup) {
 		ret = qcom_geni_serial_port_setup(uport);
 		if (ret)
 			return ret;
 	}
+	enable_irq(uport->irq);
 
-	ret = request_irq(uport->irq, qcom_geni_serial_isr, IRQF_TRIGGER_HIGH,
-							port->name, uport);
-	if (ret)
-		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-	return ret;
+	return 0;
 }
 
 static unsigned long get_clk_cfg(unsigned long clk_freq)
@@ -1290,6 +1297,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
+	scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
+		(uart_console(uport) ? "console" : "uart"), uport->line);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "Failed to get IRQ %d\n", irq);
@@ -1297,6 +1306,39 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	}
 	uport->irq = irq;
 
+	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
+				IRQF_TRIGGER_HIGH, port->name, uport);
+	if (ret) {
+		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
+		return ret;
+	}
+
+	if (!console) {
+		port->wakeup_irq = platform_get_irq(pdev, 1);
+		if (port->wakeup_irq < 0) {
+			dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
+							port->wakeup_irq);
+		} else {
+			dev_info(&pdev->dev, "wakeup_irq =%d\n",
+				port->wakeup_irq);
+			irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
+			ret = devm_request_irq(uport->dev, port->wakeup_irq,
+				qcom_geni_serial_wakeup_isr,
+				IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
+			if (ret) {
+				dev_err(uport->dev, "Failed to register wakeup "
+					"IRQ ret %d\n", ret);
+				return ret;
+			}
+
+			device_init_wakeup(&pdev->dev, true);
+			ret = enable_irq_wake(port->wakeup_irq);
+			if (unlikely(ret))
+				dev_err(uport->dev, "%s:Failed to set IRQ "
+					"wake:%d\n", __func__, ret);
+		}
+	}
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
@@ -1311,6 +1353,7 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct uart_driver *drv = port->uport.private_data;
 
 	uart_remove_one_port(drv, &port->uport);
+
 	return 0;
 }
 
@@ -1319,7 +1362,12 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	return uart_suspend_port(uport->private_data, uport);
+	uart_suspend_port(uport->private_data, uport);
+
+	if (port->wakeup_irq > 0)
+		enable_irq(port->wakeup_irq);
+
+	return 0;
 }
 
 static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
@@ -1327,6 +1375,9 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
+	if (port->wakeup_irq > 0)
+		disable_irq(port->wakeup_irq);
+
 	return uart_resume_port(uport->private_data, uport);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

