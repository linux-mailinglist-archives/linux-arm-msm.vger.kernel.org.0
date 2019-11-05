Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A40FDEFA3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 10:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730592AbfKEJ53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 04:57:29 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35416 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfKEJ53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 04:57:29 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 487D361013; Tue,  5 Nov 2019 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572947848;
        bh=YywqzKJujqDiFHMKUB3TrHS9g6DWHrxa4K22IEnPbuE=;
        h=From:To:Cc:Subject:Date:From;
        b=ByKw6+Z9Jy/TjjYOWmYpBu/6Ya8TXTz3dkuB9XK5YaITuOTgYNvYGrXzc+xRgi/70
         52mxjBWMmHb8MWMckly2iZS/nmK7FYn27QsT5Fr5SKDWipvbCWxV6R8DgvlKmrrs51
         FzMwsYdEZvzCZBLumFoJXD7/ZB1R6OTS2mTrAuHI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C00A61013;
        Tue,  5 Nov 2019 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572947847;
        bh=YywqzKJujqDiFHMKUB3TrHS9g6DWHrxa4K22IEnPbuE=;
        h=From:To:Cc:Subject:Date:From;
        b=hpBZCwxGXuz6Iv9R7Qe3yIia9O+uGcY3pf38NRkmdQo60TJSkyrj/0BQ/0XfoF5QD
         M0W8YMbEl8lvnxyqAkPakNKlI7hNzNdc9iIwS03cgt0pvjhhcKig/f3dwhM1fwpnXI
         PFiSiNIszPIWNWJ3aEi+/ZdYYuYuCW+r5QUT2ODQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C00A61013
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v4 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
Date:   Tue,  5 Nov 2019 15:27:15 +0530
Message-Id: <1572947835-30600-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move ISR registration from startup to probe function to avoid registering
it everytime when the port open is called for driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
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

