Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622061073F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 15:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfKVOSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 09:18:13 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:54320
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfKVOSN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 09:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574432292;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=uOuubZHBpGnPO3AHLT4+1988UXqM0gfUql5XfHl/kuk=;
        b=FRIHJBbA2uTBwCUjelahxVYwFxCQvqWadKrr5wjIdpMX1n/G5BhMFz+dmnc41k1c
        qvPlnuEzE403tq+jCbVE0ESCTCwCn6ppt64zswTZV1Bo9Ncu/02fF1iVVmrqIIbXpk+
        B/TROHRTRRz1MSYLmp86H2qsBVcgyAv9+9s2EstU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574432292;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=uOuubZHBpGnPO3AHLT4+1988UXqM0gfUql5XfHl/kuk=;
        b=BcqVrbO+0mAgF3aE/+Tkb3iIT8EGgMXba5Fo/ZC6oaADMuyZ2hToeALyHu2Nh4id
        dDqb0ImL8B/X+XtHRz6gYM3zNdLVknw3W/RWYspDkf9QqpnaYUJQUczCuBIa7gnPqb8
        GO+zHZ2gPCICbK0DZjaaSX0u8QbXZQD/SdP1tRHU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A47BEC76F43
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v6 3/5] tty: serial: qcom_geni_serial: IRQ cleanup
Date:   Fri, 22 Nov 2019 14:18:12 +0000
Message-ID: <0101016e937a3e05-f74c5c73-a964-45f2-ae71-6daed292e8ee-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move ISR registration from startup to probe function to avoid registering
it everytime when the port open is called for driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in v6:
 - Rebased on tty-next branch

Changes in v5:
 - No change.

Changes in v4:
 - As per Stephen's comment, move ISR registration(later in probe) after
   registering uart port with serial core.
 - As per Greg's comment, corrected returning of PTR value from integer type
   function(probe).

Changes in v3:
 - As per Stephen's comment, using devm_kasprintf instead of scnprintf API.

 drivers/tty/serial/qcom_geni_serial.c | 38 ++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 14c6306..634054a 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -9,6 +9,7 @@
 #include <linux/console.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -101,7 +102,7 @@
 struct qcom_geni_serial_port {
 	struct uart_port uport;
 	struct geni_se se;
-	char name[20];
+	const char *name;
 	u32 tx_fifo_depth;
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
@@ -830,7 +831,7 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 	if (uart_console(uport))
 		console_stop(uport->cons);
 
-	free_irq(uport->irq, uport);
+	disable_irq(uport->irq);
 	spin_lock_irqsave(&uport->lock, flags);
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
@@ -890,21 +891,14 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
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
@@ -1297,6 +1291,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
+	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
+			"qcom_geni_serial_%s%d",
+			uart_console(uport) ? "console" : "uart", uport->line);
+	if (!port->name)
+		return -ENOMEM;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
 	if (!console)
 		device_create_file(uport->dev, &dev_attr_loopback);
-	return uart_add_one_port(drv, uport);
+
+	ret = uart_add_one_port(drv, uport);
+	if (ret)
+		return ret;
+
+	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
+			IRQF_TRIGGER_HIGH, port->name, uport);
+	if (ret) {
+		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
+		uart_remove_one_port(drv, uport);
+		return ret;
+	}
+
+	return ret;
 }
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

