Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91EA5162552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 12:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgBRLLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 06:11:35 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:19224 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726327AbgBRLLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 06:11:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582024294; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+ZhXrCGiroKxS0y2NbAXy2Q56OPm0h5198cey44uu/g=;
 b=kGXHZtoJdxdMbpLqBURM6kCGA+2x/52tOYho6HgWziW3OyAAHb9pclO3pV0fbwFtTB9V8aSi
 e090KVRzWANzr1cFeNDio6ftM+DV2qFPPjacghF0vl/UNOtN0htoiUpgHo3I8wt52zN4wEXJ
 blkvJm37jo/wYzMo6v+ZJpvBOfA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4bc665.7fb70e70d570-smtp-out-n03;
 Tue, 18 Feb 2020 11:11:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7BFDC4479C; Tue, 18 Feb 2020 11:11:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BD43C43383;
        Tue, 18 Feb 2020 11:11:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Feb 2020 16:41:31 +0530
From:   ppvk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
In-Reply-To: <20200208233910.GB955802@ripper>
References: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
 <1581086695-16645-2-git-send-email-ppvk@codeaurora.org>
 <20200208233910.GB955802@ripper>
Message-ID: <48e0f11b7b8e278eba1004c1001706ae@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Thanks for the review !

On 2020-02-09 05:09, Bjorn Andersson wrote:
> On Fri 07 Feb 06:44 PST 2020, Pradeep P V K wrote:
> 
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
> 
> Write out the subject of these two patches, rather than stating that
> it's based on one RFC and some PATCH version 6. Or just state that it's
> based on work by Georgi and Saravana.
> 
Sure. i will update this in my next patch set.

>> 
>> change from RFC v2 -> v3 changes:
>> - Modified interconnect bandwidth support using OPP framework.
>> - Addressed review comments on v2.
> 
> Move the changelog below the --- line
> 
ok.

>> 
>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> 
> You should read these as the history of how this patch reached LKML and
> can use Co-developed-by to indicate that several people was part of a
> single step.
> 
> So if you're both co-author and the one sending it to LKML then you
> should have 4 Co-developed-by tags here.
> 
sure, i will follow this from my patch series.

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
> 
> Move the { to the empty line.
> 
ok.
>> +	struct icc_path *sdhc_to_ddr;
>> +	struct icc_path *cpu_to_sdhc;
>> +	bool skip_bus_bw_voting;
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
>> +
>> +	if (ios->bus_width == MMC_BUS_WIDTH_4)
>> +		bw /= 2;
>> +	else if (ios->bus_width == MMC_BUS_WIDTH_1)
>> +		bw /= 8;
>> +
>> +	return bw;
> 
> 
> switch (ios->bus_width) {
> case MMC_BUS_WIDTH_1:
> 	return msm_host->clk_rate / 8;
> case MMC_BUS_WIDTH_4:
> 	return msm_host->clk_rate / 2;
> case MMC_BUS_WIDTH_8:
> 	return msm_host->clk_rate;
> }
> 
ok. i will do this in my next patch.

>> +}
>> +
>> +/*
>> + * Helper function to parse the exact OPP node
>> + * Returns OPP pointer on success else NULL on error
>> + */
>> +static struct dev_pm_opp *find_opp_for_freq(struct sdhci_msm_host 
>> *msm_host,
> 
> A function with this name doesn't belong in the sdhci-msm driver.
> 
ok. i will update the function name accordingly.

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
>> +	int ddr_rc = 0, cpu_rc = 0;
>> +
>> +	if (!msm_host->bus_vote_data->sdhc_to_ddr ||
>> +			!msm_host->bus_vote_data->cpu_to_sdhc)
> 
> Why not include this check in the calling code, which already checks 
> for
> skip_bus_bw_voting?
> 
This is actually redundant. This is not required here again. 
skip_bus_bw_voting will set when
the handlers are NULL. so i will remove this in my next patch set.

>> +		return;
>> +
>> +	if (bw != vote_data->curr_freq) {
> 
> if (bw == vote_data->curr_freq)
> 	return;
> 
> Will save you an indentation level in the rest of the function.
> 
sure. i will make the change accordingly.

>> +		for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
>> +			opp = find_opp_for_freq(msm_host, freq);
>> +			if (opp) {
>> +				ab[i] =	dev_pm_opp_get_bw(opp, &ib[i]);
>> +				freq += 1; /* Next Band width vote */
> 
> Why do you request bw for sdhc-ddr and then bw+1 for cpu-sdhc?
> 
for sdhci-msm, the OPP's for path sdhc-ddr and cpu-sdhc are same, to 
avoid
OPP errors and warnings, i just added +1 for cpu-sdhc to differentiate 
between
sdhc-ddr and cpu-sdhc OPPS. This needs to be taken care while adding 
opp's in dt
for cpu-sdhc path.


>> +				dev_pm_opp_put(opp);
>> +			}
>> +		}
>> +		pr_debug("%s: freq:%d sdhc_to_ddr ab:%lu ib:%lu cpu_to_sdhc ab:%lu 
>> ib:%lu\n",
>> +				mmc_hostname(host->mmc), bw, ab[0], ib[0],
>> +				ab[1], ib[1]);
> 
> You probably have compiler warnings here as not all code paths will get
> here with ib and ab initialized.
> 
True. i will make the change accordingly.

>> +		ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, ib[0]);
>> +		cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, ib[1]);
>> +		if (ddr_rc || cpu_rc) {
>> +			pr_err("%s: icc_set() failed ddr_rc_err:%d cpu_rc_err:%d\n",
> 
> dev_err()
> 
ok.

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
> 
> Just pass the platform_device instead of passing &pdev->dev and then
> container_of() it directly.
> 
This function is not required here. i will move the necessary code to 
the caller fn().
to look the code more simpler. i will make the changes accordingly in my 
next patch series.

>> +	struct sdhci_msm_bus_vote_data *vote_data = NULL;
>> +	int ret = 0;
> 
> No need to initialize either vote_data or ret, given that they are both
> written before read below.
> 
same as above.

>> +
>> +	if (!pdev) {
> 
> How could this happen?
> 
same as above.
>> +		dev_err(dev, "Null platform device!\n");
>> +		return NULL;
>> +	}
>> +	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
>> +	if (!vote_data)
>> +		return vote_data;
>> +
>> +	ret = dev_pm_opp_of_add_table(dev);
>> +	if (ret) {
>> +		if (ret == -ENODEV || ret == -ENODATA) {
>> +			dev_dbg(dev, "OPP not found. Skip bus voting!!:%d\n",
>> +					ret);
>> +			vote_data->skip_bus_bw_voting = true;
>> +		} else {
>> +			dev_dbg(dev, "OPP regestration failed:%d\n", ret);
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	return vote_data;
>> +err:
>> +	devm_kfree(dev, vote_data);
>> +	vote_data = NULL;
> 
> This is a local variable, no need to clear it.
> 
same as above.
>> +	return vote_data;
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
>> +		host->bus_vote_data = NULL;
>> +		return -EINVAL;
>> +	}
>> +	host->bus_vote_data = vote_data;
>> +
>> +	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
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
>> +	}
>> +	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
>> +	if (!vote_data->cpu_to_sdhc) {
> 
> Afaict there's no reason to hold onto sdhc_to_ddr or vote_data itself 
> if
> this happens.
> 
> I think things would be cleaner if you make this function return the
> vote_data for success, NULL if the information was omitted or ERR_PTR()
> in case invalid data was given.
> 
> Assign this in the caller, check for IS_ERR() and in the places where
> you want to know if you are doing bus voting or not you can just check
> for host->bus_vote_data - no need to check sdhc_to_ddr, cpu_to_sdhc and
> skip_bus_bw_voting individually..
> 
> 
> And given that it's an both-or-nothing this function would be cleaner 
> if
> you of_icc_get() both paths, then do error handling - and then follow 
> up
> with the introduction of devm and bulk operations to the icc API.
> 
Agree with your suggestions, will make this change in my next patch set.
>> +		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
>> +					"cpu_to_sdhc");
>> +		return -ENOENT;
>> +	} else if (IS_ERR(vote_data->cpu_to_sdhc)) {
>> +		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
>> +				PTR_ERR(vote_data->cpu_to_sdhc), "cpu-sdhc");
>> +		ret = PTR_ERR(vote_data->cpu_to_sdhc);
>> +		vote_data->cpu_to_sdhc = NULL;
>> +		return ret;
>> +	}
>> +	return ret;
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
> 
> This is unused.
> 
ok. i will remove.
>> +
>> +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
> 
> Split this in an enable and a disable
> 
Why to split into two functions, most of the code is same and would be 
simpler
to use with the same name for both enable and disable.
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
> 
> Regards,
> Bjorn
