Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269C41313FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 15:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAFOqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 09:46:03 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:14166 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726303AbgAFOqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 09:46:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578321962; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=UZugwEM060lVoHINU/qT3Y/dPJu2R5ZriQ3NotXZNBo=; b=ZonajgBjaTnGzNyNJLFyZXxeBoOIG+FRzoMIGjrz+Gl93D7hJs6mqNW+RoSd/DWDUUUdseM/
 MyphO95qQNgvjxt3EjyBK8GZGws+9/SJZhTZCXKgJxjsuWIz90Fte2fda93XnwmNYC6GKIOj
 RvFP5AknhorEdCcNicRH2K/A+MQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e13481c.7f42fdca71b8-smtp-out-n03;
 Mon, 06 Jan 2020 14:45:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5FD9C447AA; Mon,  6 Jan 2020 14:45:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04051C447A3;
        Mon,  6 Jan 2020 14:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04051C447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V8 1/2] tty: serial: qcom_geni_serial: Wakeup IRQ cleanup
Date:   Mon,  6 Jan 2020 20:15:04 +0530
Message-Id: <1578321905-25843-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578321905-25843-1-git-send-email-akashast@codeaurora.org>
References: <1578321905-25843-1-git-send-email-akashast@codeaurora.org>
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
index c41c766..1e16483 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/serial.h>
@@ -99,7 +100,7 @@
 struct qcom_geni_serial_port {
 	struct uart_port uport;
 	struct geni_se se;
-	char name[20];
+	const char *name;
 	u32 tx_fifo_depth;
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
@@ -753,15 +754,6 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
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
@@ -1298,51 +1290,59 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
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
@@ -1350,7 +1350,10 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->uport.private_data;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
+
 	return 0;
 }
 
@@ -1359,12 +1362,7 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
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
@@ -1372,9 +1370,6 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	if (port->wakeup_irq > 0)
-		disable_irq(port->wakeup_irq);
-
 	return uart_resume_port(uport->private_data, uport);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
