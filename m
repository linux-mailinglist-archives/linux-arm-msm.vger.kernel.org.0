Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956682DA969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 09:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgLOIpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 03:45:41 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:56425 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgLOIpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 03:45:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608021920; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i2jmGc0B2v0Eml1asqQ1vn5E/wwWvXhDr3Rak4MLjh8=; b=eU1rFcwP7QAAho3Df1W5fsGHyX3u2963GlN/ifOdRHFH29BA2TtPY5Ftmc2A5rD+OiloP0C7
 zsZJmKjX56pp01QQ4a/GhLSg8iMF6RrZ9UZCl9FFZJF03WT/LYf+3QH61KaKBpw0RFw7CVno
 ixPpO7JKtOBuwV1EK489DZOXeOs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fd87781cb227bb0c5ab0a4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 08:44:49
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84365C43461; Tue, 15 Dec 2020 08:44:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.105] (unknown [49.205.247.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E9F0C433C6;
        Tue, 15 Dec 2020 08:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E9F0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH v5 2/2] mmc: sdhci-msm: Actually set the actual clock
To:     Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
 <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <bbe73a29-74ec-fc73-5771-96e9d7156f7c@codeaurora.org>
Date:   Tue, 15 Dec 2020 14:14:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/14/2020 10:51 PM, Douglas Anderson wrote:
> The MSM SDHCI driver always set the "actual_clock" field to 0.  It had
> a comment about it not being needed because we weren't using the
> standard SDHCI divider mechanism and we'd just fallback to
> "host->clock".  However, it's still better to provide the actual
> clock.  Why?
>
> 1. It will make timeout calculations slightly better.  On one system I
>     have, the eMMC requets 200 MHz (for HS400-ES) but actually gets 192
>     MHz.  These are close, but why not get the more accurate one.
>
> 2. If things are seriously off in the clock driver and it's missing
>     rates or picking the wrong rate (maybe it's rounding up instead of
>     down), this will make it much more obvious what's going on.
>
> NOTE: we have to be a little careful here because the "actual_clock"
> field shouldn't include the multiplier that sdhci-msm needs
> internally.
>
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

> ---
>
> Changes in v5:
> - Remove unused clock parameter.
> - Add a comment that we're stashing the requested rate.
>
> Changes in v4:
> - ("mmc: sdhci-msm: Actually set the actual clock") new for v4.
>
>   drivers/mmc/host/sdhci-msm.c | 35 ++++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 50beb407dbe9..f5669dc858d0 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -328,8 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
>   	writel_relaxed(val, host->ioaddr + offset);
>   }
>   
> -static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
> -						    unsigned int clock)
> +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
>   {
>   	struct mmc_ios ios = host->mmc->ios;
>   	/*
> @@ -342,8 +341,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
>   	    ios.timing == MMC_TIMING_MMC_DDR52 ||
>   	    ios.timing == MMC_TIMING_MMC_HS400 ||
>   	    host->flags & SDHCI_HS400_TUNING)
> -		clock *= 2;
> -	return clock;
> +		return 2;
> +	return 1;
>   }
>   
>   static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> @@ -354,14 +353,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>   	struct mmc_ios curr_ios = host->mmc->ios;
>   	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>   	unsigned long achieved_rate;
> +	unsigned int desired_rate;
> +	unsigned int mult;
>   	int rc;
>   
> -	clock = msm_get_clock_rate_for_bus_mode(host, clock);
> -	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
> +	mult = msm_get_clock_mult_for_bus_mode(host);
> +	desired_rate = clock * mult;
> +	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>   	if (rc) {
>   		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> -		       mmc_hostname(host->mmc), clock,
> -		       curr_ios.timing);
> +		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
>   		return;
>   	}
>   
> @@ -371,11 +372,14 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>   	 * encounter it.
>   	 */
>   	achieved_rate = clk_get_rate(core_clk);
> -	if (achieved_rate > clock)
> +	if (achieved_rate > desired_rate)
>   		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> -			mmc_hostname(host->mmc), clock, achieved_rate);
> +			mmc_hostname(host->mmc), desired_rate, achieved_rate);
> +	host->mmc->actual_clock = achieved_rate / mult;
> +
> +	/* Stash the rate we requested to use in sdhci_msm_runtime_resume() */
> +	msm_host->clk_rate = desired_rate;
>   
> -	msm_host->clk_rate = clock;
>   	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
>   		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
>   }
> @@ -1756,13 +1760,6 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>   static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>   {
>   	u16 clk;
> -	/*
> -	 * Keep actual_clock as zero -
> -	 * - since there is no divider used so no need of having actual_clock.
> -	 * - MSM controller uses SDCLK for data timeout calculation. If
> -	 *   actual_clock is zero, host->clock is taken for calculation.
> -	 */
> -	host->mmc->actual_clock = 0;
>   
>   	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
>   
> @@ -1785,7 +1782,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>   
>   	if (!clock) {
> -		msm_host->clk_rate = clock;
> +		host->mmc->actual_clock = msm_host->clk_rate = 0;
>   		goto out;
>   	}
>   
