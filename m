Return-Path: <linux-arm-msm+bounces-42880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CF9F88A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 00:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7593169873
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B92A1D6DAD;
	Thu, 19 Dec 2024 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGr8uLZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A411D433B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734652006; cv=none; b=dGMdjOU6srfnktRwJLguDg7y6h0IKkHQ5HL2aMlQ7PV47WssnBYSNJ4+7x83Zzx5bcYgMnaiP89s8WhoRiLaLD3eGHmx1vqf5I7Gp/OPZOu2f3re4g4+tdIJ6kiU06NNB1mU3amXAYsOu/IH4gE3dOz9JHCr+XwICjFS/ICtjxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734652006; c=relaxed/simple;
	bh=fWql8KRfov7IPSmXKtMBSyG+mJ9wi1tPmehVo+WHrhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrG7SWDsxQMHeqPsLRNZbRfsEwbSNeWKZL4Jjb0pC1YD1eI0Srkz5asBYNJjccjjr3LQHfe1v2iRe81zDHE+L4HLbdKK3tdcGb8QTIqKYmWK2ntABnkw5VlBJzgxKsk6YxggYS66qca3YTUpkxqznDPTFzegcfXXY/Ycqhmotq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGr8uLZ2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so1352614e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734652002; x=1735256802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVr8VxD2pcxwgmwMDWGN/YB6MB4xQo2dMxkaSNKw++4=;
        b=zGr8uLZ2HFGoPPUUqNnmkksAbZy2FLkU3LO13klEdadBXdnUGxsEEW3iKLkiShoHRk
         vaOogpOQQFstIwkitmxXIgtinR9x3sm1Dr9eg+EljQ7jUt95oUy0nx6yK4vuv1OtKgYy
         lyw4UHOTsx9eMeWjepyo8kWQ3Z1Mu52Zgaq9gyEk6Lg6JBYeI/iKefVgInG9BjLKEb+x
         IP0RLw23LPLYrLW8VVJqK8UzfbnXs0sFF1kCpdQPB4CWJGA5D9d37a5xJcAOo4RqQK/q
         ijnCxTzanIkgBhMiCvdG9QgLpIL+zI6t699WeeOIHXcFo6AyBZ1Ny1Eq2T6Lo9b8Vyv6
         SqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734652002; x=1735256802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVr8VxD2pcxwgmwMDWGN/YB6MB4xQo2dMxkaSNKw++4=;
        b=sRx7/QYsrGDkh0jNY9fkdgKgjvWQSzxmeC1EvgfRZxu1Y5IaP6Tb/Gtzeejd6XNIay
         viltSEWQVMqxUgis6782UfP9YAPJSTyWb5Pyzz4yqy0haHIQdV9jY20q0msLq1s6lZFy
         H4eeNv6bGFrkjUiSAZorcTCOyS/kizjcaZUCJgsYouVww5WDYRvOpq4vOUJ1nUzljOiM
         bkC/Fb7z6y8A93xAzcWpWXinUGDyT8WmnVDb7q3QA0gXWE+L3hhoxQ5ScQkdNcsfDJSg
         4+hJ7nJLgp2D0UZ4Tc6uC53yor6rXJ6qfVTD8god+CQw5zqmu0lo+cD8wQzEZaIaPBig
         P+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpRRV9SlntF96OzBAr6uPI32MBy9XjMmz31I88eJ0gcmvz+K5+vRWfUOeR8UyRyKv0RFlLpBIzuipJ1YCS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0ECgg08uWJnPaQsF0glsQnSyP9GAiYrbJL/jJTufVgxCLCL5
	9U37N2jbNBnj8Muu4Psl5y6jB3Jfr7hQgImmLj2kydDEnrp37rwC+FnqyHLh/Jk=
X-Gm-Gg: ASbGncujmsMFodcXaWyXQFhFkgrKXsID28QDPTosUhQCaz2ltD7jXBIOED8MUhDrxE1
	Qr/thcnvzu3CgKe22Xh94zwxX+KKcrRVq9+i+2IPyARYZatMnPl8JmhNhf08ZS7a16p+wOmdLk6
	SWXVbGbB08iuh6sTDZaXV8HvwzRR0bGKnwv0OWz7zUW8Lgsdaw0weda9m4iqVBoyc+nqOjwrE/r
	oHBbVbmALcYPp+NvwwBPPxbDxPbpjdG+NzET2FzuxgOHV5Zvp4Heyhv+HFUjYtPR2wIOlFr+FTE
	KlNqUt+WS2FLgWhON+5HLrnEoIrMdnnCRp5B
X-Google-Smtp-Source: AGHT+IH/+oseyR/T/CfJg4IAhC4J8FNVL3lP/XAKLkUKPfNBt0T5dQ36i8WzkNZ2cS9DJyhvWtaTdA==
X-Received: by 2002:a05:6512:128f:b0:540:251b:fe09 with SMTP id 2adb3069b0e04-54229533e70mr129311e87.19.1734652002018;
        Thu, 19 Dec 2024 15:46:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600724sm316981e87.90.2024.12.19.15.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 15:46:41 -0800 (PST)
Date: Fri, 20 Dec 2024 01:46:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
> for DSC.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
>  7 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index bad75af4e50ab..3c51c199f3e05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
>  		struct dpu_crtc_state *crtc_state)
>  {
>  	struct dpu_crtc_mixer *m;
> -	u32 crcs[CRTC_DUAL_MIXERS];
> +	u32 crcs[CRTC_QUAD_MIXERS];
>  
>  	int rc = 0;
>  	int i;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index d1bb3f84fe440..ce41fb364f3db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -210,7 +210,7 @@ struct dpu_crtc_state {
>  
>  	bool bw_control;
>  	bool bw_split_vote;
> -	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> +	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
>  
>  	uint64_t input_fence_timeout_ns;
>  
> @@ -218,10 +218,10 @@ struct dpu_crtc_state {
>  
>  	/* HW Resources reserved for the crtc */
>  	u32 num_mixers;
> -	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> +	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
>  
>  	u32 num_ctls;
> -	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> +	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
>  
>  	enum dpu_crtc_crc_source crc_source;
>  	int crc_frame_skip_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 96d06db3e4be5..6e54ddeaffacd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -54,7 +54,7 @@
>  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
>  	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>  
> -#define MAX_CHANNELS_PER_ENC 2
> +#define MAX_CHANNELS_PER_ENC 4
>  
>  #define IDLE_SHORT_TIMEOUT	1
>  
> @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	/* Datapath topology selection
>  	 *
> -	 * Dual display
> +	 * Dual display without DSC
>  	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
>  	 *
> +	 * Dual display with DSC
> +	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
> +
>  	if (intf_count == 2)
>  		topology.num_lm = 2;
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  		 * 2 DSC encoders, 2 layer mixers and 1 interface
>  		 * this is power optimal and can drive up to (including) 4k
>  		 * screens
> +		 * But for dual display case, we prefer 4 layer mixers. Because
> +		 * the resolution is always high in the case and 4 DSCs are more
> +		 * power optimal.
>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +
> +		if (intf_count == 2) {
> +			topology.num_dsc = 4;
> +			topology.num_lm = 4;
> +			topology.num_intf = 2;
> +		} else {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +			topology.num_intf = 1;

Why is it only enabled for the DSC case? Also I'd like to point out
platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
condition here needs more work to work with those platforms too.

> +		}
>  	}
>  
>  	return topology;
> @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>  	struct dpu_hw_mixer_cfg mixer;
>  	int i, num_lm;
>  	struct dpu_global_state *global_state;
> -	struct dpu_hw_blk *hw_lm[2];
> -	struct dpu_hw_mixer *hw_mixer[2];
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>  
>  	memset(&mixer, 0, sizeof(mixer));
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 63f09857025c2..d378a990cc0fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>  
>  	/* Use merge_3d unless DSC MERGE topology is used */
>  	if (phys_enc->split_role == ENC_ROLE_SOLO &&
> -	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
> +	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
> +		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&

Misaligned. Also isn't it enough to check that num_mixers != 1?

>  	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
>  		return BLEND_3D_H_ROW_INT;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 3ab79092a7f25..d9cc84b081b1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -25,6 +25,7 @@
>  #define DPU_MAX_IMG_HEIGHT 0x3fff
>  
>  #define CRTC_DUAL_MIXERS	2

Do we still need this define?

> +#define CRTC_QUAD_MIXERS	4
>  
>  #define MAX_XIN_COUNT 16
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 27ef0771da5d2..1fe21087a141a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -33,8 +33,8 @@
>  #endif
>  
>  #define STAGES_PER_PLANE		2
> -#define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
> +#define PIPES_PER_PLANE			(STAGES_PER_PLANE * STAGES_PER_PLANE)

This is incorrect.

>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES		3
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 57ccb73c45683..b5c1ad2a75594 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  		trace_dpu_plane_disable(DRMID(plane), false,
>  					pstate->pipe[i].multirect_mode);
>  
> -		if (pipe->sspp && i == 1) {
> +		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {

Separate change, please. Also I'm not sure how does that work with the
shared SSPP case that I pointed to in one of the previous replies.

>  			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>  			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

