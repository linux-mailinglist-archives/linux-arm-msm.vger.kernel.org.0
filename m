Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D1183AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 21:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgCLUtk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 16:49:40 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37498 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgCLUtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 16:49:40 -0400
Received: by mail-pj1-f67.google.com with SMTP id ca13so3149416pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8tdcN4NnkMfqmyh0gTGOOia172RsAybBpYZntXd7Nqs=;
        b=ga8j1IurUn1zgapYDjTowi9NOYHdzZj9RRmRWOE7h2G2c2CRKoHTXvBqyZh7LdiPKb
         GHmulodPZSbKh3RZU2Tg352u4qZgLHlewGIVPz1LcAMjeUZUjNhZBRH53pa3QNDdZxO1
         1uWchComPc/4QwdOjNoIO9PbIYVKYFLPTZyEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8tdcN4NnkMfqmyh0gTGOOia172RsAybBpYZntXd7Nqs=;
        b=ZwnjkETvmbvu6qXbTxFKSNKKYBniZzCdEnoocYSASGEX7hrM64AErkvM3P1Aa4dpeQ
         HsER6cyp1L6X4WL/cwasasC8j5Ww1QKdUmyCc3l68oqCiAwUbsMJFVVvfEJHJyjEfu0j
         7wgI4ohi9GfGuqttBYSbJoxW3dl62eesj+Xr0VcHCGx1bOBKthnZG0pzLC9gBtqUfUR2
         NanMi1k7VuN27sezPlYe25HlU8cORSHbsNOsWoiOSwsm3c1plzdWVmCNS3WAr04DCyit
         UmWGGZX0ADA5IVTGL7y6EY6PCScIZpsHLwzWU6VTeFXw4R6Fji5+fTfENP8uOXqhyGYp
         5eXw==
X-Gm-Message-State: ANhLgQ3ayZbzSRxwr2IUJH771pcwiL+FjgiPzJihy5YNSbBj4clEMfdZ
        8xbqsHZcl6W478B1GxdRhgE1Fw==
X-Google-Smtp-Source: ADFU+vsiPPlt1e1Q1qAOAXpv2voOnmVVwkqPBW1KQV9rDf5At6Gzha6L+H+5e9eu/8Ey6tjYcAKDHA==
X-Received: by 2002:a17:902:6504:: with SMTP id b4mr9569558plk.291.1584046177701;
        Thu, 12 Mar 2020 13:49:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b2sm2179084pjc.6.2020.03.12.13.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 13:49:36 -0700 (PDT)
Date:   Thu, 12 Mar 2020 13:49:35 -0700
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
Subject: Re: [RFC v5 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth
 scaling support
Message-ID: <20200312204935.GF144492@google.com>
References: <1583992911-12001-1-git-send-email-ppvk@codeaurora.org>
 <1583992911-12001-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1583992911-12001-2-git-send-email-ppvk@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pradeep,

On Thu, Mar 12, 2020 at 11:31:50AM +0530, Pradeep P V K wrote:
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
> RFC v4 -> v5:
> - Rewrote the icc interconnect get handlers and its error handling
>   and allocated vote data after handling all icc get handler errors.
> - Removed explicit error check on ICC handlers.
> - Addressed minor code style comments.
> 
>  drivers/mmc/host/sdhci-msm.c | 231 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 227 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 09ff731..5fe8fad 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
>
> ...
>
> +/*
> + * This function sets the interconnect bus bandwidth
> + * vote based on bw (bandwidth) argument.
> + */
> +#define BUS_INTERCONNECT_PATHS 2 /* 1. sdhc -> ddr 2. cpu -> sdhc */
> +static void sdhci_msm_bus_set_vote(struct sdhci_host *host,
> +						unsigned int bw)
> +{
> +	int i, err;
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
> +	err = icc_set_bw(vote_data->sdhc_to_ddr, 0, peak_bw[0]);
> +	if (err) {
> +		dev_err(dev, "icc_set() failed for 'sdhc-ddr' path err:%d\n",
> +							err);

nit: the alignment is odd, either align with 'dev' or a tab after 'dev_err'

> +		return;
> +	}
> +	err = icc_set_bw(vote_data->cpu_to_sdhc, 0, peak_bw[1]);
> +	if (err) {
> +		dev_err(dev, "icc_set() failed for 'cpu-sdhc' path err:%d\n",
> +							err);

ditto

> +		return;
> +	}
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
> +	int ret, i, err;

nit: you can get rid of 'ret' and use 'err' instead.

> +	struct icc_path *icc_paths[BUS_INTERCONNECT_PATHS];
> +	const char *path_names[] = {
> +		"sdhc-ddr",
> +		"cpu-sdhc",
> +	};
> +
> +	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++)
> +		icc_paths[i] = of_icc_get(&pdev->dev, path_names[i]);
> +
> +	if (!icc_paths[0] && !icc_paths[1]) {
> +		dev_info(&pdev->dev, "ICC DT property is missing.Skip vote!!\n");
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
> +		if (!icc_paths[i]) {
> +			dev_err(&pdev->dev, "interconnect path '%s' is not configured\n",
> +					path_names[i]);
> +			err = -EINVAL;
> +			goto handle_err;
> +		}
> +		if (IS_ERR(icc_paths[i])) {
> +			err = PTR_ERR(icc_paths[i]);
> +
> +			if (err != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "interconnect path '%s' is invalid:%d\n",
> +					path_names[i], err);
> +			goto handle_err;
> +		}
> +	}
> +
> +	ret = dev_pm_opp_of_add_table(dev);
> +	if (ret) {
> +		if (ret == -ENODEV || ret == -ENODATA)
> +			dev_err(dev, "OPP dt properties missing:%d\n", ret);
> +		else
> +			dev_err(dev, "OPP registration failed:%d\n", ret);

need to call icc_put() for the two paths?

> +		return ERR_PTR(ret);
> +	}
> +
> +	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
> +	if (!vote_data)

ditto

probably you want to do this with a jump to an error handler below.

> +		return ERR_PTR(-ENOMEM);
> +
> +	vote_data->sdhc_to_ddr = icc_paths[0];
> +	vote_data->cpu_to_sdhc = icc_paths[1];
> +	return vote_data;

nit: add empty line

> +handle_err:
> +	if (err) {
> +		int other = (i == 0) ? 1 : 0;
> +
> +		if (!IS_ERR_OR_NULL(icc_paths[other]))
> +			icc_put(icc_paths[other]);
> +	}

doing this at the end (as opposed to my suggestion from
https://patchwork.kernel.org/patch/11388409/#23165321) has the advantage of
keeping the above loop cleaner from error handling cruft, on the downside it
is probably easier to understand right away in the context of the loop. I
guess you can do it either way.

It might get a bit more messy if you also handle the case where both paths are
valid. If that gets too involved I'd suggest to hnadle the above case inside
the loop.

> +	return ERR_PTR(err);
> +}
> +
> +static void sdhci_msm_bus_unregister(struct device *dev,
> +				struct sdhci_msm_host *host)
> +{
> +	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
> +
> +	if (IS_ERR_OR_NULL(vote_data))

I think 'if (!vote_data)' would be sufficient, since _probe() aborts in
case of an error.

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
> +	if (IS_ERR_OR_NULL(msm_host->bus_vote_data))
> +		return;

ditto
