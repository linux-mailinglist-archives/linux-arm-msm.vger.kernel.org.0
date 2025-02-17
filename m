Return-Path: <linux-arm-msm+bounces-48278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6896A38C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C93F01891664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F622376E1;
	Mon, 17 Feb 2025 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYIRFwIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD38236A70
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820170; cv=none; b=WMnPDh2qtsNSQLjD78JMUHs9X1ti6ZWHDbcNEhtpuCyBwvuo1O6Z9nBn8tL6OzijbEDr3m5zW/f3J+0rVFAOODp44t7FxN/Wbb0Fdof20YcNnc8ggnGZFzUJVjc6crQrBMunHaFrZqbLwYnbztO/zmiELldzHyNcXYIkrQEGBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820170; c=relaxed/simple;
	bh=DBFznUQ10XYbd2xY/0XWHPMVY/S6KZNXCx5PcbpMQ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QihsPVyFEMtKsOU4UPk31mPrW4SofQSrILjBnkhK0bjkvU/NSv5+6f25NY7WpDqXKpMQ1XxSGLGvGfCU2ZFrZHL68wIqYAyhy006yXifunfwhDpcsDxi5HFuvfAaySERq+xb+RQtMcaSwj7xC0RkSelB8fAHUK+fmwwGjhfq39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYIRFwIn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54605bfcc72so2154068e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739820167; x=1740424967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
        b=BYIRFwInNL6smcOrsQPQLtVPTpYv84tn+0pDRGbvQSewcU1u5Zikz88xAPDV9w9oNH
         Q9kZlTohji6/4ePgm4GFV1hQbsr72p2zCxGOrTeIWMNfPSDHoDk6N+Nqd0PsJsfnN1gv
         eAaAq1MkSg4bOTDobt0inZjQGul2yBsADekpis5MV83SPGY7y4tHNO8W4hNY99nRFs0Z
         IaI+o8VGDQbFfAZAySZ1YAEWJTPR4wioyOccU1XKfhWpQKVDaDadUc0n2MUs4KgFypDy
         /rNZrk0WEl5dIweKUww1uNVF65Jyu/zyKROFF2UjV7mRq/6J7S0LDW1Fnoyg7+CbbK5a
         8Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820167; x=1740424967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
        b=EULAHumUcYWT/BQf5whyB9YEvhGirx9iGAHSlAR25RITkaXNe0sjoXF+ZH6sVe0K45
         PTjIJDE859ukRRj88npNPWLlwQAuBfYrf2PoCDwA84vAyqXGgclM6COBDW6uRH1Yt1/T
         XWzTtC73aV5oA83Pl0eEEPq99IPX7ySCHDOCdd/6CfL5TpDQan0MR0jgNFwjrt0VatrZ
         Z4oxHmdVmCki2sqFO6RmoMYEGFd8T8PkCX7SioB7d+3KZ0tf0ccJBwI7O9ZuaV2MX4vH
         ZXyqPHn3B2eEU4mToXfXKgGb6N6PmSX9C4+axTWhtC3MLSwNMwZKtsjBVj2ufMLzTlG2
         2Lqg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTneLGN4oLmInuau9GyXm822TuFaQSaNaplhMqC0Nh2JFV8/PyIDCg81js6DV/pibQeJKRdZOWp5gixd0@vger.kernel.org
X-Gm-Message-State: AOJu0YyibKy0GGOn7afVHHc6Lyem64vU56JWJS8Qt4pPqn65gBoZmciP
	MyGmQILLI+qx591g+0Dx0GF1BXixtn3JsxJLUBVMK+V5u1ByBIGuOW0HNTGEEwU=
X-Gm-Gg: ASbGnctYIVhXO8hYYjJavWWYdAr9fliWBnCmb8cqYKl6pbl2m0aCC6ymissQHc1eR8q
	lQN1RX1Ze4pzp51wMw7jbNwn3iEF19D+Ze1lZw+WWd7mXCEb9JRVmEDOOlCgSlX5G4pTCHF4MUD
	ZP7uMtHeCLg+oo+FXOPank6Cj7EKoXT0Za+UfgLnRDcu83XnVFPv+QC6wYXmyMhMC3VISq3RLIZ
	4sBXB+69pEmg49/NoJ7GXZaxW75Qv1uLI8TYcbQqJNxB7hAp/bbZk4Da0xFQ9QB0L6qwB/iwJBJ
	DTE1BQmQMh6U92f+RXhWKjFExYmNzgG4XNzqX9uTEYQo5L1LgaR9wpy6KTtHXVuP9YlqZNI=
X-Google-Smtp-Source: AGHT+IFlV1UP/wKVxhbwSwQTJ2SEmKZ4/rOsrk8g+x6pZhmGCoSOJCnGQ4bptI2YGeo2RC0BYkCcnA==
X-Received: by 2002:a05:6512:108f:b0:545:16a8:6a5d with SMTP id 2adb3069b0e04-5451dfc13a5mr4931403e87.2.1739820166729;
        Mon, 17 Feb 2025 11:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452cb59c35sm1293957e87.203.2025.02.17.11.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:22:45 -0800 (PST)
Date: Mon, 17 Feb 2025 21:22:43 +0200
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
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
Message-ID: <w3i4e3hkbemmjdbzp5kevxouv4smftsnzml3wa6mkd2e7mzmi6@op2uaa26kz2z>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:29PM +0100, Krzysztof Kozlowski wrote:
> Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
> SoC because it's duplicating the actual name of structure.

Historically there were more SoC-specific data, now we are really
limited to the LM sblk. Maybe that points out that we should rename
those to drop the SoC name. Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>   * MIXER sub blocks config
>   *************************************************************/
>  
> -/* MSM8998 */
> -
>  static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	},
>  };
>  
> -/* SDM845 */
> -
>  static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 11, /* excluding base layer */
> @@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	},
>  };
>  
> -/* SC7180 */
> -
>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -/* QCM2290 */
> -
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
>  	.maxblendstages = 4, /* excluding base layer */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

