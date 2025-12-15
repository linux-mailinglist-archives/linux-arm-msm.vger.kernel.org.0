Return-Path: <linux-arm-msm+bounces-85233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E568ACBDB63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7329930B0A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDEC331A53;
	Mon, 15 Dec 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YPs2D5G0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D09330314;
	Mon, 15 Dec 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800041; cv=none; b=aqtkBFx4kOHqnnMYKE8q59Ey/oOmTjYuZzjmLnsM+H3lCrBtz4TFrOCS2IcUMtHmkaU2clZkxSBFuH58DDvSRi6qdKLv0fXPTJRoXFUXtK4N6jF2QLzIwmRAbqaNpM8XopD6HiBsiEFONcyznkXEPSh/WpaECHncHbcLkJMfInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800041; c=relaxed/simple;
	bh=iXhMw37ihWXCwsmhdX1Af9gm8ztmMWkU3Hxnia6ma6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oq9NV39UTZY+8hrw76LVwzX/Mj4B8l7TobevxAfx6mGv7/YnH3Sdrb7Ga/1MTxqZklVtoHoTSiAie6NDjHReJbrD03xB7LPFh9fpww3zLPxTystERRj/krMxfhdfI8qiaV7U0fCwVPBcoK42Ep1yoHeKlZgtUldIf+UOQjz9pNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YPs2D5G0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFB2itv4002967;
	Mon, 15 Dec 2025 12:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rFCIbfdt26e
	o1m3o5i+NfGsxU5xPPvxzu6PAdS8nMwo=; b=YPs2D5G0kCtBU6MrLQ3sjxmxNH+
	ESho3Pxpkl2504NhwR7yeUnkNL28N3O7H6Ok9qqOP1WGStZzL+FILqjmzGD3+wc1
	2n6iwzZezvlLLHodmfp5cRgcG2+frBZWvNh5tkPM8kClVTV6RCJu1+X9f0X8s2mB
	iyF/SFIE/TjyNJnTVj4qdaWLnPNc1g4Qym2qJjW0qEY4OOWUdDu0KHvzb8CDP5mj
	0i52B1Y8OVE06Wgppy3NBwg175p9hTMEIreFbxdg3EByo9ATi66rudmrSGo/ofFx
	FG74WRNcqotRf1Fvy+/2/9KwQaaNfKamQs34O66aUfgpyCdP/GMqUAmD+mQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2h44g4pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0Jsp029071;
	Mon, 15 Dec 2025 12:00:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0UgH029137;
	Mon, 15 Dec 2025 12:00:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0TAs029136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:30 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id B87B65D7; Mon, 15 Dec 2025 17:30:28 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v6 5/5] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Mon, 15 Dec 2025 17:30:09 +0530
Message-Id: <20251215120009.3877889-6-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-GUID: PxCVu2485kPBIx9hv1fShpM7Ok0XIzRT
X-Proofpoint-ORIG-GUID: PxCVu2485kPBIx9hv1fShpM7Ok0XIzRT
X-Authority-Analysis: v=2.4 cv=G9cR0tk5 c=1 sm=1 tr=0 ts=693ff863 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=u9bmkiIFCt68AObFJ30A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfX4/SgJVMlgdjE
 cs1757X/rEhyijzcB0Crr+LSdXyxbGE9Ed95n0y+0EYJnaXOZgup85/zBhKIQKzHk8k4N7Je/Uo
 E/nSH+jwYl/suH52QZyXkUXogxQTAFHu8lMpI0ijAcV1WI3peaFodsnUviPpfOogMlczMRapp2A
 Z9l/SE8xFsjWVn1fXKJYGVcSWPueVEbkjuxNq525OEMioKoupg9rde6Eivn6eiB/lGY2r/yu8HW
 /LL11+jks784nr94Ru6Hu1ZxOG4BXS1Nasn8nycpr0trpFaH3qY9Cf4sWn+TciYW446S1FNpO3r
 aplJMx8SBpmxbCLF962oTHHDTV8scCeyDDRYeIJA4FLNZVfTFHNZaO6dvU4wMO+e4Mlo0WEQ0aS
 hFWuHQEj34Rq/dO8tq7iB8H0ObKO8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150104

From: Sachin Gupta <quic_sachgupt@quicinc.com>

With the current DLL sequence stability issues for data
transfer seen in HS400 and HS200 modes.

"mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
data error 0"

Rectify the DLL programming sequence as per latest hardware
programming guide

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 277 ++++++++++++++++++++++++++++++++---
 1 file changed, 260 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 1fcd92158bee..f459b40db41c 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -28,6 +28,7 @@
 #define CORE_VERSION_MAJOR_SHIFT	28
 #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
 #define CORE_VERSION_MINOR_MASK		0xff
+#define SDHCI_MSM_MIN_V_7FF		0x6e
 
 #define CORE_MCI_GENERICS		0x70
 #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
@@ -119,7 +120,8 @@
 #define CORE_PWRSAVE_DLL	BIT(3)
 
 #define DDR_CONFIG_POR_VAL	0x80040873
-
+#define DLL_CONFIG_3_POR_VAL	0x10
+#define TCXO_FREQ               19200000
 
 #define INVALID_TUNING_PHASE	-1
 #define SDHCI_MSM_MIN_CLOCK	400000
@@ -319,6 +321,15 @@ struct sdhci_msm_host {
 	bool artanis_dll;
 };
 
+enum dll_init_context {
+	DLL_INIT_NORMAL,
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
@@ -805,6 +816,207 @@ static int msm_init_cm_dll(struct sdhci_host *host)
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
+	struct mmc_ios ios = host->mmc->ios;
+	unsigned int sup_clk;
+
+	if (req_clk < sdhci_msm_get_min_clock(host))
+		return sdhci_msm_get_min_clock(host);
+
+	sup_clk = clk_get_rate(core_clk);
+
+	if (ios.timing == MMC_TIMING_MMC_HS400 ||
+	    host->flags & SDHCI_HS400_TUNING)
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
+	int rc = 0;
+	u32 dll_lock;
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
+		writel_relaxed(msm_host->dll[index].dll_config_3,
+			       ioaddr + msm_offset->core_dll_config_3);
+		writel_relaxed(msm_host->dll[index].dll_usr_ctl,
+			       ioaddr + msm_offset->core_dll_usr_ctl);
+	}
+
+	/*
+	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
+	 */
+	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
+					: msm_offset->core_ddr_config_old;
+
+	config = msm_host->dll[index].ddr_config;
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
+	config = msm_host->dll[index].dll_config;
+	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
+
+	/* Wait for 52us */
+	spin_unlock_irqrestore(&host->lock, flags);
+	usleep_range(60, 70);
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
+	usleep_range(50, 60);
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
+	rc = readl_relaxed_poll_timeout(ioaddr +
+					msm_offset->core_dll_status,
+					dll_lock,
+					dll_lock & CORE_DLL_LOCK,
+					10,
+					100);
+	if (rc == -ETIMEDOUT)
+		pr_err("%s: Unable to get DLL_LOCK, dll_status: 0x%08x\n",
+		       mmc_hostname(host->mmc), dll_lock);
+
+out:
+	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
+		/* Reenable PWRSAVE as needed */
+		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
+		config |= CORE_CLK_PWRSAVE;
+		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
+	}
+
+	spin_unlock_irqrestore(&host->lock, flags);
+	return rc;
+}
+
 static void msm_hc_select_default(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -927,6 +1139,24 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
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
@@ -942,7 +1172,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (ret)
 		goto out;
 
@@ -1030,7 +1260,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	return ret;
 }
 
-static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
+static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
 {
 	struct mmc_host *mmc = host->mmc;
 	u32 dll_status, config, ddr_cfg_offset;
@@ -1053,7 +1283,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
 		ddr_cfg_offset = msm_offset->core_ddr_config;
 	else
 		ddr_cfg_offset = msm_offset->core_ddr_config_old;
-	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
+
+	if (msm_host->artanis_dll)
+		writel_relaxed(msm_host->dll[index].ddr_config, host->ioaddr + ddr_cfg_offset);
+	else
+		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
 
 	if (mmc->ios.enhanced_strobe) {
 		config = readl_relaxed(host->ioaddr +
@@ -1122,7 +1356,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		goto out;
 
@@ -1142,7 +1377,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	if (msm_host->use_cdclp533)
 		ret = sdhci_msm_cdclp533_calibration(host);
 	else
-		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
+		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
 out:
 	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
 		 __func__, ret);
@@ -1185,7 +1420,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
 		return 0;
 
 	/* Reset the tuning block */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		return ret;
 
@@ -1227,6 +1463,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
 	u32 config;
+	bool hs400_tuning;
 
 	if (!sdhci_msm_is_tuning_needed(host)) {
 		msm_host->use_cdr = false;
@@ -1256,17 +1493,23 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	 * - select MCLK/2 in VENDOR_SPEC
 	 * - program MCLK to 400MHz (or nearest supported) in GCC
 	 */
-	if (host->flags & SDHCI_HS400_TUNING) {
+	hs400_tuning = !!(host->flags & SDHCI_HS400_TUNING);
+	if (hs400_tuning) {
 		sdhci_msm_hc_select_mode(host);
 		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
-		host->flags &= ~SDHCI_HS400_TUNING;
 	}
 
 retry:
 	/* First of all reset the tuning block */
-	rc = msm_init_cm_dll(host);
-	if (rc)
+	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+	if (rc) {
+		if (hs400_tuning)
+			host->flags &= ~SDHCI_HS400_TUNING;
 		return rc;
+	}
+
+	if (hs400_tuning)
+		host->flags &= ~SDHCI_HS400_TUNING;
 
 	phase = 0;
 	do {
@@ -1297,6 +1540,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 				mmc_hostname(mmc));
 			if (--tuning_seq_cnt) {
 				tuned_phase_cnt = 0;
+				if (hs400_tuning)
+					host->flags |= SDHCI_HS400_TUNING;
 				goto retry;
 			}
 		}
@@ -1319,8 +1564,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		dev_dbg(mmc_dev(mmc), "%s: Setting the tuning phase to %d\n",
 			 mmc_hostname(mmc), phase);
 	} else {
-		if (--tuning_seq_cnt)
+		if (--tuning_seq_cnt) {
+			if (hs400_tuning)
+				host->flags |= SDHCI_HS400_TUNING;
 			goto retry;
+		}
 		/* Tuning failed */
 		dev_dbg(mmc_dev(mmc), "%s: No tuning point found\n",
 		       mmc_hostname(mmc));
@@ -1847,11 +2095,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
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
2.34.1


