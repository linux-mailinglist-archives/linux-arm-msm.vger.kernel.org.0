Return-Path: <linux-arm-msm+bounces-47922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA2A34ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB86179028
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF56A28A2CB;
	Thu, 13 Feb 2025 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N728a3Y3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4928A2BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464934; cv=none; b=IB6MRn5iPyyyXAEx0d1Kxyk/5SlO6Bf+6qBvYzp3I52i7+eQni5yG1uJm1XQj3WxJhQj5k5tm06DlxEcB1tMvdQHwptUzmXjJaPmDIsFcP1yzNS3/D3M71qlQhfF0wrq0Lp4qLcWlP7OA1QW36bwODH61Stg5tv79j1b3Nj1oyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464934; c=relaxed/simple;
	bh=NQGhOKxdr0VFUgwzEQPeEJr3Wopll3rPHlH9KoZwD78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJk8cHFngrGfy8sXjI+tGxDPhJxUZnjgQ6XBhx0pQW8CQJDM5JyV3EPMpl/yN1F11ikGYseAFqVmN16nxhh7u/OmdQqmVQI7AkIWuy7NOtDrWzSWPS0oLjmlNWu4r9xXt1+Auu1Lxmx1QihPbq71He17c8SSGZ1JhAxTDOfvH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N728a3Y3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450cf0cb07so984931e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739464930; x=1740069730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
        b=N728a3Y3iqiyKsZ4/85aF6f5Uxoga5Z4xt6jfpsPsQSrdTkiZWN3DT932ujiYK9cvO
         3tX1fN+ZxCKq7nMqUl7qyXSdOMU2ulE3uXybuio2EeZBjKsG6oejIjV4ks/eAmR35N2J
         uDMyRvAr1j63i2EX+lQaoNI6gMH2JUQ5uDP9DozoHFQ/pKg6QZtNuTKfTa+muolhSFvt
         EH1Q6TJJ9G8v5pt9qyww+75AYJWQFyopwjHpkMUXEFeTWvYKZMWr6F5a8tJsXGFY1nLv
         L3ipVYbyN9oBeJ95tXCLfCIfORsJ508pCtxlklsSZsN6jzlalegRcW+k/OERH5A6s5gG
         +7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464930; x=1740069730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
        b=hhJ0/2vgJ42uaUFZgmzYDIFF/xZ0yXIj7bcwhPw8n397BebTWpB7bIUXfQR6ROr2cB
         ehz/RqJKe2kwZexXNUkgQt6ZytzBYqL1ZBPRlEzGBTiG/7GU/ipfADXs7yfWr6MLNk3s
         gSevw3Ht9GEYBPmPwVxKaQyA1wbg+VjBkycrDP+8RpB8unbh3JDRCHWOvq8AABsYQT6B
         hSA3KMVhZNoKDWIR0+f8fT7RTbQXM78vGz3bccm8GJuYbrPGSFmkZmApMojRYo4aq12j
         Mb0GjpLB/Xnc0VOiXv1DdtVkEq8H4Exxrc81E/98PkpdNora6CyaNQ/ZnP4J8FhGb3Xl
         FhNg==
X-Forwarded-Encrypted: i=1; AJvYcCWVBvnZWHBUxld5gfW83xmBll5nXsaPcIdC7qJhlYb0Kkh+Gd8iKstrXs/vnQJldXVz7tZL/Jlo5Kd0lK0D@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNGTCq/xpZJ37zgmz3WEsRpCyom2hcMCXHoRnY3KGSRwmYUgn
	eGNFWxQrfEnwSAGHSVCGFxgS951Y6Wq4AH9il/t9vAD1ZcOyBrmbgnvoaXT46rQ=
X-Gm-Gg: ASbGncuHtOK7EJe2BRYGofpIZcJ1UvE7zsfA73bwb88kpU++sNtFcF4Dm3lyjNsQ4vJ
	QYDJvW5NVUPrWNu/bEJkcBAvCWRnchvJE9Hp/W+0XuJ5LHGxbgJPx5x8tMT5rhJMNC+O3JGtRAt
	JEmy9OArRkzVSGir3++gC7pXEx2nSKf+n7qDk6Y/tWynJ/clxzht0CvziY44uG+KxGuoXYNCBqS
	sy1OcZmIcLqLsRrv1EJNBoRZK0AQWn9BNzw210sZdtgCwN2I4ADKAQk0cDExlMKM5bTJ3+R5ZZb
	RNizVvDO7emT1mFB7NVb7+P1wGgsc/+7/CDSkHTfICn8cbqg97bCqbQR8gFH8fxQpP9Yd4A=
X-Google-Smtp-Source: AGHT+IEK8JK5DtZLaAkJMolAlSlboIjYitOyjK3vekr4hRL/4+W/nuknTnupS56IhVxnTVQaQLo3jw==
X-Received: by 2002:ac2:4e04:0:b0:542:2e09:639a with SMTP id 2adb3069b0e04-545180ea26dmr2471042e87.10.1739464929907;
        Thu, 13 Feb 2025 08:42:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09d0d4sm218066e87.100.2025.02.13.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:42:08 -0800 (PST)
Date: Thu, 13 Feb 2025 18:42:06 +0200
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
Subject: Re: [PATCH 0/5] EDITME: Support for Adreno 623 GPU
Message-ID: <wdeqpz7ckpzw5sx7pigcp7fjx7nf4irz23kvj6xwamv34vfyba@rwzavxd5o6o3>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>

On Thu, Feb 13, 2025 at 09:40:05PM +0530, Akhil P Oommen wrote:

Nit: subject needs to be fixed

> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Jie Zhang (5):
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry

