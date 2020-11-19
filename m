Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CFE2B92E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 13:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgKSMym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 07:54:42 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20666 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgKSMyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 07:54:41 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Nov 2020 04:54:38 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Nov 2020 04:54:36 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Nov 2020 18:24:13 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 4E98421D72; Thu, 19 Nov 2020 18:24:12 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v2] Bluetooth: Use NVM files based on SoC ID for WCN3991
Date:   Thu, 19 Nov 2020 18:24:09 +0530
Message-Id: <1605790449-7250-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change will allow to use different NVM file based
on WCN3991 BT SoC ID.Need to use different NVM file based on
fab location for WCN3991 BT SoC.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/btqca.c   | 36 ++++++++++++++++++++----------------
 drivers/bluetooth/btqca.h   | 22 ++++++++++++++++++----
 drivers/bluetooth/hci_qca.c |  9 ++++-----
 3 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index ce9dcff..f85a55a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -14,12 +14,11 @@
 
 #define VERSION "0.1"
 
-int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
 			 enum qca_btsoc_type soc_type)
 {
 	struct sk_buff *skb;
 	struct edl_event_hdr *edl;
-	struct qca_btsoc_version *ver;
 	char cmd;
 	int err = 0;
 	u8 event_type = HCI_EV_VENDOR;
@@ -70,9 +69,9 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 	}
 
 	if (soc_type >= QCA_WCN3991)
-		memmove(&edl->data, &edl->data[1], sizeof(*ver));
-
-	ver = (struct qca_btsoc_version *)(edl->data);
+		memcpy(ver, edl->data + 1, sizeof(*ver));
+	else
+		memcpy(ver, &edl->data, sizeof(*ver));
 
 	bt_dev_info(hdev, "QCA Product ID   :0x%08x",
 		    le32_to_cpu(ver->product_id));
@@ -83,13 +82,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 	bt_dev_info(hdev, "QCA Patch Version:0x%08x",
 		    le16_to_cpu(ver->patch_ver));
 
-	/* QCA chipset version can be decided by patch and SoC
-	 * version, combination with upper 2 bytes from SoC
-	 * and lower 2 bytes from patch will be used.
-	 */
-	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
-		       (le16_to_cpu(ver->rom_ver) & 0x0000ffff);
-	if (*soc_version == 0)
+	if (ver->soc_id == 0 || ver->rom_ver == 0)
 		err = -EILSEQ;
 
 out:
@@ -446,15 +439,20 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
 
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
-		   enum qca_btsoc_type soc_type, u32 soc_ver,
+		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
 		   const char *firmware_name)
 {
 	struct qca_fw_config config;
 	int err;
 	u8 rom_ver = 0;
+	u32 soc_ver;
 
 	bt_dev_dbg(hdev, "QCA setup on UART");
 
+	soc_ver = get_soc_ver(ver.soc_id, ver.rom_ver);
+
+	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
+
 	config.user_baud_rate = baudrate;
 
 	/* Download rampatch file */
@@ -491,9 +489,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	if (firmware_name)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/%s", firmware_name);
-	else if (qca_is_wcn399x(soc_type))
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/crnv%02x.bin", rom_ver);
+	else if (qca_is_wcn399x(soc_type)) {
+		if (ver.soc_id == QCA_WCN3991_SOC_ID) {
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/crnv%02xu.bin", rom_ver);
+		} else {
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/crnv%02x.bin", rom_ver);
+		}
+	}
 	else if (soc_type == QCA_QCA6390)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htnv%02x.bin", rom_ver);
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index d81b74c..e73b8f8 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -34,6 +34,18 @@
 #define QCA_HCI_CC_OPCODE		0xFC00
 #define QCA_HCI_CC_SUCCESS		0x00
 
+#define QCA_WCN3991_SOC_ID		(0x40014320)
+
+/* QCA chipset version can be decided by patch and SoC
+ * version, combination with upper 2 bytes from SoC
+ * and lower 2 bytes from patch will be used.
+ */
+#define get_soc_ver(soc_id, rom_ver)	\
+	((le32_to_cpu(soc_id) << 16) | (le16_to_cpu(rom_ver)))
+
+#define QCA_FW_BUILD_VER_LEN		255
+
+
 enum qca_baudrate {
 	QCA_BAUDRATE_115200 	= 0,
 	QCA_BAUDRATE_57600,
@@ -136,9 +148,9 @@ enum qca_btsoc_type {
 
 int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
-		   enum qca_btsoc_type soc_type, u32 soc_ver,
+		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
 		   const char *firmware_name);
-int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
 			 enum qca_btsoc_type);
 int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
@@ -155,13 +167,15 @@ static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdad
 }
 
 static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
-				 enum qca_btsoc_type soc_type, u32 soc_ver,
+				 enum qca_btsoc_type soc_type,
+				 struct qca_btsoc_version ver,
 				 const char *firmware_name)
 {
 	return -EOPNOTSUPP;
 }
 
-static inline int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
+static inline int qca_read_soc_version(struct hci_dev *hdev,
+				       struct qca_btsoc_version *ver,
 				       enum qca_btsoc_type)
 {
 	return -EOPNOTSUPP;
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 5cc7b16..4a96368 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1655,7 +1655,7 @@ static int qca_setup(struct hci_uart *hu)
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	const char *firmware_name = qca_get_firmware_name(hu);
 	int ret;
-	int soc_ver = 0;
+	struct qca_btsoc_version ver;
 
 	ret = qca_check_speeds(hu);
 	if (ret)
@@ -1684,7 +1684,7 @@ static int qca_setup(struct hci_uart *hu)
 	if (qca_is_wcn399x(soc_type)) {
 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
 
-		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
+		ret = qca_read_soc_version(hdev, &ver, soc_type);
 		if (ret)
 			goto out;
 	} else {
@@ -1703,14 +1703,13 @@ static int qca_setup(struct hci_uart *hu)
 
 	if (!qca_is_wcn399x(soc_type)) {
 		/* Get QCA version information */
-		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
+		ret = qca_read_soc_version(hdev, &ver, soc_type);
 		if (ret)
 			goto out;
 	}
 
-	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
 	/* Setup patch / NVM configurations */
-	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
+	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
 			firmware_name);
 	if (!ret) {
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

