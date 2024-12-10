Return-Path: <linux-arm-msm+bounces-41328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5B9EB485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32B91694E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CBF1B86EF;
	Tue, 10 Dec 2024 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VuWFYm+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78E1C07D9;
	Tue, 10 Dec 2024 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843872; cv=none; b=TkEfcYE/lcwalOOGQfrk4EFdzKuUq+0B1MLMGlS0y7OI1OTUksP3RE/5gelEiZJ3amg44GcDE0IwxstYTb+uWYdQ7e5LMY0AdczntYc8cRomx/cMF00DB/gJeFmyFMJuZ29p5dKF3OP6pZh0mesdCtYuNg6ozA3bQINeSAXzyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843872; c=relaxed/simple;
	bh=/3wmrizKspkbGRRI8WGwJ/9GQKeylh4aPdZB4tKobxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oY7CnyacoCKpiZKjR5m9JO0bOrE6geq49muZ7F02MVdwFCoBZ8SOPa/UxymTPCpanQp7QQi+LOQCfPxDKWPVWO9kNKB7auxJn9v+b2NDXhDV27kYL0x3K4l5UIQmQ/KjCx0vv8GJhCMM9/BzAqmudaj0xhDpbGATuPsTpJs8DBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VuWFYm+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAArdpU021040;
	Tue, 10 Dec 2024 15:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3CJLID/j92qNSGch5SvxcLnKteKD1ilUybawZgoXQf4=; b=VuWFYm+PSwybGWdg
	TGpoCCbG5OlVpOie+S+qbD0P+HZKbeyT0zB+ZfWXgz2mg9fw3dZ2aIeedxMlNoRQ
	dAYNBPSNX/G7iT7jdqQjEG8kqsNic8hyr4tZjg2yOdZ8KgX+6HE8PSuJj9cZI5qN
	Yf1xBalwy09JWRZ2CELglQMO3CoEg+uedQgvLE/P1lf2SCvqyZx2T71qA8bfZzO6
	OApwDhfFb8iCPXpzyxuW8tVEYoLJPOMvRO3QJW1L5CN7hNXec9eLzXHLBuHdsvL4
	8ZoAreA2eaeDtS8ZGRexxSkguW36lTHhXC3m4XawwWerX0Ycu1PKMSiq4Nr/vwFb
	WGipIA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3abfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAFHi6q026604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:44 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 07:17:40 -0800
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
Subject: [PATCH v4 3/4] Bluetooth: qca: Expand firmware-name to load specific rampatch
Date: Tue, 10 Dec 2024 23:16:35 +0800
Message-ID: <20241210151636.2474809-4-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 461g8EqiyU1cdV4eJBuXeRMeFS7cCSNU
X-Proofpoint-GUID: 461g8EqiyU1cdV4eJBuXeRMeFS7cCSNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100114

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
index deb2b1753..8dfc2c084 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -786,7 +786,7 @@ static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
 
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
-		   const char *firmware_name)
+		   const char *firmware_name, const char *rampatch_name)
 {
 	struct qca_fw_config config = {};
 	int err;
@@ -816,44 +816,48 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
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


