Return-Path: <linux-arm-msm+bounces-87624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479FCF6ABB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 05:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5530305CD0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 04:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F902868AD;
	Tue,  6 Jan 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1H8VXGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F01C695;
	Tue,  6 Jan 2026 04:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767674116; cv=none; b=gf5SoMNU7YHPaN5pM49NLDJQJtUmnqeWPLJ6Y0Qab0up+P3L2RqmXY5eg3/2+DdJthMgnoqEpqxaSWbx6TuX7RFojRNJg/D5TQgsbuA+zyuosvdTVSxaAJvwLDzQYchLUB1GVO9eCy2fNZcM/V9Bssi/e5be5XhnazXrYq+udMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767674116; c=relaxed/simple;
	bh=vJrdttF8LiB2zygyQQI5m1ezHWCgPes80GkMLIpzVHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hN82gkDtNdq1Mdqb8XxlJJAiQXSXsxlD+vPa1r7217L3WRgmoYeYtyjw+166751LiztMrUObpnkiTala6Kxf0cdwnOlcQej1whqxvRPwRL0Hqi9H0Zdrozw7K3uNuUY3ETJQ/kq5TqwXnchVKmZEBMDYIaLJ4T8KCWAWMzh09bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1H8VXGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649YED2255188;
	Tue, 6 Jan 2026 04:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7xPGTzeyH9n
	7qkYeLM6CaLNLmZ57MZOrJdfjCxncBYo=; b=Z1H8VXGSV+/sX6EWRFafFuEpgCE
	GfRVRVsvDJTj49qBcYlxUOpXyaujPHtRwhJzYv6+bKe7V2TP/X+jxzcAJEMkuEbL
	Fv51yHdH9zD30S3HBCGJXyLt+TcnubSFHDZxwLSgyNS3EXqGZsex2srr0i9OvqEW
	WNIjGucUXNcBmRP8k6wKeF+seGtaD3ZMC8dS97WMzjRUqc1MeLuJrWYKS6p99BLs
	VltZlqRfD5ybu40hrgfIgTB9c53ghpGyKx0s/l6/0eaJfVrus6PYkICCKzXzsUDT
	ULst5d1qdMWmoHfuS2DxV61DGD8jIETVYVRCNstF6SUtO9/M9BoRgIMNX+Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu4201qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6064Z64O005739;
	Tue, 6 Jan 2026 04:35:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kxje9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6064Z5Sn005725;
	Tue, 6 Jan 2026 04:35:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6064Z5k8005723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 928DB23254; Tue,  6 Jan 2026 12:35:04 +0800 (CST)
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
Date: Tue,  6 Jan 2026 12:35:02 +0800
Message-Id: <20260106043503.534557-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
References: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695c90fc cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qIci_JhjpdMqbErLLe4A:9
X-Proofpoint-GUID: NBP9W4af7q_YOo7sD3Low9tZpoVfduhL
X-Proofpoint-ORIG-GUID: NBP9W4af7q_YOo7sD3Low9tZpoVfduhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzNSBTYWx0ZWRfX5DmNOOOl6dKd
 sBjBqCEdU6jMz8gpeKjFvjriQA23WrfkGA5PXkmCbFEaAuk2rxus0RGD5SjoOBVQ0pYnFKfcXhk
 PFIk9NujTd/MHWEK6B1ac6OMoZIncEqIymSAoYAfUoupWYH5Orwgjd59HGHgHI/D669l+e5DYIe
 ytjNa0eVPPYHvCPGn5sxUfMgD61tm8V6WPGYHzFeUpSqvyb1bQmpgfIVhA9hBmgcoGMFMf80iZb
 hXTpTzsJ/NQXkI5VguP4ijgNOlULzt47q7KhWt4Xs8GdP34bGV8A1tbXyC6KUXdytluRl+QeMIb
 luEqm/dwY9XjxcBif/0SKyc9QFYPBFSciY1iVRLjwrXPwTWSO964C9U6T11pZX5rN1VOzxBmbDL
 StegidrNzCQRsK6WOAjGQenTk7qZH+fpZiuWK8Tpdo+oW78cJNYvf+icRuvVirH4cewWsoU30Dp
 e5Lqsm0AnNnFGjw8fUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060035

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


