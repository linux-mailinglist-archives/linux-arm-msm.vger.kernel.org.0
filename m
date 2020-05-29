Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37681E7A57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 12:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgE2KRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 06:17:17 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25634 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgE2KRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 06:17:17 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 May 2020 15:47:13 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 May 2020 15:46:57 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 253E93D97; Fri, 29 May 2020 15:46:56 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH] tty: serial: qcom_geni_serial: Add 51.2MHz frequency support
Date:   Fri, 29 May 2020 15:44:42 +0530
Message-Id: <1590747282-5487-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To support BT use case over UART at baud rate of 3.2 Mbps,
we need SE clocks to run at 51.2MHz frequency. Previously this
frequency was not available in clk src, so, we were requesting
for 102.4 MHz and dividing it internally by 2 to get 51.2MHz.

As now 51.2MHz frequency is made available in clk src,
adding this frequency to UART frequency table.

We will save significant amount of power, if 51.2 is used
because it belongs to LowSVS range whereas 102.4 fall into
Nominal category.

Signed-off-by: satya priya <skakit@codeaurora.org>
---

Note: This depend on clk patch https://patchwork.kernel.org/patch/11554073/

 drivers/tty/serial/qcom_geni_serial.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090..168e1c0 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -141,9 +141,10 @@ static void qcom_geni_serial_stop_rx(struct uart_port *uport);
 static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop);
 
 static const unsigned long root_freq[] = {7372800, 14745600, 19200000, 29491200,
-					32000000, 48000000, 64000000, 80000000,
-					96000000, 100000000, 102400000,
-					112000000, 120000000, 128000000};
+					32000000, 48000000, 51200000, 64000000,
+					80000000, 96000000, 100000000,
+					102400000, 112000000, 120000000,
+					128000000};
 
 #define to_dev_port(ptr, member) \
 		container_of(ptr, struct qcom_geni_serial_port, member)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

