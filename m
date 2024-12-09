Return-Path: <linux-arm-msm+bounces-40965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D39E8B1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 06:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247AD18813DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62281C1F31;
	Mon,  9 Dec 2024 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fl5RF8kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7531C0DED;
	Mon,  9 Dec 2024 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722801; cv=none; b=W+ngyrNNnZofMuxzD9j06KTRXZzxkF8pJrf3mLYNLcfldiDjrZ69D5mNNK9M5iO+6u6v6iW3sfN8mHvtSYMOenjPZFhsDMvgjkdcar5QqlVLR0/E503TSVmJb8PndyZMiyQjIxKTB4SwTIuZx2QFY83aRU4Dk4V9UzLP3maLczI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722801; c=relaxed/simple;
	bh=abYGNgUPH//pgrFtrWBWqPY5rUFm5BqZujjigrGyWaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Kdtmgunjao1WHccAlfT6zEctVcUmWiHJ6COJzqHHgNSKL2nRvDPzc290Ln0b3IDXBoXBsGMzwdTDYtoWlVz4x+kMQCWFvxotn7ah4tA9Ae4QV0M51J4hvvAJS8UbX5Aym6DVN0NRFPDNFY1oxTDZXbmEUuBEqD5qZbau4FhKNdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fl5RF8kn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NSqam014251;
	Mon, 9 Dec 2024 05:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R1sFPL66bMM1kyx014sWGC
	anG/MeMk6IQK37L5DQcAU=; b=Fl5RF8knEhmie1TPQXH0VTkHT+MArVsM1bKoe+
	gTw4h4bzuLvt2UFomW78uoSinFnnggvnWQhI2qoJs596O1sNesE5O5qUZXx2TrkR
	amEwUq81rgAVtK6CYQ7PilGfHQeYSDDppS5FyYzbrQWKgSnzBfwXyGA95Te+szXA
	aaMGk5S6OEcWrw1md03giTNMmZag+4xXRVtvqDETG0N/ndHptlTlUDN9X6eK1h2V
	RsQU9r7tNGXYVwlyIcb7wMOfQcpmZAWigdlIWqkgaAEcui4OgyzmUkOabvdBRLQq
	5STWMzbqCchL7vpQtRTi9krKQNYtXe2eSTNTipZXhGQxLm+Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhkbbyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 05:39:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B95dvGd015856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 05:39:57 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 21:39:55 -0800
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Mon, 9 Dec 2024 11:09:50 +0530
Subject: [PATCH v4] bus: mhi: host: pci_generic: Add support for QDU100
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKWCVmcC/43NTW7DIBCG4atErEvEDEOArnqPKqr4GRoWtRtTW
 60i3z1OlE2sVMryG/G8nETjoXITr5uTGHiqrfbdMuhlI9IhdJ8sa162QIUEgFYe8whKfYxNhph
 thh3o5KJY3n8PXOrvtfW+X/ahtp9++LumJ7pcH1UmkiApWLTGckYDb8exptqlbeq/Ltmb8WvD2
 UXmAISeHxpUem08ksISsQQw/xham6RD8YayNzE/a6iQdgjgnH/6H5OiKXFH2qC+M/t5ns+v2nn
 NqAEAAA==
X-Change-ID: 20241127-qdu100_us-abd7d1613c8b
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_krichai@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vivek
 Pernamitta" <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733722795; l=4243;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=abYGNgUPH//pgrFtrWBWqPY5rUFm5BqZujjigrGyWaQ=;
 b=U7VqhRsDI5lVB/Ke29bsw6T6a4d08a1hC06y8xGyzkDz4SPxzjP0sFt8wehIYZCVeKA82F02N
 fX0j+pagheaB1ON4mnWJ0IZdJUaYH6502CRoGZZNhiKqux2WU26Qj7T
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m4xvUxxb3e4F-NNZAzIfrbH4HZwiuVZa
X-Proofpoint-GUID: m4xvUxxb3e4F-NNZAzIfrbH4HZwiuVZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090044

Add MHI controller configuration for QDU100 device.

The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
servers by offloading CPUs from intensive 5G baseband functions.

Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
changes from V3:
- Removed IP_SW1 and IP_SW2 support currently, will add once
  SW_IP1/2 channels support are added to mhi-net driver.
- Removed qdu100 edl images, as EDL images are not needed.
- Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
- QDU100 XBL FW images were pushed to linux-firmware git repo
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100

changes from V2:
- updated commit text.

changes from V1:
- Changing naming convention from modem_qcom_qdu100*
  to mhi_qcom_qdu100*.
- Updated commit text.
- Fixed and corrected by passing mhi_pci_dev_info struct
  instead of mhi_controller_config.
---

---
 drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 07645ce2119a71c9277356e962252b840379cd81..dee9fa9e7ae441fbc9a86e53694568c0ba192002 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
 		.channel = ch_num,		\
 	}
 
+static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
+	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
+	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+};
+
+static struct mhi_event_config mhi_qcom_qdu100_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_CTRL(0, 64),
+	/* SAHARA dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(1, 256),
+	/* Software channels dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(2, 64),
+	MHI_EVENT_CONFIG_SW_DATA(3, 256),
+	MHI_EVENT_CONFIG_SW_DATA(4, 256),
+	/* Software IP channels dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(5, 512),
+	MHI_EVENT_CONFIG_SW_DATA(6, 512),
+	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+};
+
+static const struct mhi_controller_config mhi_qcom_qdu100_config = {
+	.max_channels = 128,
+	.timeout_ms = 120000,
+	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
+	.ch_cfg = mhi_qcom_qdu100_channels,
+	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
+	.event_cfg = mhi_qcom_qdu100_events,
+};
+
+static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
+	.name = "qcom-qdu100",
+	.fw = "qcom/qdu100/xbl_s.melf",
+	.edl_trigger = true,
+	.config = &mhi_qcom_qdu100_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
@@ -822,6 +874,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* NETPRISMA FCUN69 (SDX6X) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
 		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
+	/* QDU100, x100-DU */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);

---
base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
change-id: 20241127-qdu100_us-abd7d1613c8b

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


