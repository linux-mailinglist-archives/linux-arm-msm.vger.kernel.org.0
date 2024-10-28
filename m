Return-Path: <linux-arm-msm+bounces-36127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25DE9B2A2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023671C21AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8806C1925B3;
	Mon, 28 Oct 2024 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVip6lkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C969191F88
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103997; cv=none; b=H/cuRBnsb3L5DbSTRLPH0X7XqxG07uAQUe2kTjs6d1lsP03y2V059keoSi2GgVOC5gV83xnGrTNuxZd5fKAd7ETIrNzC4ytS/qDNy+HAfC5sLncOQwNRWzCb0MAC8i/2uMVcXHq2OnbEgMFXfNVW2LQ1RRlKWvR2o20QwHnu8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103997; c=relaxed/simple;
	bh=WB9vc9RAyVjT9j6XUyDnlnoza/GmoegASd97Em2M9Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQqHT4SLyISCC2/IgKH32YsKlw4YqkJP5KYVBXhJxHV/vd6pQ5+IdxUsTvRzLnQUhsMgYZbYXJptEbPZZeAe3rKufbRe9LN/XijHz350nqyjrpLzck35pYRr8+GGMvjZlLfr+y/TuBun3eEgS7dN2k3QKy8eUHYtJyFHWwcfVas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVip6lkc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e6c754bdso3425889e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730103993; x=1730708793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BITs+5gpronmacO+fw89Zra8b9FvogOeRWU3QBgDY7o=;
        b=rVip6lkc0W4DGYecryo54GDUzbI+FQe7IbQqf9FhAQB4CWMVyVZWMEmKXPnRL/uPAH
         LGReLNcJNLlZUzffY5tCZiUI9ICu2cKYK0HF1JC08wWv+9pmeVFsEdbuVglQoF4rdAge
         gBXy7RUgstHTOO4Xac6vfnm6a86uI+tlHq/zPRoLeL6Pb9FbQwEqdgjfBsleiMjUR/d2
         fqmYy+7fVsnJwUjQ0VeCLPhhgrkbtW8El2JJ3Zsvm+c7FsTco37a3udRwbEoIm3BJ3Pu
         ChwSHcdIDF3kuGdsMQj+QDjnT1gOwuh9T2fPXUN4Zvk/KlIx63CZxCocXbyYiNqqS5hP
         uQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103993; x=1730708793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BITs+5gpronmacO+fw89Zra8b9FvogOeRWU3QBgDY7o=;
        b=GI+PCcy09hww2HLqZDGy5q7hQFJcaKmaS9UAhWe3KENqL6iRGgXDqK8p7zByUbk4Ym
         VQdNXXTqt19htcPtRs6LnyOJEiw6ZrjWAfgxvSj87Zyx+VjmE/qOOFuuT2Y0y7s2I67j
         A4T8luebaSYDtSdsd8R0fmo7GQfRx42hxf1jrHl3ap+0yrWhb5AFC/FpAXd15W7u7Yaa
         s2hyu8RlOnliolvSsKIvRW38BfsExoaAGwXTwQ9KPj0oyNN6MV3N0p+t7D6txr67CC5o
         PTmarBOXd1mcIINV+3WPh8cVtkc5+aS3XLkOq+MVaTsxEJL9elXngXOzMnYH0f0SFGWL
         KC3w==
X-Forwarded-Encrypted: i=1; AJvYcCWht0V5hJciCx6rUaH4ExU9rSWARrkVN6OYuMIaV6bv/1+PJ4xERQbSeFUunuJ/+Dt5ZRjfdYb/zCCQvhBC@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8P15V3pdqw2aoAkD6/E/l6HP1GE6Rqa50CUImA8fY6mZpAJ1
	R9zhyqGbmmXc3Cjcfs4WzYKh+HgK/VeLd708gHElL+uYaRF3NG4YcyV9O0c24TA=
X-Google-Smtp-Source: AGHT+IE24xL8D3SXnXtqdBNqbz4ZSjA3URQxIZeML7v4SXR3TQncXvcqFR43I8ZLRP9xsv6pszixKg==
X-Received: by 2002:a05:6512:1189:b0:539:ec87:bc7f with SMTP id 2adb3069b0e04-53b348d63ddmr2953106e87.19.1730103993172;
        Mon, 28 Oct 2024 01:26:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a47asm998715e87.1.2024.10.28.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:26:32 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:26:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>

On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> Clang-19 and above sometimes end up with multiple copies of the large
> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> fill the structure, but these create another copy of the structure on
> the stack which gets copied to the first.
> 
> If the functions get inlined, that busts the warning limit:
> 
> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> 
> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> the stack. Also, use this opportunity to skip re-initializing this table
> to optimize gpu wake up latency.
> 
> Cc: Arnd Bergmann <arnd@kernel.org>
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 94b6c5cab6f4..b4a79f88ccf4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>  	struct completion pd_gate;
>  
>  	struct qmp *qmp;
> +	struct a6xx_hfi_msg_bw_table *bw_table;
>  };
>  
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cdb3f6e74d3e..55e51c81be1f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  
>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  {
> -	struct a6xx_hfi_msg_bw_table msg = { 0 };
> +	struct a6xx_hfi_msg_bw_table *msg;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  
> +	if (gmu->bw_table)
> +		goto send;
> +
> +	msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);

Is it necessary after being sent? Isn't it better to just kzalloc() it
and then kfree() it at the end of the function?

> +	if (!msg)
> +		return -ENOMEM;
> +
>  	if (adreno_is_a618(adreno_gpu))
> -		a618_build_bw_table(&msg);
> +		a618_build_bw_table(msg);
>  	else if (adreno_is_a619(adreno_gpu))
> -		a619_build_bw_table(&msg);
> +		a619_build_bw_table(msg);
>  	else if (adreno_is_a640_family(adreno_gpu))
> -		a640_build_bw_table(&msg);
> +		a640_build_bw_table(msg);
>  	else if (adreno_is_a650(adreno_gpu))
> -		a650_build_bw_table(&msg);
> +		a650_build_bw_table(msg);
>  	else if (adreno_is_7c3(adreno_gpu))
> -		adreno_7c3_build_bw_table(&msg);
> +		adreno_7c3_build_bw_table(msg);
>  	else if (adreno_is_a660(adreno_gpu))
> -		a660_build_bw_table(&msg);
> +		a660_build_bw_table(msg);
>  	else if (adreno_is_a690(adreno_gpu))
> -		a690_build_bw_table(&msg);
> +		a690_build_bw_table(msg);
>  	else if (adreno_is_a730(adreno_gpu))
> -		a730_build_bw_table(&msg);
> +		a730_build_bw_table(msg);
>  	else if (adreno_is_a740_family(adreno_gpu))
> -		a740_build_bw_table(&msg);
> +		a740_build_bw_table(msg);
>  	else
> -		a6xx_build_bw_table(&msg);
> +		a6xx_build_bw_table(msg);
> +
> +	gmu->bw_table = msg;
>  
> -	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
> +send:
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, gmu->bw_table, sizeof(*(gmu->bw_table)),
>  		NULL, 0);
>  }
>  
> 
> ---
> base-commit: 74c374648ed08efb2ef339656f2764c28c046956
> change-id: 20241024-stack-size-fix-28af7abd3fab
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry

