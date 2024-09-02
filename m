Return-Path: <linux-arm-msm+bounces-30399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8E968900
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84E6284105
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE9519C54E;
	Mon,  2 Sep 2024 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="U8JD3QvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570EC10A0E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725284177; cv=none; b=GATF/ITmsy9QKVWlhzaG79RlGItfAmGLEn15WSCZs+XYencC9DHEZGqyYLhI4hbRcJ6I9SBQ9r/u+4zOsPsTQRXKTjQeq54vFB8jevTpLpNDRtrbQ+lbsnJaPUlWbq0qB73RQXNz7/fiQK+VMHI5ZdYl4/lS7lF/OBLHNFOYlM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725284177; c=relaxed/simple;
	bh=E/VZ7GrHjsNixiI5+URY2Wc2RKp6Poy1SHD9++Jjmv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ix0caOP2TwLcv/J78HM3KlPHRkKxzp9KPwhXSKr9J4gH3ZfUBU4flZSD6Yg65ndm3lu+HJGjXzAzTxogAim76ZxbUB6C0j6LHcqedm9Kxgb8CIh7ea5vxeBwRjNhLm+yW7QBWEJCk+iPM358G1h8a2p7ODnLzo9bWHWkVjDmkH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=U8JD3QvR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so26459585e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1725284175; x=1725888975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
        b=U8JD3QvR0plnR/9zQ8J4RcZYvy9OhWenwuPO8WX/tyJoff+w971/fq45JRB3iUB1bS
         7HplsRTnr9LZOIGI185oB3tt9O56ths50KPECvRrcO0Xm/ZSt6ypbGcmlz2AGPTsNH6y
         LGzRz2t9me1D6vJ5ST/p+GGdV0Z8hpF++SWZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725284175; x=1725888975;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
        b=B3xU0oDbbRCBwhHzB0xcSCDS59emn/mXLjx08yXW0DRdw0yUWSj131zXFfeODpog5d
         rujGARq6qJbpD/5ktM/XaEQha3+AEnsuQLktaS7zLl8Aqu9hIor/JtD+TrSZ75M0F3qR
         CHVMTE8aynW/QLhYE3k1k1J1M64DiIcu8fENxTEdXUZ5EqU3muy2adBi+NILVxLRKRCA
         zG+C6n7YMn+w1xjXJIwJ3QrUutGjnzqJphGmRyh/i3bH9VBTPnBuz86BloIL24LBTbCg
         B/76pk4LmluNSDHthmDGW7oxAgATNOMgAMExI4KdA7CNlfQL87jsiB1mZFJFH5L/BqUd
         HqAg==
X-Forwarded-Encrypted: i=1; AJvYcCXzJvV/0SfvJ28Zuy4gldAzhTpdm65AE/BeCtkPSrWNaNpKGuWIWfLFbBq3RgRiiomgOyI1hbKXrZnRVBy0@vger.kernel.org
X-Gm-Message-State: AOJu0YySt/Y+ZXtFenwo0CJXERc44x8WRdVn+Ll8QU+BOfP0+h6fwHlp
	FgCugnutJb4LVZCuqoXBH996SmsrwAcAGgdanT9XDFZQDsTf43FjpVMnr7pgvW8=
X-Google-Smtp-Source: AGHT+IFmCAd/UKn+8RiDLAzhiVps6I/r8wIzIThrxAPcZIbCaz99pcPpBKWDT6e22RdxtT79ulMxyg==
X-Received: by 2002:a05:600c:3b11:b0:429:a05:32fb with SMTP id 5b1f17b1804b1-42bb01b4428mr88808955e9.10.1725284174404;
        Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c7fa443esm4065467f8f.41.2024.09.02.06.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:36:11 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <ZtW_S0j5AEr4g0QW@phenom.ffwll.local>
Mail-Followup-To: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 29, 2024 at 01:48:34PM -0700, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1b0cc899e8c1..99eaaca405a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +			(!clone_mode_requested && clone_mode_enabled))
> +		crtc_state->mode_changed = true;

So two things, and kinda about the overall patch series:

- msm is confused about crtc_state->mode_changed, e.g. it sets it if
  crtc_state->active_changed, which is wrong. Or msm dpu code doesn't use
  drm_atomic_crtc_needs_modeset() correctly.

- changing crtc_state->mode_changed from your crtc or plane callbacks
  means you cannot use drm_atomic_helper_check directly, but need to roll
  your own that calls drm_atomic_helper_check_modesets again as needed.
  See the kerneldoc comment for drm_atomic_helper_check_modesets()

- the same holds if you set mode_changed from your encoder or bridge
  functions, but I think this doesn't apply here for this patch.

I think it'd be really good to

- review existing kerneldoc and please submit patches where it's not clear
  or detailed enough

- add checks to the atomic helper code to catch this. I think the best way
  would be to check if drm_atomic_crtc_needs_modeset() changes outside of
  areas where the helper code allows it already (essentially connector
  functions setting ->connectors_changed), and set a new
  drm_atomic_state->dirty_needs_modeset. Which
  drm_atomic_helper_check_modeset would clear, and which would result in a
  WARN_ON in drm_atomic_check if it's not yet cleared when the driver
  returns with success.

  Otherwise there's just no way I think to make sure drivers get this
  right.

Can I please sign you up for these patches?

Thanks, Sima

> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

