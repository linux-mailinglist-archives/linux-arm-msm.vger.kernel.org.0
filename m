Return-Path: <linux-arm-msm+bounces-87068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB72CEB7F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA9C302C8D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFACF312810;
	Wed, 31 Dec 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihhugqIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324193126C6;
	Wed, 31 Dec 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167920; cv=none; b=Dmr0Ur11ot86SpzvEtcr5x5k+t3npNbPeIINWfZcj5/9HjCVL6w/OanBGcpgO3NWJNWVJllJp7EtOtaWyCy/n61EwIRtKTMGzOwj5PvTcqgbXjlzzEj9jlyoprWoeSl/GI8qgrvhitZ9ir6XH2xdDcOkPbT4onIGt5vzETnQhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167920; c=relaxed/simple;
	bh=XCRAPPR37AaDNKIGC3UikJT66a3V23RmiBcbm7aKN34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Orap8jeZeVpzx8rjFPIit6Ubv0L+LtHkSyEhuQW2GFJaCirFPgtEvznbPFPDUun8Id7xgwAQdUgEEVmdPCxXEO9onflbSL+hRvWzz5WSB3uDYHF0WAuvG7jPxyPFhien2mQreP2cQ76aEAmn5tSTm4goGbnCX/6v2oMp5YZdx5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihhugqIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4oXu51429526;
	Wed, 31 Dec 2025 07:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=trYAAvVYZU/
	cOcdgrTkDbQ3dfqKL9xX5wQwnsg29mJs=; b=ihhugqIKLGjuwHabncB4KTOyNJ+
	yrqj61rqcwCJ0/oeRUqHo4U91lPHc69xrhqTcphS+FmVKraSZozWnwkW36yH5nnG
	OlEaa7jFHjSK4OFljicUkSO3rLkLerukvQlBDoSCVwkdLaU6j8gwwZ2sVzhv+Ai3
	nhk/aB+waGa/1tDOh8uz8Guo6Mq+s7XnL1a1OwIZZTQv0OW05jgnyn+su7z2N1N0
	FaJ9Kc9YCdeoeXs4VPAp71k+uM3VSeSmWH3N54AjToiCvczJC1SBZq5gN7pRnEWz
	CW6c9ys72fD3WbYK5YpQLFapRF1Oz1f9PJNcSJOpBsBD4VCO2/yWlNYVOGg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0aak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BV7wTc4023885;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ba8hm6q0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BV7wThO023865;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BV7wSmF023861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1DC3B23493; Wed, 31 Dec 2025 15:58:28 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v5 1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
Date: Wed, 31 Dec 2025 15:58:16 +0800
Message-Id: <20251231075817.2611848-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA2NyBTYWx0ZWRfX4rEhugnCSzTn
 V5YO9e37asMOdQxvjpfbe2vj4M4gaWlfq5SQLfmkrTha0/ELcPU79/Opxfw5f+78cmAL4G1a9v6
 jhtJsYOeG53cJaiYw1CUV9hT5+Y1mIMj1MTMG97uxMZepqadsKEii8MVbZs6y4yDFAbe6aQlHXB
 Wgs72D3APoPrM4N0t3FEZbSalFG/WGcr36V37PRh1zcnBAVSK1oFbIX60+SVjpVnSVuAHsq3NPR
 Xuqyuinr+t8uMopAenbNTpQ0lMAS+0Zu/QcpnCIhBbiXcit5HO59cS97VOjvFac+mNfCJz42RAk
 km1N3XWRVvyGv4mk0aJQTzuR0v+D9EktXEtQD8zdr6rW6IKfGZSBlPA1bFghOrW0SD3qnyF3zbk
 3CBy23Y7qoIu5ViTyuE/ZfQLeNNQiN0GZQvrXG3Rz7ubtuwzQ9k947sZ4ndKAZzJVjFxYet8BcW
 bZGepDwftePmOPBwTwg==
X-Proofpoint-GUID: cIpUbtIw3AzT2NF7sLu2xg4RvwOG2w5B
X-Proofpoint-ORIG-GUID: cIpUbtIw3AzT2NF7sLu2xg4RvwOG2w5B
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=6954d7a7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-XRjuWSUs4zpvgrPjHIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310067

To code uniformity, move WCN7850 workaround to the caller.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 41 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..b4c0a018d 100644
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
@@ -862,8 +845,24 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
-		return err;
+		/* For WCN6750, if mbn file is not present then check for
+		 * tlv file.
+		 */
+		if (soc_type == QCA_WCN6750) {
+			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
+				   config.fwname, err);
+			config.type = TLV_TYPE_PATCH;
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/msbtfw%02x.tlv", rom_ver);
+			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
+			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+		}
+
+		if (err) {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   config.fwname, err);
+			return err;
+		}
 	}
 
 	/* Give the controller some time to get ready to receive the NVM */
-- 
2.34.1


