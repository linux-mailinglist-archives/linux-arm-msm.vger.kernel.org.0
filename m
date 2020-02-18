Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C161163601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 23:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgBRWVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 17:21:54 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36993 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgBRWVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 17:21:53 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so11376785pfn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 14:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ae8TZu3f0/iy91FoI8iTekIQejDkJJeNt9p6hBIs4w=;
        b=XCau9977EU/2cfJFWAYbqYiM+W1BOtQ1ge3/1WWyBOVVaOimLqkK707vHu297FiCca
         cBoZpp1ybWfxL8A/OA2UbU97AIjhGAWSBNLVobjTIb4ujiwp66r+puJtlRSAMu86DjSh
         tOKV8RQiGi5NYxRZsKVcaGkJy04E07qP7KgLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ae8TZu3f0/iy91FoI8iTekIQejDkJJeNt9p6hBIs4w=;
        b=tV3lQapz355BotyllJgQG8EAEbyA3UwpKNsKvNU/fNmV93fw7tpxRheVJBAIuDCSKy
         9+8cMC0KGsWAbhZZmSTkosv9QZJhNFCo9WR+6B5Bn7bT+JGdF02WT1yET9PvXyqg6psx
         HiBtQ3rJOEp+Eaq2+QfaEm9ddoBnHVL0TGkfF6d8LkXnwBYFOznjTtrl0NupCkCVqDU7
         dzBkyHz7WTB2IiK+vRN2a5hJM5GpYzPynWAxoRc3kArjVITBM4ML/gY4LxhlEkr3Barv
         knXat5byMNTxI3GGXJoLyM6bSHAvjEw/7ETXrBBkAzrCZIyDjoy7KXJ9Acn92KYCGmtH
         +3CA==
X-Gm-Message-State: APjAAAVSBs+n/u8al9HqKZIa77pap4WDzzgqC/+szx5eVCCJmq67LFyS
        vfcWatF6QfTX4UzP0ktOPisn+w==
X-Google-Smtp-Source: APXvYqwDUVM3Y0pZl+OXRpUJPoCMvvC353mJa5yCgcdaGa5y01Z3JW2lH4hYmauAsaeizaK3YyLOUQ==
X-Received: by 2002:a63:4804:: with SMTP id v4mr24517077pga.373.1582064513080;
        Tue, 18 Feb 2020 14:21:53 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c26sm16989pfj.8.2020.02.18.14.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 14:21:52 -0800 (PST)
Date:   Tue, 18 Feb 2020 14:21:51 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-mmc-owner@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: Re: [RFC v4 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth
 scaling support
Message-ID: <20200218222151.GD15781@google.com>
References: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
 <1582030833-12964-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582030833-12964-2-git-send-email-ppvk@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pradeep,

On Tue, Feb 18, 2020 at 06:30:32PM +0530, Pradeep P V K wrote:
> Add interconnect bandwidths for SDHC driver using OPP framework that
> is required by SDHC driver based on the clock frequency and bus width
> of the card. Otherwise, the system clocks may run at minimum clock
> speed and thus affecting the performance.
> 
> This change is based on
> [RFC] mmc: host: sdhci-msm: Use the interconnect API
> (https://lkml.org/lkml/2018/10/11/499) and
> 
> [PATCH v6] Introduce Bandwidth OPPs for interconnects
> (https://lkml.org/lkml/2019/12/6/740)
> 
> Co-developed-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Co-developed-by: Subhash Jadavani <subhashj@codeaurora.org>
> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
> Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> ---
> 
> changes from RFC v3 -> v4:
> 
> - Addressed review comments from Bjorn and Matthias

This is not helpful, please describe in future versions what those
changes are.

> 
>  drivers/mmc/host/sdhci-msm.c | 204 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 200 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 71f29ba..5af1c58 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -11,8 +11,10 @@
>  #include <linux/mmc/mmc.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/interconnect.h>
>  #include <linux/iopoll.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_opp.h>
>  
>  #include "sdhci-pltfm.h"
>  
> @@ -229,6 +231,12 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +struct sdhci_msm_bus_vote_data {
> +	struct icc_path *sdhc_to_ddr;
> +	struct icc_path *cpu_to_sdhc;
> +	u32 curr_freq;
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -255,8 +263,11 @@ struct sdhci_msm_host {
>  	bool use_cdr;
>  	u32 transfer_mode;
>  	bool updated_ddr_cfg;
> +	struct sdhci_msm_bus_vote_data *bus_vote_data;
>  };
>  
> +static void sdhci_msm_bus_voting(struct sdhci_host *host, bool enable);
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1564,6 +1575,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  
>  	msm_set_clock_rate_for_bus_mode(host, clock);
>  out:
> +	sdhci_msm_bus_voting(host, !!clock);
>  	__sdhci_msm_set_clock(host, clock);
>  }
>  
> @@ -1685,6 +1697,174 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>  	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>  }
>  
> +/*
> + * Returns required bandwidth in Bytes per Sec
> + */
> +static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
> +					struct mmc_ios *ios)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	switch (ios->bus_width) {
> +	case MMC_BUS_WIDTH_1:
> +		return msm_host->clk_rate/8;

nit: it would be more readable with spaces around '/'.

> +	case MMC_BUS_WIDTH_4:
> +		return msm_host->clk_rate/2;
> +	case MMC_BUS_WIDTH_8:
> +		break;
> +	}
> +	return msm_host->clk_rate;
> +}
> +
> +/*
> + * Helper function to parse the exact OPP node
> + * Returns OPP pointer on success else NULL on error
> + */
> +static struct dev_pm_opp
> +		*sdhci_msm_find_opp_for_freq(struct sdhci_msm_host *msm_host,
> +							unsigned long bw)
> +{
> +	struct dev_pm_opp *opp;
> +	struct sdhci_host *host = mmc_priv(msm_host->mmc);
> +	unsigned int freq = bw;
> +	struct device *dev = &msm_host->pdev->dev;
> +
> +
> +	if (!freq)
> +		opp = dev_pm_opp_find_peak_bw_floor(dev, &freq);
> +	else
> +		opp = dev_pm_opp_find_peak_bw_exact(dev, freq, true);
> +
> +	/* Max bandwidth vote */
> +	if (PTR_ERR(opp) == -ERANGE && freq > sdhci_msm_get_max_clock(host))
> +		opp = dev_pm_opp_find_peak_bw_ceil(dev, &bw);
> +
> +	if (IS_ERR(opp)) {
> +		dev_err(dev, "Failed to find OPP for freq:%u err:%ld\n",
> +				freq, PTR_ERR(opp));
> +		return NULL;
> +	}
> +	return opp;
> +}
> +
> +/*
> + * This function sets the interconnect bus bandwidth
> + * vote based on bw (bandwidth) argument.
> + */
> +#define BUS_INTERCONNECT_PATHS 2 /* 1. sdhc -> ddr 2. cpu -> sdhc */
> +static void sdhci_msm_bus_set_vote(struct sdhci_host *host,
> +						unsigned int bw)
> +{
> +	int i, ddr_rc, cpu_rc;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct sdhci_msm_bus_vote_data *vote_data = msm_host->bus_vote_data;
> +	struct device *dev = &msm_host->pdev->dev;
> +	struct dev_pm_opp *opp;
> +	unsigned long freq = bw;
> +	unsigned long peak_bw[BUS_INTERCONNECT_PATHS] = {0};
> +	unsigned long avg_bw[BUS_INTERCONNECT_PATHS] = {0};
> +
> +	if (bw == vote_data->curr_freq)
> +		return;
> +
> +	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
> +		opp = sdhci_msm_find_opp_for_freq(msm_host, freq);
> +		if (opp) {
> +			avg_bw[i] = dev_pm_opp_get_bw(opp, &peak_bw[i]);
> +			freq += 1; /* Next bandwidth vote */
> +			dev_pm_opp_put(opp);
> +		}
> +	}
> +	pr_debug("%s: freq:%d sdhc_to_ddr avg_bw:%lu peak_bw:%lu cpu_to_sdhc avg_bw:%lu peak_bw:%lu\n",
> +			mmc_hostname(host->mmc), bw, avg_bw[0], peak_bw[0],
> +				avg_bw[1], peak_bw[1]);
> +	ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, peak_bw[0]);
> +	cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, peak_bw[1]);
> +	if (ddr_rc || cpu_rc) {
> +		dev_err(dev, "icc_set() failed ddr_rc:%d cpu_rc:%d\n",
> +							ddr_rc, cpu_rc);
> +		return;
> +	}

Do you necessarily want to set the bandwidth of the CPU to SDHC path, if
setting the bandwidth for the SDHC to DDR path failed? If not I'd suggest
to get rid of this double error handling with 'ddr_rc' and 'cpu_rc' and
handle each error individually.

> +	vote_data->curr_freq = bw;
> +}
> +
> +/*
> + * Helper function to register for OPP and interconnect
> + * frameworks.
> + */
> +static struct sdhci_msm_bus_vote_data
> +		*sdhci_msm_bus_register(struct sdhci_msm_host *host,
> +				struct platform_device *pdev)
> +{
> +	struct sdhci_msm_bus_vote_data *vote_data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
> +	if (!vote_data)
> +		return NULL;

Even though the interconnects are optional I think we want to propagate an
out of memory error, i.e. you probably want to return -ENOMEM here.

Also the allocated 'vote_data' will not be used if the ICC configuration
does not exist or is invalid. I think Bjorn suggested to do the allocation
after getting the ICC paths and error handling, when you know the struct
is actually used.

> +
> +	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
> +	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
> +	if (!vote_data->sdhc_to_ddr || !vote_data->cpu_to_sdhc) {
> +		dev_info(&pdev->dev, "ICC DT property is missing. skip vote !!\n");
> +		return NULL;

This combined handling masks possible misconfigurations/errors, where one
ICC path is specified (correctly or not), and the other not. Also the log
message would be confusing in this case, since the ICC property exists.

Preferably NULL would only be returned if neither of the ICC paths is
specified. The message could be something like "no interconnect configuration".
This is still not entirely correct, since there could be a configuration, just
not with the expected interconnect names.

> +	} else if (IS_ERR(vote_data->sdhc_to_ddr) ||
> +			IS_ERR(vote_data->cpu_to_sdhc)) {
> +		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
> +				PTR_ERR(vote_data->sdhc_to_ddr), "sdhc-ddr");

What is the point of using '%s' here?

> +		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
> +				PTR_ERR(vote_data->sdhc_to_ddr), "cpu-sdhc");

ditto

> +
> +		return IS_ERR(vote_data->sdhc_to_ddr) ?
> +			ERR_CAST(vote_data->sdhc_to_ddr) :
> +			ERR_CAST(vote_data->cpu_to_sdhc);
> +	}

The above could print an error message for an ICC path that doesn't
have a problem. Also we don't want to yell in case of deferred probing.

Something like this could be a possible alternative:

     	struct icc_path *icc_paths[BUS_INTERCONNECT_PATHS];
	const char *path_names[] = {
		"sdhc-ddr",
		"cpu-sdhc"
	};

	// use loop?
	icc_paths[0] = of_icc_get(&pdev->dev, "sdhc-ddr");
	icc_paths[1] = of_icc_get(&pdev->dev, "cpu-sdhc");

	if (!icc_paths[0] && !icc_paths[1]) {
		dev_info(...);
		return NULL;
	}

	for (i = 0; i <  BUS_INTERCONNECT_PATHS; i++) {
	       	int err = 0;

		if (!icc_paths[i]) {
			dev_err(pdev->dev. "interconnect path '%s' is not configured\n", path_names[i]);
			err = -EINVAL;
			goto handle_err;
		}

		if (IS_ERR(icc_paths[i]) {
			err = PTR_ERR(icc_paths[i]);

			if (err != -EPROBE_DEFER)
				dev_err(pdev->dev. "interconnect path '%s' is invalid: %d\n", path_names[i], err);
		}

handle_err:
		if (err) {
			int other = (i == 0)? 1 : 0;

			if (!IS_ERR_OR_NULL(icc_paths[other]))
				icc_put(icc_paths[other]);

			return err;
		}
	}

> +	ret = dev_pm_opp_of_add_table(dev);
> +	if (ret) {
> +		if (ret == -ENODEV || ret == -ENODATA)
> +			dev_err(dev, "OPP dt properties missing:%d\n", ret);
> +		else
> +			dev_err(dev, "OPP registration failed:%d\n", ret);
> +		return ERR_PTR(ret);
> +	}

Now that we know that there are no errors we can allocate 'vote_data' and
initialize it.

> +	return vote_data;
> +}
> +
> +static void sdhci_msm_bus_unregister(struct device *dev,
> +				struct sdhci_msm_host *host)
> +{
> +	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
> +
> +	if (!vote_data ||
> +		IS_ERR(vote_data->sdhc_to_ddr) ||
> +		IS_ERR(vote_data->cpu_to_sdhc))

The check for errors in the ICC paths is not necessary. When an error is
encountered sdhci_msm_bus_register() returns an error, not a struct.

> +		return;
> +
> +	icc_put(vote_data->sdhc_to_ddr);
> +	icc_put(vote_data->cpu_to_sdhc);
> +}
> +
> +static void sdhci_msm_bus_voting(struct sdhci_host *host, bool enable)
> +{
> +	struct mmc_ios *ios = &host->mmc->ios;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	unsigned int bw;
> +
> +	if (!msm_host->bus_vote_data ||
> +		IS_ERR(msm_host->bus_vote_data))

no need to check for errors, _probe() is aborted in case of errors.

Thanks

Matthias
