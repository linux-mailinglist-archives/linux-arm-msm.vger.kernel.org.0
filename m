Return-Path: <linux-arm-msm+bounces-85695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D900CCC090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A07306FB03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38C334C1C;
	Thu, 18 Dec 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buUGKk0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A831ED91;
	Thu, 18 Dec 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064762; cv=none; b=XS1HYjGIbYnWLtR3I9OoTibV7FD7UpEXvjcA7spgGja3T5x/mqs0Cr8F7rKFiyMpPa1Il+XgvHlYP2SpMCO/tyuZq0KN7FTxsfH9ACv13hhlIvCWe1eGAD8PXqL12CckChQthnLWcnCSghHKh17mcFlQuPVCJA6BU474BLiZ1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064762; c=relaxed/simple;
	bh=L27ZwyIV0Tt+36bJmnSMXHEQzTdo+CiOZytPC3LDc4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BydTYV6VYCxza7Lt/O/Q1HevdqLzg0iz1+nMCpS0LMBGJj7IJSDDzyjPPednfDbswoquQfljct9CBFSrRyi6rOldpLwdfJ4kX90uI/jo9qwI+dGHLWfUjh8cb+RQGEpG1AcHK/Z5/CBjC8XsGcKGAO1jVWk5Uccr2tChvt0vFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buUGKk0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1000CC4CEFB;
	Thu, 18 Dec 2025 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766064762;
	bh=L27ZwyIV0Tt+36bJmnSMXHEQzTdo+CiOZytPC3LDc4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buUGKk0ZCijDnpFU9DU6y7DrDJb4E/93HvA0OIKNtODCvwaIUgFQ0/cKb18hNPxSh
	 TnxIRvEAxwQWbMPVXZ4yMb2zGxLnNQrpqDMqULVwMOg2Zjw7JLVbI5ER/LR79iIiW3
	 OgRac0/pAWelDQ4yREvpUSLijKkrhORnoehZv1zMAVIqqYfuB1OfmocpQYkUt9KBPd
	 Z/y2moVvmW7EJbvzSISdiP+YHd1+6FiiCrrNJJkpm8q4Bm8AMZGXsHrUVcD3G0YxAN
	 eU6GHgi7DQWJtci1hJZ+hn6QJA/+uxGgNtn/FEd9W4S/VZGvafmcSTVU1m+bHVWmfq
	 hk+P2ZQIF6PQA==
Date: Thu, 18 Dec 2025 07:32:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, 
	kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v6 4/5] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
Message-ID: <fkb4iietzzmhvatmvjn6s6dpdibmnhj5g4xjcsrvzfwkipgwwz@wde3bcrqxrhw>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-5-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215120009.3877889-5-quic_rampraka@quicinc.com>

On Mon, Dec 15, 2025 at 05:30:08PM +0530, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> This update introduces the capability to configure HS200
> and HS400 DLL settings via the device tree and parsing it.

No it doesn't, it merely reads a bunch of integers from DeviceTree and
does nothing with them.

Please write your commit message in imperative mood (avoid "This
update") and please include a reasoning for why this commit exists, or
as
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
says "Describe your problem.".

> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index dc79f828522b..1fcd92158bee 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -266,6 +266,19 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +/*
> + * DLL registers which needs be programmed with HSR settings.
> + * Add any new register only at the end and don't change the
> + * sequence.

/* You have to only add entries at the end, but I'm not going to tell you why... */

> + */
> +struct sdhci_msm_dll {
> +	u32 dll_config;
> +	u32 dll_config_2;
> +	u32 dll_config_3;
> +	u32 dll_usr_ctl;
> +	u32 ddr_config;
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -274,6 +287,7 @@ struct sdhci_msm_host {
>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
> +	struct sdhci_msm_dll dll[2];
>  #ifdef CONFIG_MMC_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> @@ -302,6 +316,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;

So this dll_config/ddr_config pair is no longer supposed to be used? Or
are there now two sets of dll and ddr configurations to be provided?

Regards,
Bjorn

>  	bool vqmmc_enabled;
> +	bool artanis_dll;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2534,6 +2549,23 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +#define DLL_SIZE 10
> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> +{
> +	u32 *dll_table = &msm_host->dll[0].dll_config;
> +	int ret;
> +
> +	msm_host->artanis_dll = false;
> +
> +	ret = of_property_read_variable_u32_array(dev->of_node,
> +						  "qcom,dll-presets",
> +						  dll_table, DLL_SIZE, DLL_SIZE);
> +	if (ret == DLL_SIZE)
> +		msm_host->artanis_dll = true;
> +
> +	return ret;
> +}
> +
>  static int sdhci_msm_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host;
> @@ -2580,6 +2612,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>  
> +	/*
> +	 * Parse HSR dll only when property is present in DT.
> +	 */
> +	ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
> +	if (ret == -ENODATA || ret == -EOVERFLOW) {
> +		dev_err(&pdev->dev, "Bad DLL in dt (%d)\n", ret);
> +		return ret;
> +	}
> +
>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 

