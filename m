Return-Path: <linux-arm-msm+bounces-33863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252799873D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08C6EB25F4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F283F1C9B79;
	Thu, 10 Oct 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYhlM4sM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BBB1C6F76
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565849; cv=none; b=VjT5e6SYIwHHTe4b2iG3L8d4agjhNwK8TgeJar7LwTLArXgigbkhPs2H392KjskMZqhrjsUb4zrfJQ6H3up6BKa9+U56yx+/t4flYEtaYTnWHjPuA7UmPtsH8oEkGMPy4QKc24M6O7fDgwAHHAd2YLDvzssvHD04s8Z8ydm1wvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565849; c=relaxed/simple;
	bh=Udd4pn2glGSczcTbf2nYjCAZ2rxzz7yJMHFlq0uAeQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3o+PGv/N65VBpeSxAvEDST+k8eZ4t8YT/z3TPvLBqQuaMGZ4qgcK7iA3ZgyIA6OkrUi7QNC2VOVHOmHSA84Z0vC/+LTewJrhJ1YuClboU233QrYO3EbNxZnlwpJVNx+mrwYp6UGbaFGjRGcktl/xPzMM15jp+KAf9cxrbEul78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYhlM4sM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398e58ceebso846857e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728565846; x=1729170646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pNpS+njt9cPkWZ6/CJqsL3zGajZBdNwsZNIu0dSvWo=;
        b=cYhlM4sMHU8P8R+7gLuWMKvyU3dW72JUvUnWCYWhGXBD38ySIcrfIf5Fr0TO5gRg6g
         LkT6hSq92Mx7ZIBEohbIarYgOsaUhtGJyielmljFGkE963NkCTc5dNpbjqw5lJSPn/cI
         CyCFxqFq5qggIU7Cu+ltjvYki/6wBK65E3SRGl/xGGlzrqKUiIdO/zzDmZ0tbT1aKJ/T
         6Hwubs6vzw5lyGCN9J9Busgxxk2AZOgsGcjl9N3qbnOGYWsDDclNhttzCtDQoaw/iwzo
         qdH86Wk8YjxMh4YXrZBzFN6AWpjc6HnDj5edgrD21ie8XdUBqjL6hD1eQwlXFLG96NYc
         cjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565846; x=1729170646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pNpS+njt9cPkWZ6/CJqsL3zGajZBdNwsZNIu0dSvWo=;
        b=CrqgE+47RQT7zQClpJrAfps+nqdXxut+LDbG6lkQXT8OHiLtbv7/MLFAxWr2vkPiOU
         fsXlvfHDIRzt6zk3pUrjh8TMRMXW7TVskN1NgH4ch6ZPU/NTIjzyvfJlPSiL8ck5PvP9
         9Rn5CePWH3ctXpnt8600MxezgauOwBUMY48VEdrWZRhFXDM0lT4HsDXmO7jatsQDSJJB
         Js5SE9wTOmwwCloV1huvo3MeXkx3e1CsGYGWBrLGrr+GLwW/rri9+92pPIIBJvq0Yvgm
         7t8U/XjAPKGG9Vm9WzftHNI/5nC1A9q/GdPX+r8lFsiyv3xBUNa7e7PKgPoyZNIDTCmM
         H5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUBBcwSB+AFXfWR8iB/1kxdrjw76DA57/fhBbbp+dgFqQx0YuMOVmtPOqlmKNCDhpyj9dVx3w1P0eaSvnI@vger.kernel.org
X-Gm-Message-State: AOJu0YxefW7pITUsBEYlg3uy/tLyKXqv/kJskjH7ANFjWF8Q03snXyek
	dlpD3GD9wFN+JqoMCb12nOAkSL/WTEEI9Q97K8cOxl2G9bpS8JtEsJAiGh/tiW9iEa6C1WXTs4E
	eXIU=
X-Google-Smtp-Source: AGHT+IFhrlaouxAJK8Q5oz79aOgKS1/HVBFwAarBhM3XTq5eethNmfRnt5mwLzZOc/yNhCF/pyuHOQ==
X-Received: by 2002:a05:6512:6409:b0:537:a82c:42ec with SMTP id 2adb3069b0e04-539c98689f5mr1180968e87.4.1728565846042;
        Thu, 10 Oct 2024 06:10:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb905aabsm247052e87.295.2024.10.10.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:10:45 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:10:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] drm/msm/dpu: bind correct pingpong for quad pipe
Message-ID: <brvjrwnwzkbobk47xb6i6ulzxabigsujomx4yhaa7oy5vrwvle@tn2ni4wcvdee>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-7-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-7-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:20PM GMT, Jun Nie wrote:
> There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> interface to 3rd PP instead of the 2nd PP.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bd2509985c4d0..dfe282c607933 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1100,7 +1100,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_pp, num_dsc;
> +	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1171,9 +1171,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	cstate->num_dscs = num_dsc;
>  	cstate->num_mixers = num_lm;
> -

Nit: unrelated

>  	dpu_enc->connector = conn_state->connector;
>  
> +	/*
> +	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
> +	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> +	 */
> +	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
> @@ -1195,7 +1200,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  			return;
>  		}
>  
> -		phys->hw_pp = dpu_enc->hw_pp[i];
> +		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
>  
>  		phys->cached_mode = crtc_state->adjusted_mode;
>  		if (phys->ops.atomic_mode_set)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

