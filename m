Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA2516C2D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 14:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgBYNzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 08:55:33 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:1279 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729253AbgBYNza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 08:55:30 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Feb 2020 19:25:27 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Feb 2020 19:25:26 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3E9FE3AEF; Tue, 25 Feb 2020 19:25:25 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 1/2] tty: serial: qcom_geni_serial: Allocate port->rx_fifo buffer in probe
Date:   Tue, 25 Feb 2020 19:24:21 +0530
Message-Id: <1582638862-9344-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
References: <1582638862-9344-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To fix the RX cancel command failure, rx_fifo buffer needs to be
flushed in stop_rx() by calling handle_rx().

If set_termios is called before startup, by this time memory is not
allocated to port->rx_fifo buffer, which leads to a NULL pointer
dereference.

To avoid this NULL pointer dereference allocate memory to port->rx_fifo
in probe itself.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 191abb1..d2a909c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -858,12 +858,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 						false, false, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, GENI_SE_FIFO);
-	if (!uart_console(uport)) {
-		port->rx_fifo = devm_kcalloc(uport->dev,
-			port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
-		if (!port->rx_fifo)
-			return -ENOMEM;
-	}
 	port->setup = true;
 
 	return 0;
@@ -1274,6 +1268,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
+	if (!console) {
+		port->rx_fifo = devm_kcalloc(uport->dev,
+			port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
+		if (!port->rx_fifo)
+			return -ENOMEM;
+	}
+
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

