Return-Path: <linux-arm-msm+bounces-40477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACB9E5218
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A3018824DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8111DB92E;
	Thu,  5 Dec 2024 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PIa+JIb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2D1D5AD1;
	Thu,  5 Dec 2024 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394196; cv=none; b=Mp/C9+OnhnYI0T2bs2j5Ne1KxP4Xv+535C1PqQRKu1gFhxMDvhCT7k4v5lV2DmBLuT3/ZW1pjsSh5ZkLty3C91baAa4LzjbWYvGqP+hb+cQ+GOgwH/9Wz1mTSq+ICUuQcPWkSj8Kbp8gIY3U71h2vQzhHE/8qKv+h10JWCOF7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394196; c=relaxed/simple;
	bh=4g5kMABRd0SiueP58Bm26/YnShwEkEKsPdekq+WlQ/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOArYk3OqIuoeAwCok4NQFcjUbeQvIi3BSpFj/ewv3TqV5L1Nn4lDdpYUa9P2Uy7JKCaU199IdaLSWoPspE9T54VNTHkPPYqe1+L88IlRj7Zqjpl/I6mhz/tbanIK7zxMBdPf0O9HPQDbEZfzfxk86us4/DiMQb0mQRWuK5ps3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PIa+JIb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59vkhY026596;
	Thu, 5 Dec 2024 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuhErQvlROxsPP3aETTCQNbKhSkWNSqWDNmL2EsIYwM=; b=PIa+JIb+lYDznZVD
	zJYLb3L8aTAqsdSQKpsMy1ePwZ+pqD0xLRjelHfIYDvQVX4s5Q676iKyqD/C57er
	JmeahpCA1VDN9kBuw3Weo6xIP63ZFVbYzUilsW/tAm4rkqy2dDwobgDGHbe0avwH
	rJRGS298DP99Xj9DEvjzm+ojXaVf0SVAln6MxrI990mvWI2X4xjqEPO44OsMt/sM
	b/weXMeKgUyaH71R2ssKr25o6jSduieKyIqGAN+qUEOauYuzQ8JgRhxMgBYe3IHw
	ibYnao3A848xewXjKhlmFwcaqVIDq3oCjIeuxpoosAbBo2dh5LG26Xix9hKCh/1U
	+xdFnA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kg259-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:23:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AN7mS004821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:23:07 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 02:23:02 -0800
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
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
Subject: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load specific nvm and rampatch
Date: Thu, 5 Dec 2024 18:22:12 +0800
Message-ID: <20241205102213.1281865-3-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dG53Vp6rkGjJz41XvGeRmY0Xh5WtHLgT
X-Proofpoint-GUID: dG53Vp6rkGjJz41XvGeRmY0Xh5WtHLgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050073

The firmware-name property has been expanded to specify the names of NVM
and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
chip. Although it shares the same IP core as the WCN6855, the QCA6698
has different RF components and RAM sizes, necessitating new firmware
files. This change allows for the configuration of NVM and rampatch in
DT.

Different connectivity boards may be attached to the same platform. For
example, QCA6698-based boards can support either a two-antenna or
three-antenna solution, both of which work on the sa8775p-ride platform.
Due to differences in connectivity boards and variations in RF
performance from different foundries, different NVM configurations are
used based on the board ID.

Therefore, in the firmware-name property, if the NVM file has an
extension, the NVM file will be used. Otherwise, the system will first
try the .bNN (board ID) file, and if that fails, it will fall back to
the .bin file.

Possible configurations:
firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21.bin";

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
 drivers/bluetooth/btqca.h   |   5 +-
 drivers/bluetooth/hci_qca.c |  21 ++++-
 3 files changed, 134 insertions(+), 46 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dfbbac922..e8b89b8cc 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
+static int qca_get_alt_nvm_path(char *path, size_t max_size)
+{
+	char fwname[64];
+	const char *suffix;
+
+	suffix = strrchr(path, '.');
+
+	if (!suffix)
+		return 0;
+
+	strscpy(fwname, path, strlen(path));
+	fwname[suffix - path] = 0;
+
+	snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
+
+	/* If nvm file is already the default one, return false to
+	 * skip the retry.
+	 */
+	if (strcmp(fwname, path) == 0)
+		return 0;
+
+	snprintf(path, max_size, "%s", fwname);
+	return 1;
+}
+
 static int qca_tlv_check_data(struct hci_dev *hdev,
 			       struct qca_fw_config *config,
 			       u8 *fw_data, size_t fw_size,
@@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
 					   config->fwname, ret);
 				return ret;
 			}
+		}
+		/* For nvm, if desired nvm file is not present and it's not the
+		 * default nvm file(ends with .bin), try to load the default nvm.
+		 */
+		else if (config->type == TLV_TYPE_NVM &&
+			 qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
+			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
+			ret = request_firmware(&fw, config->fwname, &hdev->dev);
+			if (ret) {
+				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+					   config->fwname, ret);
+				return ret;
+			}
 		} else {
 			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
 				   config->fwname, ret);
@@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
 			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
 }
 
+static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
+		const char *firmware_name, struct qca_btsoc_version ver,
+		enum qca_btsoc_type soc_type, u16 bid)
+{
+	const char *variant;
+
+	/* Set the variant to empty by default */
+	variant = "";
+	/* hsp gf chip */
+	if (soc_type == QCA_WCN6855) {
+		if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
+			variant = "g";
+	}
+
+	if (bid == 0x0)
+		snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
+	else if (bid & 0xff00)
+		snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
+	else
+		snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
+}
+
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
-		   const char *firmware_name)
+		   const char *firmware_name, const char *rampatch_name)
 {
 	struct qca_fw_config config = {};
 	int err;
 	u8 rom_ver = 0;
 	u32 soc_ver;
 	u16 boardid = 0;
+	const char *suffix;
 
 	bt_dev_dbg(hdev, "QCA setup on UART");
 
@@ -761,44 +822,48 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	/* Download rampatch file */
 	config.type = TLV_TYPE_PATCH;
-	switch (soc_type) {
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/crbtfw%02x.tlv", rom_ver);
-		break;
-	case QCA_WCN3988:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/apbtfw%02x.tlv", rom_ver);
-		break;
-	case QCA_QCA2066:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/hpbtfw%02x.tlv", rom_ver);
-		break;
-	case QCA_QCA6390:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/htbtfw%02x.tlv", rom_ver);
-		break;
-	case QCA_WCN6750:
-		/* Choose mbn file by default.If mbn file is not found
-		 * then choose tlv file
-		 */
-		config.type = ELF_TYPE_PATCH;
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/msbtfw%02x.mbn", rom_ver);
-		break;
-	case QCA_WCN6855:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/hpbtfw%02x.tlv", rom_ver);
-		break;
-	case QCA_WCN7850:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/hmtbtfw%02x.tlv", rom_ver);
-		break;
-	default:
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/rampatch_%08x.bin", soc_ver);
+	if (rampatch_name) {
+		snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
+	} else {
+		switch (soc_type) {
+		case QCA_WCN3990:
+		case QCA_WCN3991:
+		case QCA_WCN3998:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/crbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_WCN3988:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/apbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_QCA2066:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hpbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_QCA6390:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/htbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_WCN6750:
+			/* Choose mbn file by default.If mbn file is not found
+			 * then choose tlv file
+			 */
+			config.type = ELF_TYPE_PATCH;
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/msbtfw%02x.mbn", rom_ver);
+			break;
+		case QCA_WCN6855:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hpbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_WCN7850:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hmtbtfw%02x.tlv", rom_ver);
+			break;
+		default:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/rampatch_%08x.bin", soc_ver);
+		}
 	}
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
@@ -816,8 +881,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name) {
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/%s", firmware_name);
+		/* The firmware name has suffix, use it directly */
+		suffix = strrchr(firmware_name, '.');
+		if (suffix && *(suffix + 1) != '\0' && *(suffix + 1) != '.') {
+			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
+		} else {
+			qca_read_fw_board_id(hdev, &boardid);
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+				 firmware_name, ver, soc_type, boardid);
+		}
 	} else {
 		switch (soc_type) {
 		case QCA_WCN3990:
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index bb5207d7a..9d28c8800 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -161,7 +161,7 @@ enum qca_btsoc_type {
 int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
-		   const char *firmware_name);
+		   const char *firmware_name, const char *rampatch_name);
 int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
 			 enum qca_btsoc_type);
 int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
@@ -176,7 +176,8 @@ static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdad
 static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 enum qca_btsoc_type soc_type,
 				 struct qca_btsoc_version ver,
-				 const char *firmware_name)
+				 const char *firmware_name,
+				 const char *rampatch_name)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 37129e6cb..c566d0bf2 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -229,6 +229,7 @@ struct qca_serdev {
 	u32 oper_speed;
 	bool bdaddr_property_broken;
 	const char *firmware_name;
+	const char *rampatch_name;
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
@@ -264,6 +265,17 @@ static const char *qca_get_firmware_name(struct hci_uart *hu)
 	}
 }
 
+static const char *qca_get_rampatch_name(struct hci_uart *hu)
+{
+	if (hu->serdev) {
+		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
+
+		return qsd->rampatch_name;
+	} else {
+		return NULL;
+	}
+}
+
 static void __serial_clock_on(struct tty_struct *tty)
 {
 	/* TODO: Some chipset requires to enable UART clock on client
@@ -1855,6 +1867,7 @@ static int qca_setup(struct hci_uart *hu)
 	unsigned int retries = 0;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	const char *firmware_name = qca_get_firmware_name(hu);
+	const char *rampatch_name = qca_get_rampatch_name(hu);
 	int ret;
 	struct qca_btsoc_version ver;
 	struct qca_serdev *qcadev;
@@ -1963,7 +1976,7 @@ static int qca_setup(struct hci_uart *hu)
 
 	/* Setup patch / NVM configurations */
 	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
-			firmware_name);
+			firmware_name, rampatch_name);
 	if (!ret) {
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca_debugfs_init(hdev);
@@ -2309,8 +2322,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	qcadev->serdev_hu.serdev = serdev;
 	data = device_get_match_data(&serdev->dev);
 	serdev_device_set_drvdata(serdev, qcadev);
-	device_property_read_string(&serdev->dev, "firmware-name",
-					 &qcadev->firmware_name);
+	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
+					 0, &qcadev->firmware_name);
+	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
+					 1, &qcadev->rampatch_name);
 	device_property_read_u32(&serdev->dev, "max-speed",
 				 &qcadev->oper_speed);
 	if (!qcadev->oper_speed)
-- 
2.25.1


