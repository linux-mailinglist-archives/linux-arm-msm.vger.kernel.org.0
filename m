Return-Path: <linux-arm-msm+bounces-50678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B75A57790
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 03:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B3AC176D66
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4991EEE6;
	Sat,  8 Mar 2025 02:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6VzCJCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB11101FF
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741399223; cv=none; b=DYQl81yR5YxkiiN0DhVGOsaSLNZrbGrpXTXLif3B2dSu8IuxiM7QVV0tQLu+AFlqyLzdNpV1gT0zK+GMgkVnLJBPUsLGEcWyf9IxkSXe3oLL+905gitxrVTYxlpT3CA594wThO1vJ/6zPtdqh0Ig9Cin3UFKqCujjGKGQuVD9mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741399223; c=relaxed/simple;
	bh=S8N+QxxiOhUsGd3S0a1x+yo4CeNlEdKYrscPJ0aeCTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9XZDXpdAtUI6X/FwcFOH0bqQYcsUMzKwNtO8k8hZkwOmekfd001Qx6o3tbKYIoC+VNaqieLN8MqnsfA74K46ADMuFuUWkiWM/1+S6JPswbjVCcRi5C6FpITyhcdAv81a1RLUwQgABwADwtESewtn0ISkv8kR8ZmfJONBTbFwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6VzCJCm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so25748071fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 18:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741399219; x=1742004019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
        b=h6VzCJCmdxyZxXwCyL0qCG5jl6lsPzVqvjjUESWqf8k9TpVGTdbT0KtGgdlk9tcn1K
         dIpEryQUif8dUjd0ZyNt+aCa9Bq0BzJTbUa+JO8Rk5hQwVXk+0xxyTj5eVZ87Gx06CEZ
         Wa4pJRXNNbnUEsrGg7/WBFpIIvDCCtjNvyDZmDSKmoklxiXddNbX7sbQTbK6Ars57HtC
         ZlUFvf3wO3qeVak7gCJqtNEq1mMzr+TUcHU79IvxxPrCbLjg4pF4IzgqTQu1ryXzx4aV
         guF2lb9G+4oeiX5c6yKdXwgYLq78CSmUzgpQVZoDZKGMcmyvQTIlbjIpTF8g+B42QRF+
         HUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741399219; x=1742004019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
        b=hetaDqWo1rkqiVzoMT18CBTWW2lw3hs+TZVHT9YFnmc5flQKwE6EvmrPnjx6RIJ8PK
         YmPALfF3SdlG3T9P6lncVM9HxWs0LliV5pB7p6mh0UWB8jTdx+ypYXpiMCY/QIGJk9eX
         kbrU2hWLhnOa01hzmsh31Egvo4tZzIU4Ng1NLJUXlYwCvwbc3mCt230gVXFliv6afK7r
         qnC8Y1ghmks5+psbi+mzgNB95bBB/CHZJTVpKqeqrwc1Tj9imTe6vL6VFW6WQGUixT23
         iK1rBIUgzsUbCJ6VD2ApTvfu5t8575kIzsdUtlBUL6CulsNA2u7t9hgm+fTRz6UOy5fe
         2IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrkw5kcYN8OXxJRilce8b2DlsZZJ8gb6uow0hupGWUEearht5VPuVVQQ1T4UZN2G0WfK0lseXoGNa8G8AL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/EhrBCNTfwsHuKHJQA7YmvCMg09bkXGKmYhBsMpqVCppEj8pL
	9Q4LnxB76S7mttVaUHrSNdLNZH17Cyq8heJpQn93vFJqfTj1OoEpCkPkMjT4C4w=
X-Gm-Gg: ASbGnctCw3fy8UV8vISf3Blcgn70cbvu410r2SV7CpQWQ3gjAdvNBZ1fnPqKxI9cEuu
	iswJAIebh7WKvFASNwfU7xY7h5E5pMS+t8rYFNRYbzinQ/rMUy42sMCdZgpQKE75CbPMMfzA/tx
	I0XnjzLUdPDIWTtwgHpRvvD7pb+adom43AYg/8dcv13ujDYETUSMMp0muoCqZN8A1ybbUs6YBgr
	Ux98OqllYVMq8/etz2JPTipg/6yrnvnuoRtO3fMHZa82S9NBqjVvhA/EzSeSLisQZCIZwCNuVub
	YMRxkOwlgu+5DQM5/1axCZCoCDtfvbrLNgaxb4Y5M6aizUN4B5ccq3GeuhC3CWajf5w6skI3Wqt
	yYv0uwRIDbRNy/U+2qTbdva1X
X-Google-Smtp-Source: AGHT+IHD+uwBqwVOK6PF+JlAvIXYtVL34Ab2L2yfhLPX2xkxj8BVZbxw9BTY9Ei5g5385gK2RsIBIw==
X-Received: by 2002:a05:6512:3dab:b0:549:8ed4:fb46 with SMTP id 2adb3069b0e04-54990e676f0mr1813977e87.26.1741399219383;
        Fri, 07 Mar 2025 18:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c33bfsm680563e87.236.2025.03.07.18.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 18:00:18 -0800 (PST)
Date: Sat, 8 Mar 2025 04:00:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <kifzy754m7zygspknsk4a4aeuqxkt4bkyp5jbu6ul43gon7je3@yleqikfmh4lp>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>

On Sat, Mar 08, 2025 at 03:42:24AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add compatible and device configuration for the Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3e82ba0885d03107d54eab9569bb4c5395454c7a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sar2130p_data = {
> +	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,

This should have been .ubwc_bank_spread = true.
I have been rebasing the series from the earlier kernel and I'm not sure
why this didn't show up during the build phase.

> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> @@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> +	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>  	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

