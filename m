Return-Path: <linux-arm-msm+bounces-85706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5535BCCC3EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C4D4301F8FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF7281376;
	Thu, 18 Dec 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eshfKoEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC026D4DF;
	Thu, 18 Dec 2025 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067508; cv=none; b=lhuOsVxwzryKFYdRwHykn207Q9GWj4ZbMwkpMyb57HyaYx83D07bHSaeF43QWA8D0bKxe6zxlpc9qQfFirM+r3RFj8XusEV2sJyDETCQ5wZQ8MkFoplTMEMCrH9QWHyyfj/FVYq2VHG8BPOzBxGqVtelXW+1/Ig5pytox2I84Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067508; c=relaxed/simple;
	bh=MmQdy2pEvcDC5QpilT7rZ/uithlpJEsLXMZMQ7R+iFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrAPadUGK+2rNQAwY+yHjAlnBWHzarax+bgRmdj31FDjjG/+EXPl5ZyLVQX1HPD4NW8M/u4LmnpWsECCmTG+vJwnu/vKRUYA/hrVPaOoxDQSifvCtdXQFMyMly3mTcWgdrOFBZ8X2H4I759UCbyD7n5AArPNEZIslPMq7kIuDHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eshfKoEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B96C116B1;
	Thu, 18 Dec 2025 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766067506;
	bh=MmQdy2pEvcDC5QpilT7rZ/uithlpJEsLXMZMQ7R+iFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eshfKoEk+avn/wjWnLjnl2OeSf5tGd6NLwxbJQl7hnQjoFU5FywCbtuts6e0W5l9N
	 71bbOpcZVB8Knh1xma5tGJYvNTCrG2Q6RMFdq+V+h5y8OI9IvOCpLcQm8klN+UlWda
	 wJFUo/y2UB7NMYW4BWeo1Hm4adO/my9MrqME30QWXT1apbWXQSJFwVA4H3qWu9QFql
	 jDRqyTHc9ctxQfJEOG3IQCTg//bn6p+mCOS5Qc+MTPmWpKXXh8v9wd6MX8Wr8zuwfj
	 EoYt4Y1vrQG+w7S2pttSJuZXT3N7EYGwku7FhcPEKA3NSHW/DbxtvJfnBF0nkZ+KdJ
	 S+EdHghfFkn9w==
Date: Thu, 18 Dec 2025 08:18:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, 
	kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v6 5/5] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <vlikwopeugo43v72tu7u6rdf2ervm3gcvvwe66dycyfqf22572@wgcretfpawme>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-6-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215120009.3877889-6-quic_rampraka@quicinc.com>

On Mon, Dec 15, 2025 at 05:30:09PM +0530, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> With the current DLL sequence stability issues for data
> transfer seen in HS400 and HS200 modes.
> 
> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> data error 0"
> 
> Rectify the DLL programming sequence as per latest hardware
> programming guide

You're talking about how things are unstable, but what the commit
message completely fails to mention is that all this new spaghetti is
conditional on msm_host->artanis_dll, so I believe this statement
only applies to a single supported SoC?

No where in this series do you mention that this only (?) applies to
QDU1000. 

> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 277 ++++++++++++++++++++++++++++++++---
>  1 file changed, 260 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 1fcd92158bee..f459b40db41c 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -28,6 +28,7 @@
>  #define CORE_VERSION_MAJOR_SHIFT	28
>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
>  #define CORE_VERSION_MINOR_MASK		0xff
> +#define SDHCI_MSM_MIN_V_7FF		0x6e
>  
>  #define CORE_MCI_GENERICS		0x70
>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> @@ -119,7 +120,8 @@
>  #define CORE_PWRSAVE_DLL	BIT(3)
>  
>  #define DDR_CONFIG_POR_VAL	0x80040873
> -
> +#define DLL_CONFIG_3_POR_VAL	0x10
> +#define TCXO_FREQ               19200000

If you read the current implementation of msm_init_cm_dll() you'll see
that we don't hard code the XO clock...

>  
>  #define INVALID_TUNING_PHASE	-1
>  #define SDHCI_MSM_MIN_CLOCK	400000
> @@ -319,6 +321,15 @@ struct sdhci_msm_host {
>  	bool artanis_dll;
>  };
>  
> +enum dll_init_context {
> +	DLL_INIT_NORMAL,

What is the purpose of a single-entry enum to capture the value 0?

> +};
> +
> +enum mode {
> +	HS400, // equivalent to SDR104 mode for DLL.
> +	HS200, // equivalent to SDR50 mode for DLL.

This is effectively a bool, with a terribly generic name.

> +};
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -805,6 +816,207 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>  	return 0;
>  }
>  
> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> +{
> +	return SDHCI_MSM_MIN_CLOCK;
> +}
> +
> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> +	struct mmc_ios ios = host->mmc->ios;
> +	unsigned int sup_clk;
> +
> +	if (req_clk < sdhci_msm_get_min_clock(host))
> +		return sdhci_msm_get_min_clock(host);
> +
> +	sup_clk = clk_get_rate(core_clk);
> +
> +	if (ios.timing == MMC_TIMING_MMC_HS400 ||
> +	    host->flags & SDHCI_HS400_TUNING)
> +		sup_clk = sup_clk / 2;
> +
> +	return sup_clk;

Isn't sup_clk the same as host->mmc->actual_clock? Isn't this already
calculated for you?

> +}
> +
> +/* Initialize the DLL (Programmable Delay Line) */

So now we're going to have two functions that are named pretty much the
same and look pretty similar?

With the main difference that the slightly more generically named
sdhci_msm_configure_dll() is only called if we have a artanis_dll,
otherwise msm_init_cm_dll() is used?

> +static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
> +				 init_context, enum mode index)
> +{

Large parts of this function is duplicated from msm_init_cm_dll(). This
isn't okay.

> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> +	struct mmc_host *mmc = host->mmc;
> +	u32 ddr_cfg_offset, core_vendor_spec, config;
> +	void __iomem *ioaddr = host->ioaddr;
> +	unsigned long flags, dll_clock;
> +	int rc = 0;
> +	u32 dll_lock;
> +
> +	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> +
> +	/*
> +	 * Always disable PWRSAVE during the DLL power
> +	 * up regardless of its current setting.
> +	 */
> +	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
> +	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
> +
> +	if (msm_host->use_14lpp_dll_reset) {
> +		/* Disable CK_OUT */
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +		config &= ~CORE_CK_OUT_EN;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +		/* Disable the DLL clock */
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +		config |= CORE_DLL_CLOCK_DISABLE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +	}
> +
> +	/*
> +	 * Write 1 to DLL_RST bit of DLL_CONFIG register
> +	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
> +	 */
> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +	config |= (CORE_DLL_RST | CORE_DLL_PDN);
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Configure DLL_CONFIG_3 and USER_CTRL
> +	 * (Only applicable for 7FF projects).

What is a 7FF project?

> +	 */
> +	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
> +		writel_relaxed(msm_host->dll[index].dll_config_3,
> +			       ioaddr + msm_offset->core_dll_config_3);
> +		writel_relaxed(msm_host->dll[index].dll_usr_ctl,
> +			       ioaddr + msm_offset->core_dll_usr_ctl);
> +	}
> +
> +	/*
> +	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
> +	 */
> +	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
> +					: msm_offset->core_ddr_config_old;
> +
> +	config = msm_host->dll[index].ddr_config;
> +	writel_relaxed(config, ioaddr + ddr_cfg_offset);
> +
> +	/* Set DLL_CONFIG_2 */
> +	if (msm_host->use_14lpp_dll_reset) {
> +		u32 mclk_freq;
> +		int cycle_cnt;
> +
> +		/*
> +		 * Only configure the mclk_freq in normal DLL init
> +		 * context. If the DLL init is coming from
> +		 * CX Collapse Exit context, the host->clock may be zero.
> +		 * The DLL_CONFIG_2 register has already been restored to
> +		 * proper value prior to getting here.
> +		 */
> +		if (init_context == DLL_INIT_NORMAL) {

Guess what...enum mode only has a single possible value, so init_context
is DLL_INIT_NORMAL...

> +			cycle_cnt = readl_relaxed(ioaddr +
> +					msm_offset->core_dll_config_2)
> +					& CORE_FLL_CYCLE_CNT ? 8 : 4;
> +
> +			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
> +
> +			if (dll_clock < 100000000) {
> +				pr_err("%s: %s: Non standard clk freq =%u\n",
> +				       mmc_hostname(mmc), __func__, dll_clock);
> +				rc = -EINVAL;
> +				goto out;
> +			}
> +
> +			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +			config = (config & ~GENMASK(17, 10)) |
> +					FIELD_PREP(GENMASK(17, 10), mclk_freq);
> +			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +		}
> +		/* wait for 5us before enabling DLL clock */
> +		udelay(5);
> +	}
> +
> +	config = msm_host->dll[index].dll_config;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Wait for 52us */
> +	spin_unlock_irqrestore(&host->lock, flags);

How come this isn't racy? What is the purpose of holding this spinlock
throughout this method and are you certain that whatever concurrent
execution might happen doesn't happen here?

> +	usleep_range(60, 70);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	/*
> +	 * Write 0 to DLL_RST bit of DLL_CONFIG register
> +	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
> +	 */
> +	config &= ~CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	config &= ~CORE_DLL_PDN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
> +	config |= CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
> +	config &= ~CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
> +	if (msm_host->use_14lpp_dll_reset) {
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +		config &= ~CORE_DLL_CLOCK_DISABLE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +	}
> +
> +	/* Set DLL_EN bit to 1. */
> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +	config |= CORE_DLL_EN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Wait for 8000 input clock. Here we calculate the
> +	 * delay from fixed clock freq 192MHz, which turns out 42us.
> +	 */
> +	spin_unlock_irqrestore(&host->lock, flags);

As above, how do we know that this isn't racy?

> +	usleep_range(50, 60);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	/* Set CK_OUT_EN bit to 1. */
> +	config |= CORE_CK_OUT_EN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Wait until DLL_LOCK bit of DLL_STATUS register
> +	 * becomes '1'.
> +	 */
> +	rc = readl_relaxed_poll_timeout(ioaddr +
> +					msm_offset->core_dll_status,
> +					dll_lock,
> +					dll_lock & CORE_DLL_LOCK,
> +					10,
> +					100);
> +	if (rc == -ETIMEDOUT)
> +		pr_err("%s: Unable to get DLL_LOCK, dll_status: 0x%08x\n",

Don't pr_err() when you have a struct device.

> +		       mmc_hostname(host->mmc), dll_lock);
> +
> +out:
> +	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
> +		/* Reenable PWRSAVE as needed */
> +		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> +		config |= CORE_CLK_PWRSAVE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
> +	}
> +
> +	spin_unlock_irqrestore(&host->lock, flags);
> +	return rc;
> +}
> +
>  static void msm_hc_select_default(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -927,6 +1139,24 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
>  		msm_hc_select_default(host);
>  }
>  
> +static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
> +{
> +	if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
> +	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
> +		return sdhci_msm_configure_dll(host, init_context, HS400);
> +
> +	return sdhci_msm_configure_dll(host, init_context, HS200);
> +}
> +
> +static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
> +		msm_init_cm_dll(host);

So dll_config() calls init_dll() or init_cm_dll() which then might call
configure_dll(). Is it init or config?!

> +}
> +
>  static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -942,7 +1172,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>  	 * tuning block and restore the saved tuning phase.
>  	 */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>  	if (ret)
>  		goto out;
>  
> @@ -1030,7 +1260,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  	return ret;
>  }
>  
> -static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> +static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
>  {
>  	struct mmc_host *mmc = host->mmc;
>  	u32 dll_status, config, ddr_cfg_offset;
> @@ -1053,7 +1283,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>  		ddr_cfg_offset = msm_offset->core_ddr_config;
>  	else
>  		ddr_cfg_offset = msm_offset->core_ddr_config_old;
> -	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> +
> +	if (msm_host->artanis_dll)
> +		writel_relaxed(msm_host->dll[index].ddr_config, host->ioaddr + ddr_cfg_offset);
> +	else
> +		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
>  
>  	if (mmc->ios.enhanced_strobe) {
>  		config = readl_relaxed(host->ioaddr +
> @@ -1122,7 +1356,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>  	 * tuning block and restore the saved tuning phase.
>  	 */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> +
>  	if (ret)
>  		goto out;
>  
> @@ -1142,7 +1377,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>  	if (msm_host->use_cdclp533)
>  		ret = sdhci_msm_cdclp533_calibration(host);
>  	else
> -		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
> +		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
>  out:
>  	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
>  		 __func__, ret);
> @@ -1185,7 +1420,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
>  		return 0;
>  
>  	/* Reset the tuning block */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> +
>  	if (ret)
>  		return ret;
>  
> @@ -1227,6 +1463,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>  	u32 config;
> +	bool hs400_tuning;
>  
>  	if (!sdhci_msm_is_tuning_needed(host)) {
>  		msm_host->use_cdr = false;
> @@ -1256,17 +1493,23 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	 * - select MCLK/2 in VENDOR_SPEC
>  	 * - program MCLK to 400MHz (or nearest supported) in GCC
>  	 */
> -	if (host->flags & SDHCI_HS400_TUNING) {
> +	hs400_tuning = !!(host->flags & SDHCI_HS400_TUNING);

I don't see the reason for this change. If it actually impact the
behavior of the init/config dll, did you ensure that it doesn't impact
all currently supported targets?

Regards,
Bjorn

> +	if (hs400_tuning) {
>  		sdhci_msm_hc_select_mode(host);
>  		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
> -		host->flags &= ~SDHCI_HS400_TUNING;
>  	}
>  
>  retry:
>  	/* First of all reset the tuning block */
> -	rc = msm_init_cm_dll(host);
> -	if (rc)
> +	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> +	if (rc) {
> +		if (hs400_tuning)
> +			host->flags &= ~SDHCI_HS400_TUNING;
>  		return rc;
> +	}
> +
> +	if (hs400_tuning)
> +		host->flags &= ~SDHCI_HS400_TUNING;
>  
>  	phase = 0;
>  	do {
> @@ -1297,6 +1540,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  				mmc_hostname(mmc));
>  			if (--tuning_seq_cnt) {
>  				tuned_phase_cnt = 0;
> +				if (hs400_tuning)
> +					host->flags |= SDHCI_HS400_TUNING;
>  				goto retry;
>  			}
>  		}
> @@ -1319,8 +1564,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  		dev_dbg(mmc_dev(mmc), "%s: Setting the tuning phase to %d\n",
>  			 mmc_hostname(mmc), phase);
>  	} else {
> -		if (--tuning_seq_cnt)
> +		if (--tuning_seq_cnt) {
> +			if (hs400_tuning)
> +				host->flags |= SDHCI_HS400_TUNING;
>  			goto retry;
> +		}
>  		/* Tuning failed */
>  		dev_dbg(mmc_dev(mmc), "%s: No tuning point found\n",
>  		       mmc_hostname(mmc));
> @@ -1847,11 +2095,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
>  	return clk_round_rate(core_clk, ULONG_MAX);
>  }
>  
> -static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> -{
> -	return SDHCI_MSM_MIN_CLOCK;
> -}
> -
>  /*
>   * __sdhci_msm_set_clock - sdhci_msm clock control.
>   *
> -- 
> 2.34.1
> 

