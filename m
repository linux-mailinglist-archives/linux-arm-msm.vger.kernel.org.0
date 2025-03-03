Return-Path: <linux-arm-msm+bounces-50084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31EA4CF6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1051891C1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA8E1F2367;
	Mon,  3 Mar 2025 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pf8gjpBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66F20EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045765; cv=none; b=W5WbBQOwejRlPas6VQ6vZioqUATxax9RZrmfvxLt+0bl3nugEk+Ot4XzPqXmxNSzCWreqcYk+8VImflrWjfa+AkFXvbwH70gzGZaCmlSjD3mad6qoARAO9qxtaS4olwK1VZos9l5G9yiGuThwjQDCvI79vMblNzlsCtLyaKJHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045765; c=relaxed/simple;
	bh=+PF1wsaiP8mXxpW/X8Hzgpxz5YQURxQuQQB/TUeXtco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1jmKYvzTDRpuDBc/4vyaaMKRX0ZAajWNYvvHGkprstnxj6jE1aP5zcvm9duFUHMM7Zhrx+9jmIjJWcv3KTRD3381YmUq0vdMYp7CHILmTQso8BmDBYQuvwJ3tH71Q0gdJEvfEfDYb5ANTOJoRuI+zXiGaDsuqiQXRUXflHjhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pf8gjpBP; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3072f8dc069so54504261fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 15:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741045761; x=1741650561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGh2Jh07iqN6b8Vz0+08UIfINMxu82nUoWOUL86HJGU=;
        b=pf8gjpBPvCH8+uEq91T+CttdlMMnOPZ4exrQyLcSuDhV3FVFGtOvxqNa9HuF02SQDC
         Z1wUT4oWhPTjtCvQ/8OgcNA+fcrdc0r1X2bYToNHciSOJg/jqT8l4dlPN1wYomXCnrNq
         S4UfOSvK4N+PRf+j5Dz9K4M5JhhRpgyY9ZmGL1UIpylL2VhbblnQkpJzX83NGYqMgnb2
         E/sTJQFCKd67/Vp1YJ1+q1/XYeWKO9/JPU6Pam+REe2hrLsfhg3Oq7/cfg/z9nMNeD0p
         r2HIEoFHD6e8gUn7w9CVb3J9HcALyTVn8vuLrkwDnYwKRxrbZk0llyFnbLI29VdEMbeq
         SbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741045761; x=1741650561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGh2Jh07iqN6b8Vz0+08UIfINMxu82nUoWOUL86HJGU=;
        b=PgMx/lMRCViDyGoRx9GHoLQ69RD1XLMfsWZ/TSxar9ijPc8vQmwZIhXLJd6CpR9HeD
         6ttZZZyCNz3e2DRe0vyITuDVH4Vbr5zZjGdGKYcQ8yxZ3tSL0iqwgC6O1xziuE7c5QVl
         qG5+io28W5bkdhl9VJOckMfHkstGp7f8J3ybEbwcYyF8SQ8Vd62iaP4pyv1VFdVinCdH
         qWKf4PgY8pljrC1e16Yqv2kBVk6dN0Wf+4P1CJmmOR0pVgqVpjj7SMCvk8mGQGGjKyMh
         tRUl97XJDbtGzioC35TdCoERets+o1WXkGIP5lmClAbB4LFgoyJK8rorsfY9cb9N3uDR
         FGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq0j5u4Q9qTdB/P20fmAIDqBoJITHRNvCPFUYhJuDuadNlxrXYuKxEbH/fLJa/CwAElQItNl3Q64yHTuKd@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJPP7oDkhpwceN8bnvka+x/TD8R/1UKrWTl8XL+S/2xFBw7eP
	1+bPOXhQwSyYwtJAuXi4O3vI3Gmz0IIcWYUFoUOFvNMOgoAOoFd6pQpSBj2ch48=
X-Gm-Gg: ASbGncsknhG0Py9K/Mg6YGj8TfhZBdNX6P734fY0611oj3etxMDc8opz9cpKqnqX/Oj
	9j5Nr5Bt3nqjT7mxaNK3aGaSpe3zhUhYqtOaqH21t9wjCW+BvTM64UJVGH+LEtdm/AiwbMYBWFi
	8YfyNhHQSkAVYrmgNmtzmQh4/9pOMCGceU5dabMdT2CmdQQJrJQCsl+DN3KKxBtR4RPzg3n8N51
	RcC4yVIgsT0NgwsEZTQUg9BKfaQUMcWem8nmf60S0PWBRZ45WQdjU9dHvvt+R+bV551DS1NKZGu
	o5jFoHukq/f4aeHhEc9VOmizZ4B5YotxKOJs1NNKJAHQUIHGiG7B0BBnbshG1YDEQc/3Ycy2rQF
	SrhwegReWNfx+KKjv8Wy4QjWp
X-Google-Smtp-Source: AGHT+IFWAkh7m/Jl/ntM6OdiF2e3PXJPllKscV8h133CwwWAxNYSo0Ra0mjbeHO46uPyn1my6qBAFw==
X-Received: by 2002:a05:6512:6c9:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-5494c320129mr6121961e87.16.1741045760896;
        Mon, 03 Mar 2025 15:49:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54954afb00csm1069042e87.250.2025.03.03.15.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:49:19 -0800 (PST)
Date: Tue, 4 Mar 2025 01:49:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been
 reserved
Message-ID: <flc3cyky4wxfin7dlxhukwmhonze3napmuyhl2s6jbsgepco7a@q4l2ndh23lus>
References: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>

On Mon, Mar 03, 2025 at 10:28:00AM -0800, Jessica Zhang wrote:
> If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
> encoders will configure the stale CTL instead of the newly reserved one.

The CTLs are propagates in .atomic_mode_set(), not in .atomic_enable().

> 
> Avoid this by setting mode_changed to true if new CTLs have been
> reserved by CRTC.

This looks very strange. First we reserve new CTLs when there is a
modeset requested. Then on one of the next commits we detect that
encoder has stale CTLs and try to upgrade the commit to full modeset
(while the user might not have .allow_modeset set to true for whatever
reason, e.g. because only ACTIVE is changed).

Could you please check if the following change fixes the issue: in
crtc_set_mode() replace the raw !new_crtc_state->mode_changed check with
the drm_atomic_crtc_needs_modeset() call?

> 
> Note: This patch only adds tracking for the CTL reservation, but eventually
> all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
> similar check to avoid the same issue.
> 
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4073d821158c0..a1a8be8f5ab9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
>  	struct drm_crtc *crtc = new_crtc_state->crtc;
>  	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
>  	bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
> +	uint32_t enc_ctl_mask = 0;
> +	uint32_t crtc_ctl_mask = 0;
> +	struct dpu_crtc_mixer *m;
>  
>  	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
>  
> +	for (int i = 0; i < cstate->num_mixers; i++) {
> +		m = &cstate->mixers[i];
> +		crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
> +	}
> +
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
>  		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
>  			new_crtc_state->mode_changed = true;
> +		enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
>  	}
>  
>  	if ((clone_mode_requested && !clone_mode_enabled) ||
>  	    (!clone_mode_requested && clone_mode_enabled))
>  		new_crtc_state->mode_changed = true;
>  
> +	if (crtc_ctl_mask != enc_ctl_mask)
> +		new_crtc_state->mode_changed = true;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a61598710acda..2f3101caeba91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -188,6 +188,7 @@ struct dpu_encoder_virt {
>  
>  	unsigned int dsc_mask;
>  	unsigned int cwb_mask;
> +	unsigned int ctl_mask;
>  
>  	bool intfs_swapped;
>  
> @@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  	}
>  }
>  
> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	return dpu_enc->ctl_mask;
> +}
> +
>  bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
> @@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	unsigned int cwb_mask = 0;
> +	unsigned int ctl_mask = 0;
>  	int i;
>  
>  	if (!drm_enc) {
> @@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  				"no ctl block assigned at idx: %d\n", i);
>  			return;
>  		}
> +		ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
>  
>  		phys->cached_mode = crtc_state->adjusted_mode;
>  		if (phys->ops.atomic_mode_set)
>  			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>  	}
> +
> +	dpu_enc->ctl_mask = ctl_mask;
>  }
>  
>  static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ea..70b03743dc346 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>  
>  void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
>  
>  void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
> 
> ---
> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
> prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
> prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
> prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
> prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
> prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
> prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
> prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
> prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
> prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
> prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
> prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
> prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
> prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
> prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
> prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
> prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
> prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
> prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
> prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
> prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

