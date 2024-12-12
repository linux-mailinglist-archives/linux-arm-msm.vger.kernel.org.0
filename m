Return-Path: <linux-arm-msm+bounces-41739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B326C9EE624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 13:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE09116767B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 12:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22524213244;
	Thu, 12 Dec 2024 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fUuUwtRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D4212B27;
	Thu, 12 Dec 2024 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004658; cv=none; b=LNnUQI30uSp5C1oU8RZ8InVGifsfOpVYUstYKbqdsfhH8+MEvBlAVts5YOwx16PYty9Wb+Avyeeryahvv1kcKRKPBeXRG8yzp3gfWflvyxThNlbp44LY5OctQX6+PYemrAZMoHO8gzWRBATLq42Wrp11vEsgk6ZaN8Ayg3/oVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004658; c=relaxed/simple;
	bh=HNYEIhOmJWKAEZUkPoO9uUf1pev7pwMiPflHbtPzsr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mWgWqf4PPD7rr27O4RMe+MNMVIZKImxACg386hOdkPuie6RNWXZIgT7muYin5Z27AjGDRqt7NP26pJ9txpOM1I61xD1QxTiGsltbB5tRecIZRnvmkiiMCo2j6o31XtSo2G8UbQ13ld0Fs6TlIDn6KrVtV0d//n+UNQx4RDs8fno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fUuUwtRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8N9l1015022;
	Thu, 12 Dec 2024 11:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6gMvjW2yUZOvZpegR3/cUx
	D034wjFdxrEa9GjtWdjRU=; b=fUuUwtRzeLtRKA7MeSAZmX+akQ1pH1ju1scTzd
	0NnrqDlkR8Fmw+H+FiG6VJ/NOmXWun9I+lz2Ejp5GVnx0YNRqO2RELzbKdMl1rEK
	oONUW+hDmTbNsz7v2GaavcESVXTTdQfkVa/I+KBd2EXmdR0ey5Erp9438kczGiz+
	VsXQOkWCID6nVJ1aEUuCdbELwLbj84KUHlg89l5OgTn67CWOZk+hv9TWtnPVandY
	/ICFeX36ePG/CmlOhIuL31oJTi1RQkdm5E2oI3WwmHc9stb7zl5EkIFoQGNmUQhX
	L0xuR+Ea1O5XgpGotuWNmlcVEInYHsI1+gBwelk2IBDlxWMg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpm25b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:57:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBvX2x028913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:57:33 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 03:57:31 -0800
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Thu, 12 Dec 2024 17:27:27 +0530
Subject: [PATCH v5] bus: mhi: host: pci_generic: Add support for QDU100
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKbPWmcC/43Qz07DMAwG8FeZciYodpwl4cR7TBPKH4flQMsaW
 g1NfXe6iQtlk3b8LP8+Sz6LxkPlJl42ZzHwVFvtuyWYp41Ih9C9s6x5yQIVEgBaecwjKPU2Nhl
 ithm2oJOLYtn/HLjU07Vrt1/yobavfvi+Vk90md5qmUiCpGDRGssZDbwex5pql55T/3Gp/TV+b
 Ti7yByA0PNNg0qvjUdSWCKWAOaOobVJOhRvKHsT86OGCmmHAM75h++YFE2JW9IG9R3z7wfFK1A
 Rg/IB/5j9PM8//31uB9wBAAA=
X-Change-ID: 20241127-qdu100_us-abd7d1613c8b
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_krichai@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vivek
 Pernamitta" <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004651; l=4572;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=HNYEIhOmJWKAEZUkPoO9uUf1pev7pwMiPflHbtPzsr0=;
 b=n5g5GR8lO22DnYtbYtVyU5dFc5QQpbk6ymb0nOJnyrhfnWt7D/iajallWjn0cKNphviEmZ3SG
 x1tQFyjdd2vDcdH1vfttyIrEcK20sRGYLQWPOUwv+ZcPI+QfKr4D2R7
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NFWdd4Ipe84pH7BJ0o1rWRNe-Cu0HKst
X-Proofpoint-ORIG-GUID: NFWdd4Ipe84pH7BJ0o1rWRNe-Cu0HKst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

Add MHI controller configuration for QDU100 device.

The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
servers by offloading CPUs from intensive 5G baseband functions.

Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
changes from V4:
- Updated QDU100 VID as per order in mhi_pci_id_table.
- Link to v4: https://lore.kernel.org/r/20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com

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
index 07645ce2119a71c9277356e962252b840379cd81..aa5118dbe2e5de3f3d13a168ebe2d3d2d5930295 100644
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
@@ -742,6 +794,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
+	/* QDU100, x100-DU */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */

---
base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
change-id: 20241127-qdu100_us-abd7d1613c8b

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


