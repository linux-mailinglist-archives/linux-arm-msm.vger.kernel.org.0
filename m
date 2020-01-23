Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D91146863
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 13:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWMtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 07:49:19 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:18623 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgAWMtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 07:49:19 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jan 2020 18:18:28 +0530
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 23 Jan 2020 18:18:07 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 92D1226EB; Thu, 23 Jan 2020 18:18:05 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH v2 1/1] tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register
Date:   Thu, 23 Jan 2020 18:18:02 +0530
Message-Id: <20200123124802.24862-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123124802.24862-1-rojay@codeaurora.org>
References: <20200123124802.24862-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure UART_IO_MACRO_CTRL register if UART lines are swapped.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index ff63728a95f4..24b862937c1e 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -24,6 +24,7 @@
 
 /* UART specific GENI registers */
 #define SE_UART_LOOPBACK_CFG		0x22c
+#define SE_UART_IO_MACRO_CTRL		0x240
 #define SE_UART_TX_TRANS_CFG		0x25c
 #define SE_UART_TX_WORD_LEN		0x268
 #define SE_UART_TX_STOP_BIT_LEN		0x26c
@@ -1260,6 +1261,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	int irq;
 	bool console = false;
 	struct uart_driver *drv;
+	u32 val;
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
 		console = true;
@@ -1309,6 +1311,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return irq;
 	uport->irq = irq;
 
+	ret = of_property_read_u32(pdev->dev.of_node, "qcom,pin_inverse", &val);
+	if (!ret)
+		writel(val, uport->membase + SE_UART_IO_MACRO_CTRL);
+
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
 			IRQF_TRIGGER_HIGH, port->name, uport);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of the Code Aurora Forum, hosted by The Linux Foundation

