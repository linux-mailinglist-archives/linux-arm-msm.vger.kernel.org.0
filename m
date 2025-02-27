Return-Path: <linux-arm-msm+bounces-49770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DCA48CC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 00:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 812BA7A3316
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 23:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4E3276D0D;
	Thu, 27 Feb 2025 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Awzz1Z6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49274276D0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698827; cv=none; b=ZBH4D6MOprAmadllXQVPpqnkffipiENDZj3ewPYuN9tJrikK8jN/KPcdV5cvcFMIVrkxnzk8XiN4RHx9A7D/wvleD52jVb7IoF83BlwdFvINsyj9N8qe10MsWBmUrr6jr8bxyaQqmAOVM9x5NDuuPAKjkkxkXRSUsvW65451Gl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698827; c=relaxed/simple;
	bh=vHArphDL+AF63sqMCEKJ2/8BT0u2aDwUEc1CXbvGc0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+39pAROzm7iYeYVHnQZ+VwPXfRx9BXKEaELL4YtVK5rSfVpITdbGC3FcWu4ruwohQux5tHIw1h5SS9FZhHJTCAcho6fuTqaHZEzoC3e1bAdEGyWBRAlwejIpSuSE+rjwsM3D8dqz99v0UXitPzGvO10yXl7fNzn+2ofu37XwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Awzz1Z6Z; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-545316f80beso1456085e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698823; x=1741303623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
        b=Awzz1Z6Z8n7F8JyYL1Qw34WCRENDCcJdmOFUW9XqZs5ZraNYJgsHtNTDjYuV+DS6FE
         0wclzxD8a9Iue3UuuNw+0SkbKwVswNV2+/UOpBDOdsNdO92CazZmI8W6iKyCEFdUqJGf
         TIHvkvBIUAF1Ns8f5AO+cAJ/nykg8xJTwm/QFQ1Wkhgqrr6d+xZjEcdhEkVDfWmH00j+
         aN1QcPjNXdCH7IutDkue4MAR0y1740Y3RcrZQ2mXVMntsp8qs2w5Lo5H7XPi93p6e2ir
         3gnLbsgAiGmPUWLxjRHQNZ3lyuPZVacelea+8XU8OLPw132o7/JQdU0VpZB4QPUsVZTX
         XRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698823; x=1741303623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
        b=dHQV5py4aD1CM/Si8guQttV4Y4oVSYeb9JTPUuWNgSLXNbXdOGRbJEY2f+8SzGX5ea
         o4BVY38R7qkDN7SG+ppg0189Y863DD3KocJ356cuRcnYOyo4D0TaVmuEYdiEmx9/D9bR
         EeE9wKbid9BCIQESQieMO3HYk749qFQL3dQwUQYdSJKZzWv3dGmXxA1nMLvmUAaHN2JI
         JLEB7o5E6q/YPxRiY4NlHoe70u7SWQqKYlEwgjz5RSUzE71Bl76EEc4YW2kETpxPo0Rr
         DCxYcoTj2Vgy9oT9HRP9JW9SXNgrtz3lAMGb1mhIAmK2yvF5GB5Q9QI0HyvZTx5CZtTN
         K6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXVtBFFn/KqgDcakLITQGbcXlU6dHhfI6XimdmpREQjdrR/BWuXuH1/Wx67WY+ktYsegbL4TixLprPaER7G@vger.kernel.org
X-Gm-Message-State: AOJu0YyVq0OGCpkZLv/p9PcpeFkrLVGkTgwDVcCJDm+gFuR+76JnZcEH
	hmHsXjJZaDeEfdKP8wl6itsqXbeNVe11h9y+JhbYfDS3dwLcnLSt/ovaltFL9W4=
X-Gm-Gg: ASbGncsQTRYjpDcCGQDEVavkp3BVrrPqBpOz1z1MHAgpfIm6hUBfhKredcp3kZO4Nmo
	1hFMtRuyecYOFJ404GDJ893sFcrs5DJGqsVd6nR+X+jayIVR8lAlPn8L/5MZjm7TSqfXUiTlsoh
	etT/xVBcRnwooNpVUX+o5jiH2NaGXlsnMo/bDWTB4fzrwaESeexAcUGAb50oI82khybym328gPv
	g2bK9OC8Y3L+czusRVcqs66E99Ra2vk+wjKTSPudCltqRHz/D/8nUvsPYnFWXyCi7LS+GqsYRro
	SdeJD8bbXohMaehjUPza1uvicuWJ+9EVvcv7o+/kDIk58xu46cSAHAY6ckuIOUWuaeZ017NND0m
	2Z8DyLg==
X-Google-Smtp-Source: AGHT+IHxjxlMLhD3oxVC5PDwEv4tONUbYy57JLfGirnQiWK4YcosMJV+1qf98e7hbSx7Q8klj5cPTw==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id 2adb3069b0e04-5494c129f93mr514211e87.5.1740698823331;
        Thu, 27 Feb 2025 15:27:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443be608sm299637e87.173.2025.02.27.15.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:27:01 -0800 (PST)
Date: Fri, 28 Feb 2025 01:26:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
Message-ID: <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>

On Fri, Feb 28, 2025 at 01:37:51AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..1820c167fcee609deee3d49e7b5dd3736da23d99 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.uavflagprd_inv = 2;
>  	}
>  
> +	if (adreno_is_a623(gpu)) {
> +		gpu->ubwc_config.highest_bank_bit = 16;

Just to doublecheck, the MDSS patch for QCS8300 used HBB=2, which
means 15. Is 16 correct here? Or might the be a mistake in the MDSS
patch?

> +		gpu->ubwc_config.amsbc = 1;
> +		gpu->ubwc_config.rgb565_predicator = 1;
> +		gpu->ubwc_config.uavflagprd_inv = 2;
> +		gpu->ubwc_config.macrotile_mode = 1;
> +	}
> +
>  	if (adreno_is_a640_family(gpu))
>  		gpu->ubwc_config.amsbc = 1;
>  
-- 
With best wishes
Dmitry

