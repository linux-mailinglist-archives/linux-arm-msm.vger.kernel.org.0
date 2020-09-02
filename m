Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185CD25A53C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 07:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIBF5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 01:57:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48966 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgIBF5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 01:57:11 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2020 22:57:08 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 01 Sep 2020 22:57:07 -0700
Received: from parashar-linux.qualcomm.com ([10.206.13.63])
  by ironmsg02-blr.qualcomm.com with ESMTP; 02 Sep 2020 11:26:54 +0530
Received: by parashar-linux.qualcomm.com (Postfix, from userid 2363307)
        id 880842157D; Wed,  2 Sep 2020 11:26:53 +0530 (IST)
From:   Paras Sharma <parashar@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org, Paras Sharma <parashar@codeaurora.org>
Subject: [PATCH] serial: qcom_geni_serial: To correct QUP Version detection logic
Date:   Wed,  2 Sep 2020 11:26:51 +0530
Message-Id: <1599026211-12800-1-git-send-email-parashar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current implementation reduces the sampling rate by half
if qup HW version is  greater is than 2.5 by checking if the
geni SE major version is greater than 2 and geni SE minor version
is greater than 5.

This implementation fails when the version is 3 or greater.

Hence new implementation checks if version is greater than or equal
to 0x20050000 which would work for any future version.

Signed-off-by: Paras Sharma <parashar@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f0b1b47..e18b431 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1000,7 +1000,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
 	ver = geni_se_get_qup_hw_version(&port->se);
-	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
+	if (ver >= 0x20050000)
 		sampling_rate /= 2;
 
 	clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

