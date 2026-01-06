Return-Path: <linux-arm-msm+bounces-87619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B156ACF696C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 660FB3062CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 03:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2A72517B9;
	Tue,  6 Jan 2026 03:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBl/j5cA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67721FF26;
	Tue,  6 Jan 2026 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669155; cv=none; b=rAF65q+QZJ8AflgTa3hTBmBk39gg4wS76tGZHdmzy5i8CgSZd9P851zDeoFq35Tfp0VYzi1W6hskIZOM7ELT0gLm65DsvFyZyEOiT8gxFzzTJpOJ0AzwqZrrHiSrunb1UtfcUEGgN8aOsdzhLKdruAsaZTrGHMcgQWp6TeMXTSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669155; c=relaxed/simple;
	bh=vJrdttF8LiB2zygyQQI5m1ezHWCgPes80GkMLIpzVHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AthYbQRU/X+yx+ZSlhd8OW2A/4/GLU5kFC3HklOMFlYgvajVn1Y6LDaLoqgWOM+fVyJag0bdhJ5psZFQW49aY/0ET9TNc63+e6oanNtljhMto8O4h/CviFpKhKUgFtUs1S3TsYMSXBc66iYNw/ZR08O5WzDm3reYBQOAloW3rMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBl/j5cA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6062BI2T2765265;
	Tue, 6 Jan 2026 03:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7xPGTzeyH9n
	7qkYeLM6CaLNLmZ57MZOrJdfjCxncBYo=; b=dBl/j5cA8KuW19bkua5uJgoRj4p
	LLqp/aXUI9lcd8ipFBw7EeA4Imc5TIGp1fOOn4gxequ2FT6vHEMcUu/a23nlxqYz
	L2LI+ADsHPhtS8oEXT1zziL20cs2QMwmkQXrsyrDxpriRC4HB7scSB2gQRaVGA8X
	7roJHC27ZvM4P/phhdgNofx8cCjeWU7op3XQPZBomgkoeXdAHuPTNremN3lrqZ47
	NEPlETSvnWD+eMDI74Xj+6zhRtNRSPrY4gbV3TwJOgcgCPikauH7RgUSeeinF7bf
	MWTLg6NEO+/qaEfVJ6yEm8UiJO7zKTSt2QL3RxmTqo+sb59rENw0P6/4SmQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy84uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:28 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6063CP53018806;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kx4pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6063CP7o018794;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6063CPhm018791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 7A8A123262; Tue,  6 Jan 2026 11:12:24 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
Date: Tue,  6 Jan 2026 11:12:22 +0800
Message-Id: <20260106031223.499706-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com>
References: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: z4umOPbrL7MmxaVM4gnu86SHO0eEnUiC
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695c7d9c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qIci_JhjpdMqbErLLe4A:9
X-Proofpoint-ORIG-GUID: z4umOPbrL7MmxaVM4gnu86SHO0eEnUiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNiBTYWx0ZWRfX7JOzM01CbszL
 EL+0TafITmRzg5deFEkSpW/VO1QlUysvZ6t3ueCOywcHNEBREG3yPUoDsbeeUrCOkqLpUDeFUq1
 EGMzrue3WO7yotEWGvt3h0Bwvh0lnUGSm1d1osfk9LeZIZ+hP4Tk7apwuIpBoc/j9xYxbH1Jhs6
 G7ZGcvh9pDhpUQJdWMJ9ruCfVTzlwF9/B6UidvECYzG7ck4Cx/YGo0CWJcouovBiRy7U0E195zq
 uya/tv1eGPVKv5SAgqyC0RDQpBc/3ZFhA74xMcYI5+Xsg6aGfUidgz89oK6MBOcMrYUm0KfuJF3
 ySJEHhqLQaOmJe2DDjq8fcqk4TKlJjD1tvHajGioBADTqVxjWKCHBca53I10Uitp7YFzq100AR6
 0tzERQmPDe6nhmA1YBBQSTd0LkE9Ts/ho767ppVmCXsLirPjsLqf6ZYu+MaCDgYVDtDYFvvWvcA
 NfPguUfturYlnHcdSXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060026

WCN7850 will first attempt to use ELF_TYPE_PATCH,
and if that fails, it will fall back to TLV_TYPE_PATCH.

To code uniformity, move WCN7850 workaround to the caller.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


