Return-Path: <linux-arm-msm+bounces-45784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6DA18EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B48E161323
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BD8211719;
	Wed, 22 Jan 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V3vxLzMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828A21127E;
	Wed, 22 Jan 2025 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539279; cv=none; b=bCuM3AIxdF2jkYWoqA5QJWoZLkRhFbf7dxHBM1t1LX6hBj7Q9/1vA56b/Z0wJ3N4W0fhhCZtYCI2CO+G3fxAN8AuN8gn7aDnjPSlf9AUDXiK95eSNf3+YAb0w+KqvshOr2GQlMjU4PmIAYptF3bJN8JIRShMZG5NqsFVKMjOIwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539279; c=relaxed/simple;
	bh=RltWS3odla8Xp7YHVwZ+kpLqUMDsDKyu4GqI/llHI8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmf1eNVtVFsCb5u4oNZz9eX43WzxZcXD+uMPCQ1SJSApnd+v51lb1FU8roCCKIBQgF2qxnU+LC2VxT+R6YBKJ2gXw/e51XeYQ14RmmspujuRK6tBkl7wAx3IIXrg/ryzZD3SCUoQW1/Ob2tut490BJAG4x4Y/b6cRvn7T/gNx00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V3vxLzMe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9QWCs029827;
	Wed, 22 Jan 2025 09:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V4kPluLrC1oqmOXr743d2A/a
	+i+Ptwv9VmhBK4u0PnU=; b=V3vxLzMeVVzqDrfJsTJp4pl9ocn8B135yhxGIAiQ
	7jHjmj8rk6bGNDt4ilNsnWD1iBc9rd92a5G/cpPb2ECX8ubMQurIxMzDRj8qr1O2
	xEnZMWnxZPLJJ11fKY7qAocmyMpgQJf26+I6aZCQU/a9zCOXHt6w9GDpE0eeiDmx
	AoOfVs85Rnc4EVQMXz2KP8NG7M9bTC91isvAOrfjUIxXPFXNyZHe51lbMqMGrC2Z
	dNL/M/riNzevHD3XUv41z0dLM6lbOvcAxUGuX7Fb7ytZJvb7aFwmGR0mf2V5izAB
	jR3f9MsY7BASjUZnd0zUtcuYVr6ptk4s3g7Q31MXj1LDig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ax1yr1u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9lqox012219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:52 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 01:47:46 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 4/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Wed, 22 Jan 2025 15:17:07 +0530
Message-ID: <20250122094707.24859-5-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S41j86cScUfDe-Obc5zKJ3bGNNsVaFlf
X-Proofpoint-GUID: S41j86cScUfDe-Obc5zKJ3bGNNsVaFlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220071

With the current DLL sequence stability issues for data
transfer seen in HS400 and HS200 modes.

"mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
data error 0"

Rectify the DLL programming sequence as per latest hardware
programming guide

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 270 ++++++++++++++++++++++++++++++++---
 1 file changed, 252 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index cc7756a59c55..17f17a635d83 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -28,6 +28,7 @@
 #define CORE_VERSION_MAJOR_SHIFT	28
 #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
 #define CORE_VERSION_MINOR_MASK		0xff
+#define SDHCI_MSM_MIN_V_7FF		0x6e
 
 #define CORE_MCI_GENERICS		0x70
 #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
@@ -118,7 +119,8 @@
 #define CORE_PWRSAVE_DLL	BIT(3)
 
 #define DDR_CONFIG_POR_VAL	0x80040873
-
+#define DLL_CONFIG_3_POR_VAL	0x10
+#define TCXO_FREQ               19200000
 
 #define INVALID_TUNING_PHASE	-1
 #define SDHCI_MSM_MIN_CLOCK	400000
@@ -309,6 +311,16 @@ struct sdhci_msm_host {
 	bool artanis_dll;
 };
 
+enum dll_init_context {
+	DLL_INIT_NORMAL,
+	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
+};
+
+enum mode {
+	HS400, // equivalent to SDR104 mode for DLL.
+	HS200, // equivalent to SDR50 mode for DLL.
+};
+
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -793,6 +805,211 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 	return 0;
 }
 
+static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
+{
+	return SDHCI_MSM_MIN_CLOCK;
+}
+
+static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct clk *core_clk = msm_host->bulk_clks[0].clk;
+	unsigned int sup_clk;
+
+	if (req_clk < sdhci_msm_get_min_clock(host))
+		return sdhci_msm_get_min_clock(host);
+
+	sup_clk = clk_get_rate(core_clk);
+
+	if (host->clock != msm_host->clk_rate)
+		sup_clk = sup_clk / 2;
+
+	return sup_clk;
+}
+
+/* Initialize the DLL (Programmable Delay Line) */
+static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
+				 init_context, enum mode index)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+	struct mmc_host *mmc = host->mmc;
+	u32 ddr_cfg_offset, core_vendor_spec, config;
+	void __iomem *ioaddr = host->ioaddr;
+	unsigned long flags, dll_clock;
+	int rc = 0, wait_cnt = 50;
+
+	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
+	spin_lock_irqsave(&host->lock, flags);
+
+	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
+
+	/*
+	 * Always disable PWRSAVE during the DLL power
+	 * up regardless of its current setting.
+	 */
+	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
+	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
+
+	if (msm_host->use_14lpp_dll_reset) {
+		/* Disable CK_OUT */
+		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
+		config &= ~CORE_CK_OUT_EN;
+		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+		/* Disable the DLL clock */
+		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
+		config |= CORE_DLL_CLOCK_DISABLE;
+		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
+	}
+
+	/*
+	 * Write 1 to DLL_RST bit of DLL_CONFIG register
+	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
+	 */
+	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
+	config |= (CORE_DLL_RST | CORE_DLL_PDN);
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/*
+	 * Configure DLL_CONFIG_3 and USER_CTRL
+	 * (Only applicable for 7FF projects).
+	 */
+	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
+		writel_relaxed(msm_host->dll.dll_config_3[index],
+			       ioaddr + msm_offset->core_dll_config_3);
+		writel_relaxed(msm_host->dll.dll_usr_ctl[index],
+			       ioaddr + msm_offset->core_dll_usr_ctl);
+	}
+
+	/*
+	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
+	 */
+	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
+					: msm_offset->core_ddr_config_old;
+
+	config = msm_host->dll.ddr_config[index];
+	writel_relaxed(config, ioaddr + ddr_cfg_offset);
+
+	/* Set DLL_CONFIG_2 */
+	if (msm_host->use_14lpp_dll_reset) {
+		u32 mclk_freq;
+		int cycle_cnt;
+
+		/*
+		 * Only configure the mclk_freq in normal DLL init
+		 * context. If the DLL init is coming from
+		 * CX Collapse Exit context, the host->clock may be zero.
+		 * The DLL_CONFIG_2 register has already been restored to
+		 * proper value prior to getting here.
+		 */
+		if (init_context == DLL_INIT_NORMAL) {
+			cycle_cnt = readl_relaxed(ioaddr +
+					msm_offset->core_dll_config_2)
+					& CORE_FLL_CYCLE_CNT ? 8 : 4;
+
+			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
+
+			if (dll_clock < 100000000) {
+				pr_err("%s: %s: Non standard clk freq =%u\n",
+				       mmc_hostname(mmc), __func__, dll_clock);
+				rc = -EINVAL;
+				goto out;
+			}
+
+			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
+			config = (config & ~GENMASK(17, 10)) |
+					FIELD_PREP(GENMASK(17, 10), mclk_freq);
+			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
+		}
+		/* wait for 5us before enabling DLL clock */
+		udelay(5);
+	}
+
+	/*
+	 * Update the lower two bytes of DLL_CONFIG only with
+	 * HSR values. Since these are the static settings.
+	 */
+	config = (readl_relaxed(ioaddr + msm_offset->core_dll_config));
+	config |= (msm_host->dll.dll_config[index] & 0xffff);
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/* Wait for 52us */
+	spin_unlock_irqrestore(&host->lock, flags);
+	udelay(60);
+	spin_lock_irqsave(&host->lock, flags);
+
+	/*
+	 * Write 0 to DLL_RST bit of DLL_CONFIG register
+	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
+	 */
+	config &= ~CORE_DLL_RST;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	config &= ~CORE_DLL_PDN;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
+	config |= CORE_DLL_RST;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
+	config &= ~CORE_DLL_RST;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
+	if (msm_host->use_14lpp_dll_reset) {
+		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
+		config &= ~CORE_DLL_CLOCK_DISABLE;
+		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
+	}
+
+	/* Set DLL_EN bit to 1. */
+	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
+	config |= CORE_DLL_EN;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/*
+	 * Wait for 8000 input clock. Here we calculate the
+	 * delay from fixed clock freq 192MHz, which turns out 42us.
+	 */
+	spin_unlock_irqrestore(&host->lock, flags);
+	udelay(50);
+	spin_lock_irqsave(&host->lock, flags);
+
+	/* Set CK_OUT_EN bit to 1. */
+	config |= CORE_CK_OUT_EN;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/*
+	 * Wait until DLL_LOCK bit of DLL_STATUS register
+	 * becomes '1'.
+	 */
+	while (!(readl_relaxed(ioaddr + msm_offset->core_dll_status) &
+		 CORE_DLL_LOCK)) {
+		/* max. wait for 50us sec for LOCK bit to be set */
+		if (--wait_cnt == 0) {
+			dev_err(mmc_dev(mmc), "%s: DLL failed to LOCK\n",
+				mmc_hostname(mmc));
+			rc = -ETIMEDOUT;
+			goto out;
+		}
+		/* wait for 1us before polling again */
+		udelay(1);
+	}
+
+out:
+	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
+		/* Reenable PWRSAVE as needed */
+		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
+		config |= CORE_CLK_PWRSAVE;
+		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
+	}
+	spin_unlock_irqrestore(&host->lock, flags);
+	return rc;
+}
+
 static void msm_hc_select_default(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -915,14 +1132,31 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
 		msm_hc_select_default(host);
 }
 
+static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
+{
+	if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
+	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+		return sdhci_msm_configure_dll(host, init_context, HS400);
+
+	return sdhci_msm_configure_dll(host, init_context, HS200);
+}
+
+static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
+		msm_init_cm_dll(host);
+}
+
 static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
 	u32 config, calib_done;
 	int ret;
-	const struct sdhci_msm_offset *msm_offset =
-					msm_host->offset;
 
 	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
 
@@ -930,7 +1164,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (ret)
 		goto out;
 
@@ -1018,7 +1252,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	return ret;
 }
 
-static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
+static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
 {
 	struct mmc_host *mmc = host->mmc;
 	u32 dll_status, config, ddr_cfg_offset;
@@ -1041,7 +1275,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
 		ddr_cfg_offset = msm_offset->core_ddr_config;
 	else
 		ddr_cfg_offset = msm_offset->core_ddr_config_old;
-	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
+
+	if (msm_host->artanis_dll)
+		writel_relaxed(msm_host->dll.ddr_config[index], host->ioaddr + ddr_cfg_offset);
+	else
+		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
 
 	if (mmc->ios.enhanced_strobe) {
 		config = readl_relaxed(host->ioaddr +
@@ -1098,11 +1336,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
 	struct mmc_host *mmc = host->mmc;
-	int ret;
 	u32 config;
-	const struct sdhci_msm_offset *msm_offset =
-					msm_host->offset;
+	int ret;
 
 	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
 
@@ -1110,7 +1347,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		goto out;
 
@@ -1130,7 +1368,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	if (msm_host->use_cdclp533)
 		ret = sdhci_msm_cdclp533_calibration(host);
 	else
-		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
+		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
 out:
 	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
 		 __func__, ret);
@@ -1169,7 +1407,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
 		return 0;
 
 	/* Reset the tuning block */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		return ret;
 
@@ -1238,7 +1477,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 retry:
 	/* First of all reset the tuning block */
-	rc = msm_init_cm_dll(host);
+	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (rc)
 		return rc;
 
@@ -1767,11 +2006,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
 	return clk_round_rate(core_clk, ULONG_MAX);
 }
 
-static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
-{
-	return SDHCI_MSM_MIN_CLOCK;
-}
-
 /*
  * __sdhci_msm_set_clock - sdhci_msm clock control.
  *
-- 
2.17.1


