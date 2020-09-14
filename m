Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6D92685A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 09:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgINHTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 03:19:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44463 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgINHTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 03:19:46 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2020 00:19:44 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2020 00:19:43 -0700
Received: from parashar-linux.qualcomm.com ([10.206.13.63])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Sep 2020 12:49:28 +0530
Received: by parashar-linux.qualcomm.com (Postfix, from userid 2363307)
        id 8AA7D215D8; Mon, 14 Sep 2020 12:49:27 +0530 (IST)
From:   Paras Sharma <parashar@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org, Paras Sharma <parashar@codeaurora.org>
Subject: [PATCH V4] serial: qcom_geni_serial: To correct QUP Version detection logic
Date:   Mon, 14 Sep 2020 12:49:17 +0530
Message-Id: <1600067957-8216-1-git-send-email-parashar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current implementation reduces the sampling rate by half
if qup HW version is  greater is than 2.5 by checking if the
geni SE major version is greater than 2 and geni SE minor version
is greater than 5.This implementation fails when the version is
greater than or equal to 3.

Hence, a new macro QUP_SE_VERSION_2_5 is defined having value
for major number 2 and minor number 5 as 0x20050000.Hence,if 
ver is greater than this value,sampling rate is halved. 
This logic would work for any future qup version.

Fixes: ce734600545f ("tty: serial: qcom_geni_serial: Update the oversampling rate")
Signed-off-by: Paras Sharma <parashar@codeaurora.org>
---
Changes in V4:
Created a new macro QUP_SE_VERSION_2_5 for Qup se version 2.5

 drivers/tty/serial/qcom_geni_serial.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f0b1b47..9b74b1e 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -106,6 +106,9 @@
 /* We always configure 4 bytes per FIFO word */
 #define BYTES_PER_FIFO_WORD		4
 
+/* QUP SE VERSION value for major number 2 and minor number 5 */
+#define QUP_SE_VERSION_2_5                  0x20050000
+
 struct qcom_geni_private_data {
 	/* NOTE: earlycon port will have NULL here */
 	struct uart_driver *drv;
@@ -1000,7 +1003,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
 	ver = geni_se_get_qup_hw_version(&port->se);
-	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
+	if (ver >= QUP_SE_VERSION_2_5)
 		sampling_rate /= 2;
 
 	clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

