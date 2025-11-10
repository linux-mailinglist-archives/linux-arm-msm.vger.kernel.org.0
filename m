Return-Path: <linux-arm-msm+bounces-80898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F6C44D9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 04:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47B54345BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 03:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919842853F1;
	Mon, 10 Nov 2025 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JK1EF/7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D61284881;
	Mon, 10 Nov 2025 03:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762746108; cv=none; b=j54/m41dIdc8W5lrD7mqAqWkRnHmW4e2s3VcPZoatk0hFG4yC1NmJSU61xBU5lOdbdPPsG1nqVXeUOC/D1U4Fpptu1hy0l+CH8FBkjOfeUTWlzYgUIVPBygiIVCaxlj/aF+N6gsnQS+lCqyeCtFjxYOcby6EvPtoUZN3WVaJ2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762746108; c=relaxed/simple;
	bh=S/Cz5F06ngyhzMhBgVN+Ac0aYF/QGzq4884F8Xl88N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ViOKIb/rPp08fSLwUJ7aglVZANZX5qUtRK05Db3LLX/SwjvOkXz8OEPPBsYV8RbedZa2ZLNNDF7sFzJuljaAJ+TqB8eseAY/o/OjJrFakeIt9Cq4/bfvb2QZNgOdc0PofDOFc1BRs/zl8ALYRwfnVyDoH8YRPGHrN7VYEE8zcvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JK1EF/7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA37Yqa2166635;
	Mon, 10 Nov 2025 03:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGBWDcvxggn
	7ScLoF3zN2yUt0r4CqfcX86wQXwfqK6A=; b=JK1EF/7KGNsRWmMBXHCXlYXX5mQ
	TOX2CJ/3ZouH6H36zifsAkN1+DgPOoh4oBzwKP9UNS237itf5VesM9ReA12yTeR4
	DXBjLkVtyxvpQwF0/cWNktgDH4JBvvC2E/EpUABhjBJOEdxPX84JL6y9FAVSmJ+T
	VHskU4wOZm2qwlfACorHXqGys6/mODxWSTgB3ktI6PhqDia+2ZMFoPmvc1d1xGhb
	Zye+axtdpTuRy3UXbT/f6Ch19xgrMd4zYSzN3OpiZxwgzU/c6eLZl+YrztumJU5C
	QusNaj+IU1o4vWVCuRM1+lcrJkZDAv8JgRV11ctvcculB1doIYbQrme2n/g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab7vcr2ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:43 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA3feuE028459;
	Mon, 10 Nov 2025 03:41:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxm6p6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:40 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AA3fe6s028454;
	Mon, 10 Nov 2025 03:41:40 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AA3feQ7028452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:40 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 5EFF723599; Mon, 10 Nov 2025 11:41:39 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 1/1] Bluetooth: btusb: add default nvm file
Date: Mon, 10 Nov 2025 11:41:34 +0800
Message-Id: <20251110034134.1016537-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110034134.1016537-1-quic_shuaz@quicinc.com>
References: <20251110034134.1016537-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAyOCBTYWx0ZWRfX5YUyEUhd4/T+
 x0AZoZH+KKMnAwTH0UOzMuJEzkVYCe6tot3auWsrfwzxsMcWuxSaYcxCQ3TfppKcwYVUSb5h1fU
 xE4ZSYrHre0lqD5ejiBk43UEpBV5MGvEsqDslnjk6PfEhJXZt3V4A+q3B9sIzayty/4083t2W8B
 nJ6Yz3jOpqNUYEyRTxZHbVgn54AJi+o5GlJAahvVlI818dchPiqomgIvhgmDLsbyxVcndi1OOaW
 t/doZ69YkUP1uAlrawzrt6HovOidMPZr4oAh5zwI0y7aS2iIjFpRz13M4vdAmXFiGncIEG6hcbm
 UtwVFbJGfBToEDw5NntSfHmr2HH9TNZX8IOr/qgePQds1B3dsDlJbWjcCPEQawBxvYq3M/qBrwZ
 TzZGJaQU3IpSCi3x8um6br0zo2rYyg==
X-Proofpoint-GUID: 7pgFLiyQuzX3fBCHaZ0XJwXlG9599dYm
X-Authority-Analysis: v=2.4 cv=E8HAZKdl c=1 sm=1 tr=0 ts=69115ef7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=J2RAPmYWl02GzY4tkNoA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 7pgFLiyQuzX3fBCHaZ0XJwXlG9599dYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100028

If no NVM file matches the board_id, load the default NVM file.

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


