Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1B922BCA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 05:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgGXD6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 23:58:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38295 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgGXD6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 23:58:46 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2020 20:58:46 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2020 20:58:44 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Jul 2020 09:28:24 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 2CF344272; Fri, 24 Jul 2020 09:28:23 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 3/3] tty: serial: qcom_geni_serial: Fix the UART wakeup issue
Date:   Fri, 24 Jul 2020 09:28:02 +0530
Message-Id: <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As a part of system suspend we call uart_port_suspend from the
Serial driver, which calls set_mctrl passing mctrl as NULL. This
makes RFR high(NOT_READY) during suspend.

Due to this BT SoC is not able to send wakeup bytes to UART during
suspend. Included if check for non-suspend case to keep RFR low
during suspend.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - This patch fixes the UART flow control issue during suspend.
   Newly added in V2.

 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 07b7b6b..7108dfc 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (mctrl & TIOCM_LOOP)
 		port->loopback = RX_TX_CTS_RTS_SORTED;
 
-	if (!(mctrl & TIOCM_RTS))
+	if ((!(mctrl & TIOCM_RTS)) && (!(uport->suspended)))
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

