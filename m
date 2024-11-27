Return-Path: <linux-arm-msm+bounces-39326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D549DA8F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6110416527C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EB4194082;
	Wed, 27 Nov 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4usPjMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAB38F9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715209; cv=none; b=VQC/KkkpVYaqrrLgwJw/JBsow1KdN4Nmdq+OvvDJom+2CCwS+Buwxsc49btjdgV6kj6BNqFquTStPHqbFqDDw28vL88SGUb/oOpn0Jz1pDMy6r//+E5zfZwuHroK7E9TOjSiVYN4XxyU+RQ6+JKmxVh2ZXsQqowUvQ7jxnnh+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715209; c=relaxed/simple;
	bh=EK/zkmdAVsGvitfdRZrtD+a5V/TGE1Ft/RwwCIWFl/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2+jWP0qY7gFDkeepHReODMP9AqzQtweZVW0ZHCxHwoAZHwYtcbuowJ7jbMue7nDUEajGWbN7NG9jHsPH6fhyBLmm2QmbnqXb9IKSMwjwlPDw5YCls2gZ5PIqamektoAKSD5BRBrRXeSMpVlwzDccshkSXFyGlT3GDu7pdNj0d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4usPjMJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffa8092e34so65736831fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715206; x=1733320006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
        b=Z4usPjMJ5idpwroP/1zv2RQ9BvDNshdP5HDzzkxJMeS/5gIegrHsxs1pBEZGwSmmnu
         JKlOcABLxoNNtYCVgHTuR4VKhcZs8a9AY+G2uXHftVb3xBGOkvEpxBuAQO4wutjudOZO
         /kxXtkyUv9XrnAi3HOFcKcYjO34KobWd6Yq9UuU6IPSTzUbPdcxSNt63eqJFLNxh9fH1
         1EC7FRGAWkrhG29sbkxB8VBla8uYMZTuZYTdDVd5uEUCNu2BvSN4BUjum9WSDZ7eDssz
         RWM0Fx/Rz+pfWwn34YFMB3/KvZ+NBHGCSC06oTljN2Hupja+7DWvrYKLS/2RHnSnVLQR
         DWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715206; x=1733320006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
        b=hA0tEwdjl/LiF1A7i+JSjaPZODNEB1EPGEs2jPc+bsW6eYbfHcXI/+33ZuLyFf+uDz
         UsdctNKnwUzLxOVW/yVIOVNwJHM9ukAymTgx9cNZQk+M3Nd1eP5IJmgL9gv1BJjG26KP
         BVyoDWJa7ZSi2aGU+7OCx5TcmOZyPi0N1u/PrnWfIDBhcUklVnkwoIq88cL1FzgyM1W7
         RK047UVXkUSa5SLRxxGvFTbwPdayiMubCUxJ41Wc4TfSemb/yYWvKBOKeuirJE2CqDU/
         X6f2fmg6VbqIWcd9ZaBGVYD09IP8afFayUx49nnSu3ou70/8/U+EHQ/t9/F5Q7Ql2T6B
         Jmjw==
X-Forwarded-Encrypted: i=1; AJvYcCUZVtu9Hw34ONQxdSAYm5LPP+jKOtR1Mxrm0aGa6ZEnaj900nZesC6l2kPY9UBi33AwK36DP3oRZc4sHJXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJFrTQuGQSVbBcGJ8TClMLIO3x7VluNFW1IaV2O5SVsY2qszm
	9qTVvR4xvLJeRTYt1GbY459p7Qc+b+moYvk/9c35N9XatRaFyHrlT5fHprLjdmU=
X-Gm-Gg: ASbGncvnqrQ1RuP8isYNCMD9gno7GH2CpKXyotpPw4+vtX3smuIWjUhbHGciT+Ga/aH
	3RxlmQMu4E3pojjLRvxOHyVZXF/5eJbutruidvEGaAiC1prKmrXDLkHsqyAjwzPRKi40cgOoLqu
	vRVo3jIBz+ZC4g4WWLt6KPORAZ3idg7uRelhhnrsd8rwY/Ub7DlE7Pb28fG6iOsvWEZyAgnrLkX
	qfO307lIrN9wJsXCFyJU8b/w8J1DiseNnQyy2n1mAUc3/hy457ZbQCRGZXzemPB3+xVAUbA7nDJ
	QILHL7QyFjjVbIMDoW93YnVIpgHWlg==
X-Google-Smtp-Source: AGHT+IE5YvUnBxv51yjqkhV3Fi45R5BfRmA/OHDbr1MX0yiJhZssNxaHBIh9Ihr9OWpmi0uPhR+jZg==
X-Received: by 2002:a05:651c:220d:b0:2ff:a8e9:a64d with SMTP id 38308e7fff4ca-2ffd5ff5131mr17990441fa.2.1732715205762;
        Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffd3269561sm3194711fa.45.2024.11.27.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Date: Wed, 27 Nov 2024 15:46:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
Message-ID: <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>

On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Please mention, why do you need it at all. I see that the UBWC swizzle
and HBB settings are different. Is this really the case? Is it because
of the different memory being used on those platforms?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>  	.reg_bus_bw = 76800,
>  };
>  
> +static const struct msm_mdss_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

