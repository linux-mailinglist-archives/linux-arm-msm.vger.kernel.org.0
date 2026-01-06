Return-Path: <linux-arm-msm+bounces-87600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB4CF66C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30017304F898
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BBD2343BE;
	Tue,  6 Jan 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiaE+8sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F62135D7;
	Tue,  6 Jan 2026 02:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665270; cv=none; b=IBHlHb6O7fCA4VD3gFiQFBmHVslyjYhN7dB5AL0DI0rJMgR3/xnTIneAzqHJhb7As4c28WSXw5qL7w5kztFm8sbeX28C4+Tif1GOeDNJ///z8rjSy/3zs+oKxDFEIO4hbUz6uzCrq4Z4TXgvRVmp3PqiLPA2UDohPpvNWCDPdgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665270; c=relaxed/simple;
	bh=vLdG61hxh6edLr39DL6Wi7EzAXaD1grWlE15EgSuFyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fVnKHCTZbpN8r1g7eUXebf7NgwS6ktWbEg9fxSfRcN8D4VaNvZgjcuCMmgyt8SgpkAQBuV1JdlnHAQjypORHKL6szb0vUf1YZ1kdywkvumqIS9Z3DA8vy9e7zcul5t9bJNSMntYpiWOUWqN//FwstLN36gc//lFFZvnEK+RTilo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiaE+8sy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060ocat2107394;
	Tue, 6 Jan 2026 02:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1H5tqNCdp+8
	T1kKeMow2CdFlZfiEoXEr97tP+G0TfgU=; b=PiaE+8syqxMVnOvwQbitWr3pDUg
	DeILK/7V0kjZxbes240DsCXIlU0MHUi/EhwLeCtS4mg9m700TWNEZMd1ulNsfuYR
	nRfOKHNAWMBWbisRzzrrF1SQ1P0jnZLMvVNt5VokOdn/z0AUL9fpgRWqeCwxL5U0
	lvbq1gbrIAuUyQPdTVMphfcZmlR/Lr6rzE98+ltSP0Mg/jZWGDEszVJ5V1ty5uG3
	+aV2gVZfpqtYKuuyM2hxOWD8CmhDBFoNnZ3w8STwgH1eZ5MI6XJNp+n+aBN5m5sD
	PQYjHdRFj4g4KO10ko9PL95jTomYQo65wL2N0wLygbqu3WMjBG+Uqxxkw/g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7385f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60627din018707;
	Tue, 6 Jan 2026 02:07:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kwsyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:39 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60627dOh018693;
	Tue, 6 Jan 2026 02:07:39 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60627do5018690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:39 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id CA9A6235DF; Tue,  6 Jan 2026 10:07:38 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v7 1/1] Bluetooth: btqca: move WCN7850 workaround to the caller
Date: Tue,  6 Jan 2026 10:07:38 +0800
Message-Id: <20260106020738.466321-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695c6e6e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qIci_JhjpdMqbErLLe4A:9
X-Proofpoint-ORIG-GUID: _Xo7ZiAUHNrexKpftgTmS493SFK1eiWI
X-Proofpoint-GUID: _Xo7ZiAUHNrexKpftgTmS493SFK1eiWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxNyBTYWx0ZWRfX2u9Vj1EtScFZ
 OQHInT0tLufVR3neS4eJGitQ1qEnwFJCOKy2MZQQgPRDoPFMInGLmF3n3g8hbkVGT7g/YJuKnRi
 WVPWj06aP61F5J29/CAbW/6aiRp9lXBYaDaE/7GHXFrqyXsiRFsCzVfFX0CjRfMpYegLvUQWst+
 abf78NG0JLAzt65a/1QJo3kvzu5KPuujKb5MSNMgiqcU8ei5dPYAQK5ysVZpfope1WmmDCbgMZP
 lza1GvdZb98Dh1WBSqYm5s6wUdCxjTw+zBY2a04PGW5TFv2vg6zddyKVpt1VmIgcos7jpKmf71f
 VR50figiRyr8D8aF4XrBLCwYKqvrFye8MrMGlgR0B+zHOjVR/lCCWnBbwdOoVQkR/eJeV1jFedc
 gTgghM1AzrtqAq28GosdBd9FY9Kx18OgP7gWnWtSEBK/Z1c53ebay/q4ubT2Lsi4nLmkeoCF5PC
 J2NYUIiXqANDdmad0aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060017

WCN7850 will first attempt to use ELF_TYPE_PATCH,
and if that fails, it will fall back to TLV_TYPE_PATCH.

To code uniformity, move WCN7850 workaround to the caller.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..0af3e2109 100644
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
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
+		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+			   config.fwname, err);
 		return err;
 	}
 
-- 
2.34.1


