Return-Path: <linux-arm-msm+bounces-45789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F764A18F05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EFB3A4098
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FEC210190;
	Wed, 22 Jan 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hscZqSrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A120FAB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539887; cv=none; b=fbU6LWY7QxFeiyMlD0KjwWRHVq5Zh864/S2iV5sxRJBzj//nE4S2reiysjHY4NKHc+ULR8lhRzaKVGVIoVU/HfgpfIIoF5pLZWK3olT+y+R83YkMVJfnwG+UqPVES2V8Q0rZTvnXVp0p+VeWVeh8CEgu3ABFIKAAzKkKapZLXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539887; c=relaxed/simple;
	bh=0t93RCDXl/7xUXDW5W9vqPWXCfpMB16UsYpP/NqJ6Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUprUKvdQprkxX7++/MBmIbzIojBYhKB6Ifrb/vTHkwOSTtLLSJyQUB9gMRCowKjHoepYZu91FEhrH7IgxExS7xfMAW0NIudyg7AbQFdqXoXf51I/C5fF84/3RwC+uqihNUsq6XAn15UDHqxXUXQmCsSiUrJmGAa0qgkOn0gG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hscZqSrU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401b7f7141so6010900e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737539882; x=1738144682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lt+7T/OfDgu/+TjLQdN9iffz+QngVPZRwwA8knqRWaI=;
        b=hscZqSrUBpsdDJlvGazLsFUbKQwp1m+j+Ena3k9KzDptbkDyIYvkp4UNh8aIkBVZLI
         8r/6MHfVQkrFZQHyw3qPHX6SKSZRfoZ4RnEO+C0hTNjP/jLXCuYF/Vwlo0azMReoTQTS
         V3bPU9MBGXLS2ydWMPdxXWP3tMhVFyEpI2jsUla+a/kdlWDXbwX46wdVEM28/Arusq6k
         Gpv0ekeTK9HNC+uvD9dvpRjTP8M3oO8RXkF/AfFy/Iam+YcZg57shlU5c21BUSQUn8DZ
         YAg2ztwdL4rDU8l653TDwGFaxu8wo+3VcCLlJLMGskpBwaVSG/WvMUmMx3WKH7ePYz39
         7+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539882; x=1738144682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt+7T/OfDgu/+TjLQdN9iffz+QngVPZRwwA8knqRWaI=;
        b=ffxKbOtPxtLD0zS3CF2Ikveu4lzLSDGxsRVCQOOGAcseanGf1ZK8MKgkFkm3pUVnqL
         N0ZVUvPqsdBjnw+DbRmUqsiDPbLsC/FkEKMtnCawhb2HHNpEmLsDBuSkkIMpZu3viiRg
         KvEPsyJ2FNHp0Odg5gg+l+L0aA66d6RIKEw1z33z7YqkvyNqPpBjGUmYkvRtiH4IuqWf
         VUzXpisGBphSzTOqX1HPybDzDOMpqP13SfoID2DYHXgIK89MO7zyJ2nuTvPaIXwwZb1l
         1+thTCRHO4Ncw8WH5SMGOt8zSqsuzGi5g0uJTRW7avjAvoOQIbw0d5zOfB/aW4XnMqh+
         pQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWu/lHq7dUXYdhY5a0eBf3rw5VSOhWBw/aoh4JwRK9fEQi2uwngY52KRZE3RLaLQriTTtPUEBCtDTkCGbUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92ubgNn1Q4dk1XsMQ7EMd+pFec0Vc472h4qcGFMDK8ZGdtNFO
	nsDM4kgRN2+sMmU7fPQs6c0qSznqjZ9uVq13ajPypqAquKx/1ujGxrOAcUG7KxY=
X-Gm-Gg: ASbGncvuOI7f2e30TM7EBf847VoGI12aBvi2wiTtneCVrQXoZBhqiHiGuphUvplPRDc
	6D1LC0PaDkqt2264lMsY01rxpu2m2loubUCiikgkiiK1ZQMdlTBVA3wpeDkpCDRVQHYnkJjjslz
	bMIazxZLjZ027V9FAe3e5453/1BQ5Bc5CyMkHVa+M2sAen87E/9ApukM2mMb+UeevP4igLj8DmN
	uCEaU4kjqDxGY9ltoQrTuAB3ScjvFHf21WwwTPBK4yA4UZYI0/iZ2mITnB4VKZX24lq7LjZAbnJ
	HHfOCN8fN5PqCowEh6al0Ax+NbT2/0Fk6IUwzcfsr0uh4hrdWg==
X-Google-Smtp-Source: AGHT+IHSPoERHwXBAu/mWABs14CcJsopKYTMwQjU2ZihLtIIx69YnItSD8BMvZFUb9/vqhUAaBtVuA==
X-Received: by 2002:a05:6512:1084:b0:542:29b6:9c26 with SMTP id 2adb3069b0e04-5439c27d0c5mr7863371e87.47.1737539882463;
        Wed, 22 Jan 2025 01:58:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af7364esm2166480e87.162.2025.01.22.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:58:01 -0800 (PST)
Date: Wed, 22 Jan 2025 11:57:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
Message-ID: <6xvsnmbnnvpmlgvmi42pt4d3ugkrxhrgrkp56szqhgh2foxe72@z4ildfxufq7j>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-4-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122094707.24859-4-quic_sachgupt@quicinc.com>

On Wed, Jan 22, 2025 at 03:17:06PM +0530, Sachin Gupta wrote:
> This update introduces the capability to configure HS200
> and HS400 DLL settings via the device tree and parsing it.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 2a5e588779fc..cc7756a59c55 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -256,6 +256,19 @@ struct sdhci_msm_variant_info {
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
> @@ -264,6 +277,7 @@ struct sdhci_msm_host {
>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
> +	struct sdhci_msm_dll dll;
>  #ifdef CONFIG_MMC_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> @@ -292,6 +306,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool artanis_dll;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2400,6 +2415,74 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> +				  u32 **bw_vecs, int *len)

It just reads an array from the DT, please rename the bw_vecs param
which is inaccurate in this case.

> +{
> +	struct device_node *np = dev->of_node;
> +	u32 *arr = NULL;
> +	int ret = 0;
> +	int sz;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	if (!of_get_property(np, prop_name, &sz))
> +		return -EINVAL;
> +
> +	sz = sz / sizeof(*arr);
> +	if (sz <= 0)
> +		return -EINVAL;
> +
> +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
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
> +	*bw_vecs = arr;
> +	*len = sz;
> +	ret = 0;
> +
> +	return ret;
> +}
> +
> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> +{
> +	int dll_table_len, dll_reg_count;
> +	u32 *dll_table = NULL;
> +	int i;
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
> +	}
> +
> +	for (i = 0; i < 2; i++) {
> +		msm_host->dll.dll_config[i] = dll_table[i];
> +		msm_host->dll.dll_config_2[i] = dll_table[i + 1];
> +		msm_host->dll.dll_config_3[i] = dll_table[i + 2];
> +		msm_host->dll.dll_usr_ctl[i] = dll_table[i + 3];
> +		msm_host->dll.ddr_config[i] = dll_table[i + 4];
> +	}
> +
> +	msm_host->artanis_dll = true;

And the pointer to dll_table is lost, lingering for the driver lifetime.
Please drop the devm_ part and kfree() it once it is not used anymore.

> +
> +	return 0;
> +}
> +
>  static int sdhci_msm_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host;
> @@ -2446,6 +2529,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>  
> +	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
> +		goto pltfm_free;
> +
>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>  	if (ret)
>  		goto pltfm_free;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

