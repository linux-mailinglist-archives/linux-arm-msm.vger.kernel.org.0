Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F801D8FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 08:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgESGGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 02:06:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:64617 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgESGGa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 02:06:30 -0400
IronPort-SDR: BZlag0r54CUUkHZ95LDcdeeXpWopqoYiU98hkO2Skc7hPdwqF/JvNxdIk9TMvS3DqU7XDRqNbV
 RT0ca3jWVMrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 23:06:29 -0700
IronPort-SDR: 0Zq/ts77AzmTnn2r14Z7pySU9ywSyMmjOltrW4304M4U2WFglB2je7SSShrIar6VU9najVe+Kp
 f6OGOsc1h5aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; 
   d="scan'208";a="253269468"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.157]) ([10.237.72.157])
  by fmsmga007.fm.intel.com with ESMTP; 18 May 2020 23:06:27 -0700
Subject: Re: [PATCH V1 3/3] mmc: sdhci: Allow platform controlled voltage
 switching
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1589541535-8523-4-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <480cc8ee-27ae-2538-68d6-c382dbaca6bb@intel.com>
Date:   Tue, 19 May 2020 09:06:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589541535-8523-4-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/20 2:18 pm, Veerabhadrarao Badiganti wrote:
> From: Vijay Viswanath <vviswana@codeaurora.org>
> 
> If vendor platform drivers are controlling whole logic of voltage
> switching, then sdhci driver no need control vqmmc regulator.
> So skip enabling/disable vqmmc from SDHC driver.
> 
> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci.c | 32 +++++++++++++++++++-------------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 1bb6b67..c010823 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4098,6 +4098,7 @@ int sdhci_setup_host(struct sdhci_host *host)
>  	unsigned int override_timeout_clk;
>  	u32 max_clk;
>  	int ret;
> +	bool enable_vqmmc = false;
>  
>  	WARN_ON(host == NULL);
>  	if (host == NULL)
> @@ -4111,9 +4112,12 @@ int sdhci_setup_host(struct sdhci_host *host)
>  	 * the host can take the appropriate action if regulators are not
>  	 * available.
>  	 */
> -	ret = mmc_regulator_get_supply(mmc);
> -	if (ret)
> -		return ret;
> +	if (!mmc->supply.vqmmc) {
> +		ret = mmc_regulator_get_supply(mmc);
> +		if (ret)
> +			return ret;
> +		enable_vqmmc  = true;
> +	}
>  
>  	DBG("Version:   0x%08x | Present:  0x%08x\n",
>  	    sdhci_readw(host, SDHCI_HOST_VERSION),
> @@ -4373,7 +4377,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>  		mmc->caps |= MMC_CAP_NEEDS_POLL;
>  
>  	if (!IS_ERR(mmc->supply.vqmmc)) {
> -		ret = regulator_enable(mmc->supply.vqmmc);
> +		if (enable_vqmmc) {
> +			ret = regulator_enable(mmc->supply.vqmmc);
> +			if (ret) {
> +				pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
> +					mmc_hostname(mmc), ret);
> +				mmc->supply.vqmmc = ERR_PTR(-EINVAL);
> +			}
> +			host->vqmmc_enabled = !ret;
> +		}
>  
>  		/* If vqmmc provides no 1.8V signalling, then there's no UHS */
>  		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 1700000,
> @@ -4386,12 +4398,6 @@ int sdhci_setup_host(struct sdhci_host *host)
>  		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 2700000,
>  						    3600000))
>  			host->flags &= ~SDHCI_SIGNALING_330;
> -
> -		if (ret) {
> -			pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
> -				mmc_hostname(mmc), ret);
> -			mmc->supply.vqmmc = ERR_PTR(-EINVAL);
> -		}
>  	}
>  
>  	if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V) {
> @@ -4625,7 +4631,7 @@ int sdhci_setup_host(struct sdhci_host *host)
>  	return 0;
>  
>  unreg:
> -	if (!IS_ERR(mmc->supply.vqmmc))
> +	if (host->vqmmc_enabled)
>  		regulator_disable(mmc->supply.vqmmc);
>  undma:
>  	if (host->align_buffer)
> @@ -4643,7 +4649,7 @@ void sdhci_cleanup_host(struct sdhci_host *host)
>  {
>  	struct mmc_host *mmc = host->mmc;
>  
> -	if (!IS_ERR(mmc->supply.vqmmc))
> +	if (host->vqmmc_enabled)
>  		regulator_disable(mmc->supply.vqmmc);
>  
>  	if (host->align_buffer)
> @@ -4780,7 +4786,7 @@ void sdhci_remove_host(struct sdhci_host *host, int dead)
>  
>  	destroy_workqueue(host->complete_wq);
>  
> -	if (!IS_ERR(mmc->supply.vqmmc))
> +	if (host->vqmmc_enabled)
>  		regulator_disable(mmc->supply.vqmmc);
>  
>  	if (host->align_buffer)
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 8d2a096..24d27e1 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -570,6 +570,7 @@ struct sdhci_host {
>  	u32 caps1;		/* CAPABILITY_1 */
>  	bool read_caps;		/* Capability flags have been read */
>  
> +	bool vqmmc_enabled;	/* Vqmmc is enabled */

Last time around there was dissatisfaction with this variable name.  Perhaps
change it to sdhci_core_to_disable_vqmmc

>  	unsigned int            ocr_avail_sdio;	/* OCR bit masks */
>  	unsigned int            ocr_avail_sd;
>  	unsigned int            ocr_avail_mmc;
> 

