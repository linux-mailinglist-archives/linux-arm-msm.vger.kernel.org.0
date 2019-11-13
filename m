Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2681DFAECF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 11:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKMKtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 05:49:13 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56284 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfKMKtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 05:49:12 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6C86960592; Wed, 13 Nov 2019 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573642151;
        bh=bXxQtYvurhAVLIzAS+o22RaXGTA/pMMVi2RYqvEjxcw=;
        h=From:To:Cc:Subject:Date:From;
        b=CBsSAS9MUoGFqg0z6augI8jCg/omhhM2aqoSxaKmJ8XkgzxL2CnH8VeYJ76Toi7E9
         tN1PTS1358P+16q8736uVPdJZ0iq5vVMTtWgxYWSDjjMHnS/QxNcbGj4SqaQpMKEbn
         +yMgQbnJ8FUZgA6IqQGCjALYZ2Ts4tdM7H6K2SrU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DE1A606AC;
        Wed, 13 Nov 2019 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573642150;
        bh=bXxQtYvurhAVLIzAS+o22RaXGTA/pMMVi2RYqvEjxcw=;
        h=From:To:Cc:Subject:Date:From;
        b=a8mmcVgWkAvhDJ/KUdmK/4SSL5qL1qgblUolseJqTjwsZZtv/d2qhpe1RG8ijvcnO
         IV0Frjq7HEqQTP75/72ZkNQ8Q/7N5KeFVJ8HMe/jbxDvkXv3vqZqAtk06KC/PNGyQF
         EFMqH9dFhzQIgGTMcIl2EeyiobtdLWCoh2BxhY3E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2DE1A606AC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org,
        msavaliy@codeaurora.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v5 2/3] tty: serial: qcom_geni_serial: Wakeup over UART RX
Date:   Wed, 13 Nov 2019 16:18:56 +0530
Message-Id: <1573642136-30488-1-git-send-email-akashast@codeaurora.org>
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
Changes in V5:
 - No change.

Changes in V4:
 - As per Greg's comment, removed extra dev_err logging.
 - As per Stephen's comment, using common code that manage wakeirq irqs for
   devices. Using dev_pm_set_dedicated_wake_irq API that will take care of
   requesting and attaching wakeup irqs for devices. Also, it sets wakeirq
   status to WAKE_IRQ_DEDICATED_ALLOCATED as a result enabling/disabling of
   wake irq will be managed by suspend/resume framework so, removed the code
   for enabling and disabling of wake irq from the driver.

Changes in V3:
 - As per Stephen's comment, using platform_get_irq_optional API to get wakeup
   IRQ for device.

Changes in V2:
 - As per Stephen's comment, splitted V1 patch into 2 seperate patch.
   a) Clean up of core IRQ registration b) Add wakeup feature.

 drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 634054a..56dad67 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,6 +14,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
@@ -116,6 +118,7 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
+	int wakeup_irq;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1302,6 +1305,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return irq;
 	uport->irq = irq;
 
+	if (!console)
+		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
@@ -1321,6 +1327,23 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (port->wakeup_irq > 0) {
+		/*
+		 * Set pm_runtime status as ACTIVE so that wakeup_irq gets
+		 * enabled/disabled from dev_pm_arm_wake_irq  during  system
+		 * suspend/resume respectively.
+		 */
+		pm_runtime_set_active(&pdev->dev);
+		device_init_wakeup(&pdev->dev, true);
+		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
+						port->wakeup_irq);
+		if (ret) {
+			device_init_wakeup(&pdev->dev, false);
+			uart_remove_one_port(drv, uport);
+			return ret;
+		}
+	}
+
 	return ret;
 }
 
@@ -1330,6 +1353,10 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct uart_driver *drv = port->uport.private_data;
 
 	uart_remove_one_port(drv, &port->uport);
+
+	device_init_wakeup(&pdev->dev, false);
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

