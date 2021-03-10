Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21622333BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 12:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhCJLmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 06:42:19 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63318 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhCJLmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 06:42:08 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 Mar 2021 03:42:07 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Mar 2021 03:42:05 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Mar 2021 17:11:39 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 7098820F0F; Wed, 10 Mar 2021 17:11:38 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [RFC PATCH v1] Bluetooth: hci_qca: Add device_may_wakeup support
Date:   Wed, 10 Mar 2021 17:11:36 +0530
Message-Id: <1615376496-13577-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added device_may_wakeup() support.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index de36af6..73af901 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1571,6 +1571,20 @@ static void qca_cmd_timeout(struct hci_dev *hdev)
 	mutex_unlock(&qca->hci_memdump_lock);
 }
 
+static bool qca_prevent_wake(struct hci_dev *hdev)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	bool wakeup;
+
+	/* UART driver handles the interrupt from BT SoC.So we need to use
+	 * device handle of UART driver to get the status of device may wakeup.
+	 */
+	wakeup = device_may_wakeup(hu->serdev->ctrl->dev.parent);
+	bt_dev_dbg(hu->hdev, "wakeup status : %d", wakeup);
+
+	return !wakeup;
+}
+
 static int qca_wcn3990_init(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
@@ -1721,6 +1735,7 @@ static int qca_setup(struct hci_uart *hu)
 		qca_debugfs_init(hdev);
 		hu->hdev->hw_error = qca_hw_error;
 		hu->hdev->cmd_timeout = qca_cmd_timeout;
+		hu->hdev->prevent_wake = qca_prevent_wake;
 	} else if (ret == -ENOENT) {
 		/* No patch/nvm-config found, run with original fw/config */
 		set_bit(QCA_ROM_FW, &qca->flags);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

