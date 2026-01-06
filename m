Return-Path: <linux-arm-msm+bounces-87618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA28CCF6969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B7D301FB56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 03:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AD422F77E;
	Tue,  6 Jan 2026 03:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkkG0Hjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4241FC0EF;
	Tue,  6 Jan 2026 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669155; cv=none; b=QTGQVIamq/42OhPnkGTrKktTacGDysvHT4TqabO7NaBL9/N57dhAxlnE7mjCsAUJKFZo5OLakQ++6/V17V5i6lVMVG9cLHWDE4lsWcU+0jgw5vFiCw04CeqJocwJfT8YTaXDCpnbxv5rLxUhq6zrYpWyj80aXU42abndbEqobls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669155; c=relaxed/simple;
	bh=754BImtj6NZeIbckV8q5+8hRijJxOJ2V7g5Je/jW/Fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KhNjK1PoTVKaH/0m2PHqiWOSPrJd8paWXS+MjMYzyl4CIlMB2V1mRnk0xwkqKdUjR7QRqMZFSa0pqMvX7Urk/uv6pCllQFcEN3vzH9ITnM7Qxgi7NWnjFvujJI5yQFYOXmhzbZuUOaekXlF9vA8e4KB8zRYr9MFxSAKaovHks+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkkG0Hjk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nZnx2528273;
	Tue, 6 Jan 2026 03:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+NxoBK+kvlw
	s+TX+hvReZhRMfPwcuknxEjo/H4c3FIc=; b=DkkG0Hjk0E00wWm113vF5rKVD72
	ze1WNd8HCjPVKwXeLcetrojlCh3vFgF6pR+Y3AzTPvvQXZDhez6mEM93uPx0fXJm
	HRnWtpRzbjlTmtbhm/dbTlsM/2OZGI8xu7u+JKYTQpu4RYwpnlj7Bx2Ky9DYr6UY
	dPp3VE1K36wg+/GsJd9fGX62GuNmsRnT6FVvb/NjzMIYQvEt5lDUCv7Nqvfko7Dx
	VZXDGzJQ0BQBCmk8A8P4WJylbA5hsEiI0A5wZSkYQaZwmOJMKzq71rMApZUZIwdu
	XDP8MnrJhL0HXLkZ5Fm+BAK4u3IU88H9gSuTeUOUsqlonLT4kAZZs1aJOWw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2mvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:28 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6063CPAW018805;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kx4pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6063CPs7018793;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6063CPAi018792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 7F782235EC; Tue,  6 Jan 2026 11:12:24 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 2/2] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Tue,  6 Jan 2026 11:12:23 +0800
Message-Id: <20260106031223.499706-3-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com>
References: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 1zLHUanwmVV2dRFImjv4sFUnJCFtPTOJ
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c7d9c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KkDh8qJZr1c1ad6Nb9cA:9
X-Proofpoint-GUID: 1zLHUanwmVV2dRFImjv4sFUnJCFtPTOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNiBTYWx0ZWRfX07SFhK3gTujy
 nuZpA5ulOc4YsXPb4sNbTp74ts6l+PXDe8/WS6ny9QQARd2VUFPmdtQ83NYh2E1UsTrS77BUofw
 fXsqkXJdsNQF70o6S5jB16Z5lTRq+eUhzB16Pwmk5oZ1GduVVUQWfHC+AGtdJ4ZaqiEcpOfogMC
 5LAx5mFIeOror1IJCOidV4oVAA2AGsvugadvQd4dG9dp2/BXC+9/WJ0++E9Ge86EtExq2ZaqICG
 cyR3FLwFYK/ZfbjUM3IftYEeL+ky73sVq9k/Cw2+lVj4vYpB1ZTeCEvgJ29mcJcZKzausBiiCZ3
 4iheMD69CWbTy+eOHsCtMWNPQdeIjalAqecWhXC7FyIoD59UaT3ch9qzHh0ZzsZC3NWASnrzvfm
 vDa7c7LojH7qE3M1UkAv9nBsSWt59GuS2WHtiPMocoCp5koqCdkdqPoL6ydxtRuCRge/X29Ltha
 1O/co+YM1oXU+X719Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060026

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


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 0af3e2109..74f820e89 100644
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
 
 	if (err < 0) {
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
+	if (err < 0 && !firmware_name && soc_type == QCA_WCN6855) {
+		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+					  "hpnv", soc_type, ver, rom_ver, boardid);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	}
+
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
+		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+			   config.fwname, err);
 		return err;
 	}
 
-- 
2.34.1


