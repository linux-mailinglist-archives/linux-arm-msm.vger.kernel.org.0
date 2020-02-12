Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB39315ABBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 16:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgBLPK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 10:10:56 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:41318 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728094AbgBLPK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 10:10:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581520254; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ni+JLp8EoEtBddmUoLajZkDu3J/LrxwTVR1Ba58IxTo=;
 b=qX6nsBLgzx5oibfPQuoW2zP4glOgwfFbYKTMpP6YH9zbwndzYm7KK6DkMx6RP96LYcjLSsKX
 060IxE1Xvwo5aIjubuW/zpfKeAPkj11cRbIgXBnFq8mKmoBmg/Gx9oi4yD726q8JeGUTHfk4
 xYoW1IRx+ej50wR4Sv2bkMGi1ZY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e44157a.7ff3e2c16880-smtp-out-n01;
 Wed, 12 Feb 2020 15:10:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29DFCC4479F; Wed, 12 Feb 2020 15:10:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7430DC43383;
        Wed, 12 Feb 2020 15:10:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Feb 2020 20:40:47 +0530
From:   ppvk@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-mmc-owner@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: Re: [RFC v3 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth
 scaling support
In-Reply-To: <20200208004222.GC18972@google.com>
References: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
 <1581086695-16645-2-git-send-email-ppvk@codeaurora.org>
 <20200208004222.GC18972@google.com>
Message-ID: <e25bd753fa1ae3bba6f35fb69f0bb98e@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Thanks for the review !

On 2020-02-08 06:12, Matthias Kaehlcke wrote:
> Hi Pradeep,
> 
> On Fri, Feb 07, 2020 at 08:14:54PM +0530, Pradeep P V K wrote:
>> Add interconnect bandwidths for SDHC driver using OPP framework that
>> is required by SDHC driver based on the clock frequency and bus width
>> of the card. Otherwise, the system clocks may run at minimum clock
>> speed and thus affecting the performance.
>> 
>> This change is based on Georgi Djakov [RFC]
>> (https://lkml.org/lkml/2018/10/11/499) and
>> 
>> Saravana Kannan [PATCH v6]
>> (https://lkml.org/lkml/2019/12/6/740)
>> 
>> change from RFC v2 -> v3 changes:
>> - Modified interconnect bandwidth support using OPP framework.
>> - Addressed review comments on v2.
>> 
>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 251 
>> ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 247 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>> b/drivers/mmc/host/sdhci-msm.c
>> index 71f29ba..f061cd8 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -11,8 +11,10 @@
>>  #include <linux/mmc/mmc.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/slab.h>
>> +#include <linux/interconnect.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/pm_opp.h>
>> 
>>  #include "sdhci-pltfm.h"
>> 
>> @@ -229,6 +231,14 @@ struct sdhci_msm_variant_info {
>>  	const struct sdhci_msm_offset *offset;
>>  };
>> 
>> +struct sdhci_msm_bus_vote_data {
>> +
>> +	struct icc_path *sdhc_to_ddr;
>> +	struct icc_path *cpu_to_sdhc;
>> +	bool skip_bus_bw_voting;
> 
> nit: the name is somewhat redundant given the name of the containing
> struct. 'skip_vote' or 'skip_voting' would be sufficient IMO.
> 
ok. i will address in my next patch series.

>> +	u32 curr_freq;
>> +};
>> +
>>  struct sdhci_msm_host {
>>  	struct platform_device *pdev;
>>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
>> @@ -255,8 +265,11 @@ struct sdhci_msm_host {
>>  	bool use_cdr;
>>  	u32 transfer_mode;
>>  	bool updated_ddr_cfg;
>> +	struct sdhci_msm_bus_vote_data *bus_vote_data;
>>  };
>> 
>> +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 
>> enable);
>> +
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct 
>> sdhci_host *host)
>>  {
>>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -1564,6 +1577,7 @@ static void sdhci_msm_set_clock(struct 
>> sdhci_host *host, unsigned int clock)
>> 
>>  	msm_set_clock_rate_for_bus_mode(host, clock);
>>  out:
>> +	sdhci_msm_bus_voting(host, !!clock);
>>  	__sdhci_msm_set_clock(host, clock);
>>  }
>> 
>> @@ -1685,6 +1699,219 @@ static void 
>> sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>>  	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>>  }
>> 
>> +/*
>> + * Returns required bandwidth in Bytes per Sec
>> + */
>> +static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
>> +					struct mmc_ios *ios)
>> +{
>> +	unsigned long bw;
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +
>> +	bw = msm_host->clk_rate;
> 
> nit: you could declare 'bw' last and do the assignment together with 
> the
> declaration.
> 
ok. I will do it in my next patch.
>> +
>> +	if (ios->bus_width == MMC_BUS_WIDTH_4)
>> +		bw /= 2;
>> +	else if (ios->bus_width == MMC_BUS_WIDTH_1)
>> +		bw /= 8;
>> +
>> +	return bw;
>> +}
>> +
>> +/*
>> + * Helper function to parse the exact OPP node
>> + * Returns OPP pointer on success else NULL on error
>> + */
>> +static struct dev_pm_opp *find_opp_for_freq(struct sdhci_msm_host 
>> *msm_host,
>> +							unsigned long bw)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	struct sdhci_host *host = mmc_priv(msm_host->mmc);
>> +	unsigned int freq = bw;
>> +	struct device *dev = &msm_host->pdev->dev;
>> +
>> +
>> +	if (!freq)
>> +		opp = dev_pm_opp_find_peak_bw_floor(dev, &freq);
>> +	else
>> +		opp = dev_pm_opp_find_peak_bw_exact(dev, freq, true);
>> +
>> +	/* Max Bandwidth vote */
> 
> s/Bandwidth/bandwidth/
> 
ok.

>> +	if (PTR_ERR(opp) == -ERANGE && freq > sdhci_msm_get_max_clock(host))
>> +		opp = dev_pm_opp_find_peak_bw_ceil(dev, &bw);
>> +
>> +	if (IS_ERR(opp)) {
>> +		dev_err(dev, "Failed to find OPP for freq:%u err:%ld\n",
>> +				freq, PTR_ERR(opp));
>> +		return NULL;
>> +	}
>> +	return opp;
>> +}
>> +
>> +/*
>> + * This function sets the interconnect bus bandwidth
>> + * vote based on bw (bandwidth) argument.
>> + */
>> +#define BUS_INTERCONNECT_PATHS 2 /* 1. sdhc -> ddr 2. cpu -> sdhc */
>> +static void sdhci_msm_bus_set_vote(struct sdhci_host *host,
>> +						unsigned int bw)
>> +{
>> +	int i;
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct sdhci_msm_bus_vote_data *vote_data = msm_host->bus_vote_data;
>> +	struct dev_pm_opp *opp;
>> +	unsigned long freq = bw;
>> +	unsigned long ib[BUS_INTERCONNECT_PATHS], 
>> ab[BUS_INTERCONNECT_PATHS];
> 
> the names are not very expressive, how about peak_bw and avg_bw?
> 
hmm, ok. i will modify in my next patch set.

>> +	int ddr_rc = 0, cpu_rc = 0;
> 
> initialization is not needed
> 
ok.
>> +
>> +	if (!msm_host->bus_vote_data->sdhc_to_ddr ||
>> +			!msm_host->bus_vote_data->cpu_to_sdhc)
>> +		return;
>> +
>> +	if (bw != vote_data->curr_freq) {
> 
>   	if (bw == vote_data->curr_freq)
> 		return;
> 
> 
>> +		for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
>> +			opp = find_opp_for_freq(msm_host, freq);
>> +			if (opp) {
>> +				ab[i] =	dev_pm_opp_get_bw(opp, &ib[i]);
>> +				freq += 1; /* Next Band width vote */
> 
> s/Band width/bandwidth/
> 
ok.
>> +				dev_pm_opp_put(opp);
>> +			}
>> +		}
>> +		pr_debug("%s: freq:%d sdhc_to_ddr ab:%lu ib:%lu cpu_to_sdhc ab:%lu 
>> ib:%lu\n",
>> +				mmc_hostname(host->mmc), bw, ab[0], ib[0],
>> +				ab[1], ib[1]);
>> +		ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, ib[0]);
>> +		cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, ib[1]);
>> +		if (ddr_rc || cpu_rc) {
>> +			pr_err("%s: icc_set() failed ddr_rc_err:%d cpu_rc_err:%d\n",
>> +				mmc_hostname(host->mmc), ddr_rc, cpu_rc);
>> +			return;
>> +		}
>> +		vote_data->curr_freq = bw;
>> +	}
>> +}
>> +
>> +/*
>> + * This function registers the device to OPP framework and
>> + * parses few optional parameters from the device tree node.
>> + * Returns NULL bvd pointer on error else a valid bvd pointer.
>> + */
>> +static struct sdhci_msm_bus_vote_data 
>> *sdhci_msm_get_bus_vote_data(struct device
>> +				       *dev, struct sdhci_msm_host *host)
>> +
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct sdhci_msm_bus_vote_data *vote_data = NULL;
>> +	int ret = 0;
> 
> initialization of 'vote_data' and 'ret' is not needed.
> 
ok. i will be removing this function and bring all the required to the 
caller function
that should address all the comments on this function.
>> +
>> +	if (!pdev) {
>> +		dev_err(dev, "Null platform device!\n");
>> +		return NULL;
>> +	}
> 
> It's probably safe to assume that the device is a platform device?
> 
same as above.
>> +	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
>> +	if (!vote_data)
>> +		return vote_data;
> 
>   		return ERR_PTR(-ENOMEM); ?
> 
>> +
>> +	ret = dev_pm_opp_of_add_table(dev);
>> +	if (ret) {
>> +		if (ret == -ENODEV || ret == -ENODATA) {
>> +			dev_dbg(dev, "OPP not found. Skip bus voting!!:%d\n",
>> +					ret);
>> +			vote_data->skip_bus_bw_voting = true;
>> +		} else {
>> +			dev_dbg(dev, "OPP regestration failed:%d\n", ret);
> 
> s/regestration/registration/
> 
ok.
> Depending on the consequences of this failure (e.g. probe() fails) you
> probably want to use dev_warn() or dev_err() here.
> 
same as above.
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	return vote_data;
>> +err:
>> +	devm_kfree(dev, vote_data);
>> +	vote_data = NULL;
> 
> not needed
> 
ok.
>> +	return vote_data;
> 
>   	return NULL;
> 
>> +}
>> +
>> +/*
>> + * Helper function to register for OPP and interconnect
>> + * frameworks.
>> + */
>> +static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
>> +				struct platform_device *pdev)
>> +{
>> +	struct sdhci_msm_bus_vote_data *vote_data;
>> +	struct device *dev = &pdev->dev;
>> +	int ret = 0;
>> +
>> +	vote_data = sdhci_msm_get_bus_vote_data(dev, host);
>> +	if (!vote_data) {
>> +		dev_dbg(&pdev->dev, "Failed to get bus_scale data\n");
> 
> In general I'm not convinced about the use of dev_dbg() in the error
> paths. Maybe there is some signal you can use to determine if there
> should be a valid bus scaling information (e.g. some DT property
> exists). If it exists you proceed with obtaining the necessary
> information and complain loudly if something goes wrong, otherwise you
> don't even try to obtain it and omit the debug logs.
> 
ok. i will modify accordingly, in my next patch series.

>> +		host->bus_vote_data = NULL;
> 
> IIUC struct sdhci_msm_host is zero initialized by sdhci_pltfm_init(),
> hence the assignment to NULL is not needed.
> 
ok.
>> +		return -EINVAL;
> 
> Use the error returned by sdhci_msm_get_bus_vote_data().
> 
ok. i will address in my next patch set.
>> +	}
>> +	host->bus_vote_data = vote_data;
>> +
>> +	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
> 
> This could be the signal I mentioned above. If this entry does not
> exist it is pointless to proceed. You could check this before
> sdhci_msm_get_bus_vote_data() and abort with a dev_info() message in
> case it doesn't exist. If it exists any error afterwards will be
> reported with dev_err().
> 
ok. i will modify the code accordingly in my next patch series.

>> +	if (!vote_data->sdhc_to_ddr) {
>> +		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
>> +				"sdhc-ddr");
>> +		return -ENOENT;
>> +	} else if (IS_ERR(vote_data->sdhc_to_ddr) {
>> +		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
>> +				PTR_ERR(vote_data->sdhc_to_ddr), "sdhc-ddr");
>> +		ret = PTR_ERR(vote_data->sdhc_to_ddr);
>> +		vote_data->sdhc_to_ddr = NULL;
>> +		return ret;
> 
> if there is an error probe() should probably be aborted. If that's the
> case you can replace the above three lines with 'return
> PTR_ERR(vote_data->sdhc_to_ddr);'
> 
True but i added this for more cautious. Any how it is handled as error 
probe().
i will address this in my next patch series.


>> +	}
>> +	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
>> +	if (!vote_data->cpu_to_sdhc) {
>> +		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
>> +					"cpu_to_sdhc");
>> +		return -ENOENT;
>> +	} else if (IS_ERR(vote_data->cpu_to_sdhc)) {
>> +		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
>> +				PTR_ERR(vote_data->cpu_to_sdhc), "cpu-sdhc");
>> +		ret = PTR_ERR(vote_data->cpu_to_sdhc);
>> +		vote_data->cpu_to_sdhc = NULL;
>> +		return ret;
> 
> same comment as above
> 
ok. i will take care this too.

>> +	}
>> +	return ret;
> 
> no error if we get to this point, hence:
> 
> 	return 0;
> 
ok.

>> +}
>> +
>> +static void sdhci_msm_bus_unregister(struct device *dev,
>> +				struct sdhci_msm_host *host)
>> +{
>> +	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
>> +
>> +	if (vote_data->skip_bus_bw_voting ||
>> +		!vote_data->sdhc_to_ddr ||
>> +		!vote_data->cpu_to_sdhc)
>> +		return;
>> +
>> +	icc_put(vote_data->sdhc_to_ddr);
>> +	icc_put(vote_data->cpu_to_sdhc);
>> +}
>> +
>> +#define MSM_MMC_BUS_VOTING_DELAY        200 /* msecs */
>> +
>> +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
> 
> s/u32/bool/ ?
> 
ok.
>> +{
>> +	struct mmc_ios *ios = &host->mmc->ios;
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	unsigned int bw;
>> +
>> +	if (msm_host->bus_vote_data->skip_bus_bw_voting)
>> +		return;
>> +
>> +	if (enable) {
>> +		bw = sdhci_get_bw_required(host, ios);
>> +		sdhci_msm_bus_set_vote(host, bw);
>> +	} else
>> +		sdhci_msm_bus_set_vote(host, 0);
>> +}
>> +
>>  static const struct sdhci_msm_variant_ops mci_var_ops = {
>>  	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>>  	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
>> @@ -1845,11 +2072,20 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  		dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
>>  	}
>> 
>> +	ret = sdhci_msm_bus_register(msm_host, pdev);
>> +	if (ret && msm_host->bus_vote_data &&
>> +			!msm_host->bus_vote_data->skip_bus_bw_voting) {
>> +		dev_err(&pdev->dev, "Bus registration failed (%d)\n", ret);
>> +		goto clk_disable;
>> +	}
>> +
>> +	sdhci_msm_bus_voting(host, 1);
> 
> s/1/true/
> 
ok.
>> +
>>  	if (!msm_host->mci_removed) {
>>  		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
>>  		if (IS_ERR(msm_host->core_mem)) {
>>  			ret = PTR_ERR(msm_host->core_mem);
>> -			goto clk_disable;
>> +			goto bus_unregister;
>>  		}
>>  	}
>> 
>> @@ -1924,7 +2160,7 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  	msm_host->pwr_irq = platform_get_irq_byname(pdev, "pwr_irq");
>>  	if (msm_host->pwr_irq < 0) {
>>  		ret = msm_host->pwr_irq;
>> -		goto clk_disable;
>> +		goto bus_unregister;
>>  	}
>> 
>>  	sdhci_msm_init_pwr_irq_wait(msm_host);
>> @@ -1937,7 +2173,7 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  					dev_name(&pdev->dev), host);
>>  	if (ret) {
>>  		dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
>> -		goto clk_disable;
>> +		goto bus_unregister;
>>  	}
>> 
>>  	pm_runtime_get_noresume(&pdev->dev);
>> @@ -1962,6 +2198,9 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  	pm_runtime_disable(&pdev->dev);
>>  	pm_runtime_set_suspended(&pdev->dev);
>>  	pm_runtime_put_noidle(&pdev->dev);
>> +bus_unregister:
>> +	sdhci_msm_bus_voting(host, 0);
> 
> s/0/false/
> 
ok.
>> +	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
>>  clk_disable:
>>  	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>>  				   msm_host->bulk_clks);
>> @@ -1991,6 +2230,9 @@ static int sdhci_msm_remove(struct 
>> platform_device *pdev)
>>  				   msm_host->bulk_clks);
>>  	if (!IS_ERR(msm_host->bus_clk))
>>  		clk_disable_unprepare(msm_host->bus_clk);
>> +
>> +	sdhci_msm_bus_voting(host, 0);
> 
> s/0/false/
> 
ok.
>> +	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
>>  	sdhci_pltfm_free(pdev);
>>  	return 0;
>>  }
>> @@ -2003,7 +2245,7 @@ static __maybe_unused int 
>> sdhci_msm_runtime_suspend(struct device *dev)
>> 
>>  	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>>  				   msm_host->bulk_clks);
>> -
>> +	sdhci_msm_bus_voting(host, 0);
> 
> s/0/false/
> 
ok.
>>  	return 0;
>>  }
>> 
>> @@ -2025,6 +2267,7 @@ static __maybe_unused int 
>> sdhci_msm_runtime_resume(struct device *dev)
>>  	if (msm_host->restore_dll_config && msm_host->clk_rate)
>>  		return sdhci_msm_restore_sdr_dll_config(host);
>> 
>> +	sdhci_msm_bus_voting(host, 1);
> 
> s/0/true/
> 
ok. i will address all these in my next patch series.
> Thanks
> 
> Matthias
