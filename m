Return-Path: <linux-arm-msm+bounces-87607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70DCF681B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A4EA301786E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0893821D5BC;
	Tue,  6 Jan 2026 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrigJ6Y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B3B14F9D6;
	Tue,  6 Jan 2026 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667700; cv=none; b=hS7Q7lnPlxJ30qC1FIiToKnOqqmd8wOGbpHd9/TNrRkTxXjVf2s6xLgv8ExlrcUGFYQCSAgHzSjhXoaR+0k3OHzZmQH/z25uW5MRgXFFYnNmpNMPXkkk9dzMWNoP1ZnCJnB+1GDonWWI/0F4xBO49WetfYrXt1Z35c9vnb7873I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667700; c=relaxed/simple;
	bh=vLdG61hxh6edLr39DL6Wi7EzAXaD1grWlE15EgSuFyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rwCTCPOjnL7YDiNZv0KPqQvNU0t7StlADXsGfkUfNoCFcWzEHAMz7aENoPz1xZf/JoRW3+XxoMDRNsy6xDNXr2MeWwm7TrYDGD+hNhjHfLWZSkJpvqrf8wrh6Wo/4r7cddRZeHDLcf0drogJYuqmMAgUMD/IWrgqYgoYl9JdtdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrigJ6Y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60617woq2784761;
	Tue, 6 Jan 2026 02:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1H5tqNCdp+8
	T1kKeMow2CdFlZfiEoXEr97tP+G0TfgU=; b=OrigJ6Y2xx8paLyHMg19YqX1Mce
	fYbLHiksrQxkhKqYfpjEMQQJZfUlb6hCuhWVXjFwUu7Fc9Ns6jwb7F25WMBv/uQW
	jrePbiX97klgUu+k0qHMqJ//LtOTNkPEgbqnuYxAysv7Sd570/2+HZ54enD4Jyvj
	RJOoc/YYiTE3ibBYH15PKTTeNfd4X3ENOILrilII/ls+sexSvm25WCK4Wq0c1ZQD
	tTeIR3CxijuLrP6ZFLFUFapeWXwZloEjIupgmCePDEOY2Vp59mk28jUtx9wqHGv9
	Uae18LZEFzQMqDAYAGUPC4GQXcAblXZ5aCmHS78OIzX3PfeuM6xvlWgxYfA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7g7f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6062mBlO032060;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kx0pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6062mB5k032038;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6062mBqq032031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 7BB7123262; Tue,  6 Jan 2026 10:48:10 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v8 1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
Date: Tue,  6 Jan 2026 10:48:05 +0800
Message-Id: <20260106024806.480779-2-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XSfcmKKpsQ2STSQwEShFeLPGdMTWOIsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMiBTYWx0ZWRfX/Ip8bxp8Qmu7
 WDy1nqGlvOR8+519RppNF2dLwRWODeNPP4FGAvFZPuNkfj3grmW7Q42i93Orm/2qAKL7Hz03tPb
 QH+lKURAPzyXySStJMuIU3hjDump73dPm2fiZyHquBO3nCRceraTk2TrxWpvcgKGcAtYLyWjoTc
 n8qMgb507I6YUtXjGhu/AqMMvHmWPaVYspOcTVLEBqG9iRQhgdLOT7YMSFXzM6u+HeWXRADkzcd
 59cAQexUno4vQhpM+e9Uszo2X6po6jGooWVIRP9yuCteDrJgqiuMg52bTzxlmpDJh69wg+ICrMS
 70S0/iPCC9uQ1DlnfLtLt5zO1hD9G5Xv2US0+/fb2V6BayMg+Q/rtB0SpNMItPapA64ag6kc7cP
 GxFjANjAHoqz3UbqlGhA4EgfFjcLbNc/e/K9cCuP4Ou8yWoLFKOAIszdLFuFCaWuWGoN1mZO9iK
 hoH3r290Of/RyNbBncA==
X-Proofpoint-GUID: XSfcmKKpsQ2STSQwEShFeLPGdMTWOIsN
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695c77ed cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qIci_JhjpdMqbErLLe4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060022

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


