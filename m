Return-Path: <linux-arm-msm+bounces-24341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8721C918E29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08921B20A20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 18:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709C419048B;
	Wed, 26 Jun 2024 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbYU32NS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF7190482
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426109; cv=none; b=qrEw9mWeelG6lC1T/lxuBauG+6FvCFZknLHzphpT0CpfK6bjPBRt/GinoF9IjXQqF7E/byUQacwZ7vc7YbDfFpiuOLENLOd4AOiGBW4HoCgG0mpaNTHX4iDLl1eNPz/OzTBmVY6M1E+fCSYeX+7UeeU9WocNJrxLTP9L3KM4wuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426109; c=relaxed/simple;
	bh=6TYIPbPS4R6iweSpc2w1PZdKid1Wu6t/ISBPYdapvbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ65M+/D4R9UmVrXtsNHd9knrndsSqOnzVvEhl6g6yKrFK761phXrtM39PdFYj7aXxqCb4Vp+7VIDF48qz/n2X3Z1PwlVoMxxHC8uKWvoEjGxvDeJF4wJNNNkhYHcUWWXsl7vX3OIy7v8ySnmX3ToKIMxwyQmm+M4yDsLLLwARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbYU32NS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ce6c93103so4754717e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719426106; x=1720030906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//MpmAILITzcKEizX/9gxPn9UDOA+9PRAYCNpg/DcRs=;
        b=fbYU32NSCLChz93v6SvxehylSi91JXAVA0I7Iz1fvcq4LbVVs0mRyRCVxAprAv+RbP
         CuDSPKJ2O+HNwe6zIGFI/4FRgcWsRDmexIGuneZtraj2I/E83LDkGyt1V0fG152OF262
         5QjVOBCkf+IY5iKtLh7EdKXnSEwoQoukGmxL8gzBzLuAPX9bumVYy9kf5PwcVyA6M9j4
         ECGDc+f1sRMqrvDHyvh8lSmAxE4PT5k0TfKOS4KadOMH9JP3SI8j4t6hPYogXGGcgE3U
         q9KrzxTt+Hxcb8hqs2Rdap/JwqcyA2EsF2F8Tde/adb8HGOLQV8ezYVCEbUVV+U064on
         ZyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426106; x=1720030906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//MpmAILITzcKEizX/9gxPn9UDOA+9PRAYCNpg/DcRs=;
        b=YgNbxY1Sy93vKlkXJLzyNo2OB1g9EkONQBFc8TUak8tynGFFrXEtwsU3cqF2+dJp26
         ir2R8UolR9E7x9XmpDAiUPmcpIf70EVh0HIGOJcjNsHCw+q6mxRD+GcsJzic01z4FOzy
         zMMwQinUyMZDaRjufur5ySvAG30RASFqZtVKnBraVkysq5JD/qnGnPsGYc6UxhcYArhM
         z4kroCsg9yiTDp6B/wj7YD0azPfQrYhnbWoBjYjyUOiMy1sVH25i0Adxq7v2s42H6eCN
         oDsLSSG6S80n74qJNVTdiMAAxymG0xEA2MSVmFl9fg5rC33FB7LzDcapjtYB73ivBo5Y
         7yHg==
X-Forwarded-Encrypted: i=1; AJvYcCV1zRrAix6ZOngu4NStwUapm3Dx8mDZ8l5V4TPg5qGCNStFoseAOq7K53uB+jN7Bo6ctpE9ayHONXysjC2YX4nmgF/ez/3f3vNfKdI4KQ==
X-Gm-Message-State: AOJu0YyBsk8am+ptrCGWJ1uvZe3X5NyxaFCHFqrPY6yhDBliTXhc7B0k
	hW3yjc2PbVl3I+DYevqrQ8zsU/zUucthxrbRYssTbwsYejHL0eWK0GdRnaYJHzU=
X-Google-Smtp-Source: AGHT+IHJ4p//CH+AaNp/ZmyKwZ/tji9Ag3MV6cZw2C1QzU/zz+/aY3hOnCofp3e1KT6QUiZEBrnMNA==
X-Received: by 2002:a05:6512:308c:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52ce185ce9amr11764612e87.60.1719426105827;
        Wed, 26 Jun 2024 11:21:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdcdb981esm1450255e87.122.2024.06.26.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 11:21:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:21:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, neil.armstrong@linaro.org, luca@z3ntu.xyz, abel.vesa@linaro.org, 
	danila@jiaxyga.com, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/9] soc: qcom: cpr3: Fix 'acc_desc' usage
Message-ID: <jgboqj56nfeuv7qmi34chan46u5urdxyezqhfmqdq3clvcv2k6@k7aktead5qbk>
References: <20240626104002.420535-1-quic_varada@quicinc.com>
 <20240626104002.420535-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626104002.420535-2-quic_varada@quicinc.com>

On Wed, Jun 26, 2024 at 04:09:54PM GMT, Varadarajan Narayanan wrote:
> cpr3 code assumes that 'acc_desc' is available for SoCs
> implementing CPR version 4 or less. However, IPQ9574 SoC
> implements CPRv4 without ACC. This causes NULL pointer accesses
> resulting in crashes. Hence, check is 'acc_desc' is populated
> before using it.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/pmdomain/qcom/cpr3.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pmdomain/qcom/cpr3.c b/drivers/pmdomain/qcom/cpr3.c
> index c7790a71e74f..c28028be50d8 100644
> --- a/drivers/pmdomain/qcom/cpr3.c
> +++ b/drivers/pmdomain/qcom/cpr3.c
> @@ -2399,12 +2399,12 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
>  		if (ret)
>  			goto exit;
>  
> -		if (acc_desc->config)
> +		if (acc_desc && acc_desc->config)
>  			regmap_multi_reg_write(drv->tcsr, acc_desc->config,
>  					       acc_desc->num_regs_per_fuse);
>  
>  		/* Enable ACC if required */
> -		if (acc_desc->enable_mask)
> +		if (acc_desc && acc_desc->enable_mask)
>  			regmap_update_bits(drv->tcsr, acc_desc->enable_reg,
>  					   acc_desc->enable_mask,
>  					   acc_desc->enable_mask);
> @@ -2676,7 +2676,7 @@ static int cpr_probe(struct platform_device *pdev)
>  	desc = data->cpr_desc;
>  
>  	/* CPRh disallows MEM-ACC access from the HLOS */
> -	if (!data->acc_desc && desc->cpr_type < CTRL_TYPE_CPRH)
> +	if (!data->acc_desc && desc->cpr_type < CTRL_TYPE_CPR4)
>  		return -EINVAL;
>  
>  	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> @@ -2703,7 +2703,7 @@ static int cpr_probe(struct platform_device *pdev)
>  
>  	mutex_init(&drv->lock);
>  
> -	if (desc->cpr_type < CTRL_TYPE_CPRH) {
> +	if (desc->cpr_type < CTRL_TYPE_CPR4) {

This is incorrect. This disables ACC usage for CPR4, while GFX CPR on
MSM8998 (which is CPR4) seems to use ACC.

>  		np = of_parse_phandle(dev->of_node, "qcom,acc", 0);
>  		if (!np)
>  			return -ENODEV;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

