Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB6F387DB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346381AbhERQgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:36:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37559 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244037AbhERQgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:36:41 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 May 2021 09:35:23 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 May 2021 09:35:21 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 May 2021 22:04:49 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 5006C21300; Tue, 18 May 2021 22:04:48 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v4 1/5] Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
Date:   Tue, 18 May 2021 22:04:42 +0530
Message-Id: <1621355686-29550-2-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added regulators,GPIOs and changes required to power on/off wcn6750.
Added support for firmware download for wcn6750.

Changes done in detail:
1. Added regulators and corresponding current values.
2. Added sw_ctrl GPIO pin which is output from BT SoC and indicates
   status of clock supply to BT SoC.
3. Added inline function to check if the SoC type is wcn6750.
4. Modified the function qca_wcn3990_init() to support wcn6750 and
   renamed it to qca_regulator_init().

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/btqca.c   |  13 ++++-
 drivers/bluetooth/btqca.h   |  11 +++++
 drivers/bluetooth/hci_qca.c | 114 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 115 insertions(+), 23 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index bd71dfc..9574249 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -530,6 +530,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			    (soc_ver & 0x0000000f);
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htbtfw%02x.tlv", rom_ver);
+	} else if (soc_type == QCA_WCN6750) {
+		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
+			    (soc_ver & 0x0000000f);
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/msbtfw%02x.tlv", rom_ver);
 	} else {
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/rampatch_%08x.bin", soc_ver);
@@ -561,6 +566,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	else if (soc_type == QCA_QCA6390)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htnv%02x.bin", rom_ver);
+	else if (soc_type == QCA_WCN6750)
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/msnv%02x.bin", rom_ver);
 	else
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/nvm_%08x.bin", soc_ver);
@@ -577,13 +585,14 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			return err;
 	}
 
-	/* WCN399x supports the Microsoft vendor extension with 0xFD70 as the
+	/* WCN399x and WCN6750 supports the Microsoft vendor extension with 0xFD70 as the
 	 * VsMsftOpCode.
 	 */
 	switch (soc_type) {
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
+	case QCA_WCN6750:
 		hci_set_msft_opcode(hdev, 0xFD70);
 		break;
 	default:
@@ -597,7 +606,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
-	if (soc_type == QCA_WCN3991) {
+	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750) {
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index b19add7..6ecd329 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -143,6 +143,7 @@ enum qca_btsoc_type {
 	QCA_WCN3998,
 	QCA_WCN3991,
 	QCA_QCA6390,
+	QCA_WCN6750,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
@@ -160,6 +161,11 @@ static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3991 ||
 	       soc_type == QCA_WCN3998;
 }
+static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
+{
+	return soc_type == QCA_WCN6750;
+}
+
 #else
 
 static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
@@ -192,6 +198,11 @@ static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 	return false;
 }
 
+static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
+{
+	return false;
+}
+
 static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index dc6551d..53deea2 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -218,6 +218,7 @@ struct qca_power {
 struct qca_serdev {
 	struct hci_uart	 serdev_hu;
 	struct gpio_desc *bt_en;
+	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
 	struct qca_power *bt_power;
@@ -604,7 +605,8 @@ static int qca_open(struct hci_uart *hu)
 	if (hu->serdev) {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 
-		if (qca_is_wcn399x(qcadev->btsoc_type))
+		if (qca_is_wcn399x(qcadev->btsoc_type) ||
+		    qca_is_wcn6750(qcadev->btsoc_type))
 			hu->init_speed = qcadev->init_speed;
 
 		if (qcadev->oper_speed)
@@ -1308,7 +1310,8 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 		      msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS));
 
 	/* Give the controller time to process the request */
-	if (qca_is_wcn399x(qca_soc_type(hu)))
+	if (qca_is_wcn399x(qca_soc_type(hu)) ||
+	    qca_is_wcn6750(qca_soc_type(hu)))
 		usleep_range(1000, 10000);
 	else
 		msleep(300);
@@ -1384,7 +1387,8 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 
 static int qca_check_speeds(struct hci_uart *hu)
 {
-	if (qca_is_wcn399x(qca_soc_type(hu))) {
+	if (qca_is_wcn399x(qca_soc_type(hu)) ||
+	    qca_is_wcn6750(qca_soc_type(hu))) {
 		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
 		    !qca_get_speed(hu, QCA_OPER_SPEED))
 			return -EINVAL;
@@ -1417,7 +1421,8 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		/* Disable flow control for wcn3990 to deassert RTS while
 		 * changing the baudrate of chip and host.
 		 */
-		if (qca_is_wcn399x(soc_type))
+		if (qca_is_wcn399x(soc_type) ||
+		    qca_is_wcn6750(soc_type))
 			hci_uart_set_flow_control(hu, true);
 
 		if (soc_type == QCA_WCN3990) {
@@ -1434,7 +1439,8 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		host_set_baudrate(hu, speed);
 
 error:
-		if (qca_is_wcn399x(soc_type))
+		if (qca_is_wcn399x(soc_type) ||
+		    qca_is_wcn6750(soc_type))
 			hci_uart_set_flow_control(hu, false);
 
 		if (soc_type == QCA_WCN3990) {
@@ -1585,10 +1591,12 @@ static bool qca_prevent_wake(struct hci_dev *hdev)
 	return !wakeup;
 }
 
-static int qca_wcn3990_init(struct hci_uart *hu)
+static int qca_regulator_init(struct hci_uart *hu)
 {
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	struct qca_serdev *qcadev;
 	int ret;
+	bool sw_ctrl_state;
 
 	/* Check for vregs status, may be hci down has turned
 	 * off the voltage regulator.
@@ -1607,16 +1615,33 @@ static int qca_wcn3990_init(struct hci_uart *hu)
 		}
 	}
 
-	/* Forcefully enable wcn3990 to enter in to boot mode. */
-	host_set_baudrate(hu, 2400);
-	ret = qca_send_power_pulse(hu, false);
-	if (ret)
-		return ret;
+	if (qca_is_wcn399x(soc_type)) {
+		/* Forcefully enable wcn399x to enter in to boot mode. */
+		host_set_baudrate(hu, 2400);
+		ret = qca_send_power_pulse(hu, false);
+		if (ret)
+			return ret;
+	}
+
+	/* For wcn6750 need to enable gpio bt_en */
+	if (qcadev->bt_en) {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+		msleep(50);
+		gpiod_set_value_cansleep(qcadev->bt_en, 1);
+		msleep(50);
+		if (qcadev->sw_ctrl) {
+			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
+			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
+		}
+	}
 
 	qca_set_speed(hu, QCA_INIT_SPEED);
-	ret = qca_send_power_pulse(hu, true);
-	if (ret)
-		return ret;
+
+	if (qca_is_wcn399x(soc_type)) {
+		ret = qca_send_power_pulse(hu, true);
+		if (ret)
+			return ret;
+	}
 
 	/* Now the device is in ready state to communicate with host.
 	 * To sync host with device we need to reopen port.
@@ -1649,8 +1674,9 @@ static int qca_power_on(struct hci_dev *hdev)
 	if (!hu->serdev)
 		return 0;
 
-	if (qca_is_wcn399x(soc_type)) {
-		ret = qca_wcn3990_init(hu);
+	if (qca_is_wcn399x(soc_type) ||
+	    qca_is_wcn6750(soc_type)) {
+		ret = qca_regulator_init(hu);
 	} else {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bt_en) {
@@ -1689,7 +1715,8 @@ static int qca_setup(struct hci_uart *hu)
 	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 
 	bt_dev_info(hdev, "setting up %s",
-		qca_is_wcn399x(soc_type) ? "wcn399x" : "ROME/QCA6390");
+		qca_is_wcn399x(soc_type) ? "wcn399x" :
+		(soc_type == QCA_WCN6750) ? "wcn6750" : "ROME/QCA6390");
 
 	qca->memdump_state = QCA_MEMDUMP_IDLE;
 
@@ -1700,7 +1727,8 @@ static int qca_setup(struct hci_uart *hu)
 
 	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 
-	if (qca_is_wcn399x(soc_type)) {
+	if (qca_is_wcn399x(soc_type) ||
+	    qca_is_wcn6750(soc_type)) {
 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
 
 		ret = qca_read_soc_version(hdev, &ver, soc_type);
@@ -1720,7 +1748,8 @@ static int qca_setup(struct hci_uart *hu)
 		qca_baudrate = qca_get_baudrate_value(speed);
 	}
 
-	if (!qca_is_wcn399x(soc_type)) {
+	if (!(qca_is_wcn399x(soc_type) ||
+	     qca_is_wcn6750(soc_type))) {
 		/* Get QCA version information */
 		ret = qca_read_soc_version(hdev, &ver, soc_type);
 		if (ret)
@@ -1828,12 +1857,30 @@ static const struct qca_device_data qca_soc_data_qca6390 = {
 	.num_vregs = 0,
 };
 
+static const struct qca_device_data qca_soc_data_wcn6750 = {
+	.soc_type = QCA_WCN6750,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 5000 },
+		{ "vddaon", 26000 },
+		{ "vddbtcxmx", 126000 },
+		{ "vddrfacmn", 12500 },
+		{ "vddrfa0p8", 102000 },
+		{ "vddrfa1p7", 302000 },
+		{ "vddrfa1p2", 257000 },
+		{ "vddrfa2p2", 1700000 },
+		{ "vddasd", 200 },
+	},
+	.num_vregs = 9,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static void qca_power_shutdown(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
+	bool sw_ctrl_state;
 
 	/* From this point we go into power off state. But serial port is
 	 * still open, stop queueing the IBS data and flush all the buffered
@@ -1856,6 +1903,14 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		host_set_baudrate(hu, 2400);
 		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
+	} else if (soc_type == QCA_WCN6750) {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+		msleep(100);
+		qca_regulator_disable(qcadev);
+		if (qcadev->sw_ctrl) {
+			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
+			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
+		}
 	} else if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
@@ -1978,7 +2033,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	if (!qcadev->oper_speed)
 		BT_DBG("UART will pick default operating speed");
 
-	if (data && qca_is_wcn399x(data->soc_type)) {
+	if (data &&
+	    (qca_is_wcn399x(data->soc_type) ||
+	    qca_is_wcn6750(data->soc_type))) {
 		qcadev->btsoc_type = data->soc_type;
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
@@ -1996,6 +2053,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		qcadev->bt_power->vregs_on = false;
 
+		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
+					       GPIOD_OUT_LOW);
+		if (!qcadev->bt_en && data->soc_type == QCA_WCN6750) {
+			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
+			power_ctrl_enabled = false;
+		}
+
+		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
+					       GPIOD_IN);
+		if (!qcadev->sw_ctrl && data->soc_type == QCA_WCN6750)
+			dev_warn(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
+
 		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
 		if (IS_ERR(qcadev->susclk)) {
 			dev_err(&serdev->dev, "failed to acquire clk\n");
@@ -2068,7 +2137,9 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
 	struct qca_power *power = qcadev->bt_power;
 
-	if (qca_is_wcn399x(qcadev->btsoc_type) && power->vregs_on)
+	if ((qca_is_wcn399x(qcadev->btsoc_type) ||
+	     qca_is_wcn6750(qcadev->btsoc_type)) &&
+	     power->vregs_on)
 		qca_power_shutdown(&qcadev->serdev_hu);
 	else if (qcadev->susclk)
 		clk_disable_unprepare(qcadev->susclk);
@@ -2244,6 +2315,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
+	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

