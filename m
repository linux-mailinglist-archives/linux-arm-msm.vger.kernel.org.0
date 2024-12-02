Return-Path: <linux-arm-msm+bounces-39796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 038619DFC82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42463B21538
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D5A1F9F6E;
	Mon,  2 Dec 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CgYsO47/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5301F9F68;
	Mon,  2 Dec 2024 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129817; cv=none; b=JRcSvwqE7T55q2lnM9miSXh/EXnjgOEx9aI51In/gAQxA+5PwcbTyO6WQDAJlAqnYKMLNg76oK3BUuxAUxc9OUNBVJTf6cECG1HFjfFwbrdRndtzRA5/TSoXOh7NWrgGO/SOQ/t2Oi1p3RscRJFq567BgDLm/58ScRphSjNY5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129817; c=relaxed/simple;
	bh=NXHbiP/N1Z8upZIqhXnScWC1Bjg/zkw9Myc8i00RqOo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mYZXJZyd97TF0VXWECfvN4AlJXxxY3tSvwgbHAWeqUFKH7ce781nrSrkUCcInGLYpbGCl6V0r3mZEB+9lprT1AgZ8hkKS96lvZO3hXVc6hF65CK8n4AAet3CFWpbgRa7MsgKfeCmpByikFMXA1iCxvZImlQFv8hr1jPe7DD8lcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CgYsO47/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28khHU029794;
	Mon, 2 Dec 2024 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=fm57W6iEr1JyDnWdJkjpV4mOUWF1y4AcSwrMEljcbec=; b=Cg
	YsO47/frZKbnpjIKssrjkqo6gAtwI19FZ5yqQhH++XBOxxA1jwTC7b4uYJ3WmwND
	tEd4YfSRhEeWymYwU4uzppFtx9kKnPG9Ut/tbf/F2dsB1HksilGFee3kxioKZQRQ
	+lJD7sKQ4T6UZyZEkbsxLTFfJtCLXF83nEVeE+6p+sG4KWAxag3pbp2ncP3gVb16
	2ItlFpekkae+89JzC/g8ZwfinuroJv5lODe1L3UBMt3ssPFGLlACveLuneapTgNK
	qcQmJqeASo4/xaQtG3km0WrkHN3Nq3vy/u8LeQPp+NlsS6LUbfIfFiQzh6BcR4nI
	UwETYkY2yOUSu+fO6gtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2v6er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 08:56:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B28upQO031576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 08:56:51 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 00:56:46 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH] mmc: sdhci-msm: Command Queue (CQ) Register changes for v5.0
Date: Mon, 2 Dec 2024 14:26:31 +0530
Message-ID: <20241202085631.13468-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eygyIt_0vp5NN-aCIZM50wJsn1lLXNx6
X-Proofpoint-GUID: eygyIt_0vp5NN-aCIZM50wJsn1lLXNx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020079

For SDHC version 5.0 onwards, ICE3.0 specific registers are added in
CQ register space,  due to which few CQ registers(like CQ_VENDOR_GFG,
CQ_CMD_DBG_RAM) are shifted. This change is to add right offset to 
shifted registers.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
Signed-off-by: kamasali <quic_kamasali@quicinc.com>
Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..364e91049376 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -146,6 +146,8 @@
 /* CQHCI vendor specific registers */
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
+#define CQE_V5_VENDOR_CFG	0x900
+#define CQHCI_VENDOR_CFG	0x100
 
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
@@ -290,6 +292,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool cqhci_offset_changed;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2249,11 +2252,20 @@ static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SDHCI_MSM_DUMP(f, x...) \
 	pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
 
+#define DRV_NAME "cqhci"
+#define CQHCI_DUMP(f, x...) \
+	pr_err("%s: " DRV_NAME ": " f, mmc_hostname(host->mmc), ## x)
+
 static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+	struct cqhci_host *cq_host;
+	int offset = 0;
+
+	if (msm_host->cqhci_offset_changed)
+		offset = CQE_V5_VENDOR_CFG;
 
 	SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
 
@@ -2273,6 +2285,8 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
 		readl_relaxed(host->ioaddr +
 			msm_offset->core_vendor_spec_func2),
 		readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3));
+	CQHCI_DUMP("Vendor cfg 0x%08x\n",
+		readl_relaxed(cq_host->mmio + CQHCI_VENDOR_CFG + offset));
 }
 
 static const struct sdhci_msm_variant_ops mci_var_ops = {
@@ -2584,6 +2598,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x49)
 		msm_host->updated_ddr_cfg = true;
 
+	/* For SDHC v5.0.0 onwards, ICE 3.0 specific registers are added
+	 * in CQ register space, due to which few CQ registers are
+	 * shifted. Set cqhci_offset_changed boolean to use updated address.
+	 */
+	if (core_major == 1 && core_minor >= 0x6B)
+		msm_host->cqhci_offset_changed = true;
+
+
 	if (core_major == 1 && core_minor >= 0x71)
 		msm_host->uses_tassadar_dll = true;
 
-- 
2.17.1


