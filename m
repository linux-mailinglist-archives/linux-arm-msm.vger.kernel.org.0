Return-Path: <linux-arm-msm+bounces-76110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3DBBF98A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 23:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55DF3B0D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 21:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D46261B6C;
	Mon,  6 Oct 2025 21:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grjBg4qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A42184524;
	Mon,  6 Oct 2025 21:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787073; cv=none; b=nIdesfddJ+RlF+8gAVjNhUFo++h1/Y11w4s6NRAj5LePEsaEkRnWd1q4wFjsTpW8Fm/5x6GPWLN2rUxJY3LGrCLJnPZwCzV9vH1jRnylGedm8o/6rguJcw1BSAEZ5LdhDHgLO3DghDskRMxGyysEWVeA4RgcllY4XlCBE8jp97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787073; c=relaxed/simple;
	bh=KtUxnrCEY6S1Yi308FQ5RsBohKijSQpF4RArqq+kzuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwk4FyPJa4pkupcBKHpgNDpd3jIPwENJ7uKb+Aqa8JNs4zgQORXiAb7adS5ETG8Gf6d59Vw4HyVRvzd5QIkgumXrE2VPhDe6XeDJX4n23gCkxdqKltgvFqf7uq9mf+Mn3/T19HVwHfwlHE9/cOx3BqhxQLLIG5BnPtYqMbalULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grjBg4qi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D853C4CEF5;
	Mon,  6 Oct 2025 21:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787073;
	bh=KtUxnrCEY6S1Yi308FQ5RsBohKijSQpF4RArqq+kzuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grjBg4qiJokwyTfQoidNOjfdJw/k2s0fu19TElO3e8oPzw+x59M6mRs5or382j/7C
	 nRH1OJyr2CZnv74COiuAjgv0MgF7eUJNa9umqc2jk76iiiYhojMeclWiK5Ri5GUL3+
	 eeoc8tfK8nTqUqsqNa4Y7qJm8diy4W4TwJAkK4VAE/Wi5Cni+nsxnOzvHmUU0z0Gq9
	 Nwgw0A+s99RMzvkTlQ2IGUgFmTQpuC1IL97uWMxPZgP85HVjkSMC+JmHAwt0fgmnVH
	 BYNAaYsNjibR81XrUAssJyGQ9mjK1eLKF+C4s5/GC45qMd/D8o/qSLyN3pYaOgWTFb
	 /VYQskGVJbnfw==
Date: Mon, 6 Oct 2025 16:44:32 -0500
From: Rob Herring <robh@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v4 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
Message-ID: <20251006214432.GA625548-robh@kernel.org>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-4-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929113515.26752-4-quic_rampraka@quicinc.com>

On Mon, Sep 29, 2025 at 05:05:14PM +0530, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> This update introduces the capability to configure HS200
> and HS400 DLL settings via the device tree and parsing it.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 91 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 36700735aa3e..d07f0105b733 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -265,6 +265,19 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +/*
> + * DLL registers which needs be programmed with HSR settings.
> + * Add any new register only at the end and don't change the
> + * sequence.
> + */
> +struct sdhci_msm_dll {
> +	u32 dll_config[2];
> +	u32 dll_config_2[2];
> +	u32 dll_config_3[2];
> +	u32 dll_usr_ctl[2];
> +	u32 ddr_config[2];
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -273,6 +286,7 @@ struct sdhci_msm_host {
>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
> +	struct sdhci_msm_dll dll;
>  #ifdef CONFIG_MMC_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> @@ -301,6 +315,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool artanis_dll;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2516,6 +2531,73 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> +				  u32 **dll_table, int *len)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 *arr = NULL;
> +	int ret = 0, sz = 0;
> +
> +	if (!np)
> +		return -ENODEV;
> +	if (!of_get_property(np, prop_name, &sz))

Don't add new users of of_get_property which adds untracked pointers to 
raw DT data.

> +		return -EINVAL;
> +
> +	sz = sz / sizeof(*arr);
> +	if (sz <= 0)
> +		return -EINVAL;
> +
> +	arr = kcalloc(sz,  sizeof(*arr), GFP_KERNEL);

Why do you need to count the length first when only 5 entries is valid?

> +	if (!arr)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
> +	if (ret) {
> +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
> +		*len = 0;
> +		return ret;
> +	}
> +
> +	*dll_table = arr;
> +	*len = sz;
> +
> +	return ret;
> +}
> +
> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> +{
> +	int dll_table_len, dll_reg_count;
> +	u32 *dll_table = NULL;
> +	int i, j;
> +
> +	msm_host->artanis_dll = false;
> +
> +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
> +				   &dll_table, &dll_table_len))
> +		return -EINVAL;
> +
> +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
> +
> +	if (dll_table_len != dll_reg_count) {
> +		dev_err(dev, "Number of HSR entries are not matching\n");
> +		return -EINVAL;

You just leaked memory. devm_* functions are your friend.

> +	}
> +
> +	for (i = 0, j = 0; j < 2; i = i + 5, j++) {
> +		msm_host->dll.dll_config[j] = dll_table[i];
> +		msm_host->dll.dll_config_2[j] = dll_table[i + 1];
> +		msm_host->dll.dll_config_3[j] = dll_table[i + 2];
> +		msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
> +		msm_host->dll.ddr_config[j] = dll_table[i + 4];
> +	}
> +
> +	msm_host->artanis_dll = true;
> +
> +	kfree(dll_table);
> +
> +	return 0;
> +}

