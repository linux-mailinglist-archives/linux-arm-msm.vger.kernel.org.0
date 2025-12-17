Return-Path: <linux-arm-msm+bounces-85484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E52DECC77C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63D033004867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B4A34FF44;
	Wed, 17 Dec 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLLAxWRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C4D34F259;
	Wed, 17 Dec 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970962; cv=none; b=eQPAwDrnKP8XVz7rihMNE6AxDrXPTvoUzz8umRw3TL6UZx0cF6oFGw7P3SME9Sg8jZ9H4ZCHbpugmdi5/UbzWhHdk6auJIyeEn7scGNBAaJQqb21IYgOHu05AHUmfLbSRyFfW9PRfqeLtPXahmAcXj2aPVFdugorgkSbZYb2HqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970962; c=relaxed/simple;
	bh=gvKgHnT9KYzKy+cj0SoNOcXpS3/3uIb46dxlkr6QB2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yb/553JXmDYsZlXCbZGvDlaxJXTGjQYsgbYBMB5RaRfAYqlFf1UAuyqcnvKeHaDvj6PDhsUZm0S2ESthUxd2l7azsNma+9HERwwIJkQXr0FcfR6pUPlKHL9sc/ebf8dWm1hjnk5qCI30kWljfmtsW1ZJc80ASL/u51o1CU8oWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLLAxWRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAESLa1564870;
	Wed, 17 Dec 2025 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roY8r5ddpPV
	6XuUkspBkQ9t5XUicXErikNTk0rBcgzI=; b=kLLAxWRiXqpuPizoh3A4WdI2Khn
	ilUYER0peaGEeXE8xGEFs7fOsqIwtikCBJgOl6YOda8hXL442GQMrVM8FQ8oITWj
	i4STmhT94B1uG6aS/vX6U8k7oq6DL/Zr103mfab3ZKHG5vskwnvD3wxOznyD3R7Z
	+yWGDa2eCgUR8+1ekdHK6R1Ywqv+kQjWAX1GwfWldrp/KANhNn4GdwLPF1h4ugkm
	FNdjGMY0nJL4jnNqE83ekNMeCi+XqmeF3gBChSLoWdyXSDuFXMBVdnlGluWVOSXY
	DOXktdd1rAPBb35grSeuTIWMlJwauGOqIrZXMpKCcS70q6gm/5ZQCQQ9J+A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1dn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHBTBsr016715;
	Wed, 17 Dec 2025 11:29:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b3t8c8mrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BHBTBsL016708;
	Wed, 17 Dec 2025 11:29:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-vivesahu-hyd.qualcomm.com [10.213.96.223])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BHBTANo016707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3937004)
	id 78E9358F; Wed, 17 Dec 2025 16:59:10 +0530 (+0530)
From: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
Subject: [PATCH 2/2] Bluetooth: hci_qca: QCC2072 enablement
Date: Wed, 17 Dec 2025 16:58:50 +0530
Message-Id: <20251217112850.520572-2-vivesahu@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MCBTYWx0ZWRfX4hHcOJtSbSQp
 faMujPopFlERmPQNl8JlHax974NyU2G3o5Ak+L1Z1ZbPv4OnPxRfFFketFbq5cAigtndI81GwTO
 XnGxC5PcT3OkCXG8oTtCg8RVNs96PVORZofNszlwWx1yCDa/PVfNykNrN6DulcdA9U+9WlQJoFq
 52825wL9l2jSVRJPgJank97ohZp/QRwvvRFAniqywOSqcKwL2Wh3YrqPzXOeBlBPHWjn0alL1e2
 chAcuJXV6NPEGjI+DOxIATbgg16kfVVXs0hyOKnk3FXDpB8EDz3/LZ2wc5kORjgCu/evFiGw5VK
 jC+qZ130ZhGyQ+aifmHvZDN39wg9U0gDTWYBhERy8oqC4oXAAmBStbakl8UgcbXbbFJUT8NcFmM
 io9e2p7oF0/yL79evblLSCJQzu8CzQ==
X-Proofpoint-ORIG-GUID: UBimteLHDSxfrf1CUrfyoSnyh8rZJbru
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942940a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qjprw6iuBxiDLHx3XDMA:9
X-Proofpoint-GUID: UBimteLHDSxfrf1CUrfyoSnyh8rZJbru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170090

Adding support for BT SoC QCC2072.
Set appropriate configurations for BT UART
transport.

Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
---
 drivers/bluetooth/btqca.c   |  8 ++++++++
 drivers/bluetooth/btqca.h   |  1 +
 drivers/bluetooth/hci_qca.c | 17 +++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d6065be..7eb095db4a1d 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -854,6 +854,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/hmtbtfw%02x.tlv", rom_ver);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornbtfw%02x.tlv", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/rampatch_%08x.bin", soc_ver);
@@ -929,6 +933,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
 				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornnv%02x.bin", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 8f3c1b1c77b3..a175ac31e7b2 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -158,6 +158,7 @@ enum qca_btsoc_type {
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
+	QCA_QCC2072,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0faa9..1392a222ecd0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -629,6 +629,7 @@ static int qca_open(struct hci_uart *hu)
 		case QCA_WCN3991:
 		case QCA_WCN3998:
 		case QCA_WCN6750:
+		case QCA_QCC2072:
 			hu->init_speed = qcadev->init_speed;
 			break;
 
@@ -1506,6 +1507,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, true);
 			break;
 
@@ -1515,6 +1517,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 
 		switch (soc_type) {
 		case QCA_WCN3990:
+		case QCA_QCC2072:
 			reinit_completion(&qca->drop_ev_comp);
 			set_bit(QCA_DROP_VENDOR_EVENT, &qca->flags);
 			break;
@@ -1541,6 +1544,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, false);
 			break;
 
@@ -1550,6 +1554,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 
 		switch (soc_type) {
 		case QCA_WCN3990:
+		case QCA_QCC2072:
 			/* Wait for the controller to send the vendor event
 			 * for the baudrate change command.
 			 */
@@ -1919,6 +1924,9 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN7850:
 		soc_name = "wcn7850";
 		break;
+	case QCA_QCC2072:
+		soc_name = "qcc2072";
+		break;
 
 	default:
 		soc_name = "ROME/QCA6390";
@@ -1943,6 +1951,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
@@ -1977,6 +1986,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		break;
 
 	default:
@@ -2125,6 +2135,12 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.num_vregs = 0,
 };
 
+static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
+	.soc_type = QCA_QCC2072,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2723,6 +2739,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
 	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
+	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
-- 
2.34.1


