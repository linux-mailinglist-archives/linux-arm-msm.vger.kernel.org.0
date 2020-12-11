Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0071A2D6FEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 06:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395323AbgLKF5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 00:57:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:14361 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388912AbgLKF5B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 00:57:01 -0500
IronPort-SDR: 37HFe2CfUNk+JbQ5n4T78ZwxpTQhJloq2TLBkx6U5/4MXk2hf8pCQdFdYWEl2rdgM4mCdPz2r0
 QvjkaQ3sttfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="192719718"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="192719718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 21:56:20 -0800
IronPort-SDR: XeuqIRz9Woncf1RrMdNvjoMW/1Sn1Z8LQBzIQJlsAP1CW2l+x6QjRiHfo6PArtOnv3jBsVu9QB
 UvrBAP2rYUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="409008570"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by orsmga001.jf.intel.com with ESMTP; 10 Dec 2020 21:56:16 -0800
Subject: Re: [PATCH v3] mmc: sdhci-msm: Warn about overclocking SD/MMC
To:     Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, vbadigan@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20201210132745.v3.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <757616c0-8111-c7db-893b-31931a9d4ed0@intel.com>
Date:   Fri, 11 Dec 2020 07:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210132745.v3.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/20 11:27 pm, Douglas Anderson wrote:
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
> 
> This would have saved a bunch of time [1].
> 
> [1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
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

How does a warning help?

Also, did you consider setting host->mmc->actual_clock

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

