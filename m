Return-Path: <linux-arm-msm+bounces-87371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E508CF207E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80EC730115FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFCB326941;
	Mon,  5 Jan 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhM2mpSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAE325716;
	Mon,  5 Jan 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767592619; cv=none; b=k9CaR+M9emv7YibnPqAIMq2pqFXZhCBbC//CsTavBOccVxYZl/h22NMnUGJuDljUFGievYIXlXoBwRihve2c846N+Te3vqNnD9fgyvcbSdFI7ISEVXLsmjv2E6KrdOoJ0vktS8K/N9cSTnFUd8vdD69QpbhsGZtLKqC8bOdV/tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767592619; c=relaxed/simple;
	bh=G0EsoosuSJg449u8zoKgohNmM9JqczPmrOHFPN90yOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lu3wj/zVbUko/sl+51wAB2VYAl0D+zK1im/Z6eo+S1LY1IAxeHQSy2gwy9CAUbo7sLE0kqK1mJ71P76iP+mtiDQzYpuLInx/oZWTMUtQFPcDgfQ4iYL6htkPWlJbQRR4X/3+JmuLxyn4U2jbPGXdoXzwS0xEc4KAkXZ/4P8qLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhM2mpSi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6055ahGN4033980;
	Mon, 5 Jan 2026 05:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c3OZMNtze/h
	uDXlBYx+CQfUVJ8ranKixGtmGrENKRtY=; b=BhM2mpSiupY4NvEmXaNNpGfUw6j
	pnDwl0uyCgw88PKV4bNmL0LftG6CMM+JDTkLCKKD92vOJiidqtiIhe1acRTMbipb
	hiVyoiIcuyBZpOsarY5o/ebQbOeo+Qj4bADEJjQlVmJsJWG8vpOxSQieLBZKGg+R
	08SYVFLdpJwfhoJHpLZuHyur3qL14qMLAB8qdMLIIrGS47HQ6uK5eWiIgUlELGS3
	AKCJ+1rqcvqU997HqIirZsVYQRU5UImnDOMetFrV+Aq65wQ8L6XbGtgmnNjfsJ5V
	8ehOMPwrKdnEfUP4RbtUvjOMjbVziWvB+6T8UEeFUR4JBvsw+3td7/Yoi5Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79ng1km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6055unum023092;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kqfhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6055unGY023080;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6055un82023077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 8145B23A88; Mon,  5 Jan 2026 13:56:48 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v6 2/2] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Mon,  5 Jan 2026 13:56:46 +0800
Message-Id: <20260105055646.3816296-3-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
References: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: FTdLS9R39rxOFdVN2eVmYRC0Vp6iMjnQ
X-Proofpoint-ORIG-GUID: FTdLS9R39rxOFdVN2eVmYRC0Vp6iMjnQ
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695b52a4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=DOZn36BnpeV1FG4xDvsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA1MyBTYWx0ZWRfX3lWoi00R2ZfZ
 t/itvw5vyJH2iwwwmBkk/76af4O4k7Kn/ukmOXyO2C6h/ZpRyop5xUhCRd90NmhMPsQMu5J/yvV
 8vqlYwT+ASLrTnooCTzsM9qtdRbPjiM7jflDxOY4DWKvCl2opILwDhVco5hxRhtMcVF7rTb8DaB
 YC+iUBVIGeaeIjy1plndzE4eWoqdl4NLNOHoQgJFymL5pXY01Zj+Z/PH/5TZ+Ei3Ps/prctecFc
 KEduwrbiuvWFwtsg1/628Af4mr/rTrE9d3pr1wF1fmKq6TJwSz6pb/rEe5dlkV7MBGWq4h5U7AK
 gO7yML2BWevZ9wWA0mRsfjXwocpJl1gHw0awAXTGFaPIwVakMWQa8Ox1bomDVHdVH/FOnlY0rAS
 GQgNUhQlJJUxFlrogEW/LI/Sl0eiDyuFv91evbqn5rsP6ixuXajbT+fn+IGXuInYH1Lk4aNsO+P
 lVx+gnfQ0Jc/7SMA3bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050053

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
 drivers/bluetooth/btqca.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 561e51fa9..1617f41d8 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -830,8 +830,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
@@ -855,6 +859,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			 "qca/msbtfw%02x.tlv", rom_ver);
 		bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
 		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	} else if (err < 0 && !rampatch_name && soc_type == QCA_WCN6855) {
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/hpbtfw%02x.tlv", rom_ver);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	}
 
 	if (err) {
@@ -920,7 +928,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN6855:
 			qca_read_fw_board_id(hdev, &boardid);
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
-						  "hpnv", soc_type, ver, rom_ver, boardid);
+						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
 			break;
 		case QCA_WCN7850:
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -933,8 +941,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
-	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
+	if (err < 0 && !firmware_name && soc_type == QCA_WCN6855) {
+		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+					  "hpnv", soc_type, ver, rom_ver, boardid);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	}
+
+	if (err) {
+		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+			   config.fwname, err);
 		return err;
 	}
 
-- 
2.34.1


