Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BCE17BFF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 15:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgCFOM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 09:12:28 -0500
Received: from mga17.intel.com ([192.55.52.151]:42912 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgCFOM2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 09:12:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 06:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="320544388"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2020 06:12:25 -0800
Subject: Re: [PATCH V3 2/2] mmc: sdhci-msm: Deactivate CQE during SDHC reset
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
 <1583503724-13943-3-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <fc195864-0826-03e1-0f17-d105b46af933@intel.com>
Date:   Fri, 6 Mar 2020 16:11:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583503724-13943-3-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/03/20 4:08 pm, Veerabhadrarao Badiganti wrote:
> When SDHC gets reset (E.g. in runtime suspend path), CQE also gets
> reset and goes to disable state. But s/w state still points it as CQE
> is in enabled state. Since s/w and h/w states goes out of sync,
> it results in s/w request timeout for subsequent CQE requests.
> 
> To synchronize CQE s/w and h/w state during SDHC reset,
> explicitly deactivate CQE just before SDHC reset.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Changes sicne V2:
> 	- Use cqhci_deactivate() instead of cqhci_disable().
> 	- Deactivate CQCHI just before SDHC reset.
> 
> Changes since V1:
> 	- Disable CQE only when SDHC undergoes s/w reset for all.
> ---
>  drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 53b79ee..09ff731 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1823,6 +1823,13 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>  	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>  }
>  
> +static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
> +{
> +	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
> +		cqhci_deactivate(host->mmc);
> +	sdhci_reset(host, mask);
> +}
> +
>  static const struct sdhci_msm_variant_ops mci_var_ops = {
>  	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>  	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
> @@ -1861,7 +1868,7 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>  MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>  
>  static const struct sdhci_ops sdhci_msm_ops = {
> -	.reset = sdhci_reset,
> +	.reset = sdhci_msm_reset,
>  	.set_clock = sdhci_msm_set_clock,
>  	.get_min_clock = sdhci_msm_get_min_clock,
>  	.get_max_clock = sdhci_msm_get_max_clock,
> 

