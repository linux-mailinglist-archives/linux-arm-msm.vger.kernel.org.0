Return-Path: <linux-arm-msm+bounces-75505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFACBA90C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB391C1C2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72707301715;
	Mon, 29 Sep 2025 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lrmwifsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6784C301038;
	Mon, 29 Sep 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145759; cv=none; b=euyK1GAGsCjuQlNd28maNVuz8z+MCp0sd0pIa/6otkNtJv89wiLhLGQBmANJgS1GDS7aIwuhZJ2QX91TC/4/7MeZZTqkiLwDuoy+/vN5E3PLdZU+QSYUhTX6A0uCuTuca9J/c3koEMeT7q47b8AviuKyg7IJsG3tnXYxYrmDS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145759; c=relaxed/simple;
	bh=uAfNhgwuezOpyeVE/5dToN1u2OVvIawGg/j2hZbH8Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dvd6Qfkx06J+1ASF8EGQaOlkSRUCbFuiJA+UE0uvd5gl51fcFfT6uqx2NhiWwobjLQOiR2YdcY+gZlHIJF9yvi4HxwE9T/4+e987tGyI5eKHchMQvtZrr7PQrB1Azm0hOtATWYjKwoU+UY5+rSNpKyWlR1kqqmFO0oWFVpP5VI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lrmwifsA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9KicV019276;
	Mon, 29 Sep 2025 11:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S1chZfs/ccI
	ca1CVgethCUb8gWm+Q5uPlpoTVsU4On0=; b=lrmwifsA1mAgzF4ufu/rbyMj42i
	oxYe/6azT/Z+qYiMahAh1IWBAoyYzcPq0Er+2qmt6t5cSYqfQZ68KKKwyKG7NlzI
	UDOmNZvOKknnnHreTUAPAGmJDmO8a3bl3Br3Te5uonZHqbKb0M3SIZ1zszt3Bip2
	smjHTjio/1EVefdsoAoSiLcQOf4O4Erydwo4Fyx9OT1NSsS1Rqs2WG/Uw3nh+qhs
	9DVWuXK1iY6skGu4B/eqME01jHFoTvPFTPaEUC05haVacLDvc37vLz9J1I8vu7tL
	7UgVEhuyuwjJA9zYhPbK3rzxfMjdjElKUEEawq86/eq72+mjZQO1UbUlEdA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hcs9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TBZoJ1008944;
	Mon, 29 Sep 2025 11:35:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49e90kvy6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58TBZouo008939;
	Mon, 29 Sep 2025 11:35:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58TBZn2T008937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id C8DA15C6; Mon, 29 Sep 2025 17:05:48 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v4 4/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Mon, 29 Sep 2025 17:05:15 +0530
Message-Id: <20250929113515.26752-5-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929113515.26752-1-quic_rampraka@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX1+mIeY34RObC
 vPjlHW7wlOkavFjDRLDMtbRc+kpb3EaDtimCc4A9df/lWTxHWyQDENVp+aGtH4krakrvr8R3PA8
 NlSrmz402IjFS3dn+2PEOK1ULOH71pMsv5Fqf7vWphm5HmXiv4pPjSW2OmrsNiA57A1F4xQamCi
 Dd9T+4a+CmatOUl/zwjw+Gy/1RWKwNbZuzHwSRAPpyzr7NHVUonGAvoPW0mr/bzo/HQ/ZadAI3Z
 2z8HuoSCP+eItllsG1h2DtYNYpMLLB6412h83nqYuxCicdzX71Nt1koBC460mHhSOERNLaT17Hi
 YHmc1zFmVYd2S3WxbNLEaAEKvFNjAe/zZSIL1RUPi+0qRDNj73C/I0SC/6vaSOAOSn264vAHmNQ
 8/EbQ8iNWafDOMqvDwtq8CO4KtVRKA==
X-Proofpoint-GUID: duNeesGCNqF8_ukBTRw81qgbQ7uX7l1E
X-Proofpoint-ORIG-GUID: duNeesGCNqF8_ukBTRw81qgbQ7uX7l1E
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da6f19 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=o3FjeQ6YOhh_Ng1Uz5QA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

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
 drivers/mmc/host/sdhci-msm.c | 271 ++++++++++++++++++++++++++++++++---
 1 file changed, 252 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index d07f0105b733..0f60a3655ef1 100644
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
@@ -318,6 +320,16 @@ struct sdhci_msm_host {
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
@@ -802,6 +814,208 @@ static int msm_init_cm_dll(struct sdhci_host *host)
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
+	config = msm_host->dll.dll_config[index];
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
@@ -924,14 +1138,31 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
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
 
@@ -939,7 +1170,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (ret)
 		goto out;
 
@@ -1027,7 +1258,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	return ret;
 }
 
-static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
+static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
 {
 	struct mmc_host *mmc = host->mmc;
 	u32 dll_status, config, ddr_cfg_offset;
@@ -1050,7 +1281,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
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
@@ -1107,11 +1342,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
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
 
@@ -1119,7 +1353,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		goto out;
 
@@ -1139,7 +1374,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	if (msm_host->use_cdclp533)
 		ret = sdhci_msm_cdclp533_calibration(host);
 	else
-		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
+		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
 out:
 	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
 		 __func__, ret);
@@ -1178,7 +1413,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
 		return 0;
 
 	/* Reset the tuning block */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		return ret;
 
@@ -1242,12 +1478,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (host->flags & SDHCI_HS400_TUNING) {
 		sdhci_msm_hc_select_mode(host);
 		msm_set_clock_rate_for_bus_mode(host, ios.clock);
-		host->flags &= ~SDHCI_HS400_TUNING;
 	}
 
 retry:
 	/* First of all reset the tuning block */
-	rc = msm_init_cm_dll(host);
+	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (rc)
 		return rc;
 
@@ -1310,6 +1545,9 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		rc = -EIO;
 	}
 
+	if (host->flags & SDHCI_HS400_TUNING)
+		host->flags &= ~SDHCI_HS400_TUNING;
+
 	if (!rc)
 		msm_host->tuning_done = true;
 	return rc;
@@ -1830,11 +2068,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
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


