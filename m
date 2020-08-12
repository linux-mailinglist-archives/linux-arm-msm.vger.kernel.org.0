Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B0524251C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 07:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgHLFtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 01:49:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60702 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgHLFtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 01:49:24 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 11 Aug 2020 22:49:23 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Aug 2020 22:49:21 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Aug 2020 11:19:04 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 59E2E43FA; Wed, 12 Aug 2020 11:19:03 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH] tty: serial: qcom_geni_serial: Remove the UART frequency table
Date:   Wed, 12 Aug 2020 11:18:48 +0530
Message-Id: <1597211328-23500-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use clk_round_rate() API to find a frequency that will work with the
requested baud rate. With this we can avoid updating the table each time
we add a new frquency to the table. We can just call clk_round_rate() and
make sure it is evenly divisible by the requested rate and then it will be
the same as before.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3aa29d2..312daa24 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -149,12 +149,6 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *port);
 static void qcom_geni_serial_stop_rx(struct uart_port *uport);
 static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop);
 
-static const unsigned long root_freq[] = {7372800, 14745600, 19200000, 29491200,
-					32000000, 48000000, 51200000, 64000000,
-					80000000, 96000000, 100000000,
-					102400000, 112000000, 120000000,
-					128000000};
-
 #define to_dev_port(ptr, member) \
 		container_of(ptr, struct qcom_geni_serial_port, member)
 
@@ -941,30 +935,22 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	return 0;
 }
 
-static unsigned long get_clk_cfg(unsigned long clk_freq)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(root_freq); i++) {
-		if (!(root_freq[i] % clk_freq))
-			return root_freq[i];
-	}
-	return 0;
-}
-
-static unsigned long get_clk_div_rate(unsigned int baud,
-			unsigned int sampling_rate, unsigned int *clk_div)
+static unsigned long get_clk_div_rate(const struct geni_se *se,
+			unsigned int baud, unsigned int sampling_rate,
+			unsigned int *clk_div)
 {
 	unsigned long ser_clk;
 	unsigned long desired_clk;
+	long actual_clk;
 
 	desired_clk = baud * sampling_rate;
-	ser_clk = get_clk_cfg(desired_clk);
-	if (!ser_clk) {
+	actual_clk = clk_round_rate(se->clk, desired_clk);
+	if (actual_clk % desired_clk != 0) {
 		pr_err("%s: Can't find matching DFS entry for baud %d\n",
 								__func__, baud);
-		return ser_clk;
+		return 0;
 	}
+	ser_clk = actual_clk;
 
 	*clk_div = ser_clk / desired_clk;
 	return ser_clk;
@@ -998,7 +984,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
 		sampling_rate /= 2;
 
-	clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
+	clk_rate = get_clk_div_rate(&port->se, baud, sampling_rate, &clk_div);
 	if (!clk_rate)
 		goto out_restart_rx;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

