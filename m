Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242463E2C88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 16:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239507AbhHFOag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 10:30:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:45009 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232085AbhHFOag (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 10:30:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="299967299"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="299967299"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="504038869"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga004.fm.intel.com with ESMTP; 06 Aug 2021 07:30:18 -0700
Subject: Re: [PATCH V3 1/2] mmc: sdhci: Introduce max_timeout_count variable
 in sdhci_host
To:     Sarthak Garg <sartgarg@codeaurora.org>, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
 <1628232901-30897-1-git-send-email-sartgarg@codeaurora.org>
 <1628232901-30897-2-git-send-email-sartgarg@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d0aec4e6-e803-70c0-74a5-8de51e0ffe7e@intel.com>
Date:   Fri, 6 Aug 2021 17:30:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628232901-30897-2-git-send-email-sartgarg@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/08/21 9:54 am, Sarthak Garg wrote:
> Introduce max_timeout_count variable in the sdhci_host structure
> and use in timeout calculation. By default its set to 0xE
> (max timeout register value as per SDHC spec). But at the same time
> vendors drivers can update it if they support different max timeout
> register value than 0xE.
> 
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 16 +++++++++-------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index aba6e10..613e1ab 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -934,21 +934,21 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>  
>  	/*
>  	 * If the host controller provides us with an incorrect timeout
> -	 * value, just skip the check and use 0xE.  The hardware may take
> +	 * value, just skip the check and use the maximum. The hardware may take
>  	 * longer to time out, but that's much better than having a too-short
>  	 * timeout value.
>  	 */
>  	if (host->quirks & SDHCI_QUIRK_BROKEN_TIMEOUT_VAL)
> -		return 0xE;
> +		return host->max_timeout_count;
>  
>  	/* Unspecified command, asume max */
>  	if (cmd == NULL)
> -		return 0xE;
> +		return host->max_timeout_count;
>  
>  	data = cmd->data;
>  	/* Unspecified timeout, assume max */
>  	if (!data && !cmd->busy_timeout)
> -		return 0xE;
> +		return host->max_timeout_count;
>  
>  	/* timeout in us */
>  	target_timeout = sdhci_target_timeout(host, cmd, data);
> @@ -968,15 +968,15 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>  	while (current_timeout < target_timeout) {
>  		count++;
>  		current_timeout <<= 1;
> -		if (count >= 0xF)
> +		if (count > host->max_timeout_count)
>  			break;
>  	}
>  
> -	if (count >= 0xF) {
> +	if (count > host->max_timeout_count) {
>  		if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
>  			DBG("Too large timeout 0x%x requested for CMD%d!\n",
>  			    count, cmd->opcode);
> -		count = 0xE;
> +		count = host->max_timeout_count;
>  	} else {
>  		*too_big = false;
>  	}
> @@ -3940,6 +3940,8 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
>  	 */
>  	host->adma_table_cnt = SDHCI_MAX_SEGS * 2 + 1;
>  
> +	host->max_timeout_count = 0xE;
> +
>  	return host;
>  }
>  
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 074dc18..e8d04e4 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -517,6 +517,7 @@ struct sdhci_host {
>  
>  	unsigned int max_clk;	/* Max possible freq (MHz) */
>  	unsigned int timeout_clk;	/* Timeout freq (KHz) */
> +	u8 max_timeout_count;	/* Vendor specific max timeout count */
>  	unsigned int clk_mul;	/* Clock Muliplier value */
>  
>  	unsigned int clock;	/* Current clock (MHz) */
> 

