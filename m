Return-Path: <linux-arm-msm+bounces-30291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31096680D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5461C23D2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBA61BA895;
	Fri, 30 Aug 2024 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b06LuOYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A81BB6A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725039228; cv=none; b=W2zaA/7Oh0nq2vMz5lUtUnXIRK+48zm8GpudTGFGlvUMXLdkg+sBSGAP6fi+QgOFlBySDcPNBt+uouXKtDMorRm5R01xtRBQk4cIglkuSgZti1gJ5J8voW2kFUqiGCtMyUWyqEwxOUBYaUD/2VjZLYCx0DQ/Xz07/bcc4wIxa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725039228; c=relaxed/simple;
	bh=mpu87gMUdiZRAQJBvBJdBTmi2PXbRcqU3nE+/30W6c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POoA5W/enwpFiPNGQxx+EmlG2iBuvK2FvB0cZRZwSX7MygpjGND8rHxKOj5pAT2tuSch+X4UEn/QMX2oy86GIApiLz7PJuRK5OLEjbTLKvSzx4RSVPLexq4dbDcMxtoy9kNLwXwiORqMB2QOaaQ2ZeQHy4DWMFQlCcvNR8uEz1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b06LuOYX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-533488ffaddso2695420e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725039225; x=1725644025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZovmunSahKLAoS+vXYOMOjVXjpqJMaKf0ge9u6vq/g=;
        b=b06LuOYXS71d4KePDgL1Fo49YCb2ucUX0m8n48y+w/V4EnUgiH3fqyfBk/psKSf8SR
         AmKxMBdkaJjdBOr51xp4YZJSIG0GTwkuynhofPtRmRwLM5n6t97EhX4VtnxjiBX6ZPku
         ttvevotCWU1JfmZY1KkbkCx8yHVYR4CqxpuG/x747JTIC2cY5pUy31cHtz0eEao8Hm2t
         r4rF1ZJWvQtis8W4ujuNssPRP+aP3O2FHWSqZNGD1etRKRAjeR88ue7hjT0rYOVwhm3D
         4LqJFFp23EHpjxsHgDLWFigUDWhm2g/4LCfMY1jan9RNzpjIxtlBJdu+ByG/B7LQOPhh
         TvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725039225; x=1725644025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZovmunSahKLAoS+vXYOMOjVXjpqJMaKf0ge9u6vq/g=;
        b=Mj2x+k8r94Jn/nnfkvvOdQQCLIQ+T0l87Te4fFMKp0lS736YPqAWnZ6bVc68PPsLfE
         pGGCI3oEZQKAk0nNFbw0n5Ol1e9TRIi3j5FHo7rHtu1APVwDbfYhM9wSbSTK9E7oMb3l
         7eq4TiwyET2T1SimONYSqpTBLL8Q1+r4kZRHksUkheUE8zniti/IzHvJOvcrKWtqKn42
         +5Eqv2OnF5xAcCwXo1svxTr89jua4uWfcceomNjwFjNOx0dI2qMm5WgITBeofSB46I4Q
         WDDdqyskC189Guu4iab5o0KoAUdzh59GNDexurGWVnVs9paPxmXymUCu0RdlZQbAD761
         57bw==
X-Forwarded-Encrypted: i=1; AJvYcCUZVJThfa+JU7wbOaJyyQDPX954thhUEnX4/T5Ovxzh7VjdFfy4kTQx/ibYwAwzSx4s09BZvFxOUR1Uu+zN@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAfAdk9B7t2Iw4J9rT8XafTEG87x35A/n+QV4pFZ80BDacqxL
	Uof7qAgxEBnUGoZdwW1+AUNfkESKecG+VZGPq1YylOjJU95qbQwt599+KPCaryo=
X-Google-Smtp-Source: AGHT+IFKju2ZfMc9w9jdIMtGL/qYj6Cz+l1WLEv32Uz+h2UqFKnaakxWIPJ6i5XbIKCOFyFGs2p3qg==
X-Received: by 2002:a05:6512:2393:b0:52c:e084:bb1e with SMTP id 2adb3069b0e04-53546b04944mr2218053e87.13.1725039224564;
        Fri, 30 Aug 2024 10:33:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079bcf7sm712538e87.34.2024.08.30.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:33:44 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:33:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 19/21] drm/msm/dpu: Skip trigger flush and start for CWB
Message-ID: <g6zlve4onws3ncg6l4j2b6tzpkgbp2qntublyw4oxhlvca4tmp@g6j7bsvewgtv>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-19-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-19-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:40PM GMT, Jessica Zhang wrote:
> For concurrent writeback, the real time encoder is responsible for
> trigger flush and trigger start. Return early for trigger start and
> trigger flush for the concurrent writeback encoders.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9d495a186eb8..47b5a5994234 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1493,6 +1493,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
>  {
>  	struct dpu_hw_ctl *ctl;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);

Please move one line up.

>  	int pending_kickoff_cnt;
>  	u32 ret = UINT_MAX;
>  
> @@ -1509,6 +1510,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  
>  	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
>  
> +	/* Return early if encoder is writeback and in clone mode */
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
> +			dpu_enc->cwb_mask) {

Alignment

> +		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
> +				DRMID(drm_enc));
> +		return;
> +	}
> +
> +
>  	if (extra_flush_bits && ctl->ops.update_pending_flush)
>  		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
>  
> @@ -1531,6 +1541,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +
>  	if (!phys) {
>  		DPU_ERROR("invalid argument(s)\n");
>  		return;
> @@ -1541,6 +1553,13 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  		return;
>  	}
>  
> +	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
> +			dpu_enc->cwb_mask) {

Align to open bracket. Please adapt your editor (e.g. 'set cino=(0' in Vim).

> +		DPU_DEBUG("encoder %d CWB enabled, skipping\n",
> +				DRMID(phys->parent));

Single line, please.

> +		return;
> +	}
> +
>  	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
>  		phys->ops.trigger_start(phys);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

