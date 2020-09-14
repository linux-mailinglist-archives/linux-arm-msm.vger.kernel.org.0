Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F71268CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgINOAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:00:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36375 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgINN7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 09:59:23 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2020 06:59:22 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2020 06:59:20 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Sep 2020 19:28:55 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 5FA8544E3; Mon, 14 Sep 2020 19:28:54 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V6 4/4] tty: serial: qcom_geni_serial: Fix the UART wakeup issue
Date:   Mon, 14 Sep 2020 19:28:37 +0530
Message-Id: <1600091917-7464-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As a part of system suspend uart_port_suspend is called from the
Serial driver, which calls set_mctrl passing mctrl as 0. This
makes RFR high(NOT_READY) during suspend.

Due to this BT SoC is not able to send wakeup bytes to UART during
suspend. Include if check for non-suspend case to keep RFR low
during suspend.

Signed-off-by: satya priya <skakit@codeaurora.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes in V2:
 - This patch fixes the UART flow control issue during suspend.
   Newly added in V2.

Changes in V3:
 - As per Matthias's comment removed the extra parentheses.

Changes in V4:
 - No change.

Changes in V5:
 - As per Matthias comment, fixed nit-pick in commit text.

Changes in V6:
 - No change.

 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3aa29d2..bc63c54 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (mctrl & TIOCM_LOOP)
 		port->loopback = RX_TX_CTS_RTS_SORTED;
 
-	if (!(mctrl & TIOCM_RTS))
+	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

