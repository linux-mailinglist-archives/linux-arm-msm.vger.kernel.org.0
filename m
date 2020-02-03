Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D601A150237
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 09:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgBCIGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 03:06:48 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11598 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727308AbgBCIGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 03:06:48 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Feb 2020 13:36:45 +0530
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Feb 2020 13:36:20 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id A312F21436; Mon,  3 Feb 2020 13:36:18 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v3] Bluetooth: hci_qca:Removed the function qca_setup_clock()
Date:   Mon,  3 Feb 2020 13:35:49 +0530
Message-Id: <1580717149-7609-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For enabling and disabling clocks, directly called the functions
clk_prepare_enable() and clk_disable_unprepare() respectively.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 73706f3..eacc65b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1738,15 +1738,6 @@ static int qca_power_off(struct hci_dev *hdev)
 	return 0;
 }
 
-static int qca_setup_clock(struct clk *clk, bool enable)
-{
-	if (enable)
-		return clk_prepare_enable(clk);
-
-	clk_disable_unprepare(clk);
-	return 0;
-}
-
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
 	struct qca_power *power = qcadev->bt_power;
@@ -1764,7 +1755,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 
 	power->vregs_on = true;
 
-	ret = qca_setup_clock(qcadev->susclk, true);
+	ret = clk_prepare_enable(qcadev->susclk);
 	if (ret) {
 		/* Turn off regulators to overcome power leakage */
 		qca_regulator_disable(qcadev);
@@ -1791,7 +1782,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	power->vregs_on = false;
 
 	if (qcadev->susclk)
-		qca_setup_clock(qcadev->susclk, false);
+		clk_disable_unprepare(qcadev->susclk);
 }
 
 static int qca_init_regulators(struct qca_power *qca,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

