Return-Path: <linux-arm-msm+bounces-33857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07F9986AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F411F1F21B73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD8C1C461F;
	Thu, 10 Oct 2024 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n012j9yO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5CB1C232C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564804; cv=none; b=MUC5h7yAzIxvfYtDqMlmBpHyI6aDuUok9yu9xuqoHQ44Ol7m/nkkOjGWnC78vF95QgJhXQq4hLbIaPdSwW4QBW4f6p6RfYQBfJdA8RMISLO+b39wZAj2kWD+EfNibyhaPxqfzouaosWIQnaTqj0LgjdgnPQ6BJdnzKHSaE/mgJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564804; c=relaxed/simple;
	bh=myeTo/pxwUDIAxSsZ3uQBrvRybPwZVALbNW55OINhLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiESBOY4iB1BlLajFYyZJnUtLzdHs8B3POGx6L3O7ajP/5pQF6aSfdXk75LKmYIYfmLX/woHBPWDcq/M390EmKA47BCTdw0ouQumbYj1n78h9JRXY/8kc/gvCZBcozVv1O4Q/VVMojmjkaRFkl0AOb4/aH7S7cXFLmtiOyCPqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n012j9yO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso827283e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564801; x=1729169601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOG2cvcIa/f3eZvF9qCqDwajTrBJ79dSHibePI7xfTI=;
        b=n012j9yOQBtzUXsrry13Xr5oVXAPraA6DqGtM3SKJjfV6rSjZhCta0eR2Oxkyk+UzO
         b6j5u5+65yrdRMCYEqyK4LzsmuHL0+77AyezUXEGcqehHnW6BNX7uvprnw45ReHLGz3H
         XjoXmSsmvHrnWG/kD4/hM2qlVufltfn/aKkPzbtecs4aZLSm3Ckzo0Yp9A2V+1CEfrt+
         EIkWclRy+We6Qz8869QonY1mXyYQYgWD2fm1RuPa4Xmze6u8INKtmtn3enpvfSyHLeDw
         ZwnlBcXaUN3F+mEfww15aKil+Hiz0nsXtSdJjAJefibIuV7V7297K7PRVPfRsat6a2fX
         mIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564801; x=1729169601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOG2cvcIa/f3eZvF9qCqDwajTrBJ79dSHibePI7xfTI=;
        b=jqz5x3sPEjz/zxJt8MandLehQfoZWtfJ3caB065fqWvAAyAJtcs79S/5DFLH+mI/2B
         mbY/rYhkCpMg7rBOT96hLhzQ+HY5upKI15jmSIK036YYVlhQCpvwNlxYL/YcpdclKx1u
         IHmuVZz6IFVJSHlQgKXZbtYVsF0lmRovyWuK4wXdKZWeIdbUQdheDrQP11tZzGi1jhfE
         qqHmLPH86YGYjK3N2SO03++J+AMWn+iU5PHIaKTdreKfyn7EY6ltIsuCJEAk5c0ZmTxn
         nQCuie63PCiKH/E7kI6HdXk40M8Urqx2jTx1Jj08tSP39Q5Rp4AYWpxa1BzIfHPb0RGi
         Eckw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8Yu8T0uL4u8t1x7gDHtm3Yc3GyXMkbcH1N4r28bHCYkDm48AI6SQvjD+M8jAD1/XnWLmAIS0M2a9O6tN@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEJkl+rcoHOh4XMGL30JizsFat6m5Xp04jHg8MOPkXkWC6Sxe
	hBTJo5QcwV3nFimfixyKFd6IkLgEgqVyK/oFo7ohuU5B+32LK73qk4cDgXrSo2s=
X-Google-Smtp-Source: AGHT+IHwHdR/ayiiZrVWEQZ0jvj6QMy246EDnjvlSR6tXX1mW/aaU5oydDoW2K4KYVylDfBIuIqyDw==
X-Received: by 2002:a05:6512:3c97:b0:536:a583:2777 with SMTP id 2adb3069b0e04-539c48926aemr3865575e87.9.1728564801442;
        Thu, 10 Oct 2024 05:53:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f0f86sm240116e87.190.2024.10.10.05.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:53:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
Message-ID: <3vrwrw7kia5h3vku2n3c7kwyyokrklqjjl22apzruvh535pnav@2ewlmdjobveh>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>

On Wed, Oct 09, 2024 at 02:38:43PM GMT, Jun Nie wrote:
> Only 2 DSC engines are allowed, or no DSC is involved currently.
> We need 4 DSC in quad-pipe topology in future. So let's only configure
> DSC engines in use, instread of maximum number of DSC engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 39700b13e92f3..e8400b494687c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>  }
>  
> -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> -				 struct drm_dsc_config *dsc)
> +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
> +	struct drm_dsc_config *dsc = dpu_enc->dsc;
> +	int num_dsc = cstate->num_dscs;

I have been thinking about this part for a while. Please move num_dscs
to the dpu_encoder_virt structure. The DSC blocks are logically related
to the encoder, so having this field in dpu_crtc_state seems incorrect.

>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];

-- 
With best wishes
Dmitry

