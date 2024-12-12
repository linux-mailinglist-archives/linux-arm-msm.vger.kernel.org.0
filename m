Return-Path: <linux-arm-msm+bounces-41758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C2E9EE9B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BF781884AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A45A2156FF;
	Thu, 12 Dec 2024 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kAbtKPBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94C218594;
	Thu, 12 Dec 2024 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015789; cv=none; b=MTeUrK9SB/zsp2kD0RnFBoa6ma9IYU35XqxJIhEHvHcredyuGOC2j5/9kbrwbh9lJo4F/P0OqikE0br7zI/jTY1mdW8Ou8M9WWP1vRPYAqMIx1oinAGcdXGLeKGmpIMGCFQGHTuQp+IX3BZ1XIwyhbXBr5/eFt0FubTdT4Iaf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015789; c=relaxed/simple;
	bh=qaiVxVedwTQeWOvfKBeWvhkjkWr81uV8hjDB8H/ybcE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFwl7w+i/yr9KOc+ooUa4BQ8KsQ8IlAfYQwlOg+gPYYbqMeM9gp+tM7FoavAx/HA9Ja0xkriEMFTI1F4Tnd2W46znAcN2Gs5UscEDUBjLQXlyJd1qY7vtWYDFBNv7iSAqFHn8HCp5W7IoXseiVY54JXypatZ3Cd/Jj0bqPOq1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kAbtKPBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCD5MoE000485;
	Thu, 12 Dec 2024 15:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OFQZMr/QKm59dsonAedS8Ba2AMGBQGQ4bXpilRcI8g=; b=kAbtKPBQ3TsmT26g
	jCBaQO3piqOP22GVvgVPZ1N+c7Ywhfa7ZjudyVsvAp8YxHj1bZpzEwZUqvlVMZwu
	tPkUoEUCchyyxYW2RrhIeNH5y/SQiE5a7tlGEIN7UAM/o5GbYMmjLbEnnz7Oxpom
	ZL+IPSuDxQbX3IGCsVqqJe/Cpdn9JV8Q4P220Ou8PfIDo1qDT7jbg3AR4+OtLSYl
	2ovQfokZVb4uAY34rFWYSvwb8cs4fbfMrM3v7NP99HkRHbIwDpbk6biF+n4X9513
	knst9TlVlyF2k0kWfICskzy+5u9UG/xO1E/2MgAvr4UzBhX7vLzwQMU/vsQBB6xI
	ncnZmQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes1u6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:03:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCF2weO018993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:02:59 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 07:02:54 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
Subject: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support board specific nvm
Date: Thu, 12 Dec 2024 23:02:30 +0800
Message-ID: <20241212150232.3823088-3-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: at8x9HIkMxlV9k_kd4EjVJeXeUHN06Ik
X-Proofpoint-ORIG-GUID: at8x9HIkMxlV9k_kd4EjVJeXeUHN06Ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

Different connectivity boards may be attached to the same platform. For
example, QCA6698-based boards can support either a two-antenna or
three-antenna solution, both of which work on the sa8775p-ride platform.
Due to differences in connectivity boards and variations in RF
performance from different foundries, different NVM configurations are
used based on the board ID.

Therefore, in the firmware-name property, if the NVM file has an
extension, the NVM file will be used. Otherwise, the system will first
try the .bNN (board ID) file, and if that fails, it will fall back to
the .bin file.

Possible configurations:
firmware-name = "QCA6698/hpnv21";
firmware-name = "QCA6698/hpnv21.bin";

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 drivers/bluetooth/btqca.c | 112 ++++++++++++++++++++++++++++----------
 1 file changed, 84 insertions(+), 28 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dfbbac922..4842f4335 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -272,6 +272,38 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
+static bool qca_filename_has_extension(const char *filename)
+{
+	const char *suffix;
+
+	suffix = strrchr(filename, '.');
+	if (suffix && suffix != filename && *(suffix + 1) != '\0' && strchr(suffix, '/') == NULL)
+		return true;
+	else
+		return false;
+}
+
+static bool qca_get_alt_nvm_file(char *filename, size_t max_size)
+{
+	char fwname[64];
+	const char *suffix;
+
+	/* nvm file name has an extension, replace with .bin */
+	if (qca_filename_has_extension(filename)) {
+		suffix = strrchr(filename, '.');
+		strscpy(fwname, filename, suffix - filename + 1);
+		snprintf(fwname + (suffix - filename),
+		       sizeof(fwname) - (suffix - filename), ".bin");
+		/* If nvm file is already the default one, return false to skip the retry. */
+		if (strcmp(fwname, filename) == 0)
+			return false;
+
+		snprintf(filename, max_size, "%s", fwname);
+		return true;
+	}
+	return false;
+}
+
 static int qca_tlv_check_data(struct hci_dev *hdev,
 			       struct qca_fw_config *config,
 			       u8 *fw_data, size_t fw_size,
@@ -564,6 +596,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
 					   config->fwname, ret);
 				return ret;
 			}
+		}
+		/* For nvm, if desired nvm file is not present and it's not the
+		 * default nvm file(ends with .bin), try to load the default nvm.
+		 */
+		else if (config->type == TLV_TYPE_NVM &&
+			 qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
+			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
+			ret = request_firmware(&fw, config->fwname, &hdev->dev);
+			if (ret) {
+				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+					   config->fwname, ret);
+				return ret;
+			}
 		} else {
 			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
 				   config->fwname, ret);
@@ -700,34 +745,38 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	return 0;
 }
 
-static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
+static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
+		const char *stem, enum qca_btsoc_type soc_type,
 		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
 {
 	const char *variant;
+	const char *prefix;
 
-	/* hsp gf chip */
-	if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
-		variant = "g";
-	else
-		variant = "";
+	/* Set the defalut value to variant and prefixt */
+	variant = "";
+	prefix = "b";
 
-	if (bid == 0x0)
-		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
-	else
-		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
-}
+	if (soc_type == QCA_QCA2066)
+		prefix = "";
 
-static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
-					    const char *stem, u8 rom_ver, u16 bid)
-{
-	if (bid == 0x0)
-		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
-	else if (bid & 0xff00)
-		snprintf(cfg->fwname, sizeof(cfg->fwname),
-			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
-	else
-		snprintf(cfg->fwname, sizeof(cfg->fwname),
-			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
+	if (soc_type == QCA_WCN6855 || soc_type == QCA_QCA2066) {
+		/* hsp gf chip */
+		if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
+			variant = "g";
+	}
+
+	if (rom_ver != 0) {
+		if (bid == 0x0 || bid == 0xffff)
+			snprintf(fwname, max_size, "qca/%s%02x%s.bin", stem, rom_ver, variant);
+		else
+			snprintf(fwname, max_size, "qca/%s%02x%s.%s%02x", stem, rom_ver,
+						variant, prefix, bid);
+	} else {
+		if (bid == 0x0 || bid == 0xffff)
+			snprintf(fwname, max_size, "qca/%s%s.bin", stem, variant);
+		else
+			snprintf(fwname, max_size, "qca/%s%s.%s%02x", stem, variant, prefix, bid);
+	}
 }
 
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
@@ -816,8 +865,14 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name) {
-		snprintf(config.fwname, sizeof(config.fwname),
-			 "qca/%s", firmware_name);
+		/* The firmware name has an extension, use it directly */
+		if (qca_filename_has_extension(firmware_name)) {
+			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
+		} else {
+			qca_read_fw_board_id(hdev, &boardid);
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+				 firmware_name, soc_type, ver, 0, boardid);
+		}
 	} else {
 		switch (soc_type) {
 		case QCA_WCN3990:
@@ -836,8 +891,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 "qca/apnv%02x.bin", rom_ver);
 			break;
 		case QCA_QCA2066:
-			qca_generate_hsp_nvm_name(config.fwname,
-				sizeof(config.fwname), ver, rom_ver, boardid);
+			qca_get_nvm_name_by_board(config.fwname,
+				sizeof(config.fwname), "hpnv", soc_type, ver,
+				rom_ver, boardid);
 			break;
 		case QCA_QCA6390:
 			snprintf(config.fwname, sizeof(config.fwname),
@@ -852,9 +908,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 				 "qca/hpnv%02x.bin", rom_ver);
 			break;
 		case QCA_WCN7850:
-			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
-
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
-- 
2.25.1


