Return-Path: <linux-arm-msm+bounces-42891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D69F8A21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 03:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06D6188D4EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079F4273F9;
	Fri, 20 Dec 2024 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0HXH/Rf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD04A08
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734661962; cv=none; b=hCPy6tGJtsG6lxmMmhasTJnON+E9U9EQ3EkbKUWSexcincYZVc6/oQjwSSSoIXmDj6MrOdBF3AMHihaFco9ySxLwtX6LQiVVfAU9WFX8krtxOKwyLfPOyp8TX4UZC21M9wFt/AK5ne6fIIoliuBctxp4DEwtBXItyHHMXKtQBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734661962; c=relaxed/simple;
	bh=EhbLzKXfkij6tfReQMHYW4V6qZ4LXRGvUxdOTxgcd/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFJVFYzyQF86Ghg+S1YdWOEYX7oWL4TQ/uJlq4aC+971e10ZrGeP1x7+suRVBrwwjrW4/UYNKEs1YwejEm1bxqZ0XtYmsNaPQOsnIX5jnA1w969LmkBHPcg5GJcCvefQ1Yflt581L6Rpo8dXIT6+SJUBRm1uqUZ3cjCsGo/N1Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0HXH/Rf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3043e84c687so12893021fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734661958; x=1735266758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wikVcC8YwP43NyawYqahXbzGX/uRVSr7BgXqLVuUyoI=;
        b=S0HXH/Rf7VipnLnEoAFOMKf2oKE6fXZ8858+3Y6qr4QuWz9NBrQwbGMRhx8Lqkvae+
         6MVjXVy/7qwB/cIpntTpzYEwUn9iHMMpcXoQYkg6L4WE1P7bKnPQ6D2ncjeTqezHe+IR
         0LgcmpQ+LBRiToz8004Kx+7XFpkU0O5Yx67HnM0eETILdXVgP53WmvcuKQ0dAXotalRu
         ArRZ9Z/XVAGdm/1gbJVqYhFs/siE3yGHHX+7tSvzZ21lkJ4XgM9T21cNnrGbXN3Trt8l
         Ir0MAhjlj6pkMTrWOhyAN1NxwrqF8ey6quU3dSjQL7V79eaG9pak4vbXo4ousl/RJXt+
         KhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734661958; x=1735266758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wikVcC8YwP43NyawYqahXbzGX/uRVSr7BgXqLVuUyoI=;
        b=rZnc32O9LJDiJmYzULIRNQQA7KhUL5bcV29i7CsLNmlqe4FZSCFFjaTu1kWduLxbCd
         tZnkEIoQM9NRa+LX4GR4l9tRFvuwYIERr59LFDnRBs/E7kmeR2LfKDDq1tZAzHUK8nIm
         ldFahrN4MBjq/Rh6ugOwinK3nrWLB+eq+aNfWv6xLodUwdywRRPVRbfOvN2s3ePpZxPf
         t7xgJzCMGn6bLnQhP7ooU/LOi/QHWRI2vFUbcsRpZHcPWx+fazzPXMOw5FnWZKEk443W
         QhqD4SSD0Fvt+SS+HU5MXWqLJyJFlp/4A1nUewjOBIW4/1QlV1IxeRmDwIIbRkaPLk5p
         /TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYSV6cFkJCgsSaWLutQ9Gzsw5EK/6zK8c2Qo0hygTGGRWlsYrgsBV3sYLxSkquZ9FYOPiri9JBo8UXB5iN@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTs+cG8Si5/JCaN8+zN/wzRzhXt4Y5e/f1X7DgwqcnSuZ+l9D
	rc+IcMAeQ81EPR5hWV3DgFW7Zs/UEi4GbxfnKfnmVo0ousEgdLLrcLHdUlZqcNY=
X-Gm-Gg: ASbGncv/EBuppw3Q60+JaJWSUfV3STge6hCZtsEeX5t7DyedfkA2G6covxNEmC//RXx
	MzYeR4e581nN3Q7x+qxu62mZt1YG9EfoKaayo8mvsPMQuT768im/f5IEkXXufvTBbxwO3SGwIAQ
	UslztRChYBlIsQJaQkSgFWPkBKCj0HOAcba/K3HwA066v8fY/KEXrRch9CY6Pjd0tb4u3+qcXl/
	Jp+fF5/4eaEp0HmHwY3yIXy37o4NqaDNuFf/f5ThpL8JsLUc8F9CrrR/ODKrzE8TgOGr5sh7sie
	K4QrsQ/gfIXS6jbW1eeQo4NHBfP7Xb7bt+wK
X-Google-Smtp-Source: AGHT+IHeePIRvRlTa0WzSJOEaRbNYDGB0kZScBMguM6RwOqMwsGDgUW7Iqn7n7S3fRfyoGyLByO5pA==
X-Received: by 2002:a2e:be8e:0:b0:300:3a15:8f23 with SMTP id 38308e7fff4ca-304685198eemr3702051fa.7.1734661957805;
        Thu, 19 Dec 2024 18:32:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cad7sm3857071fa.9.2024.12.19.18.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 18:32:36 -0800 (PST)
Date: Fri, 20 Dec 2024 04:32:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
 <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>

On Mon, Dec 16, 2024 at 05:47:50PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
> >   3 files changed, 181 insertions(+), 169 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> >   	return false;
> >   }
> 
> <snip>
> 
> > +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
> >   {
> > -	struct dpu_crtc_state *cstate;
> > -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > -	int num_lm, num_ctl, num_dspp, i;
> > -
> > -	cstate = to_dpu_crtc_state(crtc_state);
> > -
> > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > -
> > -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > -		ARRAY_SIZE(hw_dspp));
> > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +	u32 num_intf = 0;
> > +	u32 num_dsc = 0;
> > +	int i;
> > -	for (i = 0; i < num_lm; i++) {
> > -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > +		if (dpu_enc->phys_encs[i])
> > +			num_intf++;
> > -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > -	}
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > +	if (dpu_enc->dsc)
> > +		num_dsc += 2;
> 
> As we requested in v3, can you please explain why we have num_dsc +=2
> instead of just num_dsc = 2? If we are hard-coding 2:2:1, this should be
> just num_dsc = 2.

I'll drop it while applying a first part of the series. Granted that
num_dsc is initialized to 0 few lines above, it should be fine.

If later there is a need to change the lane, it can be done in a
consequent patch.


-- 
With best wishes
Dmitry

