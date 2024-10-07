Return-Path: <linux-arm-msm+bounces-33346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D09927ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 11:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E161F20F86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6351F17DFE9;
	Mon,  7 Oct 2024 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gKvHaltE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D1231CA9;
	Mon,  7 Oct 2024 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728292600; cv=none; b=ZN6ksL2bERoTt3ARmyfJWrosKbycyjV45GfW+YgLbjRD5sG7a/YgmKX5A7eWiHxJ1oz+GEKZU1lTzbrjc61/ykr2nJwytItUtUSWxY6k/7eCuet9GsuYGcUaifyBu2cd98d0rzwZ+rCmc7WzkahwLqSzeVF/zruLmenui08PdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728292600; c=relaxed/simple;
	bh=YHoTprxdP0+daJj8yvPMUEEhFKpS9JjWg/OEw4mPUNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IVKLsNocHSJKybdb5jOWod9b697veMbI71bbL2VNRI4KY7d2r7V2g7qTJ1UKYF8s0sSy4glLaOTEKWpjUT6FmosduidKLcSD0Bj03QWX5p8SOLZV+8fNgdLGJPmVZqwXmuoCCATxE3Vaz9dxe1amXFt8RcQ7d3LFIYYr22oSWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gKvHaltE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974Sppv019025;
	Mon, 7 Oct 2024 09:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x27etQNEHnfLHGBL8UDVEFViQ8il40EdXTo
	FzqGNF9E=; b=gKvHaltEca3SI7thTQGR4AWkimW9b0G3YEle8PBvxLkz/wVQufz
	jXMQ2Jyb6Rn10e34UT0ZodUKZOQ7bxttoBjWthZ83h7PP8BSzP4k+zyVx6Yb9yNy
	V+Dancl2IPM+QTlSK1ti7QeJ40UeHnRdbqAyZ3Qsi1T//GHnAdtWSni26trLsfpC
	bnshUYxA/Fc2jvfm3rUrb96fUDnS6bg57JGrEggLbtRWxejgyQUCNG9rMVMQt+qu
	fZTAjopRLdR+5BBwuxiqQZmmW3lKqUsZWbmfR89QoNqkcIngFX6gNwWVwraEBBaB
	Jb8kG7h+g9q8cbGs0W6J71VSz3ZmsvWZXdg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsn3m01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 09:16:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4979GPcU030548;
	Mon, 7 Oct 2024 09:16:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 422xhkns04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 09:16:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4979GPAG030542;
	Mon, 7 Oct 2024 09:16:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.96.82])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4979GOSO030538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 09:16:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2370923)
	id 5C9C456A; Mon,  7 Oct 2024 14:46:24 +0530 (+0530)
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
Subject: [PATCH v3] bus: mhi: host: pci_generic: Add support for QDU100 device
Date: Mon,  7 Oct 2024 14:46:20 +0530
Message-Id: <20241007091622.3497928-1-quic_vpernami@quicinc.com>
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
X-Proofpoint-ORIG-GUID: db4kjahMSgN9_UjH8yZP-j8Mqpqg72f1
X-Proofpoint-GUID: db4kjahMSgN9_UjH8yZP-j8Mqpqg72f1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070065

Add MHI controller configuration for QDU100 device

The Qualcomm X100 5G RAN Accelerator Card is designed to
enhance Open vRAN servers by offloading CPUs from intensive
5G baseband functions.

Currently IP_SW1/2 channel support is not present in
mhi_net driver, will be supporting them in future.

Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

---
changs from V2:
- updated commit text.

changes from V1:
- Changing naming convention from modem_qcom_qdu100*
  to mhi_qcom_qdu100*.
- Updated commit text.
- Fixed and corrected by passing mhi_pci_dev_info struct
  instead of mhi_controller_config.
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


