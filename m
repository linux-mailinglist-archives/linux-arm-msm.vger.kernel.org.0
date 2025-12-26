Return-Path: <linux-arm-msm+bounces-86636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5BCDE776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 08:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B43A0301176D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 07:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8363148B4;
	Fri, 26 Dec 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7jrJBh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965F2313E0D;
	Fri, 26 Dec 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766735792; cv=none; b=F29WNQU4GbTZHw6oQoORT3XjRiMTqcdqTJ4kqzjoD7JVI+/y4G9LjQRMzUgM/xzBKewnpCGWXYGWhZz6DLe5fR+aohzFrC8Fc5NpYUd1GguglAe880EWqXcT+oaW2JESb2PgCGksJCDfnaHEL13M3ayFWp0FL+/1+c2KWkUHlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766735792; c=relaxed/simple;
	bh=P9Do0Tp4sGkw0y6WtSzuk18/oE8qrdLciT9xxL3KICc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9lAigPI4Yu5jHdlMao2LeAE7vrGBZobFmDhmQ1gHFgR2QJcoIuAyETtXSpoOeK927Ud907UamQsrW87Dj9Fy21Ix/LVxGO5AJK2lPXjgsCs3BvEwPmsVy7pCUajeMIvLRsaDOLGQXgd1V3eSnamY8d61QNpd0NPL3TD7SUtNQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7jrJBh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPMNAJ73382207;
	Fri, 26 Dec 2025 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+aJbb4b1TK
	bfpfywa7h3829P6Crmwt3GUOpwxj7l0Y=; b=Q7jrJBh3n38uOkkHQZgBaH+7X3Z
	a7GTJULzE0on22I6rOs211Efn6bQr26Fo3YKe0Oh/dNqVCcM68UIeq5uYsSF4vpI
	D9asZCtXL5Dpbsbn9ScqWMOU1sMeTPALVB2TDDexEGui92rB41V8G26UCUkkCJ/A
	R+jmKPDUjmnEs6n9+JQh/Bs5s4OzyPvjJGDrX6Br3Q7zUDFGibXHQH/tOZr0h7Ki
	qi41VgTQB2sHwruiYvQ8B5UMQUGPobSc5g6j+luOPf8SsWCokafIpkaJVjwSewzb
	KOObqm7ZvyCi3K2Why67L8hqARFrq70I382BzPSqB0tn3FAuNxK04o9oMLg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9y2k6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQ7uOXd015693;
	Fri, 26 Dec 2025 07:56:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvmnybe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:24 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQ7uNOY015683;
	Fri, 26 Dec 2025 07:56:23 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQ7uNTg015678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:23 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 68C5323A80; Fri, 26 Dec 2025 15:56:22 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v4 1/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Fri, 26 Dec 2025 15:56:21 +0800
Message-Id: <20251226075621.3223336-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com>
References: <20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: PXBUg7RLkS40TOvHgrxzUZDq10IwzGCO
X-Proofpoint-ORIG-GUID: PXBUg7RLkS40TOvHgrxzUZDq10IwzGCO
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=694e3faa cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5hFdRauQfWoEGVQB4jUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA3MiBTYWx0ZWRfXwE1YPmA22nex
 cQbP1Y+9VEOyVMPahbLrCPVyASB7AIovrLDNjNYPxOzfLpozO6Jw/KPbL5V1BpumuImlk/MEh2j
 tOrV+2CJtP6WjcW8Qk9AuOlW8gfweqIhj1EJhODOTlnkIRmXx7+IfvozuqWMQXnk7FwsOkbVIso
 EsjknHodmOFQazkl8jlVviO1DQc0To9gIK5aVJn9TwZHUibQ0jyxDaudq4RPoiEigYaU4wOaGF0
 iCF27cwsg2zh5eaDQXx3i3Ap9Ez4X6BynX9wrzbNzCivFmpNWeyrlFp6643hOBRkjrYJhf9C0AM
 j0QMIYwoZos1sxGpRgtHGsH2DygSGZ90MNCunJRE76aqsqBjF8xM7JzxLnXI/Bd5mJg3AYx9HwY
 VgQFXIz2AI7b9CmHbaZIle4fNUbjevDlAt1HglQQiT+GTtFyV0kkyaklsceefvRxw6x8B6esVmM
 AhJ4sY2IcyQbmDPsZXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260072

Historically, WCN685x and QCA2066 shared the same firmware files.
Now, changes are planned for the firmware that will make it incompatible
with QCA2066, so a new firmware name is required for WCN685x.

To code uniformity, move WCN7850 workaround to the caller.

Test Steps:
 - Boot device
 - Check the BTFW loading status via dmesg

Sanity pass and Test Log:
QCA Downloading qca/wcnhpbftfw21.tlv
Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
QCA Downloading qca/hpbftfw21.tlv

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 62 +++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d606..81b0208cf 100644
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
@@ -847,8 +830,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 "qca/msbtfw%02x.mbn", rom_ver);
 			break;
 		case QCA_WCN6855:
+			/* Due to historical reasons, WCN685x chip has been using firmware
+			 * without the "wcn" prefix. The mapping between the chip and its
+			 * corresponding firmware has now been corrected.
+			 */
 			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/hpbtfw%02x.tlv", rom_ver);
+				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
 			break;
 		case QCA_WCN7850:
 			snprintf(config.fwname, sizeof(config.fwname),
@@ -862,8 +849,26 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
-		return err;
+		/* For WCN6750, if mbn file is not present then check for tlv file.*/
+		if (soc_type == QCA_WCN6750 && config.type == ELF_TYPE_PATCH) {
+			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
+				   config.fwname, err);
+			config.type = TLV_TYPE_PATCH;
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/msbtfw%02x.tlv", rom_ver);
+			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
+			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+		} else if (!rampatch_name && soc_type == QCA_WCN6855) {
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hpbtfw%02x.tlv", rom_ver);
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
@@ -923,7 +928,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN6855:
 			qca_read_fw_board_id(hdev, &boardid);
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
-						  "hpnv", soc_type, ver, rom_ver, boardid);
+						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
 			break;
 		case QCA_WCN7850:
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -937,8 +942,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0) {
-		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
-		return err;
+		if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+						  "hpnv", soc_type, ver, rom_ver, boardid);
+			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
+			if (err < 0) {
+				bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
+				return err;
+			}
+		}
 	}
 
 	switch (soc_type) {
-- 
2.34.1


