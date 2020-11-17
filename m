Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAFC2B6BBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgKQRaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:30:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38491 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgKQRaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:30:14 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2020 09:30:13 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Nov 2020 09:30:11 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Nov 2020 22:59:46 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id EAACA21B7E; Tue, 17 Nov 2020 22:59:44 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: btqca: Add support to read FW build version for WCN3991 BTSoC
Date:   Tue, 17 Nov 2020 22:59:42 +0530
Message-Id: <1605634182-7926-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to read FW build version for WCN3991 BTSoC

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btqca.h |  3 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index ce9dcff..70f6cc5 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -101,6 +101,56 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 }
 EXPORT_SYMBOL_GPL(qca_read_soc_version);
 
+int qca_read_fw_build_info(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	struct edl_event_hdr *edl;
+	char cmd;
+	int err = 0;
+	char build_label[QCA_FW_BUILD_VER_LEN];
+	int build_lbl_len;
+
+	bt_dev_dbg(hdev, "QCA read fw build info");
+
+	cmd = EDL_GET_BUILD_INFO_CMD;
+	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
+				&cmd, HCI_EV_VENDOR, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		err = PTR_ERR(skb);
+		bt_dev_err(hdev, "Reading QCA fw build info failed (%d)",
+			   err);
+		return err;
+	}
+
+	edl = (struct edl_event_hdr *)(skb->data);
+	if (!edl) {
+		bt_dev_err(hdev, "QCA read fw build info with no header");
+		err = -EILSEQ;
+		goto out;
+	}
+
+	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
+	    edl->rtype != EDL_GET_BUILD_INFO_CMD) {
+		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
+			   edl->rtype);
+		err = -EIO;
+		goto out;
+	}
+
+	build_lbl_len = edl->data[0];
+	memcpy(build_label, &edl->data[1], build_lbl_len);
+	*(build_label + build_lbl_len) = '\0';
+
+	bt_dev_info(hdev, "BT SoC FW Build info: %s", build_label);
+
+out:
+	kfree_skb(skb);
+	if (err)
+		bt_dev_err(hdev, "QCA read fw build info failed (%d)", err);
+
+	return err;
+}
+
 static int qca_send_reset(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -520,6 +570,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
+	if (soc_type == QCA_WCN3991) {
+		/* get fw build info */
+		qca_read_fw_build_info(hdev);
+		if (err < 0)
+			return err;
+	}
+
 	bt_dev_info(hdev, "QCA setup on UART is completed");
 
 	return 0;
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index d81b74c..375c7fc 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -11,6 +11,7 @@
 #define EDL_PATCH_CMD_LEN		(1)
 #define EDL_PATCH_VER_REQ_CMD		(0x19)
 #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
+#define EDL_GET_BUILD_INFO_CMD		(0x20)
 #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
 #define MAX_SIZE_PER_TLV_SEGMENT	(243)
 #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
@@ -34,6 +35,8 @@
 #define QCA_HCI_CC_OPCODE		0xFC00
 #define QCA_HCI_CC_SUCCESS		0x00
 
+#define QCA_FW_BUILD_VER_LEN		255
+
 enum qca_baudrate {
 	QCA_BAUDRATE_115200 	= 0,
 	QCA_BAUDRATE_57600,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

