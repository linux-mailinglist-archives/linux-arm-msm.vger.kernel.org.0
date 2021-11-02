Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D404427EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 08:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhKBHPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 03:15:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10141 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKBHPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 03:15:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635837189; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jb2LoPxMYBS9qH6zFaOUakwg2W9Pu+ZyI6OIPSLAYxw=; b=w/AXC0a1TaSjOcQ8+8Iu6DNtOvP103iNZ+4pIoIHimJ/I/9DQZCD4T7Sh4IK0qQy3hIEm49q
 SGSWxZWSSpl+9nly6rFtReLZ+A7Hn6I8k4m9QZlOlOmyRJieIB8T0duF4A4UlywQRHuZ9rSS
 GuONKZUhcT2Gdo4a6jRwe1qCng8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6180e505900d71ea1e7d2272 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 07:13:09
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A2EEC43460; Tue,  2 Nov 2021 07:13:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3BB2FC4338F;
        Tue,  2 Nov 2021 07:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3BB2FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org,
        Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [PATCH v1 3/3] Bluetooth: hci_qca: Add support for QTI bluetooth MAPLE
Date:   Tue,  2 Nov 2021 15:12:57 +0800
Message-Id: <1635837177-1341-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Zijun Hu <quic_zijuhu@quicinc.com>

Add support for MAPLE integrated within SOC, it is mounted on
a virtual tty port and powered on/off via relevant IOCTL, neither
IBS nor RAMPATCH downloading is not required.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/bluetooth/btqca.c   | 13 ++++++++++++-
 drivers/bluetooth/btqca.h   | 13 +++++++++++++
 drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index be04d74037d2..b83d2ecefe5d 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -255,6 +255,8 @@ static void qca_tlv_check_data(struct hci_dev *hdev,
 		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
 		BT_DBG("Length\t\t : %d bytes", length);
 
+		if (qca_is_maple(soc_type))
+			break;
 		idx = 0;
 		data = tlv->data;
 		while (idx < length) {
@@ -552,6 +554,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 
 	/* Download rampatch file */
+	if (qca_is_maple(soc_type))
+		goto download_nvm;
+
 	config.type = TLV_TYPE_PATCH;
 	if (qca_is_wcn399x(soc_type)) {
 		snprintf(config.fwname, sizeof(config.fwname),
@@ -580,6 +585,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Give the controller some time to get ready to receive the NVM */
 	msleep(10);
 
+download_nvm:
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name)
@@ -597,6 +603,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	else if (soc_type == QCA_QCA6390)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htnv%02x.bin", rom_ver);
+	else if (qca_is_maple(soc_type))
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/mpnv%02x.bin", rom_ver);
 	else if (soc_type == QCA_WCN6750)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/msnv%02x.bin", rom_ver);
@@ -609,6 +618,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
 		return err;
 	}
+	if (qca_is_maple(soc_type))
+		msleep(MAPLE_NVM_READY_DELAY_MS);
 
 	if (soc_type >= QCA_WCN3991) {
 		err = qca_disable_soc_logging(hdev);
@@ -637,7 +648,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
-	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750) {
+	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750 || qca_is_maple(soc_type)) {
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 30afa7703afd..0a5a7d1daa71 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -46,6 +46,8 @@
 
 #define QCA_FW_BUILD_VER_LEN		255
 
+#define MAPLE_NVM_READY_DELAY_MS        1500
+#define MAPLE_POWER_CONTROL_DELAY_MS    50
 
 enum qca_baudrate {
 	QCA_BAUDRATE_115200 	= 0,
@@ -145,6 +147,7 @@ enum qca_btsoc_type {
 	QCA_WCN3991,
 	QCA_QCA6390,
 	QCA_WCN6750,
+	QCA_MAPLE,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
@@ -167,6 +170,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
 	return soc_type == QCA_WCN6750;
 }
 
+static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
+{
+	return soc_type == QCA_MAPLE;
+}
+
 #else
 
 static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
@@ -204,6 +212,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
 	return false;
 }
 
+static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
+{
+	return false;
+}
+
 static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index dd768a8ed7cb..f1d9670719c4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -70,6 +70,10 @@
 #define QCA_CRASHBYTE_PACKET_LEN	1096
 #define QCA_MEMDUMP_BYTE		0xFB
 
+#ifndef IOCTL_IPC_BOOT
+#define IOCTL_IPC_BOOT                  0xBE
+#endif
+
 enum qca_flags {
 	QCA_IBS_DISABLED,
 	QCA_DROP_VENDOR_EVENT,
@@ -1370,6 +1374,9 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 {
 	unsigned int speed = 0;
 
+	if (qca_is_maple(qca_soc_type(hu)))
+		return 0;
+
 	if (speed_type == QCA_INIT_SPEED) {
 		if (hu->init_speed)
 			speed = hu->init_speed;
@@ -1387,6 +1394,9 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 
 static int qca_check_speeds(struct hci_uart *hu)
 {
+	if (qca_is_maple(qca_soc_type(hu)))
+		return 0;
+
 	if (qca_is_wcn399x(qca_soc_type(hu)) ||
 	    qca_is_wcn6750(qca_soc_type(hu))) {
 		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
@@ -1660,6 +1670,21 @@ static int qca_regulator_init(struct hci_uart *hu)
 	return 0;
 }
 
+static int qca_maple_power_control(struct hci_uart *hu, bool on)
+{
+	int ret;
+	int power_arg = on ? 1 : 0;
+
+	ret = serdev_device_ioctl(hu->serdev, IOCTL_IPC_BOOT, power_arg);
+	if (ret)
+		bt_dev_err(hu->hdev, "%s: power %s failure: %d\n", __func__,
+			   on ? "ON" : "OFF", ret);
+	else
+		msleep(MAPLE_POWER_CONTROL_DELAY_MS);
+
+	return ret;
+}
+
 static int qca_power_on(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
@@ -1677,6 +1702,8 @@ static int qca_power_on(struct hci_dev *hdev)
 	if (qca_is_wcn399x(soc_type) ||
 	    qca_is_wcn6750(soc_type)) {
 		ret = qca_regulator_init(hu);
+	} else if (qca_is_maple(soc_type)) {
+		ret = qca_maple_power_control(hu, true);
 	} else {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bt_en) {
@@ -1715,6 +1742,7 @@ static int qca_setup(struct hci_uart *hu)
 	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 
 	bt_dev_info(hdev, "setting up %s",
+		qca_is_maple(soc_type) ? "maple" :
 		qca_is_wcn399x(soc_type) ? "wcn399x" :
 		(soc_type == QCA_WCN6750) ? "wcn6750" : "ROME/QCA6390");
 
@@ -1761,7 +1789,10 @@ static int qca_setup(struct hci_uart *hu)
 	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
 			firmware_name);
 	if (!ret) {
-		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		if (qca_is_maple(soc_type))
+			set_bit(QCA_ROM_FW, &qca->flags);
+		else
+			clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca_debugfs_init(hdev);
 		hu->hdev->hw_error = qca_hw_error;
 		hu->hdev->cmd_timeout = qca_cmd_timeout;
@@ -1858,6 +1889,11 @@ static const struct qca_device_data qca_soc_data_qca6390 = {
 	.num_vregs = 0,
 };
 
+static const struct qca_device_data qca_soc_data_maple = {
+	.soc_type = QCA_MAPLE,
+	.num_vregs = 0,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -1912,6 +1948,8 @@ static void qca_power_shutdown(struct hci_uart *hu)
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
 		}
+	} else if (qca_is_maple(soc_type)) {
+		qca_maple_power_control(hu, false);
 	} else if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
@@ -2089,6 +2127,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
 			power_ctrl_enabled = false;
 		}
+		if (qca_is_maple(qcadev->btsoc_type)) {
+			dev_info(&serdev->dev, "Maple: power ctrl enabled\n");
+			power_ctrl_enabled = true;
+		}
 
 		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
 		if (IS_ERR(qcadev->susclk)) {
@@ -2142,6 +2184,8 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	     qca_is_wcn6750(qcadev->btsoc_type)) &&
 	     power->vregs_on)
 		qca_power_shutdown(&qcadev->serdev_hu);
+	else if (qca_is_maple(qcadev->btsoc_type))
+		qca_power_shutdown(&qcadev->serdev_hu);
 	else if (qcadev->susclk)
 		clk_disable_unprepare(qcadev->susclk);
 
@@ -2312,6 +2356,7 @@ static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
 static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
+	{ .compatible = "qcom,maple-bt", .data = &qca_soc_data_maple},
 	{ .compatible = "qcom,qca9377-bt" },
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

