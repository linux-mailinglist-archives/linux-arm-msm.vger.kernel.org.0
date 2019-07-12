Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1D2665FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 07:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfGLFKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 01:10:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52360 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbfGLFKD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 01:10:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 02B6C60E57; Fri, 12 Jul 2019 05:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562908202;
        bh=sp1zrY6tI6nLZSfX2Dy3oIETFmAKxX/GMLFBpZYAIZc=;
        h=From:To:Cc:Subject:Date:From;
        b=WRRri5RdzYmb6F17tz9byUaYYTd5iP2LQIUWR4E7/RCF07Hqep1gT+wq7TWhsH9Rp
         4qLh3NUhNVJO5RDKt6WQk33Euh0ZjBgOXGlz1eTLUPDG0m+MHTXzfVG+2GSj+EAiuf
         MRdrM600H7xgeBTfs4cRdIMOWM8G9ZPDVztQWg6c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from c-hbandi-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: c-hbandi@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45696606DC;
        Fri, 12 Jul 2019 05:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562908201;
        bh=sp1zrY6tI6nLZSfX2Dy3oIETFmAKxX/GMLFBpZYAIZc=;
        h=From:To:Cc:Subject:Date:From;
        b=mRcxNEGLcJk+CM5xf04oskXmefOqedGx4gHF/Plgh1Mx02/mqVUttw3sea9axUrZI
         y5C+0aXTRxpebOQURwPWeVtFDjbMUM+hAypgEyR4bb/Eep3ikt8YpzKZRVFodmd/Qn
         oVdeZs0ugzkX9muvwFT25xDP72KUbGlU9LuZWRoo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45696606DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=c-hbandi@codeaurora.org
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        anubhavg@codeaurora.org, Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Send VS pre shutdown command.
Date:   Fri, 12 Jul 2019 10:39:40 +0530
Message-Id: <1562908180-7468-1-git-send-email-c-hbandi@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WCN399x chips are coex chips, it needs a VS pre shutdown
command while turning off the BT. So that chip can inform
BT is OFF to other active clients.

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
---
 drivers/bluetooth/btqca.c   | 21 +++++++++++++++++++++
 drivers/bluetooth/btqca.h   |  7 +++++++
 drivers/bluetooth/hci_qca.c |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 81a5c45..2221935 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -99,6 +99,27 @@ static int qca_send_reset(struct hci_dev *hdev)
 	return 0;
 }
 
+int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	int err;
+
+	bt_dev_dbg(hdev, "QCA pre shutdown cmd");
+
+	skb = __hci_cmd_sync(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
+				NULL, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		err = PTR_ERR(skb);
+		bt_dev_err(hdev, "QCA preshutdown_cmd failed (%d)", err);
+		return err;
+	}
+
+	kfree_skb(skb);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
+
 static void qca_tlv_check_data(struct rome_config *config,
 				const struct firmware *fw)
 {
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 6a291a7..69c5315 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -13,6 +13,7 @@
 #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
 #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
 #define MAX_SIZE_PER_TLV_SEGMENT	(243)
+#define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
 
 #define EDL_CMD_REQ_RES_EVT		(0x00)
 #define EDL_PATCH_VER_RES_EVT		(0x19)
@@ -135,6 +136,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   const char *firmware_name);
 int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version);
 int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
+int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
 static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 {
 	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3998;
@@ -167,4 +169,9 @@ static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 {
 	return false;
 }
+
+static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index cbae86e..16db6c0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1383,6 +1383,9 @@ static int qca_power_off(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 
+	/* Perform pre shutdown command */
+	qca_send_pre_shutdown_cmd(hdev);
+
 	qca_power_shutdown(hu);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

