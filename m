Return-Path: <linux-arm-msm+bounces-39490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBB9DBBAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 18:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2DD281207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819671B3924;
	Thu, 28 Nov 2024 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxdIZpA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F4B211C;
	Thu, 28 Nov 2024 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732814157; cv=none; b=nI41OW4hxUKUQgrGIYNbWQJGetCzXRv06AzQXMis6CWv7sCgGwrHIM9Kxq1fikAARp6BDBi240w88pdK9S76GIJDCi91QAw+ljKmm84PHJdZt0R8WvpRgNSwgOcG5zRTfhbr8coCbLwmr2es0c4AS7cNWxWXiIeOWiiIYsybmhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732814157; c=relaxed/simple;
	bh=tiZymhVe0D/G2ym8mSpnxGfXK5/9orFgnPuSOUquEq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTnFMThFguabdeaU3I/KHXeN1nELax1idayhE6ka8hOBvPmQVMp1dJQz0lPrros3jWdH9Z7kA8vZG/8f3DUkIXuTZLuwWy0NV1wY9/VO2wxl55SpaU74AL/f6UICuKZ/gb8phOJb3WDx0jg+XR9lJ8aTAd7oaFOuSY2aptSMHrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxdIZpA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224FFC4CECE;
	Thu, 28 Nov 2024 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732814156;
	bh=tiZymhVe0D/G2ym8mSpnxGfXK5/9orFgnPuSOUquEq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxdIZpA3xC3TX7JHy4Bb9kyzc4GuFjRiW8Nx1fA7xBNpx+jGcAyX5L/QKLFwyZj88
	 J+cxCs9kmfc0q+vaCHaqlvJrWtoKp8Xma4lwP1XsPpPcQVDLdAqyAjajWPpQKi49zL
	 DKa0X7ZpbrXhQxF5IMxK0G4bROJdGjN76yXVjMBa8mVGM7xIZIilibJ6eTCZuWIKON
	 DMzp6losctyiLyixVR4Uf0zEU9b1EVyoKKMarErrQ6vrIamW+lGVSsn68bOq+NbGq7
	 zF24aCKgoM06M5tK9dEYdpGhFsxLT2k2eQqHEgqZcSUQ01eihMThD1WNkeBq5LISck
	 Mdmdx72wAl7uA==
Date: Thu, 28 Nov 2024 11:15:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com
Subject: Re: [PATCH v2] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <lza5dbabt2eoipyrbgo47ftpsftcwggb4v6d53lqvsh7w7vp3n@f2ld34a53a2z>
References: <20241127095029.3918290-1-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127095029.3918290-1-quic_yuanjiey@quicinc.com>

On Wed, Nov 27, 2024 at 05:50:29PM +0800, Yuanjie Yang wrote:
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
> Changes in v2:
> - Add enum msm_reg_type to optimize the code

Please re-optimize the code to make it easy to read and understand.

> - Delete redundant emmc type judgment
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/
> 
> ---
>  drivers/mmc/host/sdhci-msm.c | 92 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..fc13ef60ab61 100644
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
> +enum msm_reg_type {
> +	VMMC_REGULATOR,
> +	VQMMC_REGULATOR,
> +};
> +
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
>  	u32 core_mci_data_cnt;
> @@ -1403,11 +1421,71 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
>  	return ret;
>  }
>  
> -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> +static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current,
> +					enum msm_reg_type type)
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

max_current is type == VMMC_REGULATOR ? MAX_MMC_SD_VMMC_LOAD_UA :
MAX_MMC_SD_VQMMC_LOAD_UA;

Try to rewrite the patch so that you don't have the decisions spread
across multiple levels in the callstack.

> +
> +	if (mmc_card_mmc(mmc->card))
> +		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
> +	else if (mmc_card_sd(mmc->card))
> +		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
> +
> +	return load;
> +}
> +
> +static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
> +				     bool hpm, int max_current, enum msm_reg_type type)
> +{
> +	int ret;
> +	int load = 0;
> +
> +	/*
> +	 * After the initialization process is finished, Once the type of card
> +	 * is determined, only set the corresponding current for SD and eMMC.
> +	 */
> +
> +	if (mmc->card && !(mmc_card_mmc(mmc->card) || mmc_card_sd(mmc->card)))
> +		return 0;
> +
> +	if (hpm)
> +		load = sdhci_msm_get_regulator_load(mmc, max_current, type);

Does !hpm happen when regulators are enabled or always together with a
regulator_disable? (The regulator framework skips the load of disabled
regulators when aggregating)

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

msm_config_regulator_load() is mostly 2 different functions with
multiple levels of conditional code paths depending on this last
parameter. Please try to refactor this to avoid overloading the
functions like that.

Regards,
Bjorn

> +	if (ret)
> +		return ret;
> +
>  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
>  }
>  
> @@ -1435,6 +1513,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
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
> @@ -1642,7 +1729,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  	}
>  
>  	if (pwr_state) {
> -		ret = sdhci_msm_set_vmmc(mmc);
> +		ret = sdhci_msm_set_vmmc(msm_host, mmc,
> +					 pwr_state & REQ_BUS_ON);
>  		if (!ret)
>  			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
>  					pwr_state & REQ_BUS_ON);
> -- 
> 2.34.1
> 
> 

