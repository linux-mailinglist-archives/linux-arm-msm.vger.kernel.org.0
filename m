Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F672A36C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbfH3M2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 08:28:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49662 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfH3M2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 08:28:51 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 85B6560208; Fri, 30 Aug 2019 12:28:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from c-hbandi-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: c-hbandi@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B143B6014B;
        Fri, 30 Aug 2019 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B143B6014B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=fail smtp.mailfrom=c_hbandi@qti.qualcomm.com
From:   Harish Bandi <c_hbandi@qti.qualcomm.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        anubhavg@codeaurora.org, Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v3] Bluetooth: hci_qca: wait for Pre shutdown complete event before sending the Power off pulse
Date:   Fri, 30 Aug 2019 17:58:36 +0530
Message-Id: <1567168116-12462-1-git-send-email-c_hbandi@qti.qualcomm.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Harish Bandi <c-hbandi@codeaurora.org>

When SoC receives pre shut down command, it share the same
with other COEX shared clients. So SoC needs a short time
after sending VS pre shutdown command before turning off
the regulators and sending the power off pulse. Along with
short delay, needs to wait for command complete event for
Pre shutdown VS command

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
Changes in V3:
- updated patch on latest tip.
---
 drivers/bluetooth/btqca.c   | 5 +++--
 drivers/bluetooth/hci_qca.c | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 0875470..8cc21ad 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -106,8 +106,9 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "QCA pre shutdown cmd");
 
-	skb = __hci_cmd_sync(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
-				NULL, HCI_INIT_TIMEOUT);
+	skb = __hci_cmd_sync_ev(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
+				NULL, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
+
 	if (IS_ERR(skb)) {
 		err = PTR_ERR(skb);
 		bt_dev_err(hdev, "QCA preshutdown_cmd failed (%d)", err);
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 15753f6..d33828f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1375,6 +1375,8 @@ static int qca_power_off(struct hci_dev *hdev)
 	/* Perform pre shutdown command */
 	qca_send_pre_shutdown_cmd(hdev);
 
+	usleep_range(8000, 10000);
+
 	qca_power_shutdown(hu);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

