Return-Path: <linux-arm-msm+bounces-79320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3CC180BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51EFF4E5103
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE24C2EA754;
	Wed, 29 Oct 2025 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VR5BoMPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389492E7F29;
	Wed, 29 Oct 2025 02:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705008; cv=none; b=HbSbqwoO2XX3mN0BAn96FRzsUyXi+npyeKRgHljpvyDVLi+W/27KSSvJSMZquA2vk9MEqHIy+aR/IQ4ZmfMBDdn7heIc1fWlO3HBxuOr9ykLmB5Fw1e9w6EAzqSnEWkXDCDokQSPxccclhmvTtyUgoA/oylPNn50YcqJq3KxYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705008; c=relaxed/simple;
	bh=BeESw+vKw6cYDcN/A4G65c0j8zVSiMecMyBznJqncsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AazJvCrQeX9/T3bGH+ellaAfe3eNDBCRVwkak/Q+nUcibJTAgfGxi9ZowITlDN/Zp1iIoz6FCloMAxZQcYz41IHRLi9BCzZLKG8zxQahyFA2NRceKEgHA6dk109aeFfwrOziSRVtIWviggzU5c5kzCdgLJUf+bCysczAjaBkhpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VR5BoMPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJqeNp2511129;
	Wed, 29 Oct 2025 02:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZW+/KCGQS+z
	Y7T27U6tDMtmZERCSPv6YdAILEXmxBD4=; b=VR5BoMPTm2WBdYcbSGT5pwDr6RF
	cJifbSRDTFa57taqgIX6OD23/Aw0tpGqvQFtvD6+uWYcgvwD3vBlUIFUNnam2vbU
	+g7Mpf2V7kROju0oZixsWB6DG0bwsYRziSCTZ/DOaj5fKtJZY8WTcvjQJlJ3skCV
	59yRWINTDhr0mH0xAu+Ad+WUpmglLCJghBIvjjLoc+kpECSeYOulgBz2STcU1x3y
	VZL6GUwP3B56h9Qqld5D/2eukSMRsJLLeyHfsAFGSRu5Z0HnpueGWMsXm3C144w0
	mYqq7tTr+O9/DgGXvgnRCDJqzk2ssGAns29OY1sVfBppvASkgi4hIrEA6CA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd8vbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:30:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T2Tx7Q017890;
	Wed, 29 Oct 2025 02:29:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a0qmm5k25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:29:59 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59T2Txcr017885;
	Wed, 29 Oct 2025 02:29:59 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 59T2Txbx017883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:29:59 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 6AAD5231FD; Wed, 29 Oct 2025 10:29:58 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 1/1] Bluetooth: btusb: add default nvm file
Date: Wed, 29 Oct 2025 10:29:55 +0800
Message-Id: <20251029022955.827475-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029022955.827475-1-quic_shuaz@quicinc.com>
References: <20251029022955.827475-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LkC8NCGV3P16O0rzWGoTyfKTtmEWGbGT
X-Proofpoint-GUID: LkC8NCGV3P16O0rzWGoTyfKTtmEWGbGT
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69017c2a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=icOeAstkKu_1uK2K-hUA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOCBTYWx0ZWRfX7O1S2jagMtJ2
 3wlbHoPbI5UUpvSD5651HfIOPWqs0ZUUwGhI8mM2UIDNjk3RLNdl2Zz6ZV6Pk6P58k8s2RTQ/xP
 CcgX2aaPwKcWy8GZ3C6LjxEhmykALXUnH5yxwGtRvhp8ebzJZef5gGTNttf5ptdxNXPLkYl92SA
 zNlHA6iQ0ufxbk/GJ0U/Ra5OLltq+rpbgF1vdCG6EBTKvDB4tFgiRRgoNFkr3QNxQcSjKoxOPRd
 5zigAFyhkTlGTi+qgQ5xb3gd/0683rxut+3vs8fHeerNdya9UVsA6R4qGNYr/Q1/l7utHv7Nget
 AMZw+dZ0o8AZd3b1P+TO+VoHL4ON2GUQOIQdN+cw7EVDR9OKjspFE8tt2TDWX2D1tOnNF2RhoU1
 SgKswQpoXxipwe+nTLGah6Ga1e10LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290018

If no NVM file matches the board_id, load the default NVM file.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: stable@vger.kernel.org
---
 drivers/bluetooth/btusb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..6903606d3 100644
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
@@ -3522,14 +3521,28 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
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
-		return err;
+		if (err == -ENOENT && board_id != 0) {
+			board_id = 0;
+			goto retry;
+		} else {
+			bt_dev_err(hdev, "QCOM BT firmware file request failed (%d)", err);
+			return err;
+		}
 	}
 
 	bt_dev_info(hdev, "using NVM file: %s", fwname);
-- 
2.34.1


