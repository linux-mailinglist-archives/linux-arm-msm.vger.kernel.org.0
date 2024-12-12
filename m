Return-Path: <linux-arm-msm+bounces-41759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A739EE9C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4865D1889E74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D9A21E086;
	Thu, 12 Dec 2024 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dn+AbNx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B121B90B;
	Thu, 12 Dec 2024 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015791; cv=none; b=ICsy+aTr9g3pCmFaGXeBZOschEfCHcYtEcl9anIhNCVxJJFGXUIPzPDp1NJdPHOpMxv4/+MRyBfjxux3C/KkNS8unM18vpQUnTamFiynGT7WBDRlcsrA+2UTSg3G3eT5sGk4Wg2xOXBSBL8M9IATtqSbDMpFE8BQBKJFkOumLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015791; c=relaxed/simple;
	bh=87n7Ciwfuf+E6QL4TY3C4iM5hPcdPrNUCFGiday0KiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HB1Fpl5Su2aBTEZXsZiBoahv1FWHl1pR7G0eR5oBbvGDOLm+FgzmHnrUdGNleZPDY2bDTz1LFoWVU5vj9N0OJIS3z5svg2QaUaLsQouibBVks1ZRsxhKMGAEeTMjnlccgrSRZ8j48iWTuEXDYKFxE38RPcOx/cr8CzjS8i/3cO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dn+AbNx/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7oP2t002038;
	Thu, 12 Dec 2024 15:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUAJIPZI5aZWXGUlDRPwzc2C8DYkMrJOoPmPnb9J+Jk=; b=dn+AbNx/QVCtyQFo
	TbqY9rXFIeRhx2dXAwvIVkyVcCIsl82ViR1betsSPVdUVUtdQPb+md+KPwEhu+Hc
	uKxYFjoidMBHDwCFnWvpRE2wrgKYvnt+RoA1QjIGDZkPA9NdESHBxWKNkqkVJQMF
	iQcF2j/1v7w/zV/A+IIhKQX/h4lFYUieIRvgAeCA47GI4oiPE24s0Ki5GYo0nouM
	r7yDAfhpeAOF6zfbp5RTYSumeDkzcbH7nFADH82VEaHe7BWaTD1rNpc1+4t4l6jH
	r72ku6/rpUm1MmoXvn4pQsNAP1bgGnFpY9yyndsZVkHO28BK+ae/XlCPXNYxMEvE
	cKeKsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg65vda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:03:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCF33Nb000535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:03:03 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 07:02:58 -0800
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
Subject: [PATCH v5 3/4] Bluetooth: qca: Expand firmware-name to load specific rampatch
Date: Thu, 12 Dec 2024 23:02:31 +0800
Message-ID: <20241212150232.3823088-4-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-GUID: T2KyfO4iOLx6kA8y5yR1lJu-tyqwRgun
X-Proofpoint-ORIG-GUID: T2KyfO4iOLx6kA8y5yR1lJu-tyqwRgun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

The firmware-name property has been expanded to specify the names of NVM
and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
chip. Although it shares the same IP core as the WCN6855, the QCA6698
has different RF components and RAM sizes, necessitating new firmware
files. This change allows for the configuration of NVM and rampatch in
DT.

Possible configurations:
firmware-name = QCA6698/hpnv21.bin, QCA6698/hpbtfw21.tlv;
firmware-name = QCA6698/hpnv21, QCA6698/hpbtfw21.tlv;

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 drivers/bluetooth/btqca.c   | 82 +++++++++++++++++++------------------
 drivers/bluetooth/btqca.h   |  5 ++-
 drivers/bluetooth/hci_qca.c | 22 +++++++---
 3 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 4842f4335..709e872bc 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -781,7 +781,7 @@ static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
 
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
-		   const char *firmware_name)
+		   const char *firmware_name, const char *rampatch_name)
 {
 	struct qca_fw_config config = {};
 	int err;
@@ -810,44 +810,48 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
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
index 37129e6cb..5d75087cc 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -228,7 +228,7 @@ struct qca_serdev {
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
-	const char *firmware_name;
+	const char *firmware_name[2];
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
@@ -258,7 +258,18 @@ static const char *qca_get_firmware_name(struct hci_uart *hu)
 	if (hu->serdev) {
 		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
 
-		return qsd->firmware_name;
+		return qsd->firmware_name[0];
+	} else {
+		return NULL;
+	}
+}
+
+static const char *qca_get_rampatch_name(struct hci_uart *hu)
+{
+	if (hu->serdev) {
+		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
+
+		return qsd->firmware_name[1];
 	} else {
 		return NULL;
 	}
@@ -1855,6 +1866,7 @@ static int qca_setup(struct hci_uart *hu)
 	unsigned int retries = 0;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	const char *firmware_name = qca_get_firmware_name(hu);
+	const char *rampatch_name = qca_get_rampatch_name(hu);
 	int ret;
 	struct qca_btsoc_version ver;
 	struct qca_serdev *qcadev;
@@ -1963,7 +1975,7 @@ static int qca_setup(struct hci_uart *hu)
 
 	/* Setup patch / NVM configurations */
 	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
-			firmware_name);
+			firmware_name, rampatch_name);
 	if (!ret) {
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca_debugfs_init(hdev);
@@ -2309,8 +2321,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	qcadev->serdev_hu.serdev = serdev;
 	data = device_get_match_data(&serdev->dev);
 	serdev_device_set_drvdata(serdev, qcadev);
-	device_property_read_string(&serdev->dev, "firmware-name",
-					 &qcadev->firmware_name);
+	device_property_read_string_array(&serdev->dev, "firmware-name",
+					 qcadev->firmware_name, ARRAY_SIZE(qcadev->firmware_name));
 	device_property_read_u32(&serdev->dev, "max-speed",
 				 &qcadev->oper_speed);
 	if (!qcadev->oper_speed)
-- 
2.25.1


