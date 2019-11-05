Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46A8F0033
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 15:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389649AbfKEOpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 09:45:32 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45418 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387584AbfKEOpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 09:45:32 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1FFFC6162C; Tue,  5 Nov 2019 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572965131;
        bh=f2RpBpxXpUQ0Z5mleXc1WIYnAGw0r+wMHkY1QTysd+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g0hv0UUr+Lc1ygMUAXHW0McrBAYBBlIZLwMTjwk8I7bQ0td57SwQzGXTCPrEcuZey
         vccA2FO7izSfTimzlHMsAaEAiMoQrB6HNlimF+l/fF8udjFCThLYANxQ6O+fpOW3Gd
         TW6IC2+hO71/HYKgzrOO3G5CZipVuFb36J31A7/0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E9BB6161C;
        Tue,  5 Nov 2019 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572965128;
        bh=f2RpBpxXpUQ0Z5mleXc1WIYnAGw0r+wMHkY1QTysd+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RrXlHKXxn6xt7Vo9HwCQnZgOi9TJyDrnB44Jht6qiZB6k/u/6w7Guhk1XB4cP3z+h
         wJQvrw6hSXy1LuIjlKTI7+qgwrM/VVk+dk5ivTvs5lN0FoZUloRhDYiRrtVLIkUCVB
         d9qBvCb0HAQY9VMj/LZlciQ9/TJ6QkPRa6qW+gD0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E9BB6161C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: [PATCH v1 2/2] Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC WCN3991
Date:   Tue,  5 Nov 2019 20:15:08 +0530
Message-Id: <20191105144508.22989-3-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191105144508.22989-1-bgodavar@codeaurora.org>
References: <20191105144508.22989-1-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add support for WCN3991 i.e. current values and fw download
support.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/btqca.c   | 68 +++++++++++++++++++++++++++++--------
 drivers/bluetooth/btqca.h   | 10 ++++--
 drivers/bluetooth/hci_qca.c | 16 +++++++--
 3 files changed, 74 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 1a0f630515a6..79bca2e2ec13 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -14,19 +14,33 @@
 
 #define VERSION "0.1"
 
-int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
+int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+			 enum qca_btsoc_type soc_type)
 {
 	struct sk_buff *skb;
 	struct edl_event_hdr *edl;
 	struct qca_btsoc_version *ver;
 	char cmd;
 	int err = 0;
+	u8 event_type = HCI_EV_VENDOR;
+	u8 rlen = sizeof(*edl) + sizeof(*ver);
+	u8 rtype = EDL_APP_VER_RES_EVT;
 
 	bt_dev_dbg(hdev, "QCA Version Request");
 
+	/* Unlike other SoC's sending version command response as payload to
+	 * VSE event. WCN3991 sends version command response as a payload to
+	 * command complete event.
+	 */
+	if (soc_type == QCA_WCN3991) {
+		event_type = 0;
+		rlen += 1;
+		rtype = EDL_PATCH_VER_REQ_CMD;
+	}
+
 	cmd = EDL_PATCH_VER_REQ_CMD;
 	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
-				&cmd, HCI_EV_VENDOR, HCI_INIT_TIMEOUT);
+				&cmd, event_type, HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
 		err = PTR_ERR(skb);
 		bt_dev_err(hdev, "Reading QCA version information failed (%d)",
@@ -34,7 +48,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
 		return err;
 	}
 
-	if (skb->len != sizeof(*edl) + sizeof(*ver)) {
+	if (skb->len != rlen) {
 		bt_dev_err(hdev, "QCA Version size mismatch len %d", skb->len);
 		err = -EILSEQ;
 		goto out;
@@ -48,13 +62,16 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
 	}
 
 	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
-	    edl->rtype != EDL_APP_VER_RES_EVT) {
+	    edl->rtype != rtype) {
 		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
 			   edl->rtype);
 		err = -EIO;
 		goto out;
 	}
 
+	if (soc_type == QCA_WCN3991)
+		memcpy(&edl->data, &edl->data[1], sizeof(*ver));
+
 	ver = (struct qca_btsoc_version *)(edl->data);
 
 	BT_DBG("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
@@ -223,13 +240,17 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 }
 
 static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
-				 const u8 *data, enum qca_tlv_dnld_mode mode)
+				const u8 *data, enum qca_tlv_dnld_mode mode,
+				enum qca_btsoc_type soc_type)
 {
 	struct sk_buff *skb;
 	struct edl_event_hdr *edl;
 	struct tlv_seg_resp *tlv_resp;
 	u8 cmd[MAX_SIZE_PER_TLV_SEGMENT + 2];
 	int err = 0;
+	u8 event_type = HCI_EV_VENDOR;
+	u8 rlen = (sizeof(*edl) + sizeof(*tlv_resp));
+	u8 rtype = EDL_TVL_DNLD_RES_EVT;
 
 	cmd[0] = EDL_PATCH_TLV_REQ_CMD;
 	cmd[1] = seg_size;
@@ -239,15 +260,25 @@ static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
 		return __hci_cmd_send(hdev, EDL_PATCH_CMD_OPCODE, seg_size + 2,
 				      cmd);
 
+	/* Unlike other SoC's sending version command response as payload to
+	 * VSE event. WCN3991 sends version command response as a payload to
+	 * command complete event.
+	 */
+	if (soc_type == QCA_WCN3991) {
+		event_type = 0;
+		rlen = sizeof(*edl);
+		rtype = EDL_PATCH_TLV_REQ_CMD;
+	}
+
 	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, seg_size + 2, cmd,
-				HCI_EV_VENDOR, HCI_INIT_TIMEOUT);
+				event_type, HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
 		err = PTR_ERR(skb);
 		bt_dev_err(hdev, "QCA Failed to send TLV segment (%d)", err);
 		return err;
 	}
 
-	if (skb->len != sizeof(*edl) + sizeof(*tlv_resp)) {
+	if (skb->len != rlen) {
 		bt_dev_err(hdev, "QCA TLV response size mismatch");
 		err = -EILSEQ;
 		goto out;
@@ -260,13 +291,19 @@ static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
 		goto out;
 	}
 
-	tlv_resp = (struct tlv_seg_resp *)(edl->data);
+	if (edl->cresp != EDL_CMD_REQ_RES_EVT || edl->rtype != rtype) {
+		bt_dev_err(hdev, "QCA TLV with error stat 0x%x rtype 0x%x",
+			   edl->cresp, edl->rtype);
+		err = -EIO;
+	}
 
-	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
-	    edl->rtype != EDL_TVL_DNLD_RES_EVT || tlv_resp->result != 0x00) {
+	if (soc_type == QCA_WCN3991)
+		goto out;
+
+	tlv_resp = (struct tlv_seg_resp *)(edl->data);
+	if (tlv_resp->result) {
 		bt_dev_err(hdev, "QCA TLV with error stat 0x%x rtype 0x%x (0x%x)",
 			   edl->cresp, edl->rtype, tlv_resp->result);
-		err = -EIO;
 	}
 
 out:
@@ -301,7 +338,8 @@ static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
 }
 
 static int qca_download_firmware(struct hci_dev *hdev,
-				  struct qca_fw_config *config)
+				 struct qca_fw_config *config,
+				 enum qca_btsoc_type soc_type)
 {
 	const struct firmware *fw;
 	const u8 *segment;
@@ -331,7 +369,7 @@ static int qca_download_firmware(struct hci_dev *hdev,
 			config->dnld_mode = QCA_SKIP_EVT_NONE;
 
 		ret = qca_tlv_send_segment(hdev, segsize, segment,
-					    config->dnld_mode);
+					   config->dnld_mode, soc_type);
 		if (ret)
 			goto out;
 
@@ -405,7 +443,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			 "qca/rampatch_%08x.bin", soc_ver);
 	}
 
-	err = qca_download_firmware(hdev, &config);
+	err = qca_download_firmware(hdev, &config, soc_type);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
 		return err;
@@ -426,7 +464,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/nvm_%08x.bin", soc_ver);
 
-	err = qca_download_firmware(hdev, &config);
+	err = qca_download_firmware(hdev, &config, soc_type);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
 		return err;
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 7f7a2b2c0df6..309a720ff216 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -126,6 +126,7 @@ enum qca_btsoc_type {
 	QCA_ROME,
 	QCA_WCN3990,
 	QCA_WCN3998,
+	QCA_WCN3991,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
@@ -134,12 +135,14 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, u32 soc_ver,
 		   const char *firmware_name);
-int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version);
+int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+			 enum qca_btsoc_type);
 int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
 static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 {
-	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3998;
+	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3998 ||
+	       soc_type == QCA_WCN3991;
 }
 #else
 
@@ -155,7 +158,8 @@ static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	return -EOPNOTSUPP;
 }
 
-static inline int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
+static inline int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+				       enum qca_btsoc_type)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c2062087b46b..a655cb714147 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1288,7 +1288,7 @@ static int qca_setup(struct hci_uart *hu)
 		if (ret)
 			return ret;
 
-		ret = qca_read_soc_version(hdev, &soc_ver);
+		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
 		if (ret)
 			return ret;
 	} else {
@@ -1308,7 +1308,7 @@ static int qca_setup(struct hci_uart *hu)
 
 	if (!qca_is_wcn399x(soc_type)) {
 		/* Get QCA version information */
-		ret = qca_read_soc_version(hdev, &soc_ver);
+		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
 		if (ret)
 			return ret;
 	}
@@ -1377,6 +1377,17 @@ static const struct qca_vreg_data qca_soc_data_wcn3998 = {
 	.num_vregs = 4,
 };
 
+static const struct qca_vreg_data qca_soc_data_wcn3991 = {
+	.soc_type = QCA_WCN3991,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 15000  },
+		{ "vddxo", 80000  },
+		{ "vddrf", 300000 },
+		{ "vddch0", 450000 },
+	},
+	.num_vregs = 4,
+};
+
 static void qca_power_shutdown(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
@@ -1663,6 +1674,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
+	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

