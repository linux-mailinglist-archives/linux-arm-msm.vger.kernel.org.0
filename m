Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1985DD6F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 08:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfJOGMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 02:12:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38380 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfJOGMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 02:12:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7C04160B7A; Tue, 15 Oct 2019 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571119921;
        bh=AmviZLY1yO1BoNAicdI+IEyxLpIEuPt8OV83BGe+L6I=;
        h=From:To:Cc:Subject:Date:From;
        b=GAWQEMMdimtV9dsi3uYiJg0tNffz07Mz+nEZX+H1VxUyCpiVeaFNcyyXh6TjEatfa
         8KAVOSwi4Gael+xRSxvI6dF7/qpbBu9r6hsPedZaxPMNAuPTpSGWOw78VaMv+JnXrv
         r+CuJTbnI4L6dfvU2nwoiR2lTRFuxhCQF+ws+gS8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A225D607EF;
        Tue, 15 Oct 2019 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571119920;
        bh=AmviZLY1yO1BoNAicdI+IEyxLpIEuPt8OV83BGe+L6I=;
        h=From:To:Cc:Subject:Date:From;
        b=I70IZCx+ehUk5nsiRkkOwFO8YoOOYkMOvpLdtUaO+U5ghHNXclcnvGCcdPwaFiS99
         NRxT70CQoYZFtEB9cmf/s1Kg+9IXiUXfYi4BAYiK5zmr428vki7jof8E+opV61WMKQ
         F8H0WgB4kgU6tW9rISuLCEgFqlOY4eczmBWShZ9I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A225D607EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, msavaliy@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v3 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
Date:   Tue, 15 Oct 2019 11:41:42 +0530
Message-Id: <1571119902-14169-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add system wakeup capability over UART RX line for wakeup capable UART.
When system is suspended, RX line act as an interrupt to wakeup system
for any communication requests from peer.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V3:
 - Address review comments on v2 patch.

 drivers/tty/serial/qcom_geni_serial.c | 44 ++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 12dc007..bc828e49 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
@@ -116,6 +117,7 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
+	int wakeup_irq;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -755,6 +757,15 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		uart_write_wakeup(uport);
 }
 
+static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
+{
+	struct uart_port *uport = dev;
+
+	pm_wakeup_event(uport->dev, 2000);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 {
 	u32 m_irq_en;
@@ -1310,6 +1321,29 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (!console) {
+		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+		if (port->wakeup_irq < 0) {
+			dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
+					port->wakeup_irq);
+		} else {
+			irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
+			ret = devm_request_irq(uport->dev, port->wakeup_irq,
+				qcom_geni_serial_wakeup_isr,
+				IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
+			if (ret) {
+				dev_err(uport->dev, "Failed to register wakeup IRQ ret %d\n",
+						ret);
+				return ret;
+			}
+
+			device_init_wakeup(&pdev->dev, true);
+			ret = dev_pm_set_wake_irq(&pdev->dev, port->wakeup_irq);
+			if (unlikely(ret))
+				dev_err(uport->dev, "%s:Failed to set IRQ wake:%d\n",
+						__func__, ret);
+		}
+	}
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
@@ -1332,7 +1366,12 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
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
@@ -1340,6 +1379,9 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
+	if (port->wakeup_irq > 0)
+		disable_irq(port->wakeup_irq);
+
 	return uart_resume_port(uport->private_data, uport);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

