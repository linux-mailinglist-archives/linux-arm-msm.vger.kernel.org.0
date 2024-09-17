Return-Path: <linux-arm-msm+bounces-31882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67E97AB4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 08:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F9061C22809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 06:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1C01B5AA;
	Tue, 17 Sep 2024 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+fJvQXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C206D2FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 06:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726553624; cv=none; b=I23/ASJYNZ4mczcJzOgQN8tejkidpMJQp4DLd8YUQLP9RKN2ShvP9CXRauuoZ1VEPOZQjFCSsVWh0wfuuJvWJUEq51U9CojGSFhBEQw/eSHD3Sb4wZFZbPb7txLqCq6k9zHETuR6/2Gsz3HggqcR4AMrGhG96/SrS4eEzdg3SLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726553624; c=relaxed/simple;
	bh=4aQdZ8vQy8pc9ychlauqdXGw16n2Qmw/zy3Fupd//hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzbKxvxdnEX880kBrYD4faqBRlvlXjK3/QA8GrGAVTDSuutFEo6kw5I2wHgFksGlDgPPfzUOM4lUOB8a74P2gyLz/PoQ9vEZCUWpAinq3geoEqUncyDqYiyhv6dSzVkhBjhemAGCp2qXCTsbi4U3jc5pD/84TioR+jpRrLKFzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+fJvQXa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365928acd0so5751435e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 23:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726553620; x=1727158420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVYJdvkFkNlxeJMRsZ4TNMxACduPDS+BlYyHwRQEdIQ=;
        b=y+fJvQXa0e1wnKCCgfLFXDrqTNTW9XWHoAa1obMSgUOHFKqvtVAyab26b1zliBW86f
         /03GbCwXlUa9fXoboE485PVa3nBRksAZZLqc2bXXYhFkmjVdC2/DOz1nQvFFju/Xf8JL
         yypI8HKt3/pMMOpaa+Y4QBzX2mlOoB8RcU00lRmCJKHkQcLng+jpJTOGcVuK1yEQv5yn
         7Uih7BocXPy0esBbiBpAiwwf8u3PeNyql+4TjtKD03wg1h4lTEOtZKdL2toZWTDKv8QL
         IF/tAHydiK1dWXYsvMgErBXJVpFEOWxKDVUN59UEyFTHwvIZnW4K51ccj6mr2yLkUb0e
         yDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553620; x=1727158420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVYJdvkFkNlxeJMRsZ4TNMxACduPDS+BlYyHwRQEdIQ=;
        b=ZK4RnC6bNOwelEZ0KGnKkmq5DLV1Xxqe2YzLDvCmuKQThgqZqfuq3cAx7Eo101BJ4v
         COdG0wUV+s8KW2mL1KBkYfbUGsd6/2wFJ5Xlqhy8SW2tlgwqnmAcs6ATCRYodg/4zQ0y
         T2wQvSBNL+UEAww7i9AxJptxriPTr+zGb8d3Y7lHuHWtkHSZuDOG6fBnXOe2WjcpnwsB
         PpLqNnY3V9oMj+7NZLTGN6oOUKucOCkbU5+CGsEDPn0gYo8x4bipmuFoI1IiSc+ruIUs
         +2B3fFwU6P71poW6JG6q3qBwZYu36ahe+c635+/AU4EIMiWJkD06TK6d1OijO3GLMXWc
         8HXg==
X-Forwarded-Encrypted: i=1; AJvYcCXEYfSXxygtMcCAml2S1qGdq/FM206mCPf5xGJZw2USRZzLdC3NK1+lDhXtcblBlBLARxReoJEPt1K4VAbv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4QCSBRsgOaILqnrRZyzdJFOmRAFUP2NAR5bsnqR5QQnWhWsV
	xsBkQaRde47stUFTpLigW30JOUNg95JQnTJQby+PdWHBNNPgSfa9SW1GS+FWeNY=
X-Google-Smtp-Source: AGHT+IFdBF7B4QyEPBZPGOnaXJlYt4ba+AFuUcaY/D5OQvGqZTdStRahA8ylEs0QG75e1xb02yE0Yw==
X-Received: by 2002:a05:6512:2384:b0:536:55b3:470e with SMTP id 2adb3069b0e04-53678fb70a0mr9815758e87.19.1726553619760;
        Mon, 16 Sep 2024 23:13:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870967a5sm1107728e87.181.2024.09.16.23.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:13:39 -0700 (PDT)
Date: Tue, 17 Sep 2024 09:13:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
Message-ID: <rpmp4pvv2fcg3iprcesco4a73vd457cdvlqtjtl6tzrmxkdlw6@jczni6cbi226>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
 <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
 <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>

On Mon, Sep 16, 2024 at 06:04:08PM GMT, Abhinav Kumar wrote:
> 
> 
> On 9/2/2024 8:22 PM, Dmitry Baryshkov wrote:
> > Historically CRTC resources (LMs and CTLs) were assigned in
> > dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> > resource tracking to crtc state") simply moved resources to
> > struct dpu_crtc_state, without changing the code sequence. Later on the
> > commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> > modeset") rearanged the code, but still kept the cstate->num_mixers
> > assignment to happen during commit phase. This makes dpu_crtc_state
> > inconsistent between consequent atomic_check() calls.
> > 
> > Move CRTC resource assignment to happen at the end of
> > dpu_encoder_virt_atomic_check().
> > 
> 
> Mostly LGTM now, a couple of comments/questions below:
> 
> > Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
> >   2 files changed, 38 insertions(+), 24 deletions(-)
> > 

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 949ebda2fa82..bd3698bf0cf7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >   	return topology;
> >   }
> > +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > +					      struct drm_encoder *drm_enc,
> > +					      struct dpu_global_state *global_state,
> > +					      struct drm_crtc_state *crtc_state)
> > +{
> > +	struct dpu_crtc_state *cstate;
> > +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > +	int num_lm, num_ctl, num_dspp, i;
> > +
> > +	cstate = to_dpu_crtc_state(crtc_state);
> > +
> > +	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > +
> > +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > +		ARRAY_SIZE(hw_dspp));
> > +
> > +	for (i = 0; i < num_lm; i++) {
> > +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +
> > +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > +		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > +	}
> > +
> > +	cstate->num_mixers = num_lm;
> > +}
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >   		struct drm_encoder *drm_enc,
> >   		struct drm_crtc_state *crtc_state,
> > @@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
> >   		if (!crtc_state->active_changed || crtc_state->enable)
> >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >   					drm_enc, crtc_state, topology);
> > +		if (!ret)
> > +			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> > +							  global_state, crtc_state);
> >   	}
> 
> This is now under the drm_atomic_crtc_needs_modeset() condition which is
> good, but shouldnt this also move under the same if condition as
> dpu_rm_reserve()? There cannot be any assignment without reservation right?

Maybe it's not that obvious from the function name, but it will also
clear previously assigned resources. So, I think it is correct to be
called even if the resources were released without further assignment.

> 
> 
> <snip>

-- 
With best wishes
Dmitry

