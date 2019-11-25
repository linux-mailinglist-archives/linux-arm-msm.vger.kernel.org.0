Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704A81090C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 16:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbfKYPIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 10:08:53 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:37474
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727758AbfKYPIx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 10:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574694531;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=/dSXuCaP6WI6gJbxtmgpKXS4hnGTswhDndhBpiGjwUs=;
        b=BU/TKj9PNhbM16rnlcIqR0c5qymQ7igLZ9FEaoslnndyG7hVJPgJXMvSvka6Urzw
        p1BmWLwgV2MVhY4nv/0YtsQ2K2rar2jp8QWF9QEYFKaQFxVza5UgnvQnogzQDh3CRgi
        vLQ9zkOJ3T0BlELlcvI6SIyC+KXZwk6zuwolGOdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574694531;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=/dSXuCaP6WI6gJbxtmgpKXS4hnGTswhDndhBpiGjwUs=;
        b=QXxGfEHU8QfIqcwpAENtJMeA693twAsbfGOIqf/Tks7VR8sOiscibH08xKQXrx6K
        DJL4SpOGLMnPpg92epocuVC/scE8GP1FE/RrURE4dwvakD+U4fFoc8p7iL58L9H/tWA
        EbcnynWnfcYUIQHiG+TdvcHD4UHvR6e8d8wnaOTY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25B9AC447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 1/2] tty: serial: qcom_geni_serial: Wakeup IRQ cleanup
Date:   Mon, 25 Nov 2019 15:08:51 +0000
Message-ID: <0101016ea31bb2d5-474d1ad1-2b52-455f-b77b-71fb2dd5fe4e-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574694511-31479-1-git-send-email-akashast@codeaurora.org>
References: <1574694511-31479-1-git-send-email-akashast@codeaurora.org>
X-SES-Outgoing: 2019.11.25-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch is the continuation of below mentioned commits which adds wakeup
feature over the UART RX line.
1)commit 3e4aaea7a039 ("tty: serial: qcom_geni_serial: IRQ cleanup")[v2]
2)commit 8b7103f31950 ("tty: serial: qcom_geni_serial: Wakeup over UART
  RX")[v2]

The following cleanup is done based on upstream comment received on
subsequent versions of the above-mentioned commits to simplifying the code.
 - Use devm_kasprintf API in place of scnprintf.
 - Use dev_pm_set_dedicated_wake_irq API that will take care of
   requesting and attaching wakeup irqs for devices. Also, it sets wakeirq
   status to WAKE_IRQ_DEDICATED_ALLOCATED as a result enabling/disabling of
   wake irq will be managed by suspend/resume framework. We can remove the
   code for enabling and disabling of wake irq from the this driver.
 - Use platform_get_irq_optional API to get optional wakeup IRQ for
   device.
 - Move ISR registration later in probe after uart port gets register with
   serial core.

Patch link:
 - https://patchwork.kernel.org/patch/11189717/ (v3)
 - https://patchwork.kernel.org/patch/11227435/ (v4)
 - https://patchwork.kernel.org/patch/11241669/ (v5)
 - https://patchwork.kernel.org/patch/11258045/ (v6)

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 91 +++++++++++++++++------------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index ff63728..55b1d8b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/serial.h>
@@ -103,7 +104,7 @@
 struct qcom_geni_serial_port {
 	struct uart_port uport;
 	struct geni_se se;
-	char name[20];
+	const char *name;
 	u32 tx_fifo_depth;
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
@@ -757,15 +758,6 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		uart_write_wakeup(uport);
 }
 
-static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
-{
-	struct uart_port *uport = dev;
-
-	pm_wakeup_event(uport->dev, 2000);
-
-	return IRQ_HANDLED;
-}
-
 static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 {
 	u32 m_irq_en;
@@ -1302,50 +1294,58 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
-	scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
-		(uart_console(uport) ? "console" : "uart"), uport->line);
+	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
+			"qcom_geni_serial_%s%d",
+			uart_console(uport) ? "console" : "uart", uport->line);
+	if (!port->name)
+		return -ENOMEM;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 	uport->irq = irq;
 
+	if (!console)
+		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+
+	uport->private_data = drv;
+	platform_set_drvdata(pdev, port);
+	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
+	if (!console)
+		device_create_file(uport->dev, &dev_attr_loopback);
+
+	ret = uart_add_one_port(drv, uport);
+	if (ret)
+		return ret;
+
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
+		uart_remove_one_port(drv, uport);
 		return ret;
 	}
 
-	if (!console) {
-		port->wakeup_irq = platform_get_irq(pdev, 1);
-		if (port->wakeup_irq < 0) {
-			dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
-					port->wakeup_irq);
-		} else {
-			irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
-			ret = devm_request_irq(uport->dev, port->wakeup_irq,
-				qcom_geni_serial_wakeup_isr,
-				IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
-			if (ret) {
-				dev_err(uport->dev, "Failed to register wakeup IRQ ret %d\n",
-						ret);
-				return ret;
-			}
-
-			device_init_wakeup(&pdev->dev, true);
-			ret = dev_pm_set_wake_irq(&pdev->dev, port->wakeup_irq);
-			if (unlikely(ret))
-				dev_err(uport->dev, "%s:Failed to set IRQ wake:%d\n",
-						__func__, ret);
+	/*
+	 * Set pm_runtime status as ACTIVE so that wakeup_irq gets
+	 * enabled/disabled from dev_pm_arm_wake_irq during system
+	 * suspend/resume respectively.
+	 */
+	pm_runtime_set_active(&pdev->dev);
+
+	if (port->wakeup_irq > 0) {
+		device_init_wakeup(&pdev->dev, true);
+		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
+						port->wakeup_irq);
+		if (ret) {
+			device_init_wakeup(&pdev->dev, false);
+			uart_remove_one_port(drv, uport);
+			return ret;
 		}
 	}
-	uport->private_data = drv;
-	platform_set_drvdata(pdev, port);
-	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-	if (!console)
-		device_create_file(uport->dev, &dev_attr_loopback);
-	return uart_add_one_port(drv, uport);
+
+	return 0;
 }
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1353,7 +1353,10 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->uport.private_data;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
+
 	return 0;
 }
 
@@ -1362,12 +1365,7 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	uart_suspend_port(uport->private_data, uport);
-
-	if (port->wakeup_irq > 0)
-		enable_irq(port->wakeup_irq);
-
-	return 0;
+	return uart_suspend_port(uport->private_data, uport);
 }
 
 static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
@@ -1375,9 +1373,6 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	if (port->wakeup_irq > 0)
-		disable_irq(port->wakeup_irq);
-
 	return uart_resume_port(uport->private_data, uport);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

