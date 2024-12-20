Return-Path: <linux-arm-msm+bounces-42893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A76479F8A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 03:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8EC21890C6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B2318C31;
	Fri, 20 Dec 2024 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsO3Uvyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044F3C6BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663016; cv=none; b=TI1K6/APpuogWilbi9Gf1NPW83I1xqP2uuJZ1mi8wZhBFTXDmoPZvEU1APPbjKZQcUUnEq82mQuOw0Oko04XDebFiE9dEaS+dTZTHIUJ8DnmowkB3haTgXBEjajWJbiNgpBx/rB1XwGbB/MR8hOjd4N9FL6zNqAhn7pexPTKrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663016; c=relaxed/simple;
	bh=g/9w0j97RL83ojSe7iSQhRz9fVgu1XV/OIy7F2TqFxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVZBNdPkbrVA5FTipUA9Q+4RZYYHJ1XIlawaeIjvWC85Jvryuw/guE4HhUy1N8SmEEADOCSx/DP9ozolUuppAzAg3BLfrZYuV8T1HRw8tPc7L8V0Ov79wySuYohbKqis9bApQOTeGuxAX7jb0RKJIH8hsUsYq3MY2cPy/Xl/GkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsO3Uvyz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30227ccf803so17598331fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734663013; x=1735267813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQxnzZwa+ZnAwPhXEuB51NoHRLnVz5kTCi7LiEOiNBA=;
        b=BsO3UvyzoxWB7QAgHk8gwN/LIc2wfjVT2fvkHc7wHvdK9XTQowEJ15A9Io5HVOmqMx
         w0nVSbYV3y1N/w5nXpzIAi8LSCS6yKx7qEVcxWRYTWYosF093w5HT5rr6lpHNqTIpiCv
         4NKCEbrEPtCGE3l1bJpYFkuDf0sOkn/rhDvaACtrz9YWPfZab5Tyr9LZDvEhjlA/3FLz
         Hh6cgAaZvtNYdSxu2xW0A4EbwGQTP8JcpbdbW2VZtfGSr344rVfShty4d4eQ7iTD3BiK
         E1UfoXd9Jn03zSCjJ58U3ekAv2KIjt2npXWRCvJNOwCESpyoLrn7DcJDjej4hIikCAzp
         V4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734663013; x=1735267813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQxnzZwa+ZnAwPhXEuB51NoHRLnVz5kTCi7LiEOiNBA=;
        b=X9v9fmsJY0FfYWmK2AczZa7arrSacwSxyYlXjPRCuqjp8blXfPIhIX7Lxe1/Jrvpj0
         GWKLtNNZlF2i8hb3NYUi2eVwi0NC6YXNjtA4p/RnNkWlWgyhb9nYfwINd9OCW/3USO+T
         IIuAG5EQ9559Z6G49yZ5sB+fyfFL6ssiTUMGnULPQLCOAxzPPTAFj3oG4paeQnHvuktv
         kc0guwo1d8+/C9n9X/E3BuCzSroNtfua6HuRShiJdRHdaDwSdbZ9SZvGJcPfwW5UaBym
         s+PgYGYppY3YgkIFirf1miiKwCOoemUFE0uBPRiDLp/F8sz5Kf2okxGU39opLPGZvEPe
         O7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUH0QYxV/N+YeYu03Az/ylSXy64YaD/cbKeRsbcjUGOkqPPLi+6G1uQA+tyhmih89SlIww3+7zoCHNeg/Xu@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYfj0REP0Y8h3Ad6cbTTbGSm7iiTTUSnYP77+BFuvJcgtiGqh
	lpAshcvbk4LfmG56fMBdqUxcPmKRo65TduPGeqzjZU6KfOgSFDpKLOQ+W6IIPVo=
X-Gm-Gg: ASbGncvQVU4tcnRG+6GCCzRhz39oohLmEeXMOUMGRS1Gdz8m+8YL4u05redPkOQubr4
	hiZpxHXtbI93wRks3Rx5x9RN5BonmTQCOBRv7GpzCqQjk17xfJfnZkzMaGD6IZUlBXJPzK+31NI
	kduAzOjsT8ak/kk6UuA734wiSScvwxpMbRnYLoWvWKMNjCKLG4UM5RpQuwIQuJdTTF/Ue0zqOBm
	4STy0YyYIyRtYoMrASQnY8gMl6RXipCalt0wgCuCeieztV7ozBMw423DMBxQ7IrFFCt1RGMZA3n
	JobCa5eJP0IsDa7REaHAlKLj5lB+7nhRuoQz
X-Google-Smtp-Source: AGHT+IHdCv0cpuv0cv13SlSAzLvj/BCq6RPapfQEGLkKmPf/kAnzx0OxyR7cOGcNzeydGUW5qnYdAQ==
X-Received: by 2002:a05:651c:198a:b0:302:3c78:4ea4 with SMTP id 38308e7fff4ca-304685f7231mr3770121fa.30.1734663013096;
        Thu, 19 Dec 2024 18:50:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c504sm4057041fa.10.2024.12.19.18.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 18:50:11 -0800 (PST)
Date: Fri, 20 Dec 2024 04:50:09 +0200
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
Message-ID: <nkb5dr5v3vs4h4rcg4q2hwy6iubjfzihrx2cafarbf2qq7axhd@qdqncv6kfwp2>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
 <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
 <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>

On Fri, Dec 20, 2024 at 04:32:34AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 05:47:50PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > All resource allocation is centered around the LMs. Then other blocks
> > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > powers up the CRTC rather than the encoder.
> > > 
> > > Moreover if at some point the driver supports encoder cloning,
> > > allocating resources from the encoder will be incorrect, as all clones
> > > will have different encoder IDs, while LMs are to be shared by these
> > > encoders.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
> > >   3 files changed, 181 insertions(+), 169 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> > >   	return false;
> > >   }
> > 
> > <snip>
> > 
> > > +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
> > >   {
> > > -	struct dpu_crtc_state *cstate;
> > > -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > > -	int num_lm, num_ctl, num_dspp, i;
> > > -
> > > -	cstate = to_dpu_crtc_state(crtc_state);
> > > -
> > > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > > -
> > > -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > > -		ARRAY_SIZE(hw_dspp));
> > > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > +	u32 num_intf = 0;
> > > +	u32 num_dsc = 0;
> > > +	int i;
> > > -	for (i = 0; i < num_lm; i++) {
> > > -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > > +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > > +		if (dpu_enc->phys_encs[i])
> > > +			num_intf++;
> > > -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > > -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > > -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > > -	}
> > > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > > +	if (dpu_enc->dsc)
> > > +		num_dsc += 2;
> > 
> > As we requested in v3, can you please explain why we have num_dsc +=2
> > instead of just num_dsc = 2? If we are hard-coding 2:2:1, this should be
> > just num_dsc = 2.
> 
> I'll drop it while applying a first part of the series. Granted that
> num_dsc is initialized to 0 few lines above, it should be fine.
> 
> If later there is a need to change the lane, it can be done in a
> consequent patch.

Forgot to add:

With that change,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

