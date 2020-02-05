Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8AE2152975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 11:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgBEKwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 05:52:45 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:63844 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727170AbgBEKwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 05:52:45 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Feb 2020 16:22:42 +0530
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Feb 2020 16:22:14 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 7D108213F5; Wed,  5 Feb 2020 16:22:13 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        devicetree@vger.kernel.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Optimized code while enabling clocks for BT SOC
Date:   Wed,  5 Feb 2020 16:21:43 +0530
Message-Id: <1580899903-19032-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

* Directly passing clock pointer to clock code without checking for NULL
  as clock code takes care of it
* Removed the comment which was not necessary
* Updated code for return in qca_regulator_enable()

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index eacc65b..8e95bfe 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1756,13 +1756,10 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	power->vregs_on = true;
 
 	ret = clk_prepare_enable(qcadev->susclk);
-	if (ret) {
-		/* Turn off regulators to overcome power leakage */
+	if (ret)
 		qca_regulator_disable(qcadev);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static void qca_regulator_disable(struct qca_serdev *qcadev)
@@ -1781,8 +1778,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
 	power->vregs_on = false;
 
-	if (qcadev->susclk)
-		clk_disable_unprepare(qcadev->susclk);
+	clk_disable_unprepare(qcadev->susclk);
 }
 
 static int qca_init_regulators(struct qca_power *qca,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

