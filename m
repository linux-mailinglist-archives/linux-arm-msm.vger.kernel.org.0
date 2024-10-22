Return-Path: <linux-arm-msm+bounces-35404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8399AA0E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9646F1C2215B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5411199EB7;
	Tue, 22 Oct 2024 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fim+r2Dl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A219ABCE;
	Tue, 22 Oct 2024 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729595437; cv=none; b=MpxQdrc1NLPEsJIRKwKxo6ZzKFEM3TCPl8u3fWE272+uACemP1UD8AoXfa91eAPo5ourvqTpS0QhDfi3pOjQyh63fs8Yi8qrKKh2FP29ELLzOlpVEGLNnAvLOuO/GvZ/PevTxH8jAxGOuuAIw0eN7s6wiqA4HPPIiCUd3hJmNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729595437; c=relaxed/simple;
	bh=awy8Txfxl/b/Ye7wPJXnCcKrNXCFRaKfOcFe6QzT1NE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=sCtAMlRiNp3NIJzcMeMnwy6ckQYkHrHlI2NvMlWU9Tx8m9hl7c7hbWr46vbinmUOldLF3fZ+SXQBQ6Cs5VwuXQ6LTm2PuNrzt55HVJVm+0tpjjG3Ps8sAM2G5L77jrle0Le4w2ZesDtQ+8EY8ardp374vUDqMnF0l4P7Zb+a7tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fim+r2Dl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M81dB9001014;
	Tue, 22 Oct 2024 11:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=56zH7F3EgO2m
	r7feNZfL+IutKIWg/6a3q4Ql76PAJGA=; b=Fim+r2Dl3+jSi0GSzVwNy3TqRAZv
	6K03M6wD9WMRL7CBHjg5NSI9Ez3Cwn2ysSi8bZqpCRLwUTYu/sqAsirJgfIwq82w
	fSuul29JU9AN2+/6cn6f5Z5PEXEX53/DG216EPAOgrCuFbmKQHdRqhjtV+bHsNym
	WjaPCwR3Fkpa3YYKwdQm5kn9ZI65H6SpTBv32g7b3qUDocYc+NLEopZd0/YFCSmO
	GDaf94wM4MYpOIqJj+u4WquLzFGbZcNYINF3eVXrduHc+RUBQ4ImCddsi8RKGsyG
	VDDS/yokAo9xSF1t4eraMrBb75+JQUko3NAYRC/GolCiYygfmzhKy0sqhQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj13ysj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:10:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBATlN014826;
	Tue, 22 Oct 2024 11:10:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42cpacqq82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Oct 2024 11:10:29 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49MBASc7014820;
	Tue, 22 Oct 2024 11:10:28 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49MBASBx014819;
	Tue, 22 Oct 2024 11:10:28 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id A000657304B; Tue, 22 Oct 2024 16:40:27 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
        kernel@quicinc.com
Subject: [PATCH 1/1] mmc: sdhci-msm: Toggle the FIFO write clock after ungate
Date: Tue, 22 Oct 2024 16:40:25 +0530
Message-Id: <20241022111025.25157-1-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E9Ebcoff7Pv7MQGiiOe7l4hoNcK9dFKQ
X-Proofpoint-ORIG-GUID: E9Ebcoff7Pv7MQGiiOe7l4hoNcK9dFKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

For Qualcomm SoCs with sdcc minor version 6B and more, command path
state machine is getting corrupted post clock ungate which is leading
to software timeout.

Toggle the write fifo clock to reset the async fifo to fix this issue.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..c2ccdac21232 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -146,6 +146,7 @@
 /* CQHCI vendor specific registers */
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
+#define RCLK_TOGGLE BIT(1)
 
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
@@ -290,6 +291,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool toggle_fifo_clk;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -1162,6 +1164,39 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
 	return ret;
 }
 
+/*
+ * After MCLK ugating, toggle the FIFO write clock to get
+ * the FIFO pointers and flags to valid state.
+ */
+static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
+{
+	u32 config;
+	struct mmc_ios ios = host->mmc->ios;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+
+	if ((msm_host->tuning_done || ios.enhanced_strobe) &&
+		host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
+		/*
+		 * Select MCLK as DLL input clock.
+		 */
+		config = readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3);
+		config |= RCLK_TOGGLE;
+		writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
+
+		/* ensure above write as toggling same bit quickly */
+		wmb();
+		udelay(2);
+
+		/*
+		 * Select RCLK as DLL input clock
+		 */
+		config &= ~RCLK_TOGGLE;
+		writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
+	}
+}
+
 static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
 {
 	const struct sdhci_msm_offset *msm_offset = sdhci_priv_msm_offset(host);
@@ -2587,6 +2622,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x71)
 		msm_host->uses_tassadar_dll = true;
 
+	if (core_major == 1 && core_minor >= 0x6B)
+		msm_host->toggle_fifo_clk = true;
+
 	ret = sdhci_msm_register_vreg(msm_host);
 	if (ret)
 		goto clk_disable;
@@ -2720,6 +2758,9 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 				       msm_host->bulk_clks);
 	if (ret)
 		return ret;
+
+	if (msm_host->toggle_fifo_clk)
+		sdhci_msm_toggle_fifo_write_clk(host);
 	/*
 	 * Whenever core-clock is gated dynamically, it's needed to
 	 * restore the SDR DLL settings when the clock is ungated.
-- 
2.17.1


