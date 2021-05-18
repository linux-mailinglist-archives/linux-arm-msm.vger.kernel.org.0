Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB81387DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350811AbhERQgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:36:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37559 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350802AbhERQgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:36:42 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 May 2021 09:35:24 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 May 2021 09:35:23 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 May 2021 22:04:49 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 606C022173; Tue, 18 May 2021 22:04:48 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v4 2/5] Bluetooth: btqca: Add support for firmware image with mbn type for WCN6750
Date:   Tue, 18 May 2021 22:04:43 +0530
Message-Id: <1621355686-29550-3-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Added support to download firmware image with mbn type for wcn6750
   as it supports mbn type image.
2. If mbn type image is not present then check for tlv type image.
3. Added debug logs for mbn type image.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 69 +++++++++++++++++++++++++++++++++++------------
 drivers/bluetooth/btqca.h |  3 ++-
 2 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 9574249..3210283 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -182,7 +182,8 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
-static void qca_tlv_check_data(struct qca_fw_config *config,
+static void qca_tlv_check_data(struct hci_dev *hdev,
+			       struct qca_fw_config *config,
 		u8 *fw_data, enum qca_btsoc_type soc_type)
 {
 	const u8 *data;
@@ -194,19 +195,21 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 	struct tlv_type_nvm *tlv_nvm;
 	uint8_t nvm_baud_rate = config->user_baud_rate;
 
-	tlv = (struct tlv_type_hdr *)fw_data;
-
-	type_len = le32_to_cpu(tlv->type_len);
-	length = (type_len >> 8) & 0x00ffffff;
-
-	BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
-	BT_DBG("Length\t\t : %d bytes", length);
-
 	config->dnld_mode = QCA_SKIP_EVT_NONE;
 	config->dnld_type = QCA_SKIP_EVT_NONE;
 
 	switch (config->type) {
+	case ELF_TYPE_PATCH:
+		config->dnld_mode = QCA_SKIP_EVT_VSE_CC;
+		config->dnld_type = QCA_SKIP_EVT_VSE_CC;
+
+		bt_dev_dbg(hdev, "File Class        : 0x%x", fw_data[4]);
+		bt_dev_dbg(hdev, "Data Encoding     : 0x%x", fw_data[5]);
+		bt_dev_dbg(hdev, "File version      : 0x%x", fw_data[6]);
+		break;
 	case TLV_TYPE_PATCH:
+		tlv = (struct tlv_type_hdr *)fw_data;
+		type_len = le32_to_cpu(tlv->type_len);
 		tlv_patch = (struct tlv_type_patch *)tlv->data;
 
 		/* For Rome version 1.1 to 3.1, all segment commands
@@ -218,6 +221,7 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 		config->dnld_mode = tlv_patch->download_mode;
 		config->dnld_type = config->dnld_mode;
 
+		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
 		BT_DBG("Total Length           : %d bytes",
 		       le32_to_cpu(tlv_patch->total_size));
 		BT_DBG("Patch Data Length      : %d bytes",
@@ -243,6 +247,14 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 		break;
 
 	case TLV_TYPE_NVM:
+		tlv = (struct tlv_type_hdr *)fw_data;
+
+		type_len = le32_to_cpu(tlv->type_len);
+		length = (type_len >> 8) & 0x00ffffff;
+
+		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
+		BT_DBG("Length\t\t : %d bytes", length);
+
 		idx = 0;
 		data = tlv->data;
 		while (idx < length) {
@@ -387,7 +399,8 @@ static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
 
 static int qca_download_firmware(struct hci_dev *hdev,
 				 struct qca_fw_config *config,
-				 enum qca_btsoc_type soc_type)
+				 enum qca_btsoc_type soc_type,
+				 u8 rom_ver)
 {
 	const struct firmware *fw;
 	u8 *data;
@@ -398,9 +411,27 @@ static int qca_download_firmware(struct hci_dev *hdev,
 
 	ret = request_firmware(&fw, config->fwname, &hdev->dev);
 	if (ret) {
-		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
-			   config->fwname, ret);
-		return ret;
+		/* For WCN6750, if mbn file is not present then check for
+		 * tlv file.
+		 */
+		if (soc_type == QCA_WCN6750 && config->type == ELF_TYPE_PATCH) {
+			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
+				   config->fwname, ret);
+			config->type = TLV_TYPE_PATCH;
+			snprintf(config->fwname, sizeof(config->fwname),
+				 "qca/msbtfw%02x.tlv", rom_ver);
+			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
+			ret = request_firmware(&fw, config->fwname, &hdev->dev);
+			if (ret) {
+				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+					   config->fwname, ret);
+				return ret;
+			}
+		} else {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   config->fwname, ret);
+			return ret;
+		}
 	}
 
 	size = fw->size;
@@ -415,7 +446,7 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	memcpy(data, fw->data, size);
 	release_firmware(fw);
 
-	qca_tlv_check_data(config, data, soc_type);
+	qca_tlv_check_data(hdev, config, data, soc_type);
 
 	segment = data;
 	remain = size;
@@ -533,14 +564,18 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	} else if (soc_type == QCA_WCN6750) {
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
 			    (soc_ver & 0x0000000f);
+		/* Choose mbn file by default.If mbn file is not found
+		 * then choose tlv file
+		 */
+		config.type = ELF_TYPE_PATCH;
 		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/msbtfw%02x.tlv", rom_ver);
+			 "qca/msbtfw%02x.mbn", rom_ver);
 	} else {
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/rampatch_%08x.bin", soc_ver);
 	}
 
-	err = qca_download_firmware(hdev, &config, soc_type);
+	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
 		return err;
@@ -573,7 +608,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/nvm_%08x.bin", soc_ver);
 
-	err = qca_download_firmware(hdev, &config, soc_type);
+	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
 		return err;
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 6ecd329..30afa77 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -80,7 +80,8 @@ enum qca_tlv_dnld_mode {
 
 enum qca_tlv_type {
 	TLV_TYPE_PATCH = 1,
-	TLV_TYPE_NVM
+	TLV_TYPE_NVM,
+	ELF_TYPE_PATCH,
 };
 
 struct qca_fw_config {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

