Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8847DB05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 14:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfHAMMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 08:12:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37740 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbfHAMMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 08:12:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0635B60E40; Thu,  1 Aug 2019 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564661526;
        bh=/Uh0/D+m6kv8+YXdEyt+v1OkXzm8Qmlq1aKxE0Tu1jM=;
        h=From:To:Cc:Subject:Date:From;
        b=kJGfQtm2ju01E9JUxixAeNcBZaTChFZb0F+ZXb6OmSv6fSBYYCTyu6XhuPdtQfRd7
         3TNe7iZwbY4in6sKzI0u9TPRks832x8Bo89M5yKucypNPZUerCknExileJUWzKFjKa
         V/IDMn3jsiQ/CkM11/fzFLnVD4ETOAlKBtDhrLsM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2AED860A97;
        Thu,  1 Aug 2019 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564661525;
        bh=/Uh0/D+m6kv8+YXdEyt+v1OkXzm8Qmlq1aKxE0Tu1jM=;
        h=From:To:Cc:Subject:Date:From;
        b=SaorWJN2VqM3pGx1QTKwRzujfhsCyHXwPgUokmyAfnGoUzf1mrXM+j8s+6TU+wcX+
         qAqnFVma+W6I7wMzSzJOxwMCT5+Ttka8O3SzOzmxBwLIaBLxEIHCcpRc95IiPkhaXF
         8FJIA+3M9y9KzfNrbGMNcqmVG1YZNi1pO/wsQgzE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2AED860A97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     jslaby@suse.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/1] tty: serial: qcom_geni_serial: Update the oversampling rate
Date:   Thu,  1 Aug 2019 17:41:53 +0530
Message-Id: <20190801121153.10613-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For QUP IP versions 2.5 and above the oversampling rate is halved
from 32 to 16. Update this rate after reading hardware version
register, so that the clock divider value is correctly set to
achieve required baud rate.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 35e5f9c5d5be..318f811585cc 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -920,12 +920,13 @@ static unsigned long get_clk_cfg(unsigned long clk_freq)
 	return 0;
 }
 
-static unsigned long get_clk_div_rate(unsigned int baud, unsigned int *clk_div)
+static unsigned long get_clk_div_rate(unsigned int baud,
+			unsigned int sampling_rate, unsigned int *clk_div)
 {
 	unsigned long ser_clk;
 	unsigned long desired_clk;
 
-	desired_clk = baud * UART_OVERSAMPLING;
+	desired_clk = baud * sampling_rate;
 	ser_clk = get_clk_cfg(desired_clk);
 	if (!ser_clk) {
 		pr_err("%s: Can't find matching DFS entry for baud %d\n",
@@ -951,12 +952,20 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	u32 ser_clk_cfg;
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 	unsigned long clk_rate;
+	u32 ver, sampling_rate;
 
 	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
 	port->baud = baud;
-	clk_rate = get_clk_div_rate(baud, &clk_div);
+
+	sampling_rate = UART_OVERSAMPLING;
+	/* Sampling rate is halved for IP versions >= 2.5 */
+	ver = geni_se_get_qup_hw_version(&port->se);
+	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
+		sampling_rate /= 2;
+
+	clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
 	if (!clk_rate)
 		goto out_restart_rx;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

