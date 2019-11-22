Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8531073F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 15:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKVOSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 09:18:06 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:41034
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfKVOSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 09:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574432285;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=60m7qadNAvfOutaquUIdmy4f8rhoSqd0rh/FZoSSQNw=;
        b=crmR2cyzdaM2HyeXI2rMqYEDvepHWfLO599cmTOHXChBWyX4B3g7W8Ow+AESPPIL
        BUS5lnEhX8GnjlXwYfdnE5efsMK41QvJjQ+noqo+cr0C5cg/A0q4olsr10CboyYJKqn
        ZwYnsDRoQo2OT5RyqLY9Ag+ISzb7Tyk+RAVyA7LM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574432285;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=60m7qadNAvfOutaquUIdmy4f8rhoSqd0rh/FZoSSQNw=;
        b=KiX1SXYincp337wHwnTxDM6cFfX0lYL8VCxTSTCWZazdhs0VjaP9NmwIneiq1Fgp
        qgS2RXZFufzg+4DJHyIKGia1SoxB9rxiASfl3OQr/BL/1GjpLwbvKDKK8+nAcCmexee
        1f0tQc282gwQF9LA+jMaEXXEeNrVJ/MZS5J76hn0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F0A0C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v6 1/5] Revert "tty: serial: qcom_geni_serial: Wakeup over UART RX"
Date:   Fri, 22 Nov 2019 14:18:05 +0000
Message-ID: <0101016e937a2126-089ac422-902f-418a-b8c3-b022122c847a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 8b7103f31950443fd5727d7d80d3c65416b5a390.

To apply v6 patches cleanly on tty-next, revert v2 patches.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 44 +----------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index ff63728..5180cd8 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,7 +14,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeirq.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
@@ -117,7 +116,6 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
-	int wakeup_irq;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -757,15 +755,6 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
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
@@ -1317,29 +1306,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
-		}
-	}
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
@@ -1362,12 +1328,7 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
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
@@ -1375,9 +1336,6 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	if (port->wakeup_irq > 0)
-		disable_irq(port->wakeup_irq);
-
 	return uart_resume_port(uport->private_data, uport);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

