Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510E21463AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 09:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgAWImy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 03:42:54 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:47000 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726061AbgAWImy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 03:42:54 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jan 2020 14:12:02 +0530
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jan 2020 14:11:40 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 3D99C26E5; Thu, 23 Jan 2020 14:11:40 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 1/1] tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register
Date:   Thu, 23 Jan 2020 14:11:32 +0530
Message-Id: <20200123084132.11802-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123084132.11802-1-rojay@codeaurora.org>
References: <20200123084132.11802-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure UART_IO_MACRO_CTRL register if UART lines are swapped.

Change-Id: I8e82c2395bf4cdc51b3677c3c54f5be3f390a888
Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 drivers/tty/serial/qcom_geni_serial.c        | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 7143cb2dbc05..8a8497ca0ec0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -675,6 +675,7 @@ ap_spi_fp: &spi10 {
 
 &uart3 {
 	status = "okay";
+	qcom,pin_inverse = <0x4643>;
 
 	bluetooth: bluetooth {
 		compatible = "qcom,wcn3991-bt";
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e1767359cc64..939592ca437c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -25,6 +25,7 @@
 
 /* UART specific GENI registers */
 #define SE_UART_LOOPBACK_CFG		0x22c
+#define SE_UART_IO_MACRO_CTRL		0x240
 #define SE_UART_TX_TRANS_CFG		0x25c
 #define SE_UART_TX_WORD_LEN		0x268
 #define SE_UART_TX_STOP_BIT_LEN		0x26c
@@ -1240,6 +1241,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	int irq;
 	bool console = false;
 	struct uart_driver *drv;
+	u32 val;
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
 		console = true;
@@ -1313,6 +1315,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
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

