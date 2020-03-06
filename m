Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B34A17B6FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 07:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCFGrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 01:47:40 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:8534 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbgCFGrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 01:47:40 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Mar 2020 12:17:33 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 Mar 2020 12:17:17 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 4E2CA3A24; Fri,  6 Mar 2020 12:17:16 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 1/2] tty: serial: qcom_geni_serial: Allocate port->rx_fifo buffer in probe
Date:   Fri,  6 Mar 2020 12:17:07 +0530
Message-Id: <1583477228-32231-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
References: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To fix the RX cancel command failure, rx_fifo buffer needs to be
flushed in stop_rx() by calling handle_rx().In handle_rx() the data
in rx_fifo buffer is read and then dropped, not sent to upper layers.

If set_termios is called before startup, by this time memory is not
allocated to port->rx_fifo buffer, which leads to a NULL pointer
dereference.

To avoid this NULL pointer dereference allocate memory to port->rx_fifo
in probe itself.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reported-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V3:
- As per Stephen's comment, change the declaration of rx_fifo pointer
  to void pointer.

 drivers/tty/serial/qcom_geni_serial.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 191abb1..f74f8a8 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -113,7 +113,7 @@ struct qcom_geni_serial_port {
 	unsigned int baud;
 	unsigned int tx_bytes_pw;
 	unsigned int rx_bytes_pw;
-	u32 *rx_fifo;
+	void *rx_fifo;
 	u32 loopback;
 	bool brk;
 
@@ -504,7 +504,6 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 
 static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 {
-	unsigned char *buf;
 	struct tty_port *tport;
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 	u32 num_bytes_pw = port->tx_fifo_width / BITS_PER_BYTE;
@@ -516,8 +515,7 @@ static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 	if (drop)
 		return 0;
 
-	buf = (unsigned char *)port->rx_fifo;
-	ret = tty_insert_flip_string(tport, buf, bytes);
+	ret = tty_insert_flip_string(tport, port->rx_fifo, bytes);
 	if (ret != bytes) {
 		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
 				__func__, ret, bytes);
@@ -858,12 +856,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
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
@@ -1274,6 +1266,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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

