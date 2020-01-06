Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03A31313FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 15:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgAFOqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 09:46:15 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:14166 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726303AbgAFOqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 09:46:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578321975; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A3hBI0OKb+/8Qr9SLPtCgNy19KR7Y5raIsHNdjSJdm8=; b=PrdZjPzSSxYUNrh53aX3rQrmdqRiyObAz2GNSNA6AGD9jQ8PR9HGXA4vEVvxvQC5NOPbWUUd
 mgRonOr7z6VebPuJHUDsd07CzITQiM5doKp8fvAGoBXHdNeaOJ7So0fcb4aAxKvbCKppCkEQ
 3JMrhrmXAJY4rgmWB0urHrSHQDw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e13482b.7f267695e378-smtp-out-n03;
 Mon, 06 Jan 2020 14:46:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A356FC433CB; Mon,  6 Jan 2020 14:46:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57EF4C433A2;
        Mon,  6 Jan 2020 14:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57EF4C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V8 2/2] tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP
Date:   Mon,  6 Jan 2020 20:15:05 +0530
Message-Id: <1578321905-25843-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578321905-25843-1-git-send-email-akashast@codeaurora.org>
References: <1578321905-25843-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove code from the driver that create and maintain loopback sysfs node.
Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
loopback mode.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++--------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 1e16483..191abb1 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -89,7 +89,11 @@
 #define DEF_TX_WM		2
 #define DEF_FIFO_WIDTH_BITS	32
 #define UART_RX_WM		2
-#define MAX_LOOPBACK_CFG	3
+
+/* SE_UART_LOOPBACK_CFG */
+#define RX_TX_SORTED	BIT(0)
+#define CTS_RTS_SORTED	BIT(1)
+#define RX_TX_CTS_RTS_SORTED	(RX_TX_SORTED | CTS_RTS_SORTED)
 
 #ifdef CONFIG_CONSOLE_POLL
 #define CONSOLE_RX_BYTES_PW 1
@@ -161,30 +165,6 @@ static struct qcom_geni_serial_port qcom_geni_uart_ports[GENI_UART_PORTS] = {
 	},
 };
 
-static ssize_t loopback_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-
-	return snprintf(buf, sizeof(u32), "%d\n", port->loopback);
-}
-
-static ssize_t loopback_store(struct device *dev,
-				struct device_attribute *attr, const char *buf,
-				size_t size)
-{
-	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	u32 loopback;
-
-	if (kstrtoint(buf, 0, &loopback) || loopback > MAX_LOOPBACK_CFG) {
-		dev_err(dev, "Invalid input\n");
-		return -EINVAL;
-	}
-	port->loopback = loopback;
-	return size;
-}
-static DEVICE_ATTR_RW(loopback);
-
 static struct qcom_geni_serial_port qcom_geni_console_port = {
 	.uport = {
 		.iotype = UPIO_MEM,
@@ -234,10 +214,14 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 							unsigned int mctrl)
 {
 	u32 uart_manual_rfr = 0;
+	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 
 	if (uart_console(uport))
 		return;
 
+	if (mctrl & TIOCM_LOOP)
+		port->loopback = RX_TX_CTS_RTS_SORTED;
+
 	if (!(mctrl & TIOCM_RTS))
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
@@ -1308,8 +1292,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-	if (!console)
-		device_create_file(uport->dev, &dev_attr_loopback);
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
