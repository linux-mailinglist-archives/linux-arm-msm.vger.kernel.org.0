Return-Path: <linux-arm-msm+bounces-39429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401A9DB730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90D3280A96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D1319C556;
	Thu, 28 Nov 2024 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iemqK8+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4519C546;
	Thu, 28 Nov 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795797; cv=none; b=dEMZfG4Smc7EfMhj3xZj8GoviHIUmvFw4grLfHxwW/cIha5k2shLpwksGR+b8yNGRY4nMOLUV62J84gSVJvjkbfQiksVMZge1Qymo5Iauc7VgMm9OE7r+zghR+1Lwu3NYOgywXbYJN+nK7rRmFCxz/vkbdKzR2rnkMkx/1GQ+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795797; c=relaxed/simple;
	bh=JxoicEUgdroKKF5rfdnum59tXT1qYgdOIwZIQI5EKJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGV11/Abif4FM0jfqNOwZAyV6ld9jPsx/Pk2oTwtcHl6JDJKRx6Y8gM2YFaGvhwZ9Dkxv111bsrr0EChF/YIf7sxZA5uc9dDsFl88OFykJd7Ai3KZy6qm8ipu091crOMv7VLHxcGXnvGO0MSWQaHs61clrHtmyP00va9HrVXw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iemqK8+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS91mnB018874;
	Thu, 28 Nov 2024 12:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJWuXd8mQIuJ2k4dGDkye5unxgKuHj3xOdLpL5ZhLnI=; b=iemqK8+WZusiPeN4
	k3NTBPAGo70XUGjwgZcqsRcqshA084jt8qmFVPurMsFZd//sGNisO0m+k4oVC16c
	r2PO61ADoCRkrL6LEU8lFb6nWP7kvzbTXfid/N0hgBNSSJUEbTmb+5f4xejG07zo
	q7UDe/n4roippDKAaaIJRbl1hDo92ThQUCh98a9zgIvWEhKKj9ZhKOHwrSuLO7Yx
	+QoH+7fWcTaexhC4yIwnV4PPFeJl4HyEqVB8wz+/FveCHP2zFWXtMhJJ0s32IDji
	LpODmdw/3Cat84t65T9NSWuxbDkmIsS5l9j/7n/QMe4WPm99M/YyAiiQyxk/BkV0
	mDHsfQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y02hk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASC9nYZ032348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:49 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 04:09:46 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
Subject: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
Date: Thu, 28 Nov 2024 20:09:22 +0800
Message-ID: <20241128120922.3518582-4-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VCzwscUEM4ouxctE_KV8Rih2FagGUvYN
X-Proofpoint-GUID: VCzwscUEM4ouxctE_KV8Rih2FagGUvYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280095

Add support for the QCA6698 Bluetooth chip, which shares the same IP core
as the WCN6855. However, it has different RF components and RAM sizes,
requiring new firmware files. This patch adds support for loading QCA6698
rampatch and NVM from a different directory.

Due to variations in RF performance of QCA6698 chips from different
foundries, different NVM configurations are used based on board ID.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 drivers/bluetooth/btqca.c   | 47 ++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btqca.h   |  1 +
 drivers/bluetooth/hci_qca.c | 36 ++++++++++++++++++++++++++--
 3 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dfbbac922..24bf00cac 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -700,6 +700,21 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	return 0;
 }
 
+int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = firmware_request_nowarn(&fw, name, &hdev->dev);
+	if (ret) {
+		bt_dev_warn(hdev, "Firmware %s does not exist. Use default", name);
+		return 0;
+	}
+
+	release_firmware(fw);
+	return 1;
+}
+
 static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
 		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
 {
@@ -730,6 +745,26 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
 			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
 }
 
+static void qca_get_qca6698_nvm_name(struct hci_dev *hdev, char *fwname,
+		size_t max_size, struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
+{
+	const char *variant;
+
+	/* hsp gf chip */
+	if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
+		variant = "g";
+	else
+		variant = "";
+
+	if (bid != 0x0)
+		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.b%04x", rom_ver,
+			 variant, bid);
+
+	/* if board id is 0 or the nvm file doesn't exisit, use the default */
+	if (bid == 0x0 || !qca_check_firmware_exists(fwname, hdev))
+		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.bin", rom_ver, variant);
+}
+
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
 		   const char *firmware_name)
@@ -796,6 +831,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/hmtbtfw%02x.tlv", rom_ver);
 		break;
+	case QCA_QCA6698:
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/QCA6698/hpbtfw%02x.tlv", rom_ver);
+		break;
 	default:
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/rampatch_%08x.bin", soc_ver);
@@ -810,7 +849,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Give the controller some time to get ready to receive the NVM */
 	msleep(10);
 
-	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
+	if (soc_type == QCA_QCA2066 || soc_type == QCA_QCA6698)
 		qca_read_fw_board_id(hdev, &boardid);
 
 	/* Download NVM configuration */
@@ -854,6 +893,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN7850:
 			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
 			break;
+		case QCA_QCA6698:
+			qca_get_qca6698_nvm_name(hdev, config.fwname,
+				sizeof(config.fwname), ver, rom_ver, boardid);
+			break;
 
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
@@ -874,6 +917,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		err = qca_disable_soc_logging(hdev);
 		if (err < 0)
 			return err;
@@ -909,6 +953,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index bb5207d7a..67c16d8f2 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -151,6 +151,7 @@ enum qca_btsoc_type {
 	QCA_WCN3991,
 	QCA_QCA2066,
 	QCA_QCA6390,
+	QCA_QCA6698,
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 37129e6cb..70bdc046c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1361,6 +1361,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		usleep_range(1000, 10000);
 		break;
 
@@ -1447,6 +1448,7 @@ static int qca_check_speeds(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
 		    !qca_get_speed(hu, QCA_OPER_SPEED))
 			return -EINVAL;
@@ -1489,6 +1491,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCA6698:
 			hci_uart_set_flow_control(hu, true);
 			break;
 
@@ -1523,6 +1526,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCA6698:
 			hci_uart_set_flow_control(hu, false);
 			break;
 
@@ -1803,6 +1807,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 	case QCA_QCA6390:
+	case QCA_QCA6698:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -1878,6 +1883,10 @@ static int qca_setup(struct hci_uart *hu)
 		soc_name = "qca2066";
 		break;
 
+	case QCA_QCA6698:
+		soc_name = "qca6698";
+		break;
+
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -1919,6 +1928,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bdaddr_property_broken)
 			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
@@ -1952,6 +1962,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		break;
 
 	default:
@@ -2089,6 +2100,20 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.num_vregs = 0,
 };
 
+static const struct qca_device_data qca_soc_data_qca6698 __maybe_unused = {
+	.soc_type = QCA_QCA6698,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 5000 },
+		{ "vddbtcxmx", 126000 },
+		{ "vddrfacmn", 12500 },
+		{ "vddrfa0p8", 102000 },
+		{ "vddrfa1p7", 302000 },
+		{ "vddrfa1p2", 257000 },
+	},
+	.num_vregs = 6,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2179,6 +2204,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCA6698:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2333,6 +2359,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 	case QCA_QCA6390:
+	case QCA_QCA6698:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2346,6 +2373,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
@@ -2380,7 +2408,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 					       GPIOD_OUT_LOW);
 		if (IS_ERR(qcadev->bt_en) &&
 		    (data->soc_type == QCA_WCN6750 ||
-		     data->soc_type == QCA_WCN6855)) {
+		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCA6698)) {
 			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
 			return PTR_ERR(qcadev->bt_en);
 		}
@@ -2393,7 +2422,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (IS_ERR(qcadev->sw_ctrl) &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
-		     data->soc_type == QCA_WCN7850)) {
+		     data->soc_type == QCA_WCN7850 ||
+		     data->soc_type == QCA_QCA6698)) {
 			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
 			return PTR_ERR(qcadev->sw_ctrl);
 		}
@@ -2475,6 +2505,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6698:
 		if (power->vregs_on)
 			qca_power_shutdown(&qcadev->serdev_hu);
 		break;
@@ -2669,6 +2700,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
+	{ .compatible = "qcom,qca6698-bt", .data = &qca_soc_data_qca6698},
 	{ .compatible = "qcom,qca9377-bt" },
 	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
-- 
2.25.1


