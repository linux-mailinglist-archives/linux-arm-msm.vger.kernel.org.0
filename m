Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5A150475
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgBCKlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 05:41:14 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:14206 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727196AbgBCKlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 05:41:14 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Feb 2020 16:11:08 +0530
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Feb 2020 16:10:45 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 8A536212C4; Mon,  3 Feb 2020 16:10:43 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        devicetree@vger.kernel.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v3 1/2] Bluetooth: hci_qca: Enable clocks required for BT SOC
Date:   Mon,  3 Feb 2020 16:10:40 +0530
Message-Id: <1580726441-1100-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of relying on other subsytem to turn ON clocks
required for BT SoC to operate, voting them from the driver.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
v3:
  *Removed the function qca_setup_clock() 
  *For enabling and disabling clocks, directly called the functions 
   clk_prepare_enable and clk_disable_unprepare respectively. 

---
 drivers/bluetooth/hci_qca.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d6e0c99..eacc65b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1755,6 +1755,13 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 
 	power->vregs_on = true;
 
+	ret = clk_prepare_enable(qcadev->susclk);
+	if (ret) {
+		/* Turn off regulators to overcome power leakage */
+		qca_regulator_disable(qcadev);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1773,6 +1780,9 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 
 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
 	power->vregs_on = false;
+
+	if (qcadev->susclk)
+		clk_disable_unprepare(qcadev->susclk);
 }
 
 static int qca_init_regulators(struct qca_power *qca,
@@ -1839,6 +1849,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		qcadev->bt_power->vregs_on = false;
 
+		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+		if (IS_ERR(qcadev->susclk)) {
+			dev_err(&serdev->dev, "failed to acquire clk\n");
+			return PTR_ERR(qcadev->susclk);
+		}
+
 		device_property_read_u32(&serdev->dev, "max-speed",
 					 &qcadev->oper_speed);
 		if (!qcadev->oper_speed)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

