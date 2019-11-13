Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C61FAEDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfKMKtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 05:49:35 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56584 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfKMKte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 05:49:34 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BD77A6076A; Wed, 13 Nov 2019 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573642173;
        bh=DPkyfJIDRwVR+l7oKURkDUeN4K8w4CWQB6yMzGzfDhw=;
        h=From:To:Cc:Subject:Date:From;
        b=mi2TqSYxnjlNmEtXP+yKAaOamZ9jckUymRv/DsgWrcNX/7QdcYDGTF+pUK2Zsexyj
         u988BQaLDnxWTCNyUs5Hm5Wr+EV26MUUQMKpqlGGHI3XuTnbBDEPk0WagyZXkxW1sK
         cfZ0mrVxiJgL8uPugZG5FiBCNpIO7rkis5bAduEg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AA396053B;
        Wed, 13 Nov 2019 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573642173;
        bh=DPkyfJIDRwVR+l7oKURkDUeN4K8w4CWQB6yMzGzfDhw=;
        h=From:To:Cc:Subject:Date:From;
        b=mi2TqSYxnjlNmEtXP+yKAaOamZ9jckUymRv/DsgWrcNX/7QdcYDGTF+pUK2Zsexyj
         u988BQaLDnxWTCNyUs5Hm5Wr+EV26MUUQMKpqlGGHI3XuTnbBDEPk0WagyZXkxW1sK
         cfZ0mrVxiJgL8uPugZG5FiBCNpIO7rkis5bAduEg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9AA396053B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org,
        msavaliy@codeaurora.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v5 3/3] tty: serial: qcom_geni_serial: Remove sysfs file
Date:   Wed, 13 Nov 2019 16:19:21 +0530
Message-Id: <1573642161-14189-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove code from the driver that create and maintain loopback sysfs node.
Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
loopback mode.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V5:
 - As per Greg's and Stephen's comment on v4 patch, removed loopback sysfs
   file related code.

 drivers/tty/serial/qcom_geni_serial.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 56dad67..52f5ea2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -165,30 +165,6 @@ static struct qcom_geni_serial_port qcom_geni_uart_ports[GENI_UART_PORTS] = {
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
@@ -238,10 +214,14 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 							unsigned int mctrl)
 {
 	u32 uart_manual_rfr = 0;
+	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 
 	if (uart_console(uport))
 		return;
 
+	if (mctrl & TIOCM_LOOP)
+		port->loopback = MAX_LOOPBACK_CFG;
+
 	if (!(mctrl & TIOCM_RTS))
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
@@ -1311,8 +1291,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
-	if (!console)
-		device_create_file(uport->dev, &dev_attr_loopback);
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

