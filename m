Return-Path: <linux-arm-msm+bounces-44521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28011A06F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD1B33A033C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 08:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2AB202F87;
	Thu,  9 Jan 2025 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUGYN/Fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC21A2D;
	Thu,  9 Jan 2025 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409662; cv=none; b=p9mvB3WAslM/oqgrjS7v8aEx07aolxWLXYl3YkyJUXFB1bxajvCdA7mqaCaDEU4QxOiWYwTGA7S+glW9Hm9N2xpNYtG/pbIyXkdF5sC+QhLIv9E1EyuJqm1UCOmG1flb6RoZiozP+YFDVzj+EiVnKTKGssnHGRklmydI5VWUWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409662; c=relaxed/simple;
	bh=eDx+UcjNxJKQporAaWzEp2dBNC8i4r2ZJeVh28695GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkCPzq53bIzzxybGVvr8Yc5YCNTpEXIH0rbf2/p8TicG2mOn94alNwrYY7FTJwa2vNmn+l2pIOeN5HuQIVomU2QdzcFC4kiVT4J1RLPPeuCs7nDcuFSTPuS2rRBaiUQiizhAUUjS09haNwtYHXLjKWoK5dO0i/LyiL509iol3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUGYN/Fn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736409661; x=1767945661;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eDx+UcjNxJKQporAaWzEp2dBNC8i4r2ZJeVh28695GI=;
  b=dUGYN/FnFcyzab7QTKeidTzlRQrQRt1kyuAgjG1gsvUwvO5vAvEOFD60
   VNAVmDh8U9W/Rma7OAp7nOT/yhfa1h3c+MAQs4PmOiiZdz2cT8mN+6ziC
   UUvrv4X6s1QF3IvmcDm7n9N/Y0NsNNVz/ipGimEtAztBtWGpPtfmpMalY
   xm9JYpVDbAoEA4X06ISEP7t3sNcnTnSLD7XxAj2Rl++cD36jzUsfE17FD
   Fs1Uo7RjUtR0UxnEjrYIP270KIWdmf56FXz14znQtgVmazD7euR7u/+TW
   rpRLiwg2XEGTCjt4e64Dl4rZwHLwBljW6itIUB30u3mlCfQcVsChri/rs
   Q==;
X-CSE-ConnectionGUID: YoEPECHKTPq9mMFAW5dNTw==
X-CSE-MsgGUID: zz9P9ZNqTf2A8uuMp8nduQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36885563"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36885563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:01:00 -0800
X-CSE-ConnectionGUID: LnKlZ02kQv6bffwGEkjrNw==
X-CSE-MsgGUID: zLXXEqxaRta/UQvIJ4vh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126625270"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.99.46])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:00:57 -0800
Message-ID: <23b9c309-fe92-4d53-94f7-348bacaa52cb@intel.com>
Date: Thu, 9 Jan 2025 10:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: sdhci-msm: Correctly set the load for the
 regulator
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>, ulf.hansson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Cc: quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com
References: <20241226031845.2574669-1-quic_yuanjiey@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241226031845.2574669-1-quic_yuanjiey@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/12/24 05:18, Yuanjie Yang wrote:
> Qualcomm regulator supports two power supply modes: HPM and LPM.
> Currently, the sdhci-msm.c driver does not set the load to adjust
> the current for eMMC and SD. If the regulator dont't set correct
> load in LPM state, it will lead to the inability to properly
> initialize eMMC and SD.
> 
> Set the correct regulator current for eMMC and SD to ensure that the
> device can work normally even when the regulator is in LPM.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
> Changes in v3:
> - Optimize the code logic and separate code for regulator vmmc and vqmmc
> - Rebase on tag: next-20241217
> - Link to v2: https://lore.kernel.org/all/20241127095029.3918290-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v2:
> - Add enum msm_reg_type to optimize the code
> - Delete redundant emmc type judgment
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/
> 
> ---
>  drivers/mmc/host/sdhci-msm.c | 64 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..22811964ba61 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -134,9 +134,18 @@
>  /* Timeout value to avoid infinite waiting for pwr_irq */
>  #define MSM_PWR_IRQ_TIMEOUT_MS 5000
>  
> +/* Max load for eMMC Vdd supply */
> +#define MMC_VMMC_MAX_LOAD_UA	570000
> +
>  /* Max load for eMMC Vdd-io supply */
>  #define MMC_VQMMC_MAX_LOAD_UA	325000
>  
> +/* Max load for SD Vdd supply */
> +#define SD_VMMC_MAX_LOAD_UA	800000
> +
> +/* Max load for SD Vdd-io supply */
> +#define SD_VQMMC_MAX_LOAD_UA	22000
> +
>  #define msm_host_readl(msm_host, host, offset) \
>  	msm_host->var_ops->msm_readl_relaxed(host, offset)
>  
> @@ -1403,11 +1412,59 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
>  	return ret;
>  }
>  
> -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> +static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
> +{
> +	int load;
> +
> +	if (!mmc->card) {
> +		regulator_set_mode(mmc->supply.vmmc,
> +				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);

Why use regulator_set_mode() in this case but use regulator_set_load()
otherwise?

Previous patches used the maximum 'max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA)'
for the '!mmc->card' bus-on case, so why not:

static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
{
	int load;

	if (!hpm)
		load = 0;
	else if (!mmc->card)
		load = max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA);
	else if (mmc_card_mmc(mmc->card))
		load = MMC_VMMC_MAX_LOAD_UA;
	else if (mmc_card_sd(mmc->card))
		load =  SD_VMMC_MAX_LOAD_UA;
	else
		return;

	regulator_set_load(mmc->supply.vmmc, load);
}

> +		return;
> +	}
> +
> +	if (!mmc_card_mmc(mmc->card) &&
> +	    !mmc_card_sd(mmc->card))
> +		return;
> +
> +	if (mmc_card_mmc(mmc->card))
> +		load = MMC_VMMC_MAX_LOAD_UA;
> +	else if (mmc_card_sd(mmc->card))
> +		load =  SD_VMMC_MAX_LOAD_UA;
> +	load = hpm ? load : 0;
> +
> +	regulator_set_load(mmc->supply.vmmc, load);
> +
> +	return;

'return' at the end of a function returning 'void' is not needed.

> +}
> +
> +static void msm_config_vqmmc_regulator(struct mmc_host *mmc, bool hpm)
> +{
> +	int load;
> +
> +	if (!mmc->card) {
> +		regulator_set_mode(mmc->supply.vqmmc,
> +				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);
> +		return;
> +	}
> +
> +	if (!mmc_card_sd(mmc->card))
> +		return;
> +
> +	load =  hpm ? SD_VQMMC_MAX_LOAD_UA : 0;
> +
> +	regulator_set_load(mmc->supply.vqmmc, load);
> +
> +	return;

'return' at the end of a function returning 'void' is not needed.

> +}
> +
> +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> +			      struct mmc_host *mmc, bool hpm)
>  {
>  	if (IS_ERR(mmc->supply.vmmc))
>  		return 0;
>  
> +	msm_config_vmmc_regulator(mmc, hpm);
> +
>  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
>  }
>  
> @@ -1420,6 +1477,8 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
>  	if (msm_host->vqmmc_enabled == level)
>  		return 0;
>  
> +	msm_config_vqmmc_regulator(mmc, level);
> +
>  	if (level) {
>  		/* Set the IO voltage regulator to default voltage level */
>  		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> @@ -1642,7 +1701,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  	}
>  
>  	if (pwr_state) {
> -		ret = sdhci_msm_set_vmmc(mmc);
> +		ret = sdhci_msm_set_vmmc(msm_host, mmc,
> +					 pwr_state & REQ_BUS_ON);
>  		if (!ret)
>  			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
>  					pwr_state & REQ_BUS_ON);


