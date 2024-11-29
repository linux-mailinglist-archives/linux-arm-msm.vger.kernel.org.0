Return-Path: <linux-arm-msm+bounces-39628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 912729DEC29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 19:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51549283036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FFD1A0B12;
	Fri, 29 Nov 2024 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4tQWCg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC3154C04
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732905886; cv=none; b=bvMT8qC8Z49C7uw4EZAzKYd1iTB21yoYe9Xr2mFt5kNxv5HeQW1glqQMpiTDt09yW7n8iVDs9tT5mORKoQaHi/SFmwj+NIsjx3uOk4Y+aabS1NdNnj+T0Xm48TorKvUmgJvYQQKEgQbOHh8r+wcXo/upd56gXBSqWFb3YeyuOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732905886; c=relaxed/simple;
	bh=hQcFmzIN5wiJjr7Uxk8hCjS0qmPcjwZE/5VgFTHdzxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqyI3zBt4WubnZ3QYl9OxfohuYIJ7l0yWOmeqaXbMHfsxah22T/Q8wwa5C4OGGl7jayHoExrrnK5/lMyXdq0cyrJCfXdehOOkiSGaqy8MkRMMro0GJc5/Kyk5EpX36VhyWk7zOTr1EwHYFg/p5HZAZVC2e+iP8zEur2jMcuazb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4tQWCg4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de035ea13so2249181e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732905881; x=1733510681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOiKspxipILPKcvO1wYQ1RT/mi2iBB8R5lFWNQVT9HM=;
        b=F4tQWCg4i1fiZXctSRhDvfpfkTzIWDHaO8p+BAqiSxK+8W1HJFVKC8SrMwcNSnzHhl
         uh2jBR+h+W90dfvigUOa5MO+ty+ynAkUtvuTKepqHnOgkZulHqO9rM9/CQc79h/BtFnZ
         c/wE7nENYOUmXbbbSqN8epcFft0hXS+ZBnQIBipH1Rk8KZqshhvHjDjbXrQM98zcEC1Z
         pRNvFteTlwIIEtTZ9VS2euzbxgSESqXQ6oXQUcBoDEFnheELpnKucKWny3ch5Ow+VXD5
         xru4Pro/nlgzZcdSj+5EsR4eVUNczhrY0u3IV4vAbSwiL8OWlB/pc6yRfKf5+JlmGRK+
         QbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732905881; x=1733510681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOiKspxipILPKcvO1wYQ1RT/mi2iBB8R5lFWNQVT9HM=;
        b=BEahZqS0nvMfNyfIttD8OnbTvUMxgshk+l4dgxtN5uQF4NnQbmpSXouk9YXrKrDfp1
         I+QONmqg/EXMIR0NwGIzWME7x7MWmeF7a3C9OytGdDaYt9EjJ9g8CIoTMU1LsX0TZfZn
         XrHeeGGUpoD4VTMEWhah9rZoCDE7H0d3gHQlVe3kOMulBp8HCabpZqWP8ERpVHqlNYIC
         LJW/NEpPNtnYT21rXJXLOZZsCfewKtEnlwmSYIGjJMoNqhISH02+QCchFhOc41jI727o
         HYtV5bH7iMIwcYnG21vv0j0DPhC+EX2tTeJ9qI9NG7ueNmfoKxj2ZicQE5kZAjPJu3rQ
         N4rg==
X-Forwarded-Encrypted: i=1; AJvYcCUq9eLzhDa1QTCCpMh8KkqFGJUV2UYHhoGQZ9gqMSQi1+LTXqpqLifJBeqYpWkTJRpNxrSlOyN+xcWD3YkM@vger.kernel.org
X-Gm-Message-State: AOJu0YwVaJur8UpbfTNwteEZcyW7vEVcqCHF6OHRX6nweBQoQY22gBra
	+UbxzyWl9XVWn9I9lVgm9NQY3Zr7VRFizfKC+nFKTd56xC1j/gVhff5iupBOQfo=
X-Gm-Gg: ASbGncu3g7KCR3iCGiDlhXMWowMGIvhhg8NLLw+6EDljl53B1JdWhbCWoO7PyKmjF2I
	hecOPazE/KZRsVJPnLKqQPoAS51K9U4Plyrjlc6Rw/FBPBM/YuRL3ZVpbYis/l+kp2G8onjv8in
	lRvDlA0SNwQEiMHPS665iTKkavvbe8lXblHkCwLjqY0zvpCubtvar2lYDlrCHXNbDx9RnU/vd9u
	gN0fqqCOJ4wuf7FkkcKKMMwyAjAC9uKBoL8yh5UFCIG5F7wK0DqSbk9uBilQ7YUaily6zjvyZn1
	5uiAshmACV8pyWimwPQ1HoPZmQ3VgA==
X-Google-Smtp-Source: AGHT+IGU+Gk14+Fy7vKtqK+f88i86zD4DWOjZyAi4B5JlY1q48Z1pc3ZNJuAseKpBn27HIL/89ZZ7w==
X-Received: by 2002:a05:6512:3c89:b0:53d:a2cb:349e with SMTP id 2adb3069b0e04-53df00c5ebamr8555719e87.4.1732905880726;
        Fri, 29 Nov 2024 10:44:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df643110asm553346e87.32.2024.11.29.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 10:44:39 -0800 (PST)
Date: Fri, 29 Nov 2024 20:44:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com
Subject: Re: [PATCH v2] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <cj7nsn2xphd4ftnhtp6ztor4cqyjsdwkubjgancfd3xojddj4s@m3pb4qc645sn>
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

Please drop enum completely, then...

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
> +
> +	if (mmc_card_mmc(mmc->card))
> +		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
> +	else if (mmc_card_sd(mmc->card))
> +		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;

... split this into two functions, one for vmmc and another one for
vqmmc...

> +
> +	return load;
> +}
> +
> +static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
> +				     bool hpm, int max_current, enum msm_reg_type type)

Then this becomes two functions too, each of those can be inlined in the
proper place.

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

This goes into sdhci_msm_get_regulator_load().

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

-- 
With best wishes
Dmitry

