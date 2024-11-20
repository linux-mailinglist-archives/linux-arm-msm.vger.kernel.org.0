Return-Path: <linux-arm-msm+bounces-38495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC39D3AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B80B21DDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40AC1A3BAD;
	Wed, 20 Nov 2024 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWpIpd0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CAF19EED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106448; cv=none; b=ir0j4dx8PC5AOcDJyUXANfhx1tJuOy2SYs93COkKMaQbwdS/kQoBHuXt84Cvbsi3z9AwYTnSBNJUq96ORHnLZUYNBlSa9pOyToKAkEOfSkPtswtiZ+vWrWtc9fNzzveCjh7oVGrpXiW8med618T94TLLdssk6tWK5nShjDy1Hm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106448; c=relaxed/simple;
	bh=8yJMwcTHtcgvU7ExIkN68hrctLobhHAvOsB/vCEzUVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeuMckKns2pQI+dPQoZJnsxvrAygufO9dIHjxGDcmaT3WfhOHP0A2V0ckYdop/bO7d0VxzMd1g2Y+YUBTV3DcuQ96e1qN2++Zr81xwXcK3Y7uSUrrzn5/mNjEXdk2b3oLCHyR0Nll0qG7mdCDI8ByY2r4lQjZbGG5DP17MTJoeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWpIpd0K; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a097aa3daso4030304e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732106445; x=1732711245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L956lhRe0LlEWkMS5Gwktl85mpkmY8AZuSEqvk9rvN0=;
        b=NWpIpd0Kgn79TwvM2fXv+lT7iiscWgSIdtTIEE3A1FV2ScQW35ELOfzdRkMU+ek2ib
         NgS0TAf9mFymksivorD7weh+mTlTIyL58DHm1I5r7+HJYKGeABqFqyojKyUTxDFVYGg4
         C7a18AAvjEukaXMknc+VO/pj5Ctjbp1H7ATHzRRIyHzpBqFlWqsvap+o8UD3j+QUJsMA
         hAtpHm9Kv4dk02JZXSpEMg8fHtRM8tZ39FnjidF3rGl8Q36A4R3pXE2ytOFX581TKSXC
         8UuKkmJ7ywrfcGFQoLVV6DkZsV8BGdr7jBrZMDJ6lrFI/VTvCS7ZE7fCeXSzovxbxd+I
         OqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732106445; x=1732711245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L956lhRe0LlEWkMS5Gwktl85mpkmY8AZuSEqvk9rvN0=;
        b=ZvJO2eZy7RtnssArCYUJ7zqO4KKYfMrnQ4vM68Q+R4BH3k1DjoEqWNH8494uOWO3+F
         CaMd9RMDdM2dN810cJEyf6l+XZjbOJs8iqaUIiPR8U5HnIeyXA/HXqY06rs/K4YjJdHi
         PTVF6qym2l2lc9GpuH3/kl95W3MArhMG96fPDpHXCZ/YJ9nmUmtQm1EBh8Vll2fIK0Yy
         OGz2jtB18pFMxa8yoNzOkWel9/jcJ5te6WcSlmg9v1xPZEWl4+DbW/HzVKV73nlVN3kz
         Ecc03uyhhg4llp58zYR3be8M9kpP+k/AscIOcfertV9a7WWMAFpcupVm+ziRR6L/+D0c
         vs0w==
X-Forwarded-Encrypted: i=1; AJvYcCWYGQUZmD974MUaFnowD3WINEQbCnu2bpB5kK9aiubCbCAoe+/G2qoq1ahfQSnH439FgKQgrXFfU8kewuAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYhFhvOkQrubihWfB20Rx7DPfL2FI4L2mos/QEJ/IULgSFpEH
	pn93ThlG7RGdpDBWE1nAvV07R7+uDEa5WziSaYL7+0bdnM9UOyhti/JHZBnwccY=
X-Google-Smtp-Source: AGHT+IEiqeubZ5zfbphw/m8EC0uSMLGjCvjc5KM5cHWbACD1pJ+S0jBmI33wb2FQ79hEwG5asr5GVw==
X-Received: by 2002:ac2:54ab:0:b0:53d:a283:f290 with SMTP id 2adb3069b0e04-53dc1341c7amr977825e87.31.1732106445050;
        Wed, 20 Nov 2024 04:40:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd467255sm618654e87.160.2024.11.20.04.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 04:40:44 -0800 (PST)
Date: Wed, 20 Nov 2024 14:40:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
Message-ID: <fkpp4ii254ewtmhg2j4nnjarvl7qkvet7i7urr6xhbblcmdb3u@tcbwmfqrnch2>
References: <20241119060754.3350320-1-quic_varada@quicinc.com>
 <20241119060754.3350320-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119060754.3350320-3-quic_varada@quicinc.com>

On Tue, Nov 19, 2024 at 11:37:53AM +0530, Varadarajan Narayanan wrote:
> The 'broadcast' register space is present only in chipsets that
> have multiple instances of LLCC IP. Since IPQ5424 has only one
> instance, both the LLCC and LLCC_BROADCAST points to the same
> register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3: Rebase to ToT
>     Remove 'need_llcc_cfg = true'
> 
> v2: Use 'true/false' instead of '1/0' for boolean variables.
>     Add 'no_broadcast_register' to qcom_llcc_config structure
>     to identify SoC without LLCC_BROADCAST register space instead
>     of using 'num_banks'.
> ---
>  drivers/soc/qcom/llcc-qcom.c | 57 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 32c3bc887cef..106f2619277a 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -142,6 +142,7 @@ struct qcom_llcc_config {
>  	bool skip_llcc_cfg;
>  	bool no_edac;
>  	bool irq_configured;
> +	bool no_broadcast_register;
>  };
>  
>  struct qcom_sct_config {
> @@ -154,6 +155,38 @@ enum llcc_reg_offset {
>  	LLCC_COMMON_STATUS0,
>  };
>  
> +static const struct llcc_slice_config ipq5424_data[] =  {
> +	{
> +		.usecase_id = LLCC_CPUSS,
> +		.slice_id = 1,
> +		.max_cap = 768,
> +		.priority = 1,
> +		.bonus_ways = 0xFFFF,
> +		.retain_on_pc = true,
> +		.activate_on_init = true,
> +		.write_scid_cacheable_en = true,
> +		.stale_en = true,
> +		.stale_cap_en = true,
> +		.alloc_oneway_en = true,
> +		.ovcap_en = true,
> +		.ovcap_prio = true,
> +		.vict_prio = true,
> +	},
> +	{
> +		.usecase_id = LLCC_VIDSC0,
> +		.slice_id = 2,
> +		.max_cap = 256,
> +		.priority = 2,
> +		.fixed_size = true,
> +		.bonus_ways = 0xF000,
> +		.retain_on_pc = true,
> +		.activate_on_init = true,
> +		.write_scid_cacheable_en = true,
> +		.stale_en = true,
> +		.stale_cap_en = true,
> +	},
> +};
> +
>  static const struct llcc_slice_config sa8775p_data[] =  {
>  	{
>  		.usecase_id = LLCC_CPUSS,
> @@ -3185,6 +3218,16 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
>  	},
>  };
>  
> +static const struct qcom_llcc_config ipq5424_cfg[] = {
> +	{
> +		.sct_data       = ipq5424_data,
> +		.size           = ARRAY_SIZE(ipq5424_data),
> +		.reg_offset     = llcc_v2_1_reg_offset,
> +		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +		.no_broadcast_register = true,
> +	},
> +};
> +
>  static const struct qcom_llcc_config sa8775p_cfg[] = {
>  	{
>  		.sct_data	= sa8775p_data,
> @@ -3360,6 +3403,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
>  	.num_config	= ARRAY_SIZE(qdu1000_cfg),
>  };
>  
> +static const struct qcom_sct_config ipq5424_cfgs = {
> +	.llcc_config	= ipq5424_cfg,
> +	.num_config	= ARRAY_SIZE(ipq5424_cfg),
> +};
> +
>  static const struct qcom_sct_config sa8775p_cfgs = {
>  	.llcc_config	= sa8775p_cfg,
>  	.num_config	= ARRAY_SIZE(sa8775p_cfg),
> @@ -3957,8 +4005,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  
>  	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
>  	if (IS_ERR(drv_data->bcast_regmap)) {
> -		ret = PTR_ERR(drv_data->bcast_regmap);
> -		goto err;
> +		if (cfg->no_broadcast_register) {
> +			drv_data->bcast_regmap = regmap;
> +		} else {
> +			ret = PTR_ERR(drv_data->bcast_regmap);
> +			goto err;
> +		}
>  	}
>  
>  	/* Extract version of the IP */
> @@ -4032,6 +4084,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
>  	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
>  	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
>  	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
> +	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},

I wonder why is this getting inserted at this point. The list is sorted
and your entry definitely is not in the correct place.

Please review if your addition is breaking sorting order in other places
too.

>  	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
>  	{ .compatible = "qcom,sar1130p-llcc", .data = &sar1130p_cfgs },
>  	{ .compatible = "qcom,sar2130p-llcc", .data = &sar2130p_cfgs },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

