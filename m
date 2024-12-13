Return-Path: <linux-arm-msm+bounces-42125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D9F1818
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECF5C7A04EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 21:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D5D1925A6;
	Fri, 13 Dec 2024 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KcAHjg0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D6E186294;
	Fri, 13 Dec 2024 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734125662; cv=none; b=oMMhcL89uSXJP92GM879vV16aox632bsekNtiMEN5LHtpsRQuSKsXc/f/lPjDOgPZ0JlRrwOi7kXYr+fB5McHCRKItBR4YQBOaluc9XluKraFHS2y8+df4g+/Jp3lzsLaE3oQTL5H9J20mOVhqdg1gVdxendyVjaqb11BhylMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734125662; c=relaxed/simple;
	bh=S7SztwvBGfNKMemTtXAwW9Tq3aGrW11J1KTPvvzdXUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lU5hKaqXwfKJfpyB4zzZNdE2j35Es4CfrFs1pWOWxEZKtdhf6GwFEzUP3DXNCQm19PI3wmBZQG7NQKTck0Mm+ucWteX5SNWo/enZECN0jrTJ3WQBw11l2xLAQww0yGGorBAsO8Vj0Vr3K7ztNbIW12xIJDeljAfAgcc5AlaJ1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KcAHjg0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEfpLa018025;
	Fri, 13 Dec 2024 21:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bo/4jlG3m3Tk+nd6sOsa3Mw0gda3feFfIZhiCSJy3BA=; b=KcAHjg0nJm4ypXd/
	ki5irjaUjiBeRTzc7vzSugQZ2ABe/bTaFgNKzxr1z+7/v45X/xU8UadZqUEhUmut
	VJCtd2O911f+3NQJH4NhO5JpZf/mvRRdgxXnALQ/nNe0nmKbyr8fInjVgP6otYSD
	7ZcAOGy/XPkoXE5TMoTLq11prx9wP4q2ia22ZlleRRSvqY6DRmbkf879cqjIKEyQ
	xQ8qMtsDLOeJTmP6vgBr6e1gOr2eyYvyHAE9mN8evs0s7XaAmyPo5N3RsjQXQm7A
	cBXubVn4S59gdReOSM05QsuQ58+Vy68ZgQtgmhJXbPWFqgMI/A+su2FCFgF77FVZ
	+ZmO6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn2hpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLYAQF028380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:10 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:09 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH 7/7] accel/qaic: Add AIC200 support
Date: Fri, 13 Dec 2024 14:33:40 -0700
Message-ID: <20241213213340.2551697-8-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T75Nh_KdmNAn92mfyg_koJOKJUCURPTQ
X-Proofpoint-ORIG-GUID: T75Nh_KdmNAn92mfyg_koJOKJUCURPTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152

Add basic support for the new AIC200 product. The PCIe Device ID is
0xa110. With this, we can turn on the lights for AIC200 by leveraging
much of the existing driver.

Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
 drivers/accel/qaic/mhi_controller.h |   2 +-
 drivers/accel/qaic/qaic.h           |   1 +
 drivers/accel/qaic/qaic_drv.c       |  11 +-
 drivers/accel/qaic/sahara.c         |  39 ++-
 5 files changed, 395 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 8ab82e78dd94..d68df2f6a7e6 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,11 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char *fw_image_paths[FAMILY_MAX] = {
+	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
+	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
+};
+
 static const struct mhi_channel_config aic100_channels[] = {
 	{
 		.name = "QAIC_LOOPBACK",
@@ -439,6 +444,297 @@ static const struct mhi_channel_config aic100_channels[] = {
 	},
 };
 
+static const struct mhi_channel_config aic200_channels[] = {
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 0,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 1,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 2,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 3,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 6,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 7,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 10,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 11,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 12,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 13,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 14,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 15,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 16,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 17,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TIMESYNC_PERIODIC",
+		.num = 22,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TIMESYNC_PERIODIC",
+		.num = 23,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "IPCR",
+		.num = 24,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "IPCR",
+		.num = 25,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+		.wake_capable = false,
+	},
+};
+
 static struct mhi_event_config aic100_events[] = {
 	{
 		.num_elements = 32,
@@ -454,16 +750,44 @@ static struct mhi_event_config aic100_events[] = {
 	},
 };
 
-static struct mhi_controller_config aic100_config = {
-	.max_channels = 128,
-	.timeout_ms = 0, /* controlled by mhi_timeout */
-	.buf_len = 0,
-	.num_channels = ARRAY_SIZE(aic100_channels),
-	.ch_cfg = aic100_channels,
-	.num_events = ARRAY_SIZE(aic100_events),
-	.event_cfg = aic100_events,
-	.use_bounce_buf = false,
-	.m2_no_db = false,
+static struct mhi_event_config aic200_events[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 0,
+		.channel = U32_MAX,
+		.priority = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+static struct mhi_controller_config mhi_cntrl_configs[] = {
+	[FAMILY_AIC100] = {
+		.max_channels = 128,
+		.timeout_ms = 0, /* controlled by mhi_timeout */
+		.buf_len = 0,
+		.num_channels = ARRAY_SIZE(aic100_channels),
+		.ch_cfg = aic100_channels,
+		.num_events = ARRAY_SIZE(aic100_events),
+		.event_cfg = aic100_events,
+		.use_bounce_buf = false,
+		.m2_no_db = false,
+	},
+	[FAMILY_AIC200] = {
+		.max_channels = 128,
+		.timeout_ms = 0, /* controlled by mhi_timeout */
+		.buf_len = 0,
+		.num_channels = ARRAY_SIZE(aic200_channels),
+		.ch_cfg = aic200_channels,
+		.num_events = ARRAY_SIZE(aic200_events),
+		.event_cfg = aic200_events,
+		.use_bounce_buf = false,
+		.m2_no_db = false,
+	},
 };
 
 static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
@@ -545,8 +869,9 @@ static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
 }
 
 struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
-						    int mhi_irq, bool shared_msi)
+						    int mhi_irq, bool shared_msi, int family)
 {
+	struct mhi_controller_config mhi_config = mhi_cntrl_configs[family];
 	struct mhi_controller *mhi_cntrl;
 	int ret;
 
@@ -573,6 +898,13 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 	mhi_cntrl->nr_irqs = 1;
 	mhi_cntrl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntrl->irq), GFP_KERNEL);
 
+	if (family == FAMILY_AIC200) {
+		mhi_cntrl->name = "AIC200";
+		mhi_cntrl->seg_len = SZ_512K;
+	} else {
+		mhi_cntrl->name = "AIC100";
+	}
+
 	if (!mhi_cntrl->irq)
 		return ERR_PTR(-ENOMEM);
 
@@ -581,11 +913,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 	if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
 		mhi_cntrl->irq_flags = IRQF_SHARED;
 
-	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
+	mhi_cntrl->fw_image = fw_image_paths[family];
 
 	/* use latest configured timeout */
-	aic100_config.timeout_ms = mhi_timeout_ms;
-	ret = mhi_register_controller(mhi_cntrl, &aic100_config);
+	mhi_config.timeout_ms = mhi_timeout_ms;
+	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
 	if (ret) {
 		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
 		return ERR_PTR(ret);
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
index 500e7f4af2af..8939f6ae185e 100644
--- a/drivers/accel/qaic/mhi_controller.h
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -8,7 +8,7 @@
 #define MHICONTROLLERQAIC_H_
 
 struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
-						    int mhi_irq, bool shared_msi);
+						    int mhi_irq, bool shared_msi, int family);
 void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
 void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
 void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index cf97fd9a7e70..0dbb8e32e4b9 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -34,6 +34,7 @@
 
 enum aic_families {
 	FAMILY_AIC100,
+	FAMILY_AIC200,
 	FAMILY_MAX,
 };
 
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 4e63e475b389..3b415e2c9431 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 
 #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
 #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
+#define PCI_DEVICE_ID_QCOM_AIC200	0xa110
 #define QAIC_NAME			"qaic"
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
 #define CNTL_MAJOR			5
@@ -66,6 +67,13 @@ static const struct qaic_device_config aic100_config = {
 	.dbc_bar_idx = 2,
 };
 
+static const struct qaic_device_config aic200_config = {
+	.family = FAMILY_AIC200,
+	.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
+	.mhi_bar_idx = 1,
+	.dbc_bar_idx = 2,
+};
+
 bool datapath_polling;
 module_param(datapath_polling, bool, 0400);
 MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
@@ -568,7 +576,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 
 	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
-						       qdev->single_msi);
+						       qdev->single_msi, config->family);
 	if (IS_ERR(qdev->mhi_cntrl)) {
 		ret = PTR_ERR(qdev->mhi_cntrl);
 		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
@@ -637,6 +645,7 @@ static struct mhi_driver qaic_mhi_driver = {
 static const struct pci_device_id qaic_ids[] = {
 	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
 	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
+	{ PCI_DEVICE_DATA(QCOM, AIC200, (kernel_ulong_t)&aic200_config), },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, qaic_ids);
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 09c8b055aa81..3ebcc1f7ff58 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -188,6 +188,34 @@ static const char * const aic100_image_table[] = {
 	[10] = "qcom/aic100/fw10.bin",
 };
 
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[75] = "qcom/aic200/pvs.bin",
+};
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -748,8 +776,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	context->mhi_dev = mhi_dev;
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
-	context->image_table = aic100_image_table;
-	context->table_size = ARRAY_SIZE(aic100_image_table);
+
+	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
+		context->image_table = aic200_image_table;
+		context->table_size = ARRAY_SIZE(aic200_image_table);
+	} else {
+		context->image_table = aic100_image_table;
+		context->table_size = ARRAY_SIZE(aic100_image_table);
+	}
+
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
 
-- 
2.34.1


