Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F79A1073F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 15:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfKVOSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 09:18:10 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:52540
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfKVOSK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 09:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574432289;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=I/atPG93tK42zBPgLSecpSBKlCIfLw7bC526e3EtDmo=;
        b=Mp3S4Os6omTigo5tp2c03JKIvaqI2PQrZHGSoW5IZ9TIjxkIE8HgV0DFcsjvxxIA
        h/IUFyCLKOys1omOXxiaKZuw3KQ+m8xhngiQrVaZdZHU2V5F5/d6/3ChVTicJrJVZl2
        KXnPFYd3UXMwgijgiB84nRr8/2Rtv1QSAqyGcqWY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574432289;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=I/atPG93tK42zBPgLSecpSBKlCIfLw7bC526e3EtDmo=;
        b=fo1raQ4/zXkIn7TSGZj9Pm72QIu1r8XdGIhOOdvpT3FzNli3RLaDTVyDirT7CxOV
        ++edrlhkFc81lg07T7c9+eFIZ3VZoKaXCxQiLg8JgzalbOK908S79n7VxCSHfs+h3yU
        6lJ3zHFvTsL2sxa6O0n+4wZzDENFs48TB8UWX+C8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5ADCC447B9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v6 2/5] Revert "tty: serial: qcom_geni_serial: IRQ cleanup"
Date:   Fri, 22 Nov 2019 14:18:08 +0000
Message-ID: <0101016e937a3077-0e4686f8-fad9-4592-b428-17be97b39fed-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 3e4aaea7a0391d47f6ffff1f10594c658a67c881.

To apply v6 patches cleanly on tty-next branch, revert v2 patches.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 5180cd8..14c6306 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -9,7 +9,6 @@
 #include <linux/console.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -831,7 +830,7 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 	if (uart_console(uport))
 		console_stop(uport->cons);
 
-	disable_irq(uport->irq);
+	free_irq(uport->irq, uport);
 	spin_lock_irqsave(&uport->lock, flags);
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
@@ -891,14 +890,21 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	int ret;
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 
+	scnprintf(port->name, sizeof(port->name),
+		  "qcom_serial_%s%d",
+		(uart_console(uport) ? "console" : "uart"), uport->line);
+
 	if (!port->setup) {
 		ret = qcom_geni_serial_port_setup(uport);
 		if (ret)
 			return ret;
 	}
-	enable_irq(uport->irq);
 
-	return 0;
+	ret = request_irq(uport->irq, qcom_geni_serial_isr, IRQF_TRIGGER_HIGH,
+							port->name, uport);
+	if (ret)
+		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
+	return ret;
 }
 
 static unsigned long get_clk_cfg(unsigned long clk_freq)
@@ -1291,21 +1297,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
-	scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
-		(uart_console(uport) ? "console" : "uart"), uport->line);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 	uport->irq = irq;
 
-	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
-			IRQF_TRIGGER_HIGH, port->name, uport);
-	if (ret) {
-		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		return ret;
-	}
-
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

