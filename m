Return-Path: <linux-arm-msm+bounces-33336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 891C99926C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F851C2223B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D03C18A6AA;
	Mon,  7 Oct 2024 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VZkw6f8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3E17C7C2;
	Mon,  7 Oct 2024 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288969; cv=none; b=WRRNj99LP6y0h1fzisAr/ojiH/LmXhSQ7Lla3HuaSYqVV3qthyV4v6jUaI8FvPNt5nmdOwCKUOuWNF3subaM+R0JgOzrIHWFx1gqZWMBAjJClnOukr/FINnxPez/xF/PF+MU/IFDMW9gSdr11yj+jAdfGYjkQPZwbswGh169Sf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288969; c=relaxed/simple;
	bh=tp2Is5gH0vbZp/7LIJTnCVVW2haso6x9+R0tJFjiD3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AxoERmbggCYxoCJMB3Y0rUz5U57bX2TXMH7B1qT+cN+2VZDpKV0LiAIObST1Z8UCgFvAbYVvb3C314LiE0ponaJJXQ+By+eruBmUCwfcLW5KJdLk/shO6AJkrzzLjX214N+allP8zw6g7Lqr0QcOlGVS2Dqjq4xPhTduG9Z+EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VZkw6f8A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TTd7015627;
	Mon, 7 Oct 2024 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/KyyzSmZpyWz3jrw1OiF0jpq4ugaU+HOrSv
	dlB6v3NE=; b=VZkw6f8AWBhdtJmeZRZnYKTd29wonDYjWna64M8/hY2F/+Smj1r
	WL/UTcPzSFpRXHUCkedER+LLLVgvcAA69N83QoDErdp0JFMS8/iPYnfQ5EDtNI1B
	CRMb9EIT5f+5uUKXmyWFrIWDoLFoFukiie9oEW52+Abw26xLK+oFcnCuaI+JpyA5
	SJKlVYFYjJUf+mlwf+j3UWGfNin1vmaZnXHJmPtMTt0fdz6sKOSDwD1qXmgo5gy/
	bzu3RHJsLffF5/7k8Ezyvi0HO+Jg7yjaD+djve6m5Rc0Ox0rvKWTqtJQ1BBJ94bU
	1uRs07SB8xyOwlD1UhfZHWqLRpCLQcBt4iw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs73dft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 08:15:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4978Fmuf002083;
	Mon, 7 Oct 2024 08:15:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 422xhksegy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 08:15:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4978FlPV002075;
	Mon, 7 Oct 2024 08:15:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.96.82])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4978Fl7M002074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 08:15:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2370923)
	id A98CC577; Mon,  7 Oct 2024 13:45:46 +0530 (+0530)
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
To: mhi@lists.linux.dev
Cc: quic_qianyu@quicinc.com, manivannan.sadhasivam@linaro.org,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_skananth@quicinc.com, quic_mrana@quicinc.com,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Slark Xiao <slark_xiao@163.com>, Mank Wang <mank.wang@netprisma.us>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Fabio Porcedda <fabio.porcedda@gmail.com>,
        linux-arm-msm@vger.kernel.org (open list:MHI BUS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add support for QDU100 device
Date: Mon,  7 Oct 2024 13:45:41 +0530
Message-Id: <20241007081543.3475027-1-quic_vpernami@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: RVRvMETXdyNU06U75WusFOs1FDdJsv6O
X-Proofpoint-GUID: RVRvMETXdyNU06U75WusFOs1FDdJsv6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070057

Add MHI controller configuration for QDU100 device.

This Qualcomm QDU100 device is inline accelerator card
which is an extension to QRU100 5G RAN platform.
which is designed to simplify 5G deployments by offering
a turnkey solution for ease of deployment with O-RAN
fronthaul and 5G NR layer 1 High (L1 High) processing,
and to accelerate operator and infrastructure vendor
adoption of virtualized RAN platforms.

Currently IP_SW1/2 channel support is not present in
mhi_net driver, will be supporting them in future.

https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

---
changes from V1:
- Changing naming convention from modem_qcom_qdu100*
  to mhi_qcom_qdu100*
- Added more commit test for IP_SW1/2 channels.
- Fixed and corrected by passing mhi_pci_dev_info struct
  instead of mhi_controller_config.
---
---
 drivers/bus/mhi/host/pci_generic.c | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9938bb034c1c..b9b7dd8d9411 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -245,6 +245,63 @@ struct mhi_pci_dev_info {
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
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_SW2", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_SW2", 256, 7),
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
+	.name = "qcom-lassen",
+	.fw = "qcom/lassen/xbl_s.melf",
+	.edl = "qcom/lassen/edl.mbn",
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
@@ -822,6 +879,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* NETPRISMA FCUN69 (SDX6X) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
 		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
+	/* QDU100, x100-DU */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
+		.driver_data = (kernel_ulong_t)&mhi_qcom_qdu100_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.34.1


