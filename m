Return-Path: <linux-arm-msm+bounces-87070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B19CEB803
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A4F43050CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF043128B4;
	Wed, 31 Dec 2025 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2axkBvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4705B312824;
	Wed, 31 Dec 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167923; cv=none; b=h1bxM5RWZnAi0cu27rFt+4+L4r3mo0REffneGWrVgKPgMoqwtu5HM8yH7WaUwgtfsbukbmBj3uc7KOGcRemgTQGdhcahxQsD0xfUiT/f3Pf57kXLQ7ykCSzVg9K47WfcEgPwSQmGTiAB8uHouOUV1/wZrLndkc2Zm2CI8T6las8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167923; c=relaxed/simple;
	bh=uO3NwiUzESKk4UruSiilOU0iWeghOPAdtWcn9tUOdx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fPEnnRplmCOPhLyTwoDGzlNfXfYA4WyVxnfif4dgRykERVhNOX491CVXVHh+ocPDLBuNM35zb2k89LTjumYhID1FYOi142CqzCTCT8XH3hGppEO1R5a9UNWyuir3H/y859Lr6gLPLS/CBxYnCN4KuQytkyQPFZLEbltm3Q/JNcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2axkBvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV5CtpY2017232;
	Wed, 31 Dec 2025 07:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kUIQw18IeW7
	q9+t5qiN9WDpfxLcw4ZXgMxUYXjDUsF4=; b=X2axkBvRqXH3L9h3LDHead4/EpZ
	fJw3RhbLyOeZUp04gDnxEr8dIZ1BUjAfaBn8es8kI3tq3hMX+RXHxtEqbCCcBkkR
	QVA8cZgQLONpToWz8DZK6nu9BBznm94p0tTZIAj4CNNSAznAKnvSfQWhQjDYdHO1
	bZtxFx96GKe+DwxGduiYyCbYcHnSFkY9FwUlx1Ky3MDVAcWLfkoj+aidRack3sk/
	K5ise2myWiwv+GaEh6p62UDhLB4tT2zsvBIfzJoupEYj1+38b/mcR/XEIZOHhGZ2
	Fqcl3nc8n3/UiW++4LM5CLL0r8y49U5E5GA01uev4194CEzjs6F5miRfWjg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4age4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BV7wTRY023887;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ba8hm6q0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BV7wTxU023866;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BV7wSGt023860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 222B5234D6; Wed, 31 Dec 2025 15:58:28 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v5 2/2] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Wed, 31 Dec 2025 15:58:17 +0800
Message-Id: <20251231075817.2611848-3-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DbAgooC9p8QWqBeaPl0raQibVw9chrzy
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=6954d7a7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=J33uPIFZB4DXoutAECoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA2NyBTYWx0ZWRfXyRAVUbyLS2nu
 GIdxknhX8kX+zeWJJG14GMqmYwrfzXOOWiWqHfdsG1k4FhVj57VzZEN/OinZdeYBPCIjUn5pWMA
 4vE1vLm4KgcPLzvRy310oLggFuELQ0ug7EPd5kl63i1Xm3gEO4DO/jhYL8eeY5ST2gEq30nY1Ri
 jA1gV2/PxwBCuWJPDq6SiCmRYS4hLQVBTjXSj2621dfQm7s6V2Dkk10SxsWjz0em3ZiX3Uhhol7
 E+RHZ+vWaQQXauDoZOOrbyRoWZxrHZ3fAwnRHdAzUos09nXW+/X03efxPv0LH5qSuV0yheoypNL
 57iICZ1YugwoJ4+Y06lJ55AGDQ/3oi82v+VC6e9BQ2ZIyAyIQYaMkNtWk5PUSX3SRfPoYAFqSph
 dC3dBgK5u1yNlbtuKbET6xkAQw5jfQKmVT2ldktSrspaLtH/vp2FEl9soqms0XfAGxRYxqy2GlY
 co5GKckbfxAAAV5lA+g==
X-Proofpoint-GUID: DbAgooC9p8QWqBeaPl0raQibVw9chrzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310067

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
 drivers/bluetooth/btqca.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index b4c0a018d..9383c8dde 100644
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
@@ -856,6 +860,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 "qca/msbtfw%02x.tlv", rom_ver);
 			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
 			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+		} else if (!rampatch_name && soc_type == QCA_WCN6855) {
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hpbtfw%02x.tlv", rom_ver);
+			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 		}
 
 		if (err) {
@@ -922,7 +930,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN6855:
 			qca_read_fw_board_id(hdev, &boardid);
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
-						  "hpnv", soc_type, ver, rom_ver, boardid);
+						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
 			break;
 		case QCA_WCN7850:
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -936,8 +944,17 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
-		return err;
+		if (!firmware_name && soc_type == QCA_WCN6855) {
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+						  "hpnv", soc_type, ver, rom_ver, boardid);
+			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+		}
+
+		if (err) {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   config.fwname, err);
+			return err;
+		}
 	}
 
 	switch (soc_type) {
-- 
2.34.1


