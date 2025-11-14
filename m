Return-Path: <linux-arm-msm+bounces-81800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B00C5BF55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D01903561D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90430285C8E;
	Fri, 14 Nov 2025 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4C8gxHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834C23E25B;
	Fri, 14 Nov 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108292; cv=none; b=MU5I5kpvas9ORs50Qo48IWXW1lFG7iJyOIfaFJq3eZMTYG9RzWIqNB+ARcRlsndpYSsSYswtP22chNEFCT+sXFxdIeZ1cNpz+565OoFw/1jAK5vL/1wNkbl1KdWPE9BZZA5neInoIq4Y5r5C6XDbgtPe++ez4O6ZnaFsVWDdeOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108292; c=relaxed/simple;
	bh=rbAlDdL9MMF25B6EoR34d58v2JHT2KUnHAr3E3DXNZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D4l0ahDOMTmPIyJXqxvuE8aOZoPnOatsFOp92OJzd+HbPl/10XkibIQRCKji1EgWDaV3Y/Lrpo1mVQ2JdEySvoh1MDN4xNnnIsKcNebgINN2wPziKYzj+qbJ3WB0oakjIpJH0YixLLRxtON2Xs7H7BKCOg4Yk4T69by7zdFtYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4C8gxHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb5iU1699799;
	Fri, 14 Nov 2025 08:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eZ6OLS9Ndb6
	8+TlAt0dnmMmxvTIl3QWJjkZdmgWlVnk=; b=h4C8gxHPW2pzDn2TD91VugGXM33
	c/sx+cCGBMSxSqSmbjxuEjl5crycnYxbcmWP7jlgIQnkErx/sv1P8uxjcZuVHrYy
	hLfDfNKaIfffW+6qeZRT/eNlp0ShNTs9icVGKsY+se/IQWrdy74z/+IyUYkabbGk
	f8Dr6QC5+nGAH8Q0GLcXSBsKmq33kL2HqhiGGDBE0BYCRE5YlX9rZDBZ9+DV0Q1s
	g5VTLYxwyR0zBKoM7123BgJbNG7/1f+KOVYzQBN65q60ZH7wGIcJq5wAGNwzrZj9
	juKgsHemVYYWapq8mlUxRQ4jrpwfmNwDNd6SckLSUAiDUR6JCZ8dQ9roOXg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e1dmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:56 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8HsYs009839;
	Fri, 14 Nov 2025 08:17:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxmw3jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:54 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8Hsq2009834;
	Fri, 14 Nov 2025 08:17:54 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AE8HrR9009829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:54 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id D89532162B; Fri, 14 Nov 2025 16:17:52 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v2 1/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Fri, 14 Nov 2025 16:17:51 +0800
Message-Id: <20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
References: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 70Ewoi4_ybGAD2RU4l3W30FcmzeTfBFt
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=6916e5b4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mafMjTZoDSqqSwhiDToA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 70Ewoi4_ybGAD2RU4l3W30FcmzeTfBFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NCBTYWx0ZWRfX6LRijPFzo2f4
 bG5htdG59xhfyzQrifdCg8HWymRa8vzpb+mmymZRRlywKen/O1QMU2aTIYt61ZwRcvYbHnEs0je
 TWnoe8kktZlgLcOPplyWUI8NLsn9AfM0z9RA96SYTROoOcgbh4DI9NSp17qnmv06i4PI61WwjwR
 etVo16zJFrgrN6nWTw6RbRZkmtWf2w7ZKPq3X92TCTJvkzBANcgXLV0eTyBXS4HQvFMz90hz8Pu
 sFzO/VglZ2P/JxhnA3E4m4FgfA8BDMG+BmduykP3INEGDskZq+XtIA9Fk+KtHwL7ohbLsQ0hPRN
 IzYd/FwoRStx21bKVwEamgMMcXDmt+MkIIheYgYgpSIlRXl6WeSGBvrCu1dQMR8vThCquZLa0v5
 7r3qnMbCTAlayXG5IF5Qkuuc6NHj6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140064

The prefix "wcn" corresponds to the WCN685x chip, while entries without
the "wcn" prefix correspond to the QCA2066 chip. There are some feature
differences between the two.

However, due to historical reasons, WCN685x chip has been using firmware
without the "wcn" prefix. The mapping between the chip and its
corresponding firmware has now been corrected.

Cc: stable@vger.kernel.org
Fixes: 30209aeff75f ("Bluetooth: qca: Expand firmware-name to load specific rampatch")
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..8e0004ef7 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 "qca/msbtfw%02x.mbn", rom_ver);
 			break;
 		case QCA_WCN6855:
+			/* Due to historical reasons, WCN685x chip has been using firmware
+			 * without the "wcn" prefix. The mapping between the chip and its
+			 * corresponding firmware has now been corrected.
+			 */
 			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/hpbtfw%02x.tlv", rom_ver);
+				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
 			break;
 		case QCA_WCN7850:
 			snprintf(config.fwname, sizeof(config.fwname),
@@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+
+	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/hpbtfw%02x.tlv", rom_ver);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	}
+
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
 		return err;
@@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN6855:
 			qca_read_fw_board_id(hdev, &boardid);
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
-						  "hpnv", soc_type, ver, rom_ver, boardid);
+						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
 			break;
 		case QCA_WCN7850:
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+
+	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
+		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+					  "hpnv", soc_type, ver, rom_ver, boardid);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	}
+
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
 		return err;
-- 
2.34.1


