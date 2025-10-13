Return-Path: <linux-arm-msm+bounces-77041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A7BBD3DE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BECDE18A192E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FF5310762;
	Mon, 13 Oct 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lxsfeI5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841731062D;
	Mon, 13 Oct 2025 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367225; cv=none; b=cC2m9uZ2hD+Z3LlUuA4EtSu++cZ8VZz5tUuymb+csfxL2M0cUzyyYPUU01VGfUsP8tKgrsOVRleHBquax3KLWBi9ZN+nYiCpy6wS0uMmFqevSpr/luZkj+HwaZ5ybaX6fkXGatnoGX2uqX8YSQC3wyeMby2F/dNDyqg+GkvepTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367225; c=relaxed/simple;
	bh=ealyELSyItjneqvjZ+Ea5MzvttUx8sDdSk0xpX5c7Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KEgyQZqtgajxaxBQzV/y2netyxIRLEi58UzprrL8UAJKGouqA9i96k/OHgysIpmrCOaJmRF2RXp1caK5rXnUo7UkJmXAm69/ZzzLZL2okDQZJznSnJDYttXUrx+BCYBFWodetBytQ/BqnyXvHX7f0W0ZX7e+hfTRksfRjhcdiL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lxsfeI5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DA6v7a000691;
	Mon, 13 Oct 2025 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kjZXaQVxcxK
	d7AQy1BnV6Ph1ALfGm5jWkmb7NJpXBRs=; b=lxsfeI5AL+v4sY70ehgeTAv2V8+
	e6tzvLA/MJyrOeAVZc9vTmHWnuGUA11TeKUZwrplDY6NHhkYBbAPP2t7VVFlX6hF
	FbhTnHMbSu0KD7rSoX1pgR9LyfMUb7uFPS4Uhzazrhd+50FDELjo3eB6McSuwjPW
	TK3U+SMbkqBrpKRQJoDfpd2xLZqyrbjV8XSHjJqUMQDsub9At1k8UDazzLvZKQ6t
	AiCz8i5vS1lauCSKDTDcThOMXL/ziPcCrJ4p+pJt0vTj1bvrUKRqMMsluf1cXj/+
	0ULa3tokrwDoOn6/DDeA2QPYz6WRPXLSTLazQcMOZduMInpuMnR4kzG5Alw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8w2ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DErPGK025995;
	Mon, 13 Oct 2025 14:53:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgaktjf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DErUn2026099;
	Mon, 13 Oct 2025 14:53:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59DErTTx026090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:30 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id D7E685C8; Mon, 13 Oct 2025 20:23:28 +0530 (+0530)
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
Subject: [PATCH v5 4/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Mon, 13 Oct 2025 20:23:16 +0530
Message-Id: <20251013145316.1087274-5-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fn2Dy5k9Y78SCNUAvlnTKoTL3vHh-aBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1mWpNVVYTqmu
 IGspsB1Htgt1qmWuZqZp87PAp26Bi4jOHFtLkcYvzVWn4CP6ppQEpfw/cj4IdkwgxekGd691PHS
 uYRE+HvXRISdUTwjDU8XCb61pRlPQrcXdbsHwy9vYj4tdJDVCIAUP+L6oqM6VSq9i1CzPn9jTvE
 cV5y2JOzvI2wI0zpc/JGmLIQ8NivowsxDiyBefUusSsXc23PeD7V2dorIGyuC4AezMas7Wuet5M
 8MtgqDa8o1GgHXbGjj3lmZcqRPK2QIvGDXs1JuGUNIfxgRXFzfaHngSgSC5kzGrdGGkMRemRoAf
 M42HmkS50rUWSYKzlfOjQ/B37z0+R9HbJuE3QZFuyXxjNqWUPigjyNfJqn9r425K/kDXqVMJQhO
 +3oJxKvud1OTEPPdSzY3iiA0ZzAsTg==
X-Proofpoint-GUID: fn2Dy5k9Y78SCNUAvlnTKoTL3vHh-aBu
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ed126e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=o3FjeQ6YOhh_Ng1Uz5QA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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
 drivers/mmc/host/sdhci-msm.c | 272 ++++++++++++++++++++++++++++++++---
 1 file changed, 253 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 8038b8def355..a875e92f8663 100644
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
@@ -319,6 +321,16 @@ struct sdhci_msm_host {
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
@@ -803,6 +815,209 @@ static int msm_init_cm_dll(struct sdhci_host *host)
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
+
+	spin_unlock_irqrestore(&host->lock, flags);
+	return rc;
+}
+
 static void msm_hc_select_default(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -925,14 +1140,31 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
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
 
@@ -940,7 +1172,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
 	if (ret)
 		goto out;
 
@@ -1028,7 +1260,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 	return ret;
 }
 
-static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
+static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
 {
 	struct mmc_host *mmc = host->mmc;
 	u32 dll_status, config, ddr_cfg_offset;
@@ -1051,7 +1283,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
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
@@ -1108,11 +1344,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
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
 
@@ -1120,7 +1355,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	 * Retuning in HS400 (DDR mode) will fail, just reset the
 	 * tuning block and restore the saved tuning phase.
 	 */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		goto out;
 
@@ -1140,7 +1376,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
 	if (msm_host->use_cdclp533)
 		ret = sdhci_msm_cdclp533_calibration(host);
 	else
-		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
+		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
 out:
 	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
 		 __func__, ret);
@@ -1183,7 +1419,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
 		return 0;
 
 	/* Reset the tuning block */
-	ret = msm_init_cm_dll(host);
+	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
+
 	if (ret)
 		return ret;
 
@@ -1257,12 +1494,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
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
 
@@ -1325,6 +1561,9 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		rc = -EIO;
 	}
 
+	if (host->flags & SDHCI_HS400_TUNING)
+		host->flags &= ~SDHCI_HS400_TUNING;
+
 	if (!rc)
 		msm_host->tuning_done = true;
 	return rc;
@@ -1845,11 +2084,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
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


