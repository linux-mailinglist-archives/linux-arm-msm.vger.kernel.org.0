Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2032F1F77D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 14:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgFLMU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 08:20:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54855 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgFLMUz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 08:20:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591964455; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ImX6KAheCqiFcyKOlsoV5dQHbw5VKKyzEws+R8l2dO4=; b=goASlW9ilDsuX99HQXcF43lMn2+VsdcuDnYd0xj+ycIX9/2xZ7QOMzrPkcx5Agj/V4UIv0cY
 Xg/X552Rc+CyBCRMhVyqt/+17bJuoQ1Z9VtDFy/ot0L18+n9ZaNLR0jbebY6FYS7lHeCdooD
 mYcLcYk1twPJXpDbL2gtaN95//A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5ee3731da3d8a4474352b74d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 12:20:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7B789C43387; Fri, 12 Jun 2020 12:20:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88337C433CA;
        Fri, 12 Jun 2020 12:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88337C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, abhishekpandit@chromium.org,
        rjliao@codeaurora.org, gubbaven@codeaurora.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Disable SoC debug logging for WCN3991
Date:   Fri, 12 Jun 2020 17:50:28 +0530
Message-Id: <1591964428-9607-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

By default, WCN3991 sent debug packets to HOST via ACL packet
with header 0xDC2E. This logging is not required on commercial
devices. With this patch SoC logging is disabled post fw
download.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 27 +++++++++++++++++++++++++++
 drivers/bluetooth/btqca.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index c598496..ce9dcff 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -400,6 +400,27 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	return ret;
 }
 
+static int qca_disable_soc_logging(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	u8 cmd[2];
+	int err;
+
+	cmd[0] = QCA_DISABLE_LOGGING_SUB_OP;
+	cmd[1] = 0x00;
+	skb = __hci_cmd_sync_ev(hdev, QCA_DISABLE_LOGGING, sizeof(cmd), cmd,
+				HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		err = PTR_ERR(skb);
+		bt_dev_err(hdev, "QCA Failed to disable soc logging(%d)", err);
+		return err;
+	}
+
+	kfree_skb(skb);
+
+	return 0;
+}
+
 int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 {
 	struct sk_buff *skb;
@@ -486,6 +507,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
+	if (soc_type >= QCA_WCN3991) {
+		err = qca_disable_soc_logging(hdev);
+		if (err < 0)
+			return err;
+	}
+
 	/* Perform HCI reset */
 	err = qca_send_reset(hdev);
 	if (err < 0) {
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 6e1e62d..d81b74c 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -14,6 +14,7 @@
 #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
 #define MAX_SIZE_PER_TLV_SEGMENT	(243)
 #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
+#define QCA_DISABLE_LOGGING		(0xFC17)
 
 #define EDL_CMD_REQ_RES_EVT		(0x00)
 #define EDL_PATCH_VER_RES_EVT		(0x19)
@@ -22,6 +23,7 @@
 #define EDL_CMD_EXE_STATUS_EVT		(0x00)
 #define EDL_SET_BAUDRATE_RSP_EVT	(0x92)
 #define EDL_NVM_ACCESS_CODE_EVT		(0x0B)
+#define QCA_DISABLE_LOGGING_SUB_OP	(0x14)
 
 #define EDL_TAG_ID_HCI			(17)
 #define EDL_TAG_ID_DEEP_SLEEP		(27)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

