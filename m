Return-Path: <linux-arm-msm+bounces-82013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B479BC62140
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 03:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D9D84E710E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 02:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A76243958;
	Mon, 17 Nov 2025 02:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd82atw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965261E3DE5;
	Mon, 17 Nov 2025 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345820; cv=none; b=RrlZS0c9Ee/Pk1XM7jH9/KptbkApzVyw0OtDm/V0LcqX1zDoo28jj/9yGBTnsR4ANYVK8kjdO3P7WFvAuAuyH1WjIQjjfMfYnE/xLvtHh90hwp/lCcNkqqei5nO6amhWH5d4YDF6mqTRfaLSqSZ4xcG/9+KAnyq+VrjavedOtME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345820; c=relaxed/simple;
	bh=Rx900UmhktNpwXcg60MQFit86edv3x5igmZ3sZFFEg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQXeKVqsdrf9QLQ8nafUCqBIlGTbsSCN8I4SmYzd86uB8qL+DLUzztzzOXGBlk3+RieeH9nfpkCK/5YrvLsPhI/pD7wyUanggVR0xZwUL60xfPUZ6gErtLFEB9QTmMtCz7mkRkWa4xaiwHchu7j7xDyHsFg5NvKW3nUYE+C1Q9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd82atw0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGKQNEx1882721;
	Mon, 17 Nov 2025 02:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3oJmDOKHYr+
	dxjccUVFiWGkGsLVRzUKp7PTRUBXg3CU=; b=Hd82atw0hdWHwzpDWt+J8MexvvV
	9Rl1nBMImZAH13JRr1pHrWUZxFwDMQ777lvJlBRLuIVL9SMbSTfJLzQOQ/m1YiZ7
	rbzY6cDgBf31w2BNdD8UHoZ5BAN0L6TIh0iYucxHemLmoy+HLMDxHYJ8HT56dQB/
	QWghFNjGpURKVDnzWb+f5yY/oTnwaIBucqZtOdqTkWZtHkn5J7OPbtY1odyCydOX
	SvHtIxki5IORTp0nOvibBpIGj+RP3LTXbD1HogHvSn1IkvD2lAI9Eecb0uPhAD7v
	2neI+EzJOvABGjMmA4cSNsP0olOfv1wAlNURKb39V7TnLxfzTd/k2UG0H4w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcb1qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:54 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH2GpgX016816;
	Mon, 17 Nov 2025 02:16:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aejkm5jk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:51 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AH2Gpc3016805;
	Mon, 17 Nov 2025 02:16:51 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AH2Gonn016795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:51 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id EB34B216B6; Mon, 17 Nov 2025 10:16:49 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Mon, 17 Nov 2025 10:16:45 +0800
Message-Id: <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zxzzd--2aN5fuVZAdEujioD-ZJ1ghDox
X-Proofpoint-GUID: zxzzd--2aN5fuVZAdEujioD-ZJ1ghDox
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691a8596 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=mafMjTZoDSqqSwhiDToA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAxNyBTYWx0ZWRfXzo1jMvpI9/J6
 Ug+5qnIlwtvk4M60ndR/9GcMkfXezBS7JU/EtwdJ19oNq9IfzP0fTcFXUV5A4QW0Co1WLgVHkr/
 mGF0wsPrbhQQag4tjJdO/erW+asXW6kkcExMo5WE7C1SlSCpD/YEzZETjJ42XxCCnlFmDEj28pP
 S24xoPl8rA2Lh9RGancl0lQChYvafufzGDDTxEBdkDKtrTwSzJM1GdwFmfI3rALb4n/QvvmUQjU
 1UhZn54RYJk3QqO83a2VL/alNOaSGEx/S/GgTcI4Day8BMKVxz6/x/aKVEytC24sEqKZz6KlgCZ
 zTWus+MzXiK7c7Lri4iE0sGzbcfiU9evclrnQSC8NOtQNcedq6UUk8xNn7Cwp8ec0xl5DCN3i7A
 VmKeXdgPNYBHl0cveEdQIFBowo09KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170017

Historically, WCN685x and QCA2066 shared the same firmware files.
Now, changes are planned for the firmware that will make it incompatible
with QCA2066, so a new firmware name is required for WCN685x.

Test Steps:
 - Boot device
 - Check the BTFW loading status via dmesg

Sanity pass and Test Log:
QCA Downloading qca/wcnhpbftfw21.tlv
Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
QCA Downloading qca/hpbftfw21.tlv

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


