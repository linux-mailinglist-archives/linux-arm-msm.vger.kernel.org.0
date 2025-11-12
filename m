Return-Path: <linux-arm-msm+bounces-81349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B7C50FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 250FC3440CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7A82F1FC3;
	Wed, 12 Nov 2025 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JgBVGIHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3E2F12B0;
	Wed, 12 Nov 2025 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762933613; cv=none; b=pOKYtELwBqW8qnzvW/8py0ADOb3V4xvnUa462uXPR4AE3TV5ZgiIpaqJr5QVKTg7majsiJzeGuFHRZ9hUustdUn8fWBcXscGNyDNwZESG7omHQ2v81ochxR4y8/xr51t5eQ1WOsCaQTDw+ttBf2W3nFWrrvCN9Scp0HO+60byOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762933613; c=relaxed/simple;
	bh=U9sP067DajZYhRUnsJrAkbq5NiT+eto3oQ/0ryRAoGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R7un2jfjlIAY5aHM5Ix0vKbmiGBU5aljwPFcFRksPdaRUJgy+pHQHiTx8wNFrnHiFPuBYfHR4+tOXnZtS3liUAKeZFZxJBLmXHZx412kzzgpjRHVRrVJtrwv0GsVjNK/EkGVXAX1Lf18ZjG2GCq0UMoV0Ffz0fgha5JvKJiFf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JgBVGIHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6TFHg351308;
	Wed, 12 Nov 2025 07:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QSfaaYmGBK4AVKgkYL0Nz7jJ3AbfEG+iv8i
	RHIJD/5M=; b=JgBVGIHn1ld+XGZJYCBy7fACG7z3AlUZ2GeyWOgk23imVY7Hlb8
	4a2PzkiOO+CUxKm5/KTSPHA+7xL3iP1hXcGLnwu+I6TQaWbIM6f2ZVniMXKp8qzJ
	zjNSEeIL9hr0RKTYGjrFVeNIsQBOF/MOuChGe7TyFK4upknu/lPL1Plyj5avl7TR
	Ve3/ZEVbfzl1gC6ZjbQE3UBWAllhdMp0cYfSwtBbRq7ZCSvVOMee5T3T9dLFWc1X
	5KrqJCbeDdQogxev7RSh7iYkMTjcL0CaRCfKQbg8PdIidoGeJRyEWDKpK/7uQIXU
	JuNPVEJtUxIM87V+bMKcin45u1OkvWV2egQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nr6v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:46:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC7kguU030932;
	Wed, 12 Nov 2025 07:46:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxmebe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:46:42 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AC7kf9M030924;
	Wed, 12 Nov 2025 07:46:41 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AC7kfM1030922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:46:41 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 2C52A22B62; Wed, 12 Nov 2025 15:46:40 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Wed, 12 Nov 2025 15:46:38 +0800
Message-Id: <20251112074638.1592864-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: 6D78Uujqwlg2oJegJYBh2HhPybiBd3rU
X-Proofpoint-ORIG-GUID: 6D78Uujqwlg2oJegJYBh2HhPybiBd3rU
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=69143b65 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=mafMjTZoDSqqSwhiDToA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA2MSBTYWx0ZWRfXytBK6M+cr8AF
 fVe9KJQaJSvy+NcX/ztAiR6Fskj94qWzccXbwhaXbS+QNI0qIQs+YzsvrkcJD+6ukEpi2R/2SJN
 C6/447nig/AzjM4sZxuMJpb40DT+2yecoEnTiPCMDrs3FpexLna9SgSXqBjg4AFh55zwtqzVWi1
 5XNmu+CZTca877suZMC5QHGG9pD0hj7I2pfPxsgmcXzWjiqH0hNeLmSJGyigz8ZGkltT9PYU0mr
 XKcW0S3lP4qqw/Im/VxN2hxR04379zVXbo9tLyvmwnm3YsD9I9f7fONbggNj2m0vb3Ob3nqJBUR
 Sf9ePk/8oVdtQM+7FEde5sXuW9JdcT1aoNKa6YpMxBg6t81iArThO3I7Izo/fa2+PQw0c1ATK7P
 sc81cMB1HwcfLHALZgoFeSJkMyL90Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120061

For WCN6855: download wcnhpbtfwxx.tlv and wcnhpnvxx.xxx;
if they do not exist, download hpbtfwxx.tlv and hpnvxx.xxx instead.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btqca.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..cafdae903 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -848,7 +848,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			break;
 		case QCA_WCN6855:
 			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/hpbtfw%02x.tlv", rom_ver);
+				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
 			break;
 		case QCA_WCN7850:
 			snprintf(config.fwname, sizeof(config.fwname),
@@ -861,6 +861,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
@@ -923,7 +930,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN6855:
 			qca_read_fw_board_id(hdev, &boardid);
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
-						  "hpnv", soc_type, ver, rom_ver, boardid);
+						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
 			break;
 		case QCA_WCN7850:
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -936,6 +943,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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


