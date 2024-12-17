Return-Path: <linux-arm-msm+bounces-42517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C79F494B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691FE18928FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76251E764A;
	Tue, 17 Dec 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/6TyF+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2011DCB3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432903; cv=none; b=J8t1L7iT39Ena6HETeIGP1mPT6UWu3sB6V+5JHT2nqkiNfxqSdcMt7ANLXmbvD7YiTJeM4y/MIFcx679daIYNQAZ3alb3WajJXVNbEK9YepVx9LBul5pkSAWme9lOJkHMo915+dsWVVmyzSaqL9xHQJ5P58zvmT8+FpDtLLjadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432903; c=relaxed/simple;
	bh=f0wiDzDBtnzmIV3VrgFkm7LanaG35t0eZwVYsqtV5XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHUMD3j5+zWdn17kN63B6jw43jd849Q9+XdY0bBr6IVt5uFsoIvz1e81Mw7dsJv9yAjHotLDk1SbVrErOcSndOaPLFuK04YZe8gG2GFfGDACRtbJJaPxCv2StmSXHpJZTCg1N+6tO+8OQEgwUVUlWsPR3jJjP+tNgmi5YS0+L3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/6TyF+x; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so7289896e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432899; x=1735037699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
        b=n/6TyF+xrYzl1S3GHjni7IlyxBaredY5xCgSTIzGFQ/V0s0HPtR+woCz5AawV8/1et
         +1RTCPh4n7/g/mZybJM8WTrbGCEyYOYxVSHj+kT9g9E5Pr2jj/zp/hh9sEw9fWsrgi8m
         zRGLkSc4/Gxrg0NtBR+ZL+3Iy5YNryiRooh7pzSOkaDRFjcKK7f9XhyOti1ln15CK2Vw
         OfBICCp745gJqe6A6UAzzJqXI5iymSvNb81IHnJnEd89e6cZno50DjdhxTfRuvzKIzJD
         /6WhT7V/0Mz4MenoEnWMLD39t6NKlmP8TUCdbIhrfAhhRmBo41v17+r1iDsUxV1GduQS
         ujwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432899; x=1735037699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
        b=qQ6UxFVhhWkdTZwP1NpspG5rCu1ublaSg+5QD5n4pztXFrGN+d7BkHrluAmemw8630
         ov+5+potkqW5MWILgm3Q6zoTR7nhXRxNjqebKmGix3FUHntH+D+YUKZK5Y3TZMhW8Hin
         Wpx6qFdSHmc1yN76AyLbuO7sve50yhUuCN710jt1TVzdmTnJ63Uc+8Qmd56HBIeAtPUl
         N7RK0J2773dEXBMac6QN5kqN6Zk1ji4VgxLwDq2zPkzjQU6VQSZrUaMq1KHurxJqbYsY
         InfzLf3l9eWrc2bJdlOhGPrunVIU6d6zyxgUnI7mPiBmBfDdflVpJ6jgeRrn43MU7xL8
         wZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvz9UIgGZrr4GQCccyN03ohC6xMQAhaC9W894RmmUeC5n6POk0j06RBHJNcjERxgCmXGt5EaZDKwBreByJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxwRXYJv9rOSjpEJ6nnzEQ+5P3qnoQmtob6tnPkRD1XlAVhHA
	iWpDWk843mOSvIZUUFzzRRwDLPBLF/dBlw8PZO875z3jjmLJDI2GRqw7/fMRS3U=
X-Gm-Gg: ASbGncsNEQYSDbD1WSDOkTr0NjrV/vilRJguP9Ehr7/MU0x+MXleMFQB77cl2xQzvz4
	3tyw0mCGWIXAVBbo/VQAg+IDQktRFnUISPJKqLlJHe/2Wu2qS3wT3HVRERh7FR9lzNmz7mQ3hvW
	2YoLitvgtxSvvU3LOIxEiqmyGoRVl6BvQ9bdqVbIomDYPyO15l4EGUFW6BE9S0yCmxG2U7+UszY
	jEgaEgICGs58vGpj5axITM4X/zP0RiMijOsD+RALLkDgt9fjg2ve4wcakq2VleGVhj+5hbYWfUk
	Q4WX8lLrV6ZGeWfOAazzP9aTrwR95JgsAkKu
X-Google-Smtp-Source: AGHT+IHIIXGB/X+gwvncRHBdy9tDryU1EfA09rbZDao5aKxh/K7dmzH4R4ChpaOmldxWkT0LNMbwvw==
X-Received: by 2002:a05:6512:2809:b0:53e:362e:ed0 with SMTP id 2adb3069b0e04-540916d7331mr4458490e87.44.1734432899164;
        Tue, 17 Dec 2024 02:54:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1fb46sm1125836e87.235.2024.12.17.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:54:57 -0800 (PST)
Date: Tue, 17 Dec 2024 12:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>

On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 257 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h

[...]

> +
> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
> +	.mdss_ver = &sm6150_mdss_ver,
> +	.caps = &sm6150_dpu_caps,
> +	.mdp = &sm6150_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6150_ctl),
> +	.ctl = sm6150_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6150_sspp),
> +	.sspp = sm6150_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6150_lm),
> +	.mixer = sm6150_lm,
> +	.dspp_count = ARRAY_SIZE(sm6150_dspp),
> +	.dspp = sm6150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6150_pp),
> +	.pingpong = sm6150_pp,
> +	.intf_count = ARRAY_SIZE(sm6150_intf),
> +	.intf = sm6150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6150_perf_data,

I noticed that the catalog entry doesn't provide writeback configuration
although the vendor DTSi specified that there is WB_2 on this platform.
Please send a followup patch enabling writeback on this platform.

> +};
> +
> +#endif

-- 
With best wishes
Dmitry

