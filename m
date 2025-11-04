Return-Path: <linux-arm-msm+bounces-80278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74AC30B8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 12:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B093BDDBD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC582E8DF0;
	Tue,  4 Nov 2025 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CH5EnktU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793C2E718E;
	Tue,  4 Nov 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255548; cv=none; b=qFNmi3QnRcSw61vvMeSKplFUkk3pQwZMEdSFzYrwR84HcW/VSc5BrwQwy0FLcSW8ku/vSrApPFV69Kq72+3naBeY+2LiCFLGqgPMVCTUt53MXidwQtE300rQiGerXBkTAtGQPobWMM3GVhxhrvxmjJrawNjUwGAqpyQW6LYdM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255548; c=relaxed/simple;
	bh=7q9qUIZAvqIo3x6wghkF9nlPfLCE4twzXLbKzhvsfKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XRDE2n2gtiZQ1pIS5S8TQAqlYgZaiwQZbsK4k1tWZ9IN/yUSR6yU801WNPhnrg8QknonJthqhzvSA08JnWmntRBnXKwtcmHwnmDwm2mYWPMf0RsfReedGycX2M/xaS1mNVVUMfGFrU3zscDsLSDYZax8zhdXSbQAACMf14XEL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CH5EnktU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49dYRu1659030;
	Tue, 4 Nov 2025 11:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Rr/kjr2hnM
	Xqh2UKjZBzPVHTWOd0udUzQdbniBVJls=; b=CH5EnktU7WURm6ikoH+UpPFpN9N
	8L5+iUiVMoeZkaZCCjaKP5s7yZbsabKMhseU6uxA/uy7k4+F34VMHbK4cCsXA/Ci
	hrEsnBIbL7WSL1qDapgdJD6CuSdvzaDnjhEprG361ykIKJtm0OlMsGg1b/jizuJC
	zYjNY6IP0099SkbpbjBWSidIqqmuNnseUV9nyCwPn2cI40/Sy5THcFw3Jc1Rndah
	7hHkE2X375MuzycvhQBDqNPbAEHUCzSAzcH/thns/tUvTk4SAiUpGe1kwXPH2NpS
	mDnXv+40DsNca0qdU4IRzmwBnzSZc4Gu9ll3p+liaWMqhsg2QLUn7mUGCSw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f25091x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:43 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BPd88024756;
	Tue, 4 Nov 2025 11:25:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9mgnt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:39 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A4BPdaf024751;
	Tue, 4 Nov 2025 11:25:39 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A4BPdEO024749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:39 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1243522C5E; Tue,  4 Nov 2025 19:25:38 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 1/1] Bluetooth: btusb: add default nvm file
Date: Tue,  4 Nov 2025 19:24:41 +0800
Message-Id: <20251104112441.2667316-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104112441.2667316-1-quic_shuaz@quicinc.com>
References: <20251104112441.2667316-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=6909e2b7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=J2RAPmYWl02GzY4tkNoA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Vch1Cg7wuEh2NXy85yJgDWZe9AnpCtx9
X-Proofpoint-ORIG-GUID: Vch1Cg7wuEh2NXy85yJgDWZe9AnpCtx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5NCBTYWx0ZWRfX3p7Yn8bUhHA9
 XbjlnmTJ4sg8m7VuTbutpP0l/xyaAbl2mh7mohSUOhu14n6GvkvKs8tz4rn+uun3S4FmAMXZK3s
 Hdi+703gySxwaYsoWkbxYM2hG+YGQmPhXVDESeO8wy7JxCzIAozAGV1VY66cLrp/jGKsEzTDfnk
 kLgEqYc3WoJCC+pr91u44u/oLpeHqIMK+fjjtCVMZLvVX9gDzwKt8ZUqL7PzIau3BZp2CCbIAU0
 nxdGTHLSoNF2WIug4xz1UtZhbqvsk/KHZMKkC7ysWdJNR829aMejyQNIzJ8Kbnrzxwccb8ydS1Z
 UUbHpznM5osSiSaAaUiaFdCBT0TUhe2Va8+ZcwhyfIqV8vtxNcQILhoaxql1tl++jFkpO5F0Uw4
 7VKceDr6LeJoI7ipd8WRMPKv0F8hXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040094

If no NVM file matches the board_id, load the default NVM file.

Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..020dbb0ab 100644
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
@@ -3517,14 +3516,14 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
 
 static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 				    struct qca_version *ver,
-				    const struct qca_device_info *info)
+				    const struct qca_device_info *info,
+				    u16 board_id)
 {
 	const struct firmware *fw;
 	char fwname[80];
 	int err;
 
-	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
-
+	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err) {
 		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
@@ -3606,10 +3605,19 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
 
 	if (!(status & QCA_SYSCFG_UPDATED)) {
-		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
-		if (err < 0)
-			return err;
+		u16 board_id = qca_extract_board_id(&ver);
 
+		err = btusb_setup_qca_load_nvm(hdev, &ver, info, board_id);
+		if (err < 0) {
+			//if the board id is not 0, try to load the defalut nvm file
+			if (err == -ENOENT && board_id != 0) {
+				err = btusb_setup_qca_load_nvm(hdev, &ver, info, 0);
+				if (err < 0)
+					return err;
+			} else {
+				return err;
+			}
+		}
 		/* WCN6855 2.1 and later will reset to apply firmware downloaded here, so
 		 * wait ~100ms for reset Done then go ahead, otherwise, it maybe
 		 * cause potential enable failure.
-- 
2.34.1


