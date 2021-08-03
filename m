Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064A53DE841
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 10:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhHCIXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 04:23:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:51748 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234384AbhHCIXH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 04:23:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200796417"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="200796417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 01:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="667099956"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2021 01:22:53 -0700
Subject: Re: [PATCH V2 1/2] mmc: sdhci: Introduce max_timeout_count variable
 in sdhci_host
To:     Sarthak Garg <sartgarg@codeaurora.org>, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1626444182-2187-3-git-send-email-sartgarg@codeaurora.org>
 <1627534001-17256-1-git-send-email-sartgarg@codeaurora.org>
 <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <683d3e6e-34b3-03f7-0773-beed66dfce40@intel.com>
Date:   Tue, 3 Aug 2021 11:23:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/07/21 7:46 am, Sarthak Garg wrote:
> Introduce max_timeout_count variable in the sdhci_host structure
> and use in timeout calculation. By default its set to 0xE
> (max timeout register value as per SDHC spec). But at the same time
> vendors drivers can update it if they support different max timeout
> register value than 0xE.

Looks fine.  A couple of minor comments below.

> 
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci.c | 15 +++++++++------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index aba6e10..2debda3 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -939,16 +939,16 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>  	 * timeout value.
>  	 */
>  	if (host->quirks & SDHCI_QUIRK_BROKEN_TIMEOUT_VAL)
> -		return 0xE;
> +		return host->max_timeout_count;

Please adjust the comment above this that also refers to 0xE
e.g. "skip the check and use 0xE" -> "skip the check and use the maximum"

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
> @@ -3940,6 +3940,9 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
>  	 */
>  	host->adma_table_cnt = SDHCI_MAX_SEGS * 2 + 1;
>  
> +	if (!host->max_timeout_count)

'host' has just been (zero) allocated as part of 'mmc', so the 'if' is redundant here.

> +		host->max_timeout_count = 0xE;
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

