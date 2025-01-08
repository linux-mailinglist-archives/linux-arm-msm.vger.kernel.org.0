Return-Path: <linux-arm-msm+bounces-44440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0CA063D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61FDF7A3593
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8A200138;
	Wed,  8 Jan 2025 17:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="j7xE9qW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDA197558
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358990; cv=none; b=uoFMSPKu/Kl/4KjqGYDgy3t+kYqvNxtYK2QhodHvhBofHinF4C0N+Lp5jjgYIhaO1rn+m+GZWMfYm/cyb2WZ1VDoduzGxUsEp1IDO38deg/AxDZCao6LYDzCZKbI/a9zprVRkQnDmfBNRjc/DtqNsZGDZcMC+egQaoJ6TEACWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358990; c=relaxed/simple;
	bh=BUKyAiugUJfK1DZFaV9Ps2Js4W69APqRrj0+x6J0jbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCrgDyRtIdOsjtNIXh0rEHdUbVpCWppy42Y/zBVWuON2aAtkmumd/LVbkg7dolWSLMqQhN3FQ1uw1GEc+/4+4CqOVMSTWXyC22dyFl9sGowbkmj/2kyjgKpsHevjSkVsbOCVhU0VrOtDVn+BhwL3fL3KiYitzX7S5cP+rJjRKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=j7xE9qW/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f664af5so1306115e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736358987; x=1736963787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyXJyoTUz/O+MekoAhD1dI1UuPy1klDP8U3mVYcAA7E=;
        b=j7xE9qW/KCOuOsJJaIskA07kC3NJOUGlIUp0uwcC2Eo7NrPjeecnXmGakL7/29Z0IG
         hHsxMPmPf5WaWXZzIHDD6dVquQp9LQvSeMsSg6wcKmiQSQ3eD9hSlgfRnBCxJuz727N8
         OdA4oyvMVYwrco1R3VvPeG/Fax5ZIb6vlqjSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358987; x=1736963787;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyXJyoTUz/O+MekoAhD1dI1UuPy1klDP8U3mVYcAA7E=;
        b=A1y83o9vzGMHcy+PoV6DJjlEOuDZn+OcLxNmMowh2FvGI+NuabCDBxtdrCOw4TRReP
         6n9Wv7HYy4Y/02HdPrEDepiQsEDMF8YBOG0yDXBdpq54CluCcqZa7MRg/Mj/2ZRPdDE8
         OCGtN3uyh7+zxgGq1n0f10GsRtKCPFrXgccfLYHwNCBDWEdcTxjEJJ7n0EPCM+wBqxqp
         HLdCequkjZXcyuRjCcCq1gdUVe96Lyc1S/lorZU13PP5IrbTJ60WIHPCpwl405U8MDWS
         WD8rtkddS9HDjZQr91NwFwb8PhasF0pSSeEKEFHhBfgukCBQCNDoJkHAs6Mitk8guYM3
         odwg==
X-Forwarded-Encrypted: i=1; AJvYcCXLAVbtK5Sv8dI9rH8SeAu9ekcFgwaT0ppt2uVzLgSUh51SYCk3dkzz0lE0NuA1Gp34uXXumSu4Ho+bXsGe@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUxToHdyuWzqRMv52wKWDxYhG2GvOMvNXArlfgpbDsLY2LeTR
	Nc++K03TvOKATVPoEVKZfSMgA2vklRc+1ahs2bHqiJA32eyC3zhCOAbQnXXGj1w=
X-Gm-Gg: ASbGncv+P0Mj+m76KrWrdQjeNgaJhCOsmPoIR4bovlANxjXycncS7w4HLSkdzzED+Eg
	qtqBIMT/vvuM9Yd4OZVPjtfqvZMv4VSzU87nUNiXYk8IjyEnhFDnxpC8zfKM4w+CtQQTbxz3hWl
	LshWVcMTuf2IdgKKq7Fd4Yi0m+ELPrifp4HTK5VLcKJmVzWWhCCCkCFI+RBUy5sA0/7DKPiMxo8
	zHvUSYgDc2LeIntod1+eVtpa4qKCg3ELXnQd3Xwz5U4in4S72NeUkA2xy3h8DBlE4FO
X-Google-Smtp-Source: AGHT+IFozYJT06qw76DGVvnYOd+8i9OFhvq0LrKuiLg44EMhHZJky3qMfsIaLpjOif5j1Ah+kYp2VQ==
X-Received: by 2002:a5d:64eb:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a8732c439mr3473025f8f.45.1736358986935;
        Wed, 08 Jan 2025 09:56:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm54271834f8f.71.2025.01.08.09.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:56:26 -0800 (PST)
Date: Wed, 8 Jan 2025 18:56:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Message-ID: <Z368SF0R6L82aM8Z@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Sun, Dec 22, 2024 at 07:00:43AM +0200, Dmitry Baryshkov wrote:
> The driver isn't supposed to consult crtc_state->active/active_check for
> resource allocation. Instead all resources should be allocated if
> crtc_state->enabled is set. Stop consulting active / active_changed in
> order to determine whether the hardware resources should be
> (re)allocated.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This is well-contained enough that I feel like I can actually review this
without making a fool of myself :-)

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
>  
> -	/* force a full mode set if active state changed */
> -	if (crtc_state->active_changed)
> -		crtc_state->mode_changed = true;
> -
>  	if (cstate->num_mixers) {
>  		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
>  		if (rc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
>  		crtc_state->mode_changed = true;
>  	/*
>  	 * Release and Allocate resources on every modeset
> -	 * Dont allocate when active is false.
>  	 */
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		dpu_rm_release(global_state, drm_enc);
>  
> -		if (!crtc_state->active_changed || crtc_state->enable)
> +		if (crtc_state->enable)
>  			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>  					drm_enc, crtc_state, topology);
>  		if (!ret)
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

