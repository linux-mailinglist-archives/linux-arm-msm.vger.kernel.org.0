Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25ACA2DA91D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 09:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgLOIZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 03:25:31 -0500
Received: from mga14.intel.com ([192.55.52.115]:1029 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbgLOIZb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 03:25:31 -0500
IronPort-SDR: HD+3A4inHfqk2LdDg5sZwacmWC2Y6zDERzEjEbgqEUvrRNWAIR3gttNlj9Ng+30Vk/BemH2jKk
 6FdFiyc6p+yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174074004"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="174074004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 00:24:50 -0800
IronPort-SDR: 93jty2wlBwon4KsNvKrEHiU3+39iQBL97Lllrtnw8Y8gh3m4TIrhYwEX08sSr2Z4dIOhyWKtao
 4M3YQ7CbPxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="558617364"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2020 00:24:48 -0800
Subject: Re: [PATCH v5 2/2] mmc: sdhci-msm: Actually set the actual clock
To:     Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
 <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <b388a821-ab68-a3cf-09cc-92923d278d4e@intel.com>
Date:   Tue, 15 Dec 2020 10:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/20 7:21 pm, Douglas Anderson wrote:
> The MSM SDHCI driver always set the "actual_clock" field to 0.  It had
> a comment about it not being needed because we weren't using the
> standard SDHCI divider mechanism and we'd just fallback to
> "host->clock".  However, it's still better to provide the actual
> clock.  Why?
> 
> 1. It will make timeout calculations slightly better.  On one system I
>    have, the eMMC requets 200 MHz (for HS400-ES) but actually gets 192
>    MHz.  These are close, but why not get the more accurate one.
> 
> 2. If things are seriously off in the clock driver and it's missing
>    rates or picking the wrong rate (maybe it's rounding up instead of
>    down), this will make it much more obvious what's going on.
> 
> NOTE: we have to be a little careful here because the "actual_clock"
> field shouldn't include the multiplier that sdhci-msm needs
> internally.
> 
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> Changes in v5:
> - Remove unused clock parameter.
> - Add a comment that we're stashing the requested rate.
> 
> Changes in v4:
> - ("mmc: sdhci-msm: Actually set the actual clock") new for v4.
> 
>  drivers/mmc/host/sdhci-msm.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 50beb407dbe9..f5669dc858d0 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -328,8 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
>  	writel_relaxed(val, host->ioaddr + offset);
>  }
>  
> -static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
> -						    unsigned int clock)
> +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
>  {
>  	struct mmc_ios ios = host->mmc->ios;
>  	/*
> @@ -342,8 +341,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	    ios.timing == MMC_TIMING_MMC_DDR52 ||
>  	    ios.timing == MMC_TIMING_MMC_HS400 ||
>  	    host->flags & SDHCI_HS400_TUNING)
> -		clock *= 2;
> -	return clock;
> +		return 2;
> +	return 1;
>  }
>  
>  static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> @@ -354,14 +353,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	struct mmc_ios curr_ios = host->mmc->ios;
>  	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>  	unsigned long achieved_rate;
> +	unsigned int desired_rate;
> +	unsigned int mult;
>  	int rc;
>  
> -	clock = msm_get_clock_rate_for_bus_mode(host, clock);
> -	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
> +	mult = msm_get_clock_mult_for_bus_mode(host);
> +	desired_rate = clock * mult;
> +	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>  	if (rc) {
>  		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> -		       mmc_hostname(host->mmc), clock,
> -		       curr_ios.timing);
> +		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
>  		return;
>  	}
>  
> @@ -371,11 +372,14 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	 * encounter it.
>  	 */
>  	achieved_rate = clk_get_rate(core_clk);
> -	if (achieved_rate > clock)
> +	if (achieved_rate > desired_rate)
>  		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> -			mmc_hostname(host->mmc), clock, achieved_rate);
> +			mmc_hostname(host->mmc), desired_rate, achieved_rate);
> +	host->mmc->actual_clock = achieved_rate / mult;
> +
> +	/* Stash the rate we requested to use in sdhci_msm_runtime_resume() */
> +	msm_host->clk_rate = desired_rate;
>  
> -	msm_host->clk_rate = clock;
>  	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
>  		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
>  }
> @@ -1756,13 +1760,6 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>  static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>  	u16 clk;
> -	/*
> -	 * Keep actual_clock as zero -
> -	 * - since there is no divider used so no need of having actual_clock.
> -	 * - MSM controller uses SDCLK for data timeout calculation. If
> -	 *   actual_clock is zero, host->clock is taken for calculation.
> -	 */
> -	host->mmc->actual_clock = 0;
>  
>  	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
>  
> @@ -1785,7 +1782,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  
>  	if (!clock) {
> -		msm_host->clk_rate = clock;
> +		host->mmc->actual_clock = msm_host->clk_rate = 0;
>  		goto out;
>  	}
>  
> 

