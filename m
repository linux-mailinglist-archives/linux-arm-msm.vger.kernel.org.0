Return-Path: <linux-arm-msm+bounces-87372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09BCF2096
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3329E301F8C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8D532720C;
	Mon,  5 Jan 2026 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFlm44CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35B1326936;
	Mon,  5 Jan 2026 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767592621; cv=none; b=dcpR5Yj6ofqDlO2Wp3brOCaNrDPp2gnFBPSA0PBcWo6s24hVIKalmUJqZt9Jy/5hi2GleyfWJ50XwUlBh7iDiQzdhViQ9r/FqiQKAkwjXOgvuJ7nY276Xh1VsYcTT/EjRmDUdhhw0UR7lHjRccmv0mwLwvpY/PKQ59VjkSshJQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767592621; c=relaxed/simple;
	bh=q6QJ1SGoN+2m0tj+j4OgQWmQ5f+rK2FuLR3lpRzHNZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iw7PizGUyOq0iVzOEd2fQ/3vydehRPaRuebZ4PgheQw1p/UbWBCpDSl8iOyQ96AWo7jrpmCYPWYMB6P5sphhkVo75MeTchJICEK4/CbGVMIL/29n22NT2+lsvLsX/qMBzrhGwehF15u0a8hD0uvvv2bq71u/OZg6wUKinh/Mzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFlm44CX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60556RrT3522071;
	Mon, 5 Jan 2026 05:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X/Rk5U+1TrJ
	2x0hx6SifXXBxvo+mMRQLmEUQ/reC5FI=; b=jFlm44CXAiPWhUOqpoKsfbgLSgE
	kjzlWEYzkXv9rd7evjEcR5TGvEBJilhwcPNP8ULIPMhLgpIO26GKhJ6hEKlmCTOy
	huVziZLiIrUO84Kqvl19f7nRW0sBnzrVWckgRTEhNkrPb/ZVtmHtWIozh0G2RYCQ
	1C1IE3GnmxLy5Q1pmllB63h9vjj5+hvXHhrSyQ5XrNTjEOH6iIplJAJXwEBD/4Uw
	R3Az+FFHL6kzJ4XeMBFTu8PW8SW9UMmtWr2Hxh1pdP38iWlOOet/H5Q+XK6s8y8f
	BZJ6T4bPFzSVa24zdGgt/VuCVa7lDHkBMv/QOL72PthXKF2PlMV/ofljxCg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu83tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6055un3P017790;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kqfgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6055unDe017785;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6055un9H017783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 7C591237A3; Mon,  5 Jan 2026 13:56:48 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v6 1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
Date: Mon,  5 Jan 2026 13:56:45 +0800
Message-Id: <20260105055646.3816296-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
References: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA1MyBTYWx0ZWRfXxs8nU+kh0vXx
 L1JuVUKMhhfturZqtucuKnomAuOcP5dRVzrqceIZXv8XWlkgGGDZix1XKOGDfPsMnM7BCsWgsKS
 ksr3IVP8CeWLJVHkA4HpzRHU8tNCYpDI463SLwxP3I4dsxKiQLg9WrF+y6eH+7vB19GT4lhcPq1
 asx++PFbKSQWM03JxuU2FZu5WivRxHGqV/8wa0kSoxSSCPuE99UqDAldvmNhPwTOjBlEmwIdOSi
 IWqKG3dJMKQYHrniDSBk8RqkUGTcBEi+F+8Rdf0XtXg90EN7m7KiWJYcjm6W/07ALpanqRBLuk7
 q0ydO8hGzoAHWqXKhDDmwJouVpt7aKSwm2b9wrs9CgTDG7E9akjyvhvL/9y8GL/m680n9uzCEr0
 UUTW3uENUGXymyqwtWz7C0fPDBt9chzM+gM7wdVx9YcJ2czpSGPvkHR73Qt7B9a3IdGr7c0P8PC
 ZEawR/kxYfb9K3NGKqw==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695b52a4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5IpSEunilBm-A8HMIfAA:9
X-Proofpoint-GUID: EquOHCZ0U9EjQIu8_owkmoHH_DNxSZz8
X-Proofpoint-ORIG-GUID: EquOHCZ0U9EjQIu8_owkmoHH_DNxSZz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050053

WCN7850 will first attempt to use ELF_TYPE_PATCH,
and if that fails, it will fall back to TLV_TYPE_PATCH.

To code uniformity, move WCN7850 workaround to the caller.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..561e51fa9 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -581,28 +581,11 @@ static int qca_download_firmware(struct hci_dev *hdev,
 
 	ret = request_firmware(&fw, config->fwname, &hdev->dev);
 	if (ret) {
-		/* For WCN6750, if mbn file is not present then check for
-		 * tlv file.
-		 */
-		if (soc_type == QCA_WCN6750 && config->type == ELF_TYPE_PATCH) {
-			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
-				   config->fwname, ret);
-			config->type = TLV_TYPE_PATCH;
-			snprintf(config->fwname, sizeof(config->fwname),
-				 "qca/msbtfw%02x.tlv", rom_ver);
-			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
-			ret = request_firmware(&fw, config->fwname, &hdev->dev);
-			if (ret) {
-				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
-					   config->fwname, ret);
-				return ret;
-			}
-		}
 		/* If the board-specific file is missing, try loading the default
 		 * one, unless that was attempted already.
 		 */
-		else if (config->type == TLV_TYPE_NVM &&
-			 qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
+		if (config->type == TLV_TYPE_NVM &&
+		    qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
 			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
 			ret = request_firmware(&fw, config->fwname, &hdev->dev);
 			if (ret) {
@@ -861,8 +844,22 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
-	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
+	/* For WCN6750, if mbn file is not present then check for
+	 * tlv file.
+	 */
+	if (err < 0 && soc_type == QCA_WCN6750) {
+		bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
+			   config.fwname, err);
+		config.type = TLV_TYPE_PATCH;
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/msbtfw%02x.tlv", rom_ver);
+		bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
+		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+	}
+
+	if (err) {
+		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+			   config.fwname, err);
 		return err;
 	}
 
-- 
2.34.1


