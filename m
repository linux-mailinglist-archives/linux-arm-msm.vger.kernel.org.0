Return-Path: <linux-arm-msm+bounces-81020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0916C46D9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7173C188D1F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D532F30FC2D;
	Mon, 10 Nov 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZIpzju3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD501EE7C6;
	Mon, 10 Nov 2025 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780955; cv=none; b=jsLPkkEhXLb3WEXH5E5qILCn1Fir33/c+gi6/BGidQIBPO8Nd4rStHe0DPu7SA76UzM/fgS1f5q55wSi//P7pIG2yvfGtUZ9qGNCL5FWTa46r46x7xg1o03+eyzazKRHQJh7Qm4YyNzx2Gwf73u5j9GnIddmVly7cxYNIWpynIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780955; c=relaxed/simple;
	bh=vieobzLTaB2LRgIRcNoGdXwyx/JpUJutZXz+L91IMTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UwRwySUxxb6zni48bD2Mfe/gut1yuAsmA0D0soANTdrSyNkBSXZP433nmxJgY9FSZScAUhxYwkXZGkOl7H2R9bMsumapQ8RERQBZ9aY1uFhyPZsX916xPBH94c+9lL73ljFAMD/J/DVwz5JSXnI7jFN5TIGvICDt/QpbE+lCtbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZIpzju3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9CgYM3146225;
	Mon, 10 Nov 2025 13:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0W6NTvN40zE
	ct9E/LO34i1M9nFTSpRVPIDz47hG4RXw=; b=ZIpzju3FS3Moxh3r9Cyy4dwLIS5
	l85IQpSh1YshR1dy2XRmCMMQ3C9s7Iq3B9tx/zc1bLiscuoX1noqGud5n3RHnJd4
	/uDybx9Z+2rb5TwmnC2yWZyT7s99vVhZDCC8zE/bqKNpm5WujVAYv5KtLuB5Ezrq
	ogOgXIMtXCYI+96N7fOB1Xy+NstoXyyLz/trHt19glI7h0KQ6jmf9gsBMb1g0ZHn
	mYJeSKIz/BESQRj+E7KBF24PS138rqpYpGwE1zCy1TkBGG8RPJEOj2zywRX6GCE+
	Kg323MuHQ1yUwuQuEf3V6iv2/hPak4Yy166pCFZ+kuALIHDC6UAWAK62Zow==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7hrqkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AADMR80013303;
	Mon, 10 Nov 2025 13:22:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxm9qa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:27 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AADMReH013296;
	Mon, 10 Nov 2025 13:22:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AADMRSc013294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 25C6B22D6C; Mon, 10 Nov 2025 21:22:26 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v5 1/1] Bluetooth: btusb: add default nvm file
Date: Mon, 10 Nov 2025 21:22:25 +0800
Message-Id: <20251110132225.2413017-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110132225.2413017-1-quic_shuaz@quicinc.com>
References: <20251110132225.2413017-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: YWECupguSjpaC591pChfR6WZv09p8o8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNyBTYWx0ZWRfX5R2yg76Z+SfH
 jfoukmrqX2PPOcHfjUTJRgsbXJqvwC7g6WMAopX4DxlhmNeJ5vECqSAl1TGrYd6Yumvw3U1hSiW
 EfLwQczSGkmDJ4KBYNr8Bf/TiUkSH71j+JwNgw7acRKWEiA4O3SGraBN+28wJHa5JfwHNj3ANXR
 hztLPvqeiwF9kEmq6fu3MNUptqHridQLPdQr8IUbY36Zv4txj26zqkS3JGPPLg2PwCpaoIAYs+y
 BB0VYPNIv8lqy1GJWKOuzHCLIQGWuMi0zYaYzRp+oL5ei0UEzjsNWJwY3BsbIoHzLyTszTUw9ls
 Oo8nfBJoP31ksm2hACTgxY6ZBE7PQyL8coKRRQ3oP89+t5jQRTuTI5RvkAYBWKQb6H7HF3Dxm3L
 4Y4zUgKYlk3kI+lDojPsKVquJO/BzA==
X-Proofpoint-ORIG-GUID: YWECupguSjpaC591pChfR6WZv09p8o8p
X-Authority-Analysis: v=2.4 cv=Yt4ChoYX c=1 sm=1 tr=0 ts=6911e716 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=J2RAPmYWl02GzY4tkNoA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100117

If no NVM file matches the board_id, load the default NVM file to ensure
basic Bluetooth functionality. The default NVM file may differ in
functionality and performance because specific NVM files enable certain
vendor commands based on chip capabilities. This fallback improves
compatibility when a dedicated NVM file is not available.

Also, pass board_id explicitly to select the correct NVM file. This is
required for proper NVM file determination.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btusb.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..09e81320c 100644
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
@@ -3606,10 +3605,21 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
 
 	if (!(status & QCA_SYSCFG_UPDATED)) {
-		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
-		if (err < 0)
-			return err;
+		u16 board_id = qca_extract_board_id(&ver);
 
+		err = btusb_setup_qca_load_nvm(hdev, &ver, info, board_id);
+		if (err < 0) {
+			/* If the board-specific NVM file is not found, set board_id to 0
+			 * and load the default NVM file to ensure basic functionality.
+			 */
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


