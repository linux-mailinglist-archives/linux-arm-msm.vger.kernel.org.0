Return-Path: <linux-arm-msm+bounces-87609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F6CF682D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0AC7303753B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523823958A;
	Tue,  6 Jan 2026 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfQNO+SE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58582218AAB;
	Tue,  6 Jan 2026 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667702; cv=none; b=fBw+bV5eBIWcLeW72hq0YsSBgjCti5xe/iIb++wElESPavpivWWYpSlkmPe71VoisfxVhRkGOtt9abPYrNQyuetZ/GdkuYH2Z7RS4clKn+K6U3kgKKPJcXYpwkVFN7HPD1nYFCBe/ZRAqKHKEfpcqbTLHeawdmyWe4gnnpWGdE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667702; c=relaxed/simple;
	bh=HFn6gPzSIS3ODNSaZAilPfMlgfQWAWyprn68MuNQ/LY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MWe2yLtLHujJsnOTb092I3+ugkOO0P9mEF4USd0dN7+ueGSBpBL7AQDkPEOGw7pDDN10mOedJkbbbMG0bcdKmZ7Pf1PJsK88dvi2Hs3qDut5aAvYaMpgEfQpQSADoqFBacZAobLyg8dn+qYxN+RiybdB4bf5/RlhHf6Ah1ZVUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfQNO+SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060o5xg2292288;
	Tue, 6 Jan 2026 02:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Qhtt78w4dQ
	hGW4dt9dujGRQ/pQpqvpyXFOQGlzxG08=; b=gfQNO+SEJjgRAWeOc9ypnKsnEa6
	t5uHWhyojdlhOqwLg33gFFaDZLsqOz3gI30Ymr9Y9JqwUNxD6U16vrFPiad6kymN
	vAbaokaWxujFXL8XHySxYGawEMJEbO0St6Ud5vNGUpQ3AplH+Yja65CwViePG8AJ
	yiU38IKaieN2GyTJTRnWv9SQRmEXiFJbIWNDjLzl+kH/TQISiDpIiu1AW27F+Fya
	nsx++bUkl9Ibuw+TQOetuHFcptjCYRFJzUVLlWla8YUX2nioh1YcdEQ8Q0+TVgIY
	Op01kUITYFt2DSJtp4Cw56DR0MR0wx0tc958lh3ZAAQOLtEzq5CUSWXOWPQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nk9mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6062mB18032059;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kx0pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6062mBpG032037;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6062mBYc032032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 8062A235EB; Tue,  6 Jan 2026 10:48:10 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v8 2/2] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Tue,  6 Jan 2026 10:48:06 +0800
Message-Id: <20260106024806.480779-3-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106024806.480779-1-shuai.zhang@oss.qualcomm.com>
References: <20260106024806.480779-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: z9UCKknSLD-0MS88tU5EkNG_UhKHGKX7
X-Proofpoint-ORIG-GUID: z9UCKknSLD-0MS88tU5EkNG_UhKHGKX7
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c77ee cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KkDh8qJZr1c1ad6Nb9cA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMiBTYWx0ZWRfX3VMXKcxKCS19
 C/mw8+upIizvHFjYdb5FnoS73m2bMmywvUtNAHGG6E15Czj/xjG3dY2kEwQFmltKe6vQdaiNZy3
 8g9MAiSK3nvyHeJWVpNTszFyIpllxdBVs4xnbDH9SHV7w63NnRmDj36dTDNaNAf1cxsqRH+UGSb
 glwy3NXBQxgxUH4kDw8YSO9zwmhkw/agrUYa7fqYzAvijuxG/qCeVsaMoEqa74SxeBMzmn1dNFS
 McZtw6cAQdx4+rViVqracUMHjrGdPJfVB4oKWXb9fhZppd7MgrFEB0Q9w68LS47QrUGTzovHhxT
 uyYsBHbZl0m4YVJGv7EX8YCZ+jJOPyvCCsBEQUn6HuPAu+sH5V93gC7BScANctjKDGB9cRx9Red
 TNtzc0H0U4o51IG8Efa1T3zYECG2bWV0QNEtRwg0MoSNyxiQzBRJyRVUWKJu+lIDRMZwPnxmKCA
 MuSrakK+VAkSSqyywMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060022

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


