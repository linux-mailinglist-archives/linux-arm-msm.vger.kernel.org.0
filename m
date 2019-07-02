Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865995C9C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 09:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfGBHJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 03:09:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:37163 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfGBHJ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 03:09:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 00:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; 
   d="scan'208";a="171683707"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.122]) ([10.237.72.122])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2019 00:08:43 -0700
Subject: Re: [PATCH v2] mmc: sdhci-msm: fix mutex while in spinlock
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        agross@kernel.org, ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        khasim.mohammed@linaro.org, vinod.koul@linaro.org
References: <20190701150125.2602-1-jorge.ramirez-ortiz@linaro.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <96f6f560-25fd-f33c-0b0d-eab6b67aa979@intel.com>
Date:   Tue, 2 Jul 2019 10:07:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190701150125.2602-1-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/07/19 6:01 PM, Jorge Ramirez-Ortiz wrote:
> mutexes can sleep and therefore should not be taken while holding a
> spinlock. move clk_get_rate (can sleep) outside the spinlock protected
> region.
> 
> Fixes: 83736352e0ca ("mmc: sdhci-msm: Update DLL reset sequence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 5fc76a1993d0..9cf14b359c14 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -575,11 +575,14 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  	int wait_cnt = 50;
> -	unsigned long flags;
> +	unsigned long flags, xo_clk = 0;
>  	u32 config;
>  	const struct sdhci_msm_offset *msm_offset =
>  					msm_host->offset;
>  
> +	if (msm_host->use_14lpp_dll_reset && !IS_ERR_OR_NULL(msm_host->xo_clk))
> +		xo_clk = clk_get_rate(msm_host->xo_clk);
> +
>  	spin_lock_irqsave(&host->lock, flags);
>  
>  	/*
> @@ -627,10 +630,10 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>  		config &= CORE_FLL_CYCLE_CNT;
>  		if (config)
>  			mclk_freq = DIV_ROUND_CLOSEST_ULL((host->clock * 8),
> -					clk_get_rate(msm_host->xo_clk));
> +					xo_clk);
>  		else
>  			mclk_freq = DIV_ROUND_CLOSEST_ULL((host->clock * 4),
> -					clk_get_rate(msm_host->xo_clk));
> +					xo_clk);
>  
>  		config = readl_relaxed(host->ioaddr +
>  				msm_offset->core_dll_config_2);
> 

