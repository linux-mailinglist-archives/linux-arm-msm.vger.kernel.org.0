Return-Path: <linux-arm-msm+bounces-39191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 853119D95C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4646C283179
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A5C1C4A1E;
	Tue, 26 Nov 2024 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDtwA68v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F5185955;
	Tue, 26 Nov 2024 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732617805; cv=none; b=OF64XjBnI6brpDfedrmgZfNyHf9KGrTiNG9i2HdX9Mw+WRTP1+5jLWSjT5r3Te18UzY59bzEyWxMFzU3WGWXA9lhp5hzhu/8lPUZq5rzRjEcSf8JBbkgp9w9POMLwEkpL+4dQxmgtHtdLTBlmI25pXft7xGL36vqsbLAZ4uokak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732617805; c=relaxed/simple;
	bh=HLvUTAv0P3FwIwDGfZTeBiyPVEhWQwukjLmE50Kv1/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLDD9o+6e6B2K63PgByr80IFiGYy3TEmiDeKEfMthe3tc1SgqO1HMohk9IltFmrayyzrSoRJ0sHTekPiGMM32z5Gq8BakJdrwTSWoEq4Ki/wgDC/ob0xrs1bjlKjWdsMEc8JlBaPs5Rqo8+SB+1LMCcEcVEokoUfnVxdMH4wefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDtwA68v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732617803; x=1764153803;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HLvUTAv0P3FwIwDGfZTeBiyPVEhWQwukjLmE50Kv1/4=;
  b=eDtwA68vA7m9uC31lHhLGXV3aDwE+4eO6Q3UOrQszhGMACUm+pq1mcAm
   9NHM0GSRQC+OaI+WFpQxxvjyFDTryt/iq91lci4A6vTpisi9uexcPP/yp
   5w/cA2/0BhrgZFUckPlAVuOJWasYgjrPgF0y0B0SirUpITAA2PbHbF8qr
   d3Y517IwBo7XnNhDObdshAVXbiZhXFrGTNB44rSv3CI3cbf13Eltcg8Ck
   XsCaFHjNuL+PC6TRTv8yAxf1jx2lMw3mra43/o2Qm9fVA70BMpUKflRUk
   Yk1gICdLPcz2DmXuiXZsfy5QzYtAC+oTspWOAHYvFMDcmfxwRtrIZ35Pm
   A==;
X-CSE-ConnectionGUID: 2WGictS/RdyJKOuKH9tENg==
X-CSE-MsgGUID: Ciu8iq+1SBq63U32PZsOmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="35626373"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="35626373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:43:22 -0800
X-CSE-ConnectionGUID: qYu6erpHQy6nNwlrFgiVuA==
X-CSE-MsgGUID: oS12Wfu1RAK8dyMQge9kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="114838744"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:43:19 -0800
Message-ID: <10836ece-7ea9-47d6-ad0c-25ae36e5051b@intel.com>
Date: Tue, 26 Nov 2024 12:43:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mmc: sdhci-msm: Correctly set the load for the
 regulator
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>, ulf.hansson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: quic_tengfan@quicinc.com, quic_tingweiz@quicinc.com,
 quic_zhgao@quicinc.com
References: <20241122075048.2006894-1-quic_yuanjiey@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241122075048.2006894-1-quic_yuanjiey@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/24 09:50, Yuanjie Yang wrote:
> Qualcomm regulator supports two power supply modes: HPM and LPM.
> Currently, the sdhci-msm.c driver does not set the load to adjust
> the current for eMMC and SD. Therefore, if the regulator set load
> in LPM state, it will lead to the inability to properly initialize
> eMMC and SD.
> 
> Set the correct regulator current for eMMC and SD to ensure that the
> device can work normally even when the regulator is in LPM.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 91 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..f2a2260d54c6 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -134,9 +134,22 @@
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
> +#define MAX_MMC_SD_VMMC_LOAD_UA  max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA)
> +
> +#define MAX_MMC_SD_VQMMC_LOAD_UA max(MMC_VQMMC_MAX_LOAD_UA, SD_VQMMC_MAX_LOAD_UA)
> +
>  #define msm_host_readl(msm_host, host, offset) \
>  	msm_host->var_ops->msm_readl_relaxed(host, offset)
>  
> @@ -147,6 +160,11 @@
>  #define CQHCI_VENDOR_CFG1	0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>  
> +enum {

This could be a named type and used instead of 'int'
e.g.

enum msm_reg_type {

> +	VMMC_REGULATOR,
> +	VQMMC_REGULATOR,
> +};
> +
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
>  	u32 core_mci_data_cnt;
> @@ -1403,11 +1421,70 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
>  	return ret;
>  }
>  
> -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> +static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current, int type)

Then 'int type' could be 'enum msm_reg_type type'

> +{
> +	int load = 0;
> +
> +	/*
> +	 * When eMMC and SD are powered on for the first time, select a higher
> +	 * current value from the corresponding current for eMMC and SD to
> +	 * ensure that the eMMC and SD cards start up properly and complete
> +	 * initialization. After the initialization process is finished, use
> +	 * the corresponding current to set the eMMC and SD to ensure the
> +	 * normal work of the device.
> +	 */
> +
> +	if (!mmc->card)
> +		return max_current;
> +
> +	if (mmc_card_is_removable(mmc) && mmc_card_mmc(mmc->card))

The comment mentions eMMC but here there is 'mmc_card_is_removable()'
whereas eMMC's are not removable.  If this is right it needs some
clarification.

> +		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
> +	else if (mmc_card_sd(mmc->card))
> +		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
> +
> +	return load;
> +}
> +
> +static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
> +				     bool hpm, int max_current, int type)

Again 'int type' could be 'enum msm_reg_type type'

> +{
> +	int ret;
> +	int load = 0;
> +
> +	/*
> +	 * After the initialization process is finished, Once the type of card
> +	 * is determined，only set the corresponding current for SD and eMMC.
> +	 */
> +
> +	if (mmc->card && !(mmc_card_mmc(mmc->card) || mmc_card_sd(mmc->card)))
> +		return 0;
> +
> +	if (hpm)
> +		load = sdhci_msm_get_regulator_load(mmc, max_current, type);
> +
> +	if (type == VMMC_REGULATOR)
> +		ret = regulator_set_load(mmc->supply.vmmc, load);
> +	else
> +		ret = regulator_set_load(mmc->supply.vqmmc, load);
> +	if (ret)
> +		dev_err(mmc_dev(mmc), "%s: set load failed: %d\n",
> +			mmc_hostname(mmc), ret);
> +	return ret;
> +}
> +
> +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> +			      struct mmc_host *mmc, bool hpm)
>  {
> +	int ret;
> +
>  	if (IS_ERR(mmc->supply.vmmc))
>  		return 0;
>  
> +	ret = msm_config_regulator_load(msm_host, mmc, hpm,
> +					MAX_MMC_SD_VMMC_LOAD_UA, VMMC_REGULATOR);
> +	if (ret)
> +		return ret;
> +
>  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
>  }
>  
> @@ -1435,6 +1512,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
>  				goto out;
>  			}
>  		}
> +
> +		ret = msm_config_regulator_load(msm_host, mmc, level,
> +						MAX_MMC_SD_VQMMC_LOAD_UA, VQMMC_REGULATOR);
> +		if (ret < 0) {
> +			dev_err(mmc_dev(mmc), "%s: vqmmc set regulator load failed: %d\n",
> +				mmc_hostname(mmc), ret);
> +			goto out;
> +		}
> +
>  		ret = regulator_enable(mmc->supply.vqmmc);
>  	} else {
>  		ret = regulator_disable(mmc->supply.vqmmc);
> @@ -1642,7 +1728,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  	}
>  
>  	if (pwr_state) {
> -		ret = sdhci_msm_set_vmmc(mmc);
> +		ret = sdhci_msm_set_vmmc(msm_host, mmc,
> +					 pwr_state & REQ_BUS_ON);
>  		if (!ret)
>  			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
>  					pwr_state & REQ_BUS_ON);


