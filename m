Return-Path: <linux-arm-msm+bounces-79184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014FC14849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8003E1A253D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CCD3195F0;
	Tue, 28 Oct 2025 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hsf0ehmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDB2EA473;
	Tue, 28 Oct 2025 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653161; cv=none; b=Y+RC5NEv3+8WPt62EsRqoMMWUSglE0TPoOA6X7wdpdF1xKyQV62ieIRTxWCdDX1f8ITjKx9odf6ZdnFKzCOOSwMbGVYA/MnkVwiDN2VzKrv+NjkAg3IaNki0Qb44P634c9gHeSbaAmkc25gdCB2RD7rlgjXwFJDzyoxpae+X3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653161; c=relaxed/simple;
	bh=PhGGpEXqkmznOczFPyxAkSU3pBDrQtMgvujThrQe20M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANB2G5G+OmIdrz1atOCsB5Cr2jmmAXiyIjISdPLe/fZJkbJXj+nPz+Z4935YA9VTANeWNLy/ovboE6n8MQJNQGYfe4t1gJMZbsLrZoCy92qdA8tIZAaQFA4uLThOhh2dVGm5g/WxVVcABKPPublVGGxgPyxz9IrhdqEZ+4Qhjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hsf0ehmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SBctka1559797;
	Tue, 28 Oct 2025 12:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qcuPS2t5SiZmpSZCZCScmJtjO/b5vr5O70D
	E5lU39lY=; b=hsf0ehmK6cnn6YrGwKSvPgO20LRFBunepCMLR/pXIbHARj3tVdr
	DBmoHD4jSn8OW6BJo0bVMk3Cv0RHqKO7c7V6aepd3hI1MXYD/3bdipeJ7ahAMR+1
	bCF0K3u6jB05V9rC8Nc7e6n9dhB4eO5XiSMJtv81ldB9J4Ox1zQAO7X9DJjex75j
	DZyWbMwTUseAx4WGMl8MBlxIYZEtv57nuc8hBk3KHPcWJmt/GmEPMhSD4YCSdcLI
	26k8SpqM213bz34CztbeS1Rix0W/KCMXCW8FyKUFzN4NpyyPUmG5jleEa0m0fFX7
	rr4beCTigqAWaYr792CphzoosU1juapJLWQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51r27j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 12:05:55 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59SC5rvP001280;
	Tue, 28 Oct 2025 12:05:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a0qmm0mah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 12:05:53 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59SC5rtt001261;
	Tue, 28 Oct 2025 12:05:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 59SC5q5m001251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 12:05:53 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id E15F9231FF; Tue, 28 Oct 2025 20:05:51 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v1] Bluetooth: btusb: add default nvm file
Date: Tue, 28 Oct 2025 20:05:50 +0800
Message-Id: <20251028120550.2225434-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: xMMIyjSgGHwEeAnFH3_ApRVoBl0VfIa3
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=6900b1a3 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=icOeAstkKu_1uK2K-hUA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: xMMIyjSgGHwEeAnFH3_ApRVoBl0VfIa3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMiBTYWx0ZWRfX+utccSGBSB1u
 JGYE6liXje3zAsQ8egr7t5pgqLtXdF/ZZ+FcSso6HWxuX4t9i0DAbODVvR+bv4wfUYolEVL9Ee7
 JV6tSLhfQrCbOYhMqJ951As2t4MOnHKYR0eVY3WIDhrj5cZbBSnO0Rx9dIdk5dcEOPtkArOr74T
 m1/WXjpjWNwpUlu0JoTbPJNSk9r5oQpWQxljo567iWiI4AzSMK15Ex5UZlN1yP5OXZxwyrmqkln
 ji39zH4iHaPWsOfIJGZewhhrXyF+l1+q+Du0j7xGFdgChB2nuOBPviX/lcs4M0A8p8lTG4XfCmi
 49XF8luMkL2nFDXy5IbfI3UHiyh8n0C1bQ78pw2RsWWsHB9IhiXIlrFCFFlcmRnUqLcaW4nqeF3
 5y00b/3VrCaVJnLYiI4D7DjTOVPEyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280102

If no NVM file matches the board_id, load the default NVM file.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btusb.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..998dfd455 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 }
 
 static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
-					const struct qca_version *ver)
+					const struct qca_version *ver,
+					u16 board_id)
 {
 	u32 rom_version = le32_to_cpu(ver->rom_version);
 	const char *variant, *fw_subdir;
 	int len;
-	u16 board_id;
 
 	fw_subdir = qca_get_fw_subdirectory(ver);
-	board_id = qca_extract_board_id(ver);
 
 	switch (le32_to_cpu(ver->ram_version)) {
 	case WCN6855_2_0_RAM_VERSION_GF:
@@ -3522,13 +3521,25 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 	const struct firmware *fw;
 	char fwname[80];
 	int err;
+	u16 board_id = 0;
 
-	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
+	board_id = qca_extract_board_id(ver);
 
+retry:
+	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err) {
+		if (err == -EINVAL) {
+			bt_dev_err(hdev, "QCOM BT firmware file request failed (%d)", err);
+			return err;
+		}
+
 		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
 			   fwname, err);
+		if (err == -ENOENT && board_id != 0) {
+			board_id = 0;
+			goto retry;
+		}
 		return err;
 	}
 
-- 
2.34.1


