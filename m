Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2F5D2699
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 11:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387483AbfJJJqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 05:46:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39264 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJJqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 05:46:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8390C60E3F; Thu, 10 Oct 2019 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570700793;
        bh=p2wtO2z/vjKBDKn54RxXqXGB/OiyfNXhB+zD4PldS38=;
        h=From:To:Cc:Subject:Date:From;
        b=Kvik9GOB0HS8NF7ggxPEFUDNS21bx43whQedozaGpuCbIqUZ9GeYK5+hiayE7hncF
         rUlHLJT08LrANuhWOpyNUN4/OtJ8kdydm4U6M+TDvNtGU54HtnVDHdd17ODZUqW3F7
         s5F9F6+aj9J1hSw33b/hPJJhIogv5iUmwu3oxIYA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08C2760159;
        Thu, 10 Oct 2019 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570700792;
        bh=p2wtO2z/vjKBDKn54RxXqXGB/OiyfNXhB+zD4PldS38=;
        h=From:To:Cc:Subject:Date:From;
        b=MxJZ292UdwnTa+/jiXoaZCS5AwkKZUDtc4cWhCevTHYacoXIMj5H8gGHRi8MlxI/N
         zRlCcundOluJUQW+wUtfxmROo1kkRXUVOFl/dUBjEMRoFrZB9Mqt4RxU9tnX2BYoVP
         Vwj7mFTzY9C3kxANQF6ci2odwLWOyLPNjzSIrXiw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08C2760159
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
Date:   Thu, 10 Oct 2019 15:16:03 +0530
Message-Id: <1570700763-17319-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move ISR registration from startup to probe function to avoid registering
it everytime when the port open is called for driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 14c6306..5180cd8 100644
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
@@ -1297,11 +1291,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
+	scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
+		(uart_console(uport) ? "console" : "uart"), uport->line);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 	uport->irq = irq;
 
+	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
+			IRQF_TRIGGER_HIGH, port->name, uport);
+	if (ret) {
+		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
+		return ret;
+	}
+
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

