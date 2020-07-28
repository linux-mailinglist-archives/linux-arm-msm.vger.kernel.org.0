Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B65230E72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 17:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731117AbgG1Px1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 11:53:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28797 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgG1Px1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 11:53:27 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Jul 2020 08:53:26 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 28 Jul 2020 08:53:24 -0700
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Jul 2020 21:23:01 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id ECC9621A2A; Tue, 28 Jul 2020 21:23:00 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Stop collecting memdump again for command timeout during SSR
Date:   Tue, 28 Jul 2020 21:23:00 +0530
Message-Id: <1595951580-16724-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Setting memdump state to idle prior to setting of callback function
pointer for command timeout to NULL,causing the issue.Now moved the
initialisation of memdump state to qca_setup().

Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3d13002..20e1ded 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1668,6 +1668,8 @@ static int qca_setup(struct hci_uart *hu)
 	bt_dev_info(hdev, "setting up %s",
 		qca_is_wcn399x(soc_type) ? "wcn399x" : "ROME/QCA6390");
 
+	qca->memdump_state = QCA_MEMDUMP_IDLE;
+
 retry:
 	ret = qca_power_on(hdev);
 	if (ret)
@@ -1817,9 +1819,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	qca_flush(hu);
 	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
-	hu->hdev->hw_error = NULL;
-	hu->hdev->cmd_timeout = NULL;
-
 	/* Non-serdev device usually is powered by external power
 	 * and don't need additional action in driver for power down
 	 */
@@ -1841,6 +1840,9 @@ static int qca_power_off(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 
+	hu->hdev->hw_error = NULL;
+	hu->hdev->cmd_timeout = NULL;
+
 	/* Stop sending shutdown command if soc crashes. */
 	if (soc_type != QCA_ROME
 		&& qca->memdump_state == QCA_MEMDUMP_IDLE) {
@@ -1848,7 +1850,6 @@ static int qca_power_off(struct hci_dev *hdev)
 		usleep_range(8000, 10000);
 	}
 
-	qca->memdump_state = QCA_MEMDUMP_IDLE;
 	qca_power_shutdown(hu);
 	return 0;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

