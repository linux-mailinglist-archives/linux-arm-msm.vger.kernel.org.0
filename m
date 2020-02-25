Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94CC16C2D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 14:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgBYN4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 08:56:03 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:4070 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729602AbgBYN4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 08:56:02 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Feb 2020 19:26:01 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Feb 2020 19:26:00 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 227B93AEF; Tue, 25 Feb 2020 19:25:59 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 2/2] tty: serial: qcom_geni_serial: Fix RX cancel command failure
Date:   Tue, 25 Feb 2020 19:24:22 +0530
Message-Id: <1582638862-9344-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
References: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RX cancel command fails when BT is switched on and off multiple times.

To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS register
instead of SE_GENI_S_CMD_CTRL_REG.

As per the HPG update, handle the RX last bit after cancel command
and flush out the RX FIFO buffer.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d2a909c..22d99b0 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -129,6 +129,7 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop);
 static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop);
 static unsigned int qcom_geni_serial_tx_empty(struct uart_port *port);
 static void qcom_geni_serial_stop_rx(struct uart_port *uport);
+static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop);
 
 static const unsigned long root_freq[] = {7372800, 14745600, 19200000, 29491200,
 					32000000, 48000000, 64000000, 80000000,
@@ -599,7 +600,7 @@ static void qcom_geni_serial_stop_rx(struct uart_port *uport)
 	u32 irq_en;
 	u32 status;
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
-	u32 irq_clear = S_CMD_DONE_EN;
+	u32 s_irq_status;
 
 	irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
 	irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
@@ -615,10 +616,19 @@ static void qcom_geni_serial_stop_rx(struct uart_port *uport)
 		return;
 
 	geni_se_cancel_s_cmd(&port->se);
-	qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
-					S_GENI_CMD_CANCEL, false);
+	qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
+					S_CMD_CANCEL_EN, true);
+	/*
+	 * If timeout occurs secondary engine remains active
+	 * and Abort sequence is executed.
+	 */
+	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
+	/* Flush the Rx buffer */
+	if (s_irq_status & S_RX_FIFO_LAST_EN)
+		qcom_geni_serial_handle_rx(uport, true);
+	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
+
 	status = readl(uport->membase + SE_GENI_STATUS);
-	writel(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
 	if (status & S_GENI_CMD_ACTIVE)
 		qcom_geni_serial_abort_rx(uport);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

