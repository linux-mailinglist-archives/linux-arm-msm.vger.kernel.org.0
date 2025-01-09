Return-Path: <linux-arm-msm+bounces-44676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6270A082DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF281166718
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 22:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11457205E02;
	Thu,  9 Jan 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wY7DUVdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41F1FBC94
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462392; cv=none; b=hf9V8Wg8kxdRlPIAqoBOTwxv2gSgj6I+D6quQNKjKAnYeY6oZXWDv77qznL2IvqUJY2M9kNw+1imIzqMBRw8B5LHNZYEgJyNdmUwASRCuOyCP4aei+EOglq3uJ4Lj1/AP7XyfFDv+ZaC20dGqCvvkxrIgss9GiGO48nchhHiLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462392; c=relaxed/simple;
	bh=bCLA9vY/hEpakt2u0OOpCpjUqmLQ8glexW6t3P6onp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTu9wfeD8nlncztXm+hMtXoDCHrcugVThAIxCqrMXisOZ5SrUhpEpQVaUZD3FpQJ9HiCEfoFOHHBaIQXvryW1Qi0dlvs4K+S1YnMpQweP4lmsKj31Qn/emMn9t5vmK0Da6bJDncXvdGZsBACOZ0X6cEt2BHPhLHomHZQBPWoB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wY7DUVdT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54263b52b5aso1530961e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736462388; x=1737067188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
        b=wY7DUVdTx7k8G/h5qOr+XpT+tbIV2ZGjxwWXRPGYv1avMPIfT4FCibzqRkZMIhcpgu
         HA1MitEoY8XTeBf5N8EJsO1n/ncEHEZcz3IWbA8VhmAp5nAPKLC3+XFvMq0mNtosGsCp
         fOD997wfE7u/dcP0X27THRSDP3t1ySFo0JhevRSxGuDCuu8DqSxEV5vw4oABCxknjLYK
         Qx9ePIQjujGqjE3UaL1K7pxbJh6/Y1XYV/TGKgVR8IZPy9rJW5eFlyZYBndhVqYMvxFK
         RPOo2krZRnG74ZFCqm7z0dcegt1AvtztWfEF6zUajkjNif9RE+f/zwOqdyR98auLQ66Z
         Cqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736462388; x=1737067188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
        b=ttPTxbnd7PHVbLspoO5Y+b6Deb92tP6PnJWnjqlF3Bpt9UQn7sZHDyMF/bCldkGQ9P
         SxkTl9z72VG9KzqrK7k7f6AzR+7qBKziNyBzW5Xy4RhC1bM8iJ2lQmkkOB5mRYoIOE7W
         Ts3szFOyvbG8pyrdPMfzMGPYMim8SRd8Ot/jcjGWgNXPS9DXNV/P3TOtooMfZIgvwurZ
         uYmUIZjtFgSnPDT+RQUDeg6SNI7l91LETlV/AntCXRGtkpI6DDy5falY06N5DydRma9l
         KxiAHCfdYjlm7s1QyoZhgrmHgJfboxilZ1923uBJIv/Jy6AyaxO/0Pbs52kG7EP7oK53
         p//w==
X-Forwarded-Encrypted: i=1; AJvYcCXTK56Ol55BV5o2LL3BXu7cJDGMaVQ1I5YgFRtcLOYp7x3alr1YszRIxcA3LlPWsSUjEjvwPXasVSS8OZot@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfIUIcjQPn+2/PYGDfHlolZGuDiaJpMuAZemR9yEag3qeCPdN
	C17NMsDhLY2umLGnKdhyeSWtJhyPTWoZUxKN6uzKavrng8KiSnWMaS8Q2SZxdV4=
X-Gm-Gg: ASbGnctJhiMl4iU+sz23ZPBeOZQM1ad/3J3tcBRQgS9jwGRI+VWWZMeBnD+fv7V3PaO
	FVqwW3xSI36GC4KnFBa/UdHrmtHbhnjz+TWgzCY95XR1NLXu/n4qBbRDjaALmVum55v6/TpxdLb
	80c3wrL/FKqS5bI8cMv7VSMTm0HPg7wpJKN3p6H1VWF6lXO5zhORgM6+9tSoGseoB0mmvLXvK6k
	T5x6MOPsQ+fk5sJ9n4knFhlCd3fq/Yqs9YC7q7NIccqsYoKYt0QVCDOW7c42LIZk/ReEMp96f+s
	vpfQ0HAsVizcbGVI4QCBI8SwYK67COw4SWQx
X-Google-Smtp-Source: AGHT+IGjSVrLD+BTCfZfVNXTNwUqqxiO45ZG5ef6NG4hf2D5QyOSBg9wrPZDTY0SG9oxOVZaANgBhQ==
X-Received: by 2002:a05:6512:3c83:b0:542:2929:63ea with SMTP id 2adb3069b0e04-542845c1e8amr3117213e87.24.1736462388248;
        Thu, 09 Jan 2025 14:39:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49eb2sm321608e87.41.2025.01.09.14.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:39:46 -0800 (PST)
Date: Fri, 10 Jan 2025 00:39:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
Message-ID: <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>

On Thu, Jan 09, 2025 at 02:08:37PM +0100, Krzysztof Kozlowski wrote:
> Add support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mdss.h |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>  	}
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> +{
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);

Nit: this probably can be folded into the msm_mdss_setup_ubwc_dec_40(),
but I would not require it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +}
> +
>  #define MDSS_HW_MAJ_MIN		\
>  	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
>  

-- 
With best wishes
Dmitry

