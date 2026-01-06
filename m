Return-Path: <linux-arm-msm+bounces-87623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B3CF6AAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 05:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81E5304DB50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 04:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B06280332;
	Tue,  6 Jan 2026 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbIR8Cx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB02701B6;
	Tue,  6 Jan 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767674115; cv=none; b=k1O6R6aocY+9UYQr1E890JzllzloL/S2z0+fYvI5A40RMzkG2vS1pHMtNFX0qbj4MuTF/ml6DcQsRPMjVEVy1wXkkHmV5kqI/QbU/GHg3JM04pbjorENlqkij4aEZrI2ZONGU1nsAaglsYmogR04kag7IkakWOD33ku2gSB6n6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767674115; c=relaxed/simple;
	bh=754BImtj6NZeIbckV8q5+8hRijJxOJ2V7g5Je/jW/Fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GlCdGFr9RKLPOI05nHW8BuYXg6hPobNwLosC/Ru8ktPwMAGKDgbynvfDjW021Cc+KTqpDXJYYn0JgJWnNkz7wN31oJw6ITCIgJMJgo4zQRCrhCPiC3dvWUOu5qYEi0TQll/yoSi119ZTk2ubsccwiy7DzlRP+ph/TxQgi242OWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbIR8Cx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QT1t3301277;
	Tue, 6 Jan 2026 04:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+NxoBK+kvlw
	s+TX+hvReZhRMfPwcuknxEjo/H4c3FIc=; b=lbIR8Cx61lh3j3nzFCxbfB/7aFW
	kl3DRSNV/PCKPsc3EGtq2zJUCUekUp0bbfHAuJ7LF97O5Oq4leDep0ZqSWtLlEiD
	0bXYhdQPYrkXHTisdHhd/6KGjEgyClSctvt9stOXSL/DBRa4GCPp3O+VziESwmk4
	UwC2VkVKC1/idJno6T+8LWeDJQqZqHyB4408VhUzZ5S54oCyNwo+3ZYnAYjwqqkh
	0fdnfz7dq/8mQ81DFH4KzuR28t4TdYdIsPyikRkBgdzopGj870H6c5cU0URhtQzr
	xO/VVSVfzp0l5OvU0ATy0fRKFMcO+UdE/WwosWBPNSMZR7jkwH1HQlctLgg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsrj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6064Z6iW010712;
	Tue, 6 Jan 2026 04:35:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kxjgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6064Z5N7010705;
	Tue, 6 Jan 2026 04:35:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6064Z5Rf010702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 96D7423493; Tue,  6 Jan 2026 12:35:04 +0800 (CST)
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
Date: Tue,  6 Jan 2026 12:35:03 +0800
Message-Id: <20260106043503.534557-3-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
References: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4ABE8M-urpiJTRmgK5P8d_XBD3DxvI_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzNSBTYWx0ZWRfXwHVxj39kYPXH
 VOiGZ/npstJzn+xmw1OBn67HItb+WyM+uRGh2SQUME8Xr859tYm0TjOgXWpXNyKNtonAE9nTv+r
 jlmqs1cqGwkBWjyks3zqZAdPnDjZ2s5QxN+BEBJT963GQtRLvy0UFippCAxz/Oo5ROoKbcMVy2i
 Hhc/Fduz1M74FZ1JHuP+0c1MXznE/4A5gPmew5wTFNTbbOTIJ/4S/jFhZ6upAA/rrl1uFIive9C
 iop/k3O/OncPGEtzr6Nh6pDbt4fzuStHnK8+S+EMCRKZXAlgE8Nj9ZO6/hp6ybFhMrvndt7+YVn
 npZ3UjDt0AmR9kbRG8p/NGCquZZCHvfYwWcIeJKvCMZDfMy6pQuJFi1FPY5l/IfYLWlanX1zuH7
 XB66xbdAJKl5D5R8yLGJs6+l/fGTT4FiiMDJFXgEDODEZCDUGnuX0FHwWMaZsjvxSTgoKv24sGl
 BSg/IeDxgiKiALNai1Q==
X-Proofpoint-ORIG-GUID: 4ABE8M-urpiJTRmgK5P8d_XBD3DxvI_w
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c90fc cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KkDh8qJZr1c1ad6Nb9cA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060035

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


