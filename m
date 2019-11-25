Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 573551090C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 16:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfKYPI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 10:08:58 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:54598
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727758AbfKYPI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 10:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574694537;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=lZkv0WaliIVRy2qcSu5uhvCCM679HwJ6HZKoHTh8rJQ=;
        b=UiB5prAgZdUANA1veVeGBDeGgtZoUJ/795oZ4KrlZ3TU3ddMjMS7PJjupwzR7ATP
        7j6UK8buMwK6y4Z3vNyfGSCw2Ce4BP79ASsnpZC2ptxhmZa87o5puwxm2VKS1tWhsId
        UOy4kHtXY26Xc+NtxxyWd/X8GWFLxVhc4F4BclvE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574694537;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=lZkv0WaliIVRy2qcSu5uhvCCM679HwJ6HZKoHTh8rJQ=;
        b=HElbUGedkm8qw2IgV4qse8z7nEMArHFgRGbyzH5J8oGzZie7Mq2IkFPXFW8FRpxn
        SFfjW/wM4zfy9t5gDej4c5VKvMumA6nzeGVvGDhM+s10bs9y4Wi7Hd690Z2g8bpxPqK
        UE4T38s/VPzZSIzCBwDU2djR/X5D3Wok43MnHRn8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95F68C447AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 2/2] tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP
Date:   Mon, 25 Nov 2019 15:08:57 +0000
Message-ID: <0101016ea31bc929-7270e21a-b57c-4af4-b5cc-dc67da1d6146-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574694511-31479-1-git-send-email-akashast@codeaurora.org>
References: <1574694511-31479-1-git-send-email-akashast@codeaurora.org>
X-SES-Outgoing: 2019.11.25-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
index 55b1d8b..997b262 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -93,7 +93,11 @@
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
@@ -165,30 +169,6 @@ static struct qcom_geni_serial_port qcom_geni_uart_ports[GENI_UART_PORTS] = {
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
@@ -238,10 +218,14 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
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
@@ -1311,8 +1295,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-	if (!console)
-		device_create_file(uport->dev, &dev_attr_loopback);
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

