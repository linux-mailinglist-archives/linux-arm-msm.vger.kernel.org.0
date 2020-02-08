Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8B156827
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 00:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgBHXj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Feb 2020 18:39:59 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34748 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBHXj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Feb 2020 18:39:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id i6so1732448pfc.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2020 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Eg3TnBpMTKud4CeCJnXphyKgaQ/soJJY9sibRPamW+Y=;
        b=rQvLk6FWWDJr5ggIvQr0AOnP9cYuYzVrFhuUBYnZbmijyCS7zMXEOA7EFrezRBDa+8
         Wy6jXjhFWOaoMRHNN6Dw9MkpzdBlCoMvK28QM9UeAIQ91tUjT3PEw2ozcE2MJrdrkLDQ
         2vINA6yg+Qov+ursDE88yAb8VRU3QNPMUTbd9yqP86nGS1yndijPcb3EN/aA7F2eTBaZ
         B7suM3lZGBQb+9tcGXltqwz6luUunOlA3DlP4pWglbvfxinEuYzUI99PuI/CO2r4rXEf
         0aDEXv5+k2mslPQuVrT3Equ6Qwrus0r478MtBE/klr82AzU3wut+zq3wq/DMoo1I4p09
         uvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Eg3TnBpMTKud4CeCJnXphyKgaQ/soJJY9sibRPamW+Y=;
        b=mVj7bfABcgIWpg7ZrD/pGnles4+TJ0p3fSuD6avSAMiCab/2P1uJz/Dfjtwvc1BZI9
         GIwU8nA21PLtC4wrWxKh0vzjJDhu03bs22kcbXahkpbidQ3TdS4UEAPfZji+isSOP0HV
         a0joKKhdYtRO4a0LVBdFL9ObDn+tTdOVdE32gvgIicrWdeYc3w/0aq3lg4l5Qbmz8RzO
         sxxBZ+WhSw3JbilvxXyQRW64b6HjpV6TCGTwdIquQVhN6/RdBJOpN8ejtYJowHPoUBjK
         ofe2xK8GHi6JdF2OLpnn4XEi0AOioKukkLGB+ze4sNY3jSJvc+MKvEPbhSASAXBpkv4g
         gH9A==
X-Gm-Message-State: APjAAAX2x4OkgR/B+cOLffhG6hTLDHHY44rONZ4mwTS254w2K8ofbZgL
        yRX/TMcsQrng4EsFmGdK4Bkjog==
X-Google-Smtp-Source: APXvYqy90j0qW6DjVaLgMNcPubEJw+8g0IY4vEKi2QX2Qb6TzOOtfSbusMfL5z2ZsNLag+Gbp6HiGQ==
X-Received: by 2002:a63:454a:: with SMTP id u10mr7059975pgk.248.1581205197761;
        Sat, 08 Feb 2020 15:39:57 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n2sm7636015pfq.50.2020.02.08.15.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 15:39:56 -0800 (PST)
Date:   Sat, 8 Feb 2020 15:39:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-mmc-owner@vger.kernel.org, mka@chromium.org,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: Re: [RFC v3 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth
 scaling support
Message-ID: <20200208233910.GB955802@ripper>
References: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
 <1581086695-16645-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581086695-16645-2-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 07 Feb 06:44 PST 2020, Pradeep P V K wrote:

> Add interconnect bandwidths for SDHC driver using OPP framework that
> is required by SDHC driver based on the clock frequency and bus width
> of the card. Otherwise, the system clocks may run at minimum clock
> speed and thus affecting the performance.
> 
> This change is based on Georgi Djakov [RFC]
> (https://lkml.org/lkml/2018/10/11/499) and
> 
> Saravana Kannan [PATCH v6]
> (https://lkml.org/lkml/2019/12/6/740)

Write out the subject of these two patches, rather than stating that
it's based on one RFC and some PATCH version 6. Or just state that it's
based on work by Georgi and Saravana.

> 
> change from RFC v2 -> v3 changes:
> - Modified interconnect bandwidth support using OPP framework.
> - Addressed review comments on v2.

Move the changelog below the --- line

> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>

You should read these as the history of how this patch reached LKML and
can use Co-developed-by to indicate that several people was part of a
single step.

So if you're both co-author and the one sending it to LKML then you
should have 4 Co-developed-by tags here.

> ---
>  drivers/mmc/host/sdhci-msm.c | 251 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 247 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 71f29ba..f061cd8 100644
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
> @@ -229,6 +231,14 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +struct sdhci_msm_bus_vote_data {
> +

Move the { to the empty line.

> +	struct icc_path *sdhc_to_ddr;
> +	struct icc_path *cpu_to_sdhc;
> +	bool skip_bus_bw_voting;
> +	u32 curr_freq;
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -255,8 +265,11 @@ struct sdhci_msm_host {
>  	bool use_cdr;
>  	u32 transfer_mode;
>  	bool updated_ddr_cfg;
> +	struct sdhci_msm_bus_vote_data *bus_vote_data;
>  };
>  
> +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable);
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1564,6 +1577,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  
>  	msm_set_clock_rate_for_bus_mode(host, clock);
>  out:
> +	sdhci_msm_bus_voting(host, !!clock);
>  	__sdhci_msm_set_clock(host, clock);
>  }
>  
> @@ -1685,6 +1699,219 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>  	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>  }
>  
> +/*
> + * Returns required bandwidth in Bytes per Sec
> + */
> +static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
> +					struct mmc_ios *ios)
> +{
> +	unsigned long bw;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	bw = msm_host->clk_rate;
> +
> +	if (ios->bus_width == MMC_BUS_WIDTH_4)
> +		bw /= 2;
> +	else if (ios->bus_width == MMC_BUS_WIDTH_1)
> +		bw /= 8;
> +
> +	return bw;


switch (ios->bus_width) {
case MMC_BUS_WIDTH_1:
	return msm_host->clk_rate / 8;
case MMC_BUS_WIDTH_4:
	return msm_host->clk_rate / 2;
case MMC_BUS_WIDTH_8:
	return msm_host->clk_rate;
}

> +}
> +
> +/*
> + * Helper function to parse the exact OPP node
> + * Returns OPP pointer on success else NULL on error
> + */
> +static struct dev_pm_opp *find_opp_for_freq(struct sdhci_msm_host *msm_host,

A function with this name doesn't belong in the sdhci-msm driver.

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
> +	/* Max Bandwidth vote */
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
> +	int i;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct sdhci_msm_bus_vote_data *vote_data = msm_host->bus_vote_data;
> +	struct dev_pm_opp *opp;
> +	unsigned long freq = bw;
> +	unsigned long ib[BUS_INTERCONNECT_PATHS], ab[BUS_INTERCONNECT_PATHS];
> +	int ddr_rc = 0, cpu_rc = 0;
> +
> +	if (!msm_host->bus_vote_data->sdhc_to_ddr ||
> +			!msm_host->bus_vote_data->cpu_to_sdhc)

Why not include this check in the calling code, which already checks for
skip_bus_bw_voting?

> +		return;
> +
> +	if (bw != vote_data->curr_freq) {

if (bw == vote_data->curr_freq)
	return;

Will save you an indentation level in the rest of the function.

> +		for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
> +			opp = find_opp_for_freq(msm_host, freq);
> +			if (opp) {
> +				ab[i] =	dev_pm_opp_get_bw(opp, &ib[i]);
> +				freq += 1; /* Next Band width vote */

Why do you request bw for sdhc-ddr and then bw+1 for cpu-sdhc?

> +				dev_pm_opp_put(opp);
> +			}
> +		}
> +		pr_debug("%s: freq:%d sdhc_to_ddr ab:%lu ib:%lu cpu_to_sdhc ab:%lu ib:%lu\n",
> +				mmc_hostname(host->mmc), bw, ab[0], ib[0],
> +				ab[1], ib[1]);

You probably have compiler warnings here as not all code paths will get
here with ib and ab initialized.

> +		ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, ib[0]);
> +		cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, ib[1]);
> +		if (ddr_rc || cpu_rc) {
> +			pr_err("%s: icc_set() failed ddr_rc_err:%d cpu_rc_err:%d\n",

dev_err()

> +				mmc_hostname(host->mmc), ddr_rc, cpu_rc);
> +			return;
> +		}
> +		vote_data->curr_freq = bw;
> +	}
> +}
> +
> +/*
> + * This function registers the device to OPP framework and
> + * parses few optional parameters from the device tree node.
> + * Returns NULL bvd pointer on error else a valid bvd pointer.
> + */
> +static struct sdhci_msm_bus_vote_data *sdhci_msm_get_bus_vote_data(struct device
> +				       *dev, struct sdhci_msm_host *host)
> +
> +{
> +	struct platform_device *pdev = to_platform_device(dev);

Just pass the platform_device instead of passing &pdev->dev and then container_of() it directly.

> +	struct sdhci_msm_bus_vote_data *vote_data = NULL;
> +	int ret = 0;

No need to initialize either vote_data or ret, given that they are both
written before read below.

> +
> +	if (!pdev) {

How could this happen?

> +		dev_err(dev, "Null platform device!\n");
> +		return NULL;
> +	}
> +	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
> +	if (!vote_data)
> +		return vote_data;
> +
> +	ret = dev_pm_opp_of_add_table(dev);
> +	if (ret) {
> +		if (ret == -ENODEV || ret == -ENODATA) {
> +			dev_dbg(dev, "OPP not found. Skip bus voting!!:%d\n",
> +					ret);
> +			vote_data->skip_bus_bw_voting = true;
> +		} else {
> +			dev_dbg(dev, "OPP regestration failed:%d\n", ret);
> +			goto err;
> +		}
> +	}
> +
> +	return vote_data;
> +err:
> +	devm_kfree(dev, vote_data);
> +	vote_data = NULL;

This is a local variable, no need to clear it.

> +	return vote_data;
> +}
> +
> +/*
> + * Helper function to register for OPP and interconnect
> + * frameworks.
> + */
> +static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
> +				struct platform_device *pdev)
> +{
> +	struct sdhci_msm_bus_vote_data *vote_data;
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +
> +	vote_data = sdhci_msm_get_bus_vote_data(dev, host);
> +	if (!vote_data) {
> +		dev_dbg(&pdev->dev, "Failed to get bus_scale data\n");
> +		host->bus_vote_data = NULL;
> +		return -EINVAL;
> +	}
> +	host->bus_vote_data = vote_data;
> +
> +	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
> +	if (!vote_data->sdhc_to_ddr) {
> +		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
> +				"sdhc-ddr");
> +		return -ENOENT;
> +	} else if (IS_ERR(vote_data->sdhc_to_ddr) {
> +		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
> +				PTR_ERR(vote_data->sdhc_to_ddr), "sdhc-ddr");
> +		ret = PTR_ERR(vote_data->sdhc_to_ddr);
> +		vote_data->sdhc_to_ddr = NULL;
> +		return ret;
> +	}
> +	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
> +	if (!vote_data->cpu_to_sdhc) {

Afaict there's no reason to hold onto sdhc_to_ddr or vote_data itself if
this happens.

I think things would be cleaner if you make this function return the
vote_data for success, NULL if the information was omitted or ERR_PTR()
in case invalid data was given.

Assign this in the caller, check for IS_ERR() and in the places where
you want to know if you are doing bus voting or not you can just check
for host->bus_vote_data - no need to check sdhc_to_ddr, cpu_to_sdhc and
skip_bus_bw_voting individually..


And given that it's an both-or-nothing this function would be cleaner if
you of_icc_get() both paths, then do error handling - and then follow up
with the introduction of devm and bulk operations to the icc API.

> +		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
> +					"cpu_to_sdhc");
> +		return -ENOENT;
> +	} else if (IS_ERR(vote_data->cpu_to_sdhc)) {
> +		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
> +				PTR_ERR(vote_data->cpu_to_sdhc), "cpu-sdhc");
> +		ret = PTR_ERR(vote_data->cpu_to_sdhc);
> +		vote_data->cpu_to_sdhc = NULL;
> +		return ret;
> +	}
> +	return ret;
> +}
> +
> +static void sdhci_msm_bus_unregister(struct device *dev,
> +				struct sdhci_msm_host *host)
> +{
> +	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
> +
> +	if (vote_data->skip_bus_bw_voting ||
> +		!vote_data->sdhc_to_ddr ||
> +		!vote_data->cpu_to_sdhc)
> +		return;
> +
> +	icc_put(vote_data->sdhc_to_ddr);
> +	icc_put(vote_data->cpu_to_sdhc);
> +}
> +
> +#define MSM_MMC_BUS_VOTING_DELAY        200 /* msecs */

This is unused.

> +
> +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)

Split this in an enable and a disable 

> +{
> +	struct mmc_ios *ios = &host->mmc->ios;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	unsigned int bw;
> +
> +	if (msm_host->bus_vote_data->skip_bus_bw_voting)
> +		return;
> +
> +	if (enable) {
> +		bw = sdhci_get_bw_required(host, ios);
> +		sdhci_msm_bus_set_vote(host, bw);
> +	} else
> +		sdhci_msm_bus_set_vote(host, 0);
> +}
> +
>  static const struct sdhci_msm_variant_ops mci_var_ops = {
>  	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>  	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,

Regards,
Bjorn
