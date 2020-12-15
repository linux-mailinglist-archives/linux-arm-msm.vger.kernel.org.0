Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8562DA91B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 09:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgLOIZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 03:25:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:47372 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgLOIZC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 03:25:02 -0500
IronPort-SDR: 6Q9g5t9zI8GElc3P63hxz3rnVz7JyJlk+aabnY5e8b730QNv90Ql4f1G+OtW8IETIUpWCDAuWN
 E0uD9SQfQ1Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174988290"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="174988290"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 00:24:18 -0800
IronPort-SDR: L1LVKlTPRKENUuMAPXPTc/vUSAioT62gf7973Gb2v5GV1tEiR3TpsVEKP797w9dfhSMZkJJA5D
 Gv/689FL+uhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="558617291"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2020 00:24:15 -0800
Subject: Re: [PATCH v5 1/2] mmc: sdhci-msm: Warn about overclocking SD/MMC
To:     Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <c4f59241-1b4b-363f-c786-71636514f233@intel.com>
Date:   Tue, 15 Dec 2020 10:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/20 7:21 pm, Douglas Anderson wrote:
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
> 
> This would have saved a bunch of time [1].
> 
> NOTE: this doesn't actually fix any problems, it just makes it obvious
> to devs that there is a problem and that should be an indication to
> fix the clock driver.
> 
> [1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Emphasize in the commit message that this itself doesn't fix anything.
> 
> Changes in v3:
> - Proper printf format code.
> 
> Changes in v2:
> - Store rate in unsigned long, not unsigned int.
> - Reuse the clk_get_rate() in the later print.
> 
>  drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..50beb407dbe9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -353,6 +353,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  	struct mmc_ios curr_ios = host->mmc->ios;
>  	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> +	unsigned long achieved_rate;
>  	int rc;
>  
>  	clock = msm_get_clock_rate_for_bus_mode(host, clock);
> @@ -363,10 +364,20 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  		       curr_ios.timing);
>  		return;
>  	}
> +
> +	/*
> +	 * Qualcomm clock drivers by default round clock _up_ if they can't
> +	 * make the requested rate.  This is not good for SD.  Yell if we
> +	 * encounter it.
> +	 */
> +	achieved_rate = clk_get_rate(core_clk);
> +	if (achieved_rate > clock)
> +		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> +			mmc_hostname(host->mmc), clock, achieved_rate);
> +
>  	msm_host->clk_rate = clock;
>  	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
> -		 mmc_hostname(host->mmc), clk_get_rate(core_clk),
> -		 curr_ios.timing);
> +		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
>  }
>  
>  /* Platform specific tuning */
> 

