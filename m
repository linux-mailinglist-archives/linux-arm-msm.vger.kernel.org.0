Return-Path: <linux-arm-msm+bounces-33878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A472998895
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5D6288D4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0000D1CB328;
	Thu, 10 Oct 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUu8hd2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0251CB316
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568862; cv=none; b=JAoKsu7fTYD9q2pKzLxfDwExRpo3+oVmelJHWcsg+qOUb65h1+mTrmj/w8SBBUGvluGw2z3CYsJHWpOO+CR+kjRyTw86s2CfdljX6HtW9tdT0wYxfIvmPVIBuEzm0cv9wiF0/bia5l6OO9w/3PFn8WBJXFg+4uYEgjhOAu4dX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568862; c=relaxed/simple;
	bh=46nC7UCrxfbGRTvp4kHcfQ9XfTuLxmKO03pqTfGejag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqfThK7/4CdU4YVAnd/BR6ES64QOTFAltwuCE189+uh8P+8Gv7pHAKZ10r/g19CBdPQ4rJqnym9cztBuUVGxPOosP12X7hRjOeIeCH10+d00cbG2+275eOBh6lb8H4ZdMdAKrN216MVJ2ecEB2bCsd5KwNa2oqUlhtCrKJuQzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUu8hd2A; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso10236261fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568858; x=1729173658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuQJ+WTKIalk9f0kVjFjmlbMbJQEJBE3pr3wOCiST3A=;
        b=rUu8hd2A4kGH+DkFCYtwEbwObEt0VHVljxNc890fInzvIQGNBsYlvbkHS5U5x0XWre
         07DBqqeGDxnoOqqYbOIO+U/v4eWXbmZdorQarRT8mu5gyV+VxJuIIYd/+9wpVJ8INV1+
         4trSSJflz3rY057KM0FojLHXCY/4qzTpBGiHF2Kferl6mb0ZIFGBaDidjwyG3CRlq1xI
         InScoGkddCqsH7N1XaE3/eUjoVAwgVzU9JmU0Azg+alJMKWTzmzumMy5wsTB/3qYyYLi
         3whKcUh+C4u967jYh9bnAAAYpqEInRdx6h5W50pilNKF/ybB4tNFTelEh8ljHAsTKG8r
         zXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568858; x=1729173658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuQJ+WTKIalk9f0kVjFjmlbMbJQEJBE3pr3wOCiST3A=;
        b=lQ5m3ZjLtEyYLAJ4Zg7CxaTY00vkFzvut5VLmeWT90zdWEpjugUjpTwwAoFhFxsQFW
         cqi/frjTPILF3HMweOlFWiVu+YQUga+kkDSn1/hDL5YoLhPstlhAK4nAXN5oa6FLhmAt
         wWY5x4VbYhYRAVukjnxUWFA/AbqLm3MEG7DnSwTQUnE6zWUNhRTxi1saT6YLpI4r5W3z
         a5HGUNDr9j1odFW9cxOnCrUnluCvShHvkwv5CBS2rA085YLZeD9M5PMC3H66hiGq5PmK
         GQ/XTwMf+QVluxXqwcDeQ2GHGvWvVSMNAOxLEml/a+AR8D7a4wgPKcOK5B9cu72y9UUw
         4T9g==
X-Forwarded-Encrypted: i=1; AJvYcCVyIRqCISeU28VLRpRT1Gppa+wNVzJgXgO+/Nvm/dDcVzyfLgbmTBxDqbJJHjrJ7gYyZZ69iy2IZk9FQ56N@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSyqjFRA1eWT6dSdZYTqs/AJqorY62uNrCoEDXVlx2+AE1iKO
	SSnsNodPJ1iRBsClSuurZHN3wFQOu+cTaGJK+ESROiYsuQSAClZvhwxcIzcolHvyibwTsAHxBs+
	nQbM=
X-Google-Smtp-Source: AGHT+IFrF4G/q1LSEE7otBncLBp307ma3OuS5kLKhttKr1HVd467Z9RO2T62rEKs3DTe/GxAHiuZAw==
X-Received: by 2002:a2e:bc0e:0:b0:2fa:c0fc:e3d8 with SMTP id 38308e7fff4ca-2fb1f891ef9mr20050011fa.38.1728568856319;
        Thu, 10 Oct 2024 07:00:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2474c0c4sm2153281fa.101.2024.10.10.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:00:54 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:00:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/14] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <sygn5eco3yn3tsk2urpubh74lt77wdm3pyd5rbhrrp2bl3ro6v@nyjjwhdrlnyp>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-14-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-14-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:27PM GMT, Jun Nie wrote:
> Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
> for DSC.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d2aca0a9493d5..dbdfff1c7792a 100644
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
> index ee7cf71f89fc7..f8276afd99192 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -211,7 +211,7 @@ struct dpu_crtc_state {
>  
>  	bool bw_control;
>  	bool bw_split_vote;
> -	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> +	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
>  
>  	uint64_t input_fence_timeout_ns;
>  
> @@ -219,10 +219,10 @@ struct dpu_crtc_state {
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
>  	u32 num_dscs;
>  	enum dpu_crtc_crc_source crc_source;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 68655c8817bf8..ed220ac691e8a 100644
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
> @@ -588,15 +588,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
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
> @@ -615,10 +619,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  		 * 2 DSC encoders, 2 layer mixers and 1 interface
>  		 * this is power optimal and can drive up to (including) 4k
>  		 * screens
> +		 * But for dual display case, we prefer 4 layer mixers. Because
> +		 * the resolution is always high in the case and 4 DSCs are more
> +		 * power optimal. While a single SSPP can only co-work with one
> +		 * mixer pair. So 4 mixers are needed in this case.

What is the relationship between SSPP working with a mixer pair and
high-res using 4 mixers? You have been writing about DSC, then you
suddently mention SSPP.

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
> +		}
>  	}
>  
>  	return topology;
> @@ -2031,8 +2046,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
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
> index e77ebe3a68da9..c877ee45535ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -324,7 +324,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>  
>  	/* Use merge_3d unless DSC MERGE topology is used */
>  	if (phys_enc->split_role == ENC_ROLE_SOLO &&
> -	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
> +	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
> +		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
>  	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
>  		return BLEND_3D_H_ROW_INT;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index bf86d643887dd..f79ecd409a830 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -25,6 +25,7 @@
>  #define MAX_IMG_HEIGHT 0x3fff
>  
>  #define CRTC_DUAL_MIXERS	2
> +#define CRTC_QUAD_MIXERS	4
>  
>  #define MAX_XIN_COUNT 16
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index d8f5cffa60ea6..671e03406df74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -32,9 +32,9 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> -#define PIPES_PER_PLANE			2
>  #define PIPES_PER_LM_PAIR		2
>  #define LM_PAIRS_PER_PLANE		2
> +#define PIPES_PER_PLANE			(PIPES_PER_LM_PAIR * LM_PAIRS_PER_PLANE)
>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES		3
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

