Return-Path: <linux-arm-msm+bounces-45092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC0A11EAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA513A7A8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79B422F832;
	Wed, 15 Jan 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pax7Fi/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCE020B1FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934999; cv=none; b=F6Sqw59QrRL+NS3SlHzBE60L4vf9HbWNy4/5m4Zv55UpzRduT/1zNBwAcXxGBWyZtauM7xkXmSJN1xvFV5HpReBY9LJ0GOID77CbequOwywbX97eJwOuf4LqY0Kd5WBP46qgVV7gkO80PL44dZWnzLe7bTFPp1errA5y+dNNIqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934999; c=relaxed/simple;
	bh=sXzpR7AY8lxGu6y9X3q/cxh+SQ+GSxc0uBHTXMhLEDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDfAXvCXyeIQtedCu3NCAZ460KL0aZv29bYUyFDKyAHM3/L+2czT12tiTOGvF57ldvw3NOtVnTF2m3CiG88ADGvcHiKlRWhUgnPH9hD6sEkBsqIHlbPnxtEs+1k6TQGRsvshJ+4FM7OTtOB4xNCNTfPvZG0CZ6hy1+XfinPzye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pax7Fi/6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30616d71bb0so35055661fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 01:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736934994; x=1737539794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4NbaAPA4KZidZN9igMvvUhEuUYQkMPdFpA4C+Rcz3WU=;
        b=Pax7Fi/6FqhajskWQ3D7PSAzkCXufQwp24CLEw05wX/JLo872RqVKwJKtBzmSvauIX
         7vH5MZZwqNQIIL1dra5kD8fmq1nBXqWjeHuVNZ/Z4/3uaPWyPyL+WjNmD5PsWPvbrovP
         CXXmzqEXS6yKHFvVVScm6l+l7WaLd+T58bBQ7SqIprIaHcnySctwDo9xo4cP5unqvgCF
         dOaxOFmhnxurzyfj8M1a5r7Q6Ri7i/5ZRWaYAetjC7arFAZ8oB+JzdHPIUQnB9RdQeRn
         iA3NuE8wuJ6wRzVHbqZCag1CQv2wfGZCfkkL9YKMmSR085eMnbSyCg2JtQx+PDGdmPP2
         xYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736934994; x=1737539794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NbaAPA4KZidZN9igMvvUhEuUYQkMPdFpA4C+Rcz3WU=;
        b=hyB3X7+lXPGanTvK6WvpPBuouydyTUtDVMfj5Eu+pj7sPKab9U0fIxI0NNvHPS2dsa
         oY0Y899PhqL92K02Xnin14h/gQa9L3mrDyxaSQVGQiLxo+mfEP3MLaQ+yMh48M+2Vy98
         BJxTEymunQ809m68U9nPcA/Kk1b47Fq3Tk0Ik6RNZqzLXuWxWYnzi/GJhye2tqZHKlzw
         4Kx3Bhe1PWHoJ8txbDe/qA8BhlkaUZEM94eP0zCXqQ5tUfoVilWwEXac6BYj6at3wA00
         y0bH+wmsyeMGtWPsq054k7YEOT630RcHYKL4xvbnduY+xIL9hUDigalWiUS3RIOyrcu/
         h42g==
X-Forwarded-Encrypted: i=1; AJvYcCXqb1UyUTk/0TGotJj+jrOYtY+quLuw/AbIQn991+5Gncz0HQhfdiUQF7jnQQnd7vCjgCHZqZCV2j2w5wU1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcb/TOYbaMJ8maZD7h7+uvht9V8DNxyQnDBEYEcKHTFXnlutIE
	DmpvEoD+G3msCGDKF6ZgqX+TDEIduzlbzJmet9O1ZLTAfjr+EGtY3++oFF9wKrU=
X-Gm-Gg: ASbGncvfZHT/ymwiIBvRp2vUG2rZvf2Ywl5I7fIc3vF3hbkaB1TiJh6QQMu6mXaPIYW
	jpQPVt0ZVILslJR3zEnB9ND5ckjo+rUJzd8Xjk1YNU/1QMtOtgETjQMtsO/OORNV3bEoWBtGc4N
	gWXM1cL8dt4qyX1jBIdi2fWwOYD///Zoh2Ze2y59p42Ce3qHeFBldNRtkwhMLabV/sajNWgbqMy
	LNXIsmbEhKYWWIL6YdvAHuewk5nqrxKkIzaaB0sINsB/aBbqzLl75Mrht94TPU2zqRAcE3bfZRk
	RkC4y3kQa7P1p6SYvyafX4SCS1EfwrEDLuVm
X-Google-Smtp-Source: AGHT+IGdcAOdUG5fgly7YfptG6CNNweisHhi/hZNftHi4OvJxWiB8xY4glhYK6kEsCdx9Iy4Jw5dDw==
X-Received: by 2002:a05:651c:4cb:b0:304:4e03:f9d9 with SMTP id 38308e7fff4ca-305f45e84b9mr95164771fa.28.1736934994161;
        Wed, 15 Jan 2025 01:56:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7d9asm21725061fa.77.2025.01.15.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:56:32 -0800 (PST)
Date: Wed, 15 Jan 2025 11:56:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 06/25] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <sh5b25yj5down5udxyqh6c3zv3iqboy2z7woapzkmf4or2kcad@y2e3vb7oae2g>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-6-fe220297a7f0@quicinc.com>
 <c5zetpm7kdonvkmzvuun3b6omcplyet3xjtrdjm6rcsnzqnaxd@qvdeobkzanw2>
 <ymmjih5imrh7rrvgylolrerdqffqz57qcuvyj6dyb2ak367f3t@nfoqwt6hxy34>
 <7beaf677-d1b9-4342-ad62-90eb4a1df17c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7beaf677-d1b9-4342-ad62-90eb4a1df17c@quicinc.com>

On Tue, Jan 14, 2025 at 09:28:50PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/24/2024 12:00 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 06:45:07AM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 16, 2024 at 04:43:17PM -0800, Jessica Zhang wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Up to now the driver has been using encoder to allocate hardware
> > > > resources. Switch it to use CRTC id in preparation for the next step.
> > > > 
> > > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > > Changes in v4 (due to rebase):
> > > > 
> > > > - moved *_get_assigned_resources() changes for DSPP and LM from
> > > >    encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> > > > ---
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  20 +--
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
> > > >   4 files changed, 110 insertions(+), 118 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > index 5172ab4dea995a154cd88d05c3842d7425fc34ce..e6f930dd34566d01223823de82c922668e6be300 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > @@ -715,11 +715,11 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > > >   	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > > +		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > 
> > > And this crashes because drm_enc->crtc isn't set yet. Was this commit
> > > tested? Or was it only tested as a part of the patchset, after this code
> > > has been rewritten by the subsequent patches? I will replace this with
> > > crtc_state->crtc, but generatlly this looks bad.
> > 
> > Even with this in place, it fails the kms_color@ctm-max for pipe-B-eDP-1
> > on SC7180 (pipe-A-eDP-1 succeeds). See job log at [1].
> > 
> > corresponding excerpt from the log:
> > 
> > [IGT] kms_color: starting dynamic subtest pipe-B-eDP-1
> > [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
> > [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
> > [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
> > [IGT] kms_color: finished subtest pipe-B-eDP-1, FAIL
> > 
> > FWIW it looks like during an attempt to use second CRTC the driver
> > doesn't release resources for the first one. I'll drop this patch for
> > now, leaving just HW_CWB patches in.
> > 
> > [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/68614460/viewer
> 
> Hi Dmitry,
> 
> Thanks for catching this -- it seems like the issue is because a disabling
> commit will not call into the encoder atomic check.
> 
> During the disabling commit at the end of the IGT test [2], the connector is
> detached from the crtc it was testing on. Because of this, we end up
> skipping over any connector that doesn't have the best_encoder or crtc set
> [1] within mode_fixup().
> 
> So we'll never release the dspp block from the pipe-A/crtc-0 subtest, which
> will cause the "failed to reserve hw resources" error for pipe-b/crtc-1.

And currently the test works because the encoder isn't changed, so all
resources are kept from the previous run, even though the routing has
changed from CRTC 0 to 1. Fun.

> Overall, I think the issue stems from the fact that we're trying to update a
> crtc-based component within an encoder-specific callback. Maybe the right
> call here would be to squash this commit with "drm/msm/dpu: move resource
> allocation to CRTC".

I'd rather not. Those two changes are big enough and independent. Can
you change the order of those two commits instead?

> 
> What do you think?
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/drm_atomic_helper.c#L441
> [2] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_color.c#L603
> 
> > 
> > > 
> > > >   	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > > +		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > >   	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > > > +		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > > 
> > > 
> > > >   		ARRAY_SIZE(hw_dspp));
> > > >   	for (i = 0; i < num_lm; i++) {
> > > > @@ -796,11 +796,11 @@ static int dpu_encoder_virt_atomic_check(
> > > >   	 * Dont allocate when active is false.
> > > >   	 */
> > > >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > > > -		dpu_rm_release(global_state, drm_enc);
> > > > +		dpu_rm_release(global_state, crtc_state->crtc);
> > > >   		if (!crtc_state->active_changed || crtc_state->enable)
> > > >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> > > > -					drm_enc, crtc_state, &topology);
> > > > +					crtc_state->crtc, &topology);
> > > >   		if (!ret)
> > > >   			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> > > >   							  global_state, crtc_state);
> > > > @@ -1244,17 +1244,17 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > >   	/* Query resource that have been reserved in atomic check step. */
> > > >   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> > > > +		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > >   		ARRAY_SIZE(hw_pp));
> > > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > > +		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > > >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > > >   						: NULL;
> > > >   	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -						drm_enc->base.id, DPU_HW_BLK_DSC,
> > > > +						drm_enc->crtc, DPU_HW_BLK_DSC,
> > > >   						hw_dsc, ARRAY_SIZE(hw_dsc));
> > > >   	for (i = 0; i < num_dsc; i++) {
> > > >   		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> > > > @@ -1268,7 +1268,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > >   		struct dpu_hw_blk *hw_cdm = NULL;
> > > >   		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > -					      drm_enc->base.id, DPU_HW_BLK_CDM,
> > > > +					      drm_enc->crtc, DPU_HW_BLK_CDM,
> > > >   					      &hw_cdm, 1);
> > > >   		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> > > >   	}
> > > > @@ -2189,7 +2189,7 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
> > > >   	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
> > > >   	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
> > > > -		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > > +		phys_enc->parent->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > >   	for (i = 0; i < num_lm; i++) {
> > > >   		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > index 88d64d43ea1a8226b414f04bf76551f7dda94ef6..48d756d8f8c6e4ab94b72bac0418320f7dc8cda8 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > @@ -122,12 +122,12 @@ struct dpu_global_state {
> > > >   	struct dpu_rm *rm;
> > > > -	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> > > > -	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> > > > -	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> > > > -	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> > > > -	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> > > > -	uint32_t cdm_to_enc_id;
> > > > +	uint32_t pingpong_to_crtc_id[PINGPONG_MAX - PINGPONG_0];
> > > > +	uint32_t mixer_to_crtc_id[LM_MAX - LM_0];
> > > > +	uint32_t ctl_to_crtc_id[CTL_MAX - CTL_0];
> > > > +	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> > > > +	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
> > > > +	uint32_t cdm_to_crtc_id;
> > > >   };
> > > >   struct dpu_global_state
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > index cd5960af4a151428cc6fb7154c3ffdb65ebcf287..2f227e6826b5f90bdab508bd1e87075d8b4274fd 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > @@ -22,9 +22,9 @@
> > > >   static inline bool reserved_by_other(uint32_t *res_map, int idx,
> > > > -				     uint32_t enc_id)
> > > > +				     uint32_t crtc_id)
> > > >   {
> > > > -	return res_map[idx] && res_map[idx] != enc_id;
> > > > +	return res_map[idx] && res_map[idx] != crtc_id;
> > > >   }
> > > >   /**
> > > > @@ -226,7 +226,7 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > > >    *	pingpong
> > > >    * @rm: dpu resource manager handle
> > > >    * @global_state: resources shared across multiple kms objects
> > > > - * @enc_id: encoder id requesting for allocation
> > > > + * @crtc_id: crtc id requesting for allocation
> > > >    * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
> > > >    *      if lm, and all other hardwired blocks connected to the lm (pp) is
> > > >    *      available and appropriate
> > > > @@ -239,14 +239,14 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > > >    */
> > > >   static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> > > >   		struct dpu_global_state *global_state,
> > > > -		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> > > > +		uint32_t crtc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> > > >   		struct msm_display_topology *topology)
> > > >   {
> > > >   	const struct dpu_lm_cfg *lm_cfg;
> > > >   	int idx;
> > > >   	/* Already reserved? */
> > > > -	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
> > > > +	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
> > > >   		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
> > > >   		return false;
> > > >   	}
> > > > @@ -258,7 +258,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> > > >   		return false;
> > > >   	}
> > > > -	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
> > > > +	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
> > > >   		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
> > > >   				lm_cfg->pingpong);
> > > >   		return false;
> > > > @@ -274,7 +274,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> > > >   		return false;
> > > >   	}
> > > > -	if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
> > > > +	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
> > > >   		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
> > > >   				lm_cfg->dspp);
> > > >   		return false;
> > > > @@ -286,7 +286,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> > > >   static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > > >   			       struct dpu_global_state *global_state,
> > > > -			       uint32_t enc_id,
> > > > +			       uint32_t crtc_id,
> > > >   			       struct msm_display_topology *topology)
> > > >   {
> > > > @@ -310,7 +310,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > > >   		lm_idx[lm_count] = i;
> > > >   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> > > > -				enc_id, i, &pp_idx[lm_count],
> > > > +				crtc_id, i, &pp_idx[lm_count],
> > > >   				&dspp_idx[lm_count], topology)) {
> > > >   			continue;
> > > >   		}
> > > > @@ -329,7 +329,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > > >   				continue;
> > > >   			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
> > > > -					global_state, enc_id, j,
> > > > +					global_state, crtc_id, j,
> > > >   					&pp_idx[lm_count], &dspp_idx[lm_count],
> > > >   					topology)) {
> > > >   				continue;
> > > > @@ -346,12 +346,12 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > > >   	}
> > > >   	for (i = 0; i < lm_count; i++) {
> > > > -		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
> > > > -		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
> > > > -		global_state->dspp_to_enc_id[dspp_idx[i]] =
> > > > -			topology->num_dspp ? enc_id : 0;
> > > > +		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
> > > > +		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
> > > > +		global_state->dspp_to_crtc_id[dspp_idx[i]] =
> > > > +			topology->num_dspp ? crtc_id : 0;
> > > > -		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
> > > > +		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, crtc_id,
> > > >   					 pp_idx[i] + PINGPONG_0);
> > > >   	}
> > > > @@ -361,7 +361,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > > >   static int _dpu_rm_reserve_ctls(
> > > >   		struct dpu_rm *rm,
> > > >   		struct dpu_global_state *global_state,
> > > > -		uint32_t enc_id,
> > > > +		uint32_t crtc_id,
> > > >   		const struct msm_display_topology *top)
> > > >   {
> > > >   	int ctl_idx[MAX_BLOCKS];
> > > > @@ -380,7 +380,7 @@ static int _dpu_rm_reserve_ctls(
> > > >   		if (!rm->ctl_blks[j])
> > > >   			continue;
> > > > -		if (reserved_by_other(global_state->ctl_to_enc_id, j, enc_id))
> > > > +		if (reserved_by_other(global_state->ctl_to_crtc_id, j, crtc_id))
> > > >   			continue;
> > > >   		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
> > > > @@ -404,8 +404,8 @@ static int _dpu_rm_reserve_ctls(
> > > >   		return -ENAVAIL;
> > > >   	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
> > > > -		global_state->ctl_to_enc_id[ctl_idx[i]] = enc_id;
> > > > -		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
> > > > +		global_state->ctl_to_crtc_id[ctl_idx[i]] = crtc_id;
> > > > +		trace_dpu_rm_reserve_ctls(i + CTL_0, crtc_id);
> > > >   	}
> > > >   	return 0;
> > > > @@ -413,12 +413,12 @@ static int _dpu_rm_reserve_ctls(
> > > >   static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
> > > >   				       int start,
> > > > -				       uint32_t enc_id)
> > > > +				       uint32_t crtc_id)
> > > >   {
> > > >   	int i;
> > > >   	for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
> > > > -		if (global_state->pingpong_to_enc_id[i] == enc_id)
> > > > +		if (global_state->pingpong_to_crtc_id[i] == crtc_id)
> > > >   			return i;
> > > >   	}
> > > > @@ -439,7 +439,7 @@ static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
> > > >   static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > > >   			     struct dpu_global_state *global_state,
> > > > -			     uint32_t enc_id,
> > > > +			     uint32_t crtc_id,
> > > >   			     const struct msm_display_topology *top)
> > > >   {
> > > >   	int num_dsc = 0;
> > > > @@ -452,10 +452,10 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > > >   		if (!rm->dsc_blks[dsc_idx])
> > > >   			continue;
> > > > -		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
> > > > +		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id))
> > > >   			continue;
> > > > -		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > > > +		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
> > > >   		if (pp_idx < 0)
> > > >   			return -ENAVAIL;
> > > > @@ -463,7 +463,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > > >   		if (ret)
> > > >   			return -ENAVAIL;
> > > > -		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > > > +		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
> > > >   		num_dsc++;
> > > >   		pp_idx++;
> > > >   	}
> > > > @@ -479,7 +479,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > > >   static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > > >   				  struct dpu_global_state *global_state,
> > > > -				  uint32_t enc_id,
> > > > +				  uint32_t crtc_id,
> > > >   				  const struct msm_display_topology *top)
> > > >   {
> > > >   	int num_dsc = 0;
> > > > @@ -494,11 +494,11 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > > >   			continue;
> > > >   		/* consective dsc index to be paired */
> > > > -		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
> > > > -		    reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
> > > > +		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id) ||
> > > > +		    reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx + 1, crtc_id))
> > > >   			continue;
> > > > -		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > > > +		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
> > > >   		if (pp_idx < 0)
> > > >   			return -ENAVAIL;
> > > > @@ -508,7 +508,7 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > > >   			continue;
> > > >   		}
> > > > -		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
> > > > +		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, crtc_id);
> > > >   		if (pp_idx < 0)
> > > >   			return -ENAVAIL;
> > > > @@ -518,8 +518,8 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > > >   			continue;
> > > >   		}
> > > > -		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > > > -		global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
> > > > +		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
> > > > +		global_state->dsc_to_crtc_id[dsc_idx + 1] = crtc_id;
> > > >   		num_dsc += 2;
> > > >   		pp_idx++;	/* start for next pair */
> > > >   	}
> > > > @@ -535,11 +535,9 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > > >   static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > >   			       struct dpu_global_state *global_state,
> > > > -			       struct drm_encoder *enc,
> > > > +			       uint32_t crtc_id,
> > > >   			       const struct msm_display_topology *top)
> > > >   {
> > > > -	uint32_t enc_id = enc->base.id;
> > > > -
> > > >   	if (!top->num_dsc || !top->num_intf)
> > > >   		return 0;
> > > > @@ -555,16 +553,16 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > >   	/* num_dsc should be either 1, 2 or 4 */
> > > >   	if (top->num_dsc > top->num_intf)	/* merge mode */
> > > > -		return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
> > > > +		return _dpu_rm_dsc_alloc_pair(rm, global_state, crtc_id, top);
> > > >   	else
> > > > -		return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
> > > > +		return _dpu_rm_dsc_alloc(rm, global_state, crtc_id, top);
> > > >   	return 0;
> > > >   }
> > > >   static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> > > >   			       struct dpu_global_state *global_state,
> > > > -			       struct drm_encoder *enc)
> > > > +			       uint32_t crtc_id)
> > > >   {
> > > >   	/* try allocating only one CDM block */
> > > >   	if (!rm->cdm_blk) {
> > > > @@ -572,12 +570,12 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> > > >   		return -EIO;
> > > >   	}
> > > > -	if (global_state->cdm_to_enc_id) {
> > > > +	if (global_state->cdm_to_crtc_id) {
> > > >   		DPU_ERROR("CDM_0 is already allocated\n");
> > > >   		return -EIO;
> > > >   	}
> > > > -	global_state->cdm_to_enc_id = enc->base.id;
> > > > +	global_state->cdm_to_crtc_id = crtc_id;
> > > >   	return 0;
> > > >   }
> > > > @@ -585,30 +583,31 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> > > >   static int _dpu_rm_make_reservation(
> > > >   		struct dpu_rm *rm,
> > > >   		struct dpu_global_state *global_state,
> > > > -		struct drm_encoder *enc,
> > > > +		uint32_t crtc_id,
> > > >   		struct msm_display_topology *topology)
> > > >   {
> > > >   	int ret;
> > > > -	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
> > > > +	ret = _dpu_rm_reserve_lms(rm, global_state, crtc_id, topology);
> > > >   	if (ret) {
> > > >   		DPU_ERROR("unable to find appropriate mixers\n");
> > > >   		return ret;
> > > >   	}
> > > > -	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
> > > > +
> > > > +	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> > > >   			topology);
> > > >   	if (ret) {
> > > >   		DPU_ERROR("unable to find appropriate CTL\n");
> > > >   		return ret;
> > > >   	}
> > > > -	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
> > > > +	ret  = _dpu_rm_reserve_dsc(rm, global_state, crtc_id, topology);
> > > >   	if (ret)
> > > >   		return ret;
> > > >   	if (topology->needs_cdm) {
> > > > -		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> > > > +		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
> > > >   		if (ret) {
> > > >   			DPU_ERROR("unable to find CDM blk\n");
> > > >   			return ret;
> > > > @@ -619,12 +618,12 @@ static int _dpu_rm_make_reservation(
> > > >   }
> > > >   static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
> > > > -				  uint32_t enc_id)
> > > > +				  uint32_t crtc_id)
> > > >   {
> > > >   	int i;
> > > >   	for (i = 0; i < cnt; i++) {
> > > > -		if (res_mapping[i] == enc_id)
> > > > +		if (res_mapping[i] == crtc_id)
> > > >   			res_mapping[i] = 0;
> > > >   	}
> > > >   }
> > > > @@ -633,23 +632,25 @@ static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
> > > >    * dpu_rm_release - Given the encoder for the display chain, release any
> > > >    *	HW blocks previously reserved for that use case.
> > > >    * @global_state: resources shared across multiple kms objects
> > > > - * @enc: DRM Encoder handle
> > > > + * @crtc: DRM CRTC handle
> > > >    * @return: 0 on Success otherwise -ERROR
> > > >    */
> > > >   void dpu_rm_release(struct dpu_global_state *global_state,
> > > > -		    struct drm_encoder *enc)
> > > > +		    struct drm_crtc *crtc)
> > > >   {
> > > > -	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
> > > > -		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
> > > > -	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
> > > > -		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
> > > > -	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
> > > > -		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
> > > > -	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> > > > -		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> > > > -	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> > > > -		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> > > > -	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
> > > > +	uint32_t crtc_id = crtc->base.id;
> > > > +
> > > > +	_dpu_rm_clear_mapping(global_state->pingpong_to_crtc_id,
> > > > +			ARRAY_SIZE(global_state->pingpong_to_crtc_id), crtc_id);
> > > > +	_dpu_rm_clear_mapping(global_state->mixer_to_crtc_id,
> > > > +			ARRAY_SIZE(global_state->mixer_to_crtc_id), crtc_id);
> > > > +	_dpu_rm_clear_mapping(global_state->ctl_to_crtc_id,
> > > > +			ARRAY_SIZE(global_state->ctl_to_crtc_id), crtc_id);
> > > > +	_dpu_rm_clear_mapping(global_state->dsc_to_crtc_id,
> > > > +			ARRAY_SIZE(global_state->dsc_to_crtc_id), crtc_id);
> > > > +	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
> > > > +			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
> > > > +	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
> > > >   }
> > > >   /**
> > > > @@ -661,42 +662,33 @@ void dpu_rm_release(struct dpu_global_state *global_state,
> > > >    *	HW Reservations should be released via dpu_rm_release_hw.
> > > >    * @rm: DPU Resource Manager handle
> > > >    * @global_state: resources shared across multiple kms objects
> > > > - * @enc: DRM Encoder handle
> > > > - * @crtc_state: Proposed Atomic DRM CRTC State handle
> > > > + * @crtc: DRM CRTC handle
> > > >    * @topology: Pointer to topology info for the display
> > > >    * @return: 0 on Success otherwise -ERROR
> > > >    */
> > > >   int dpu_rm_reserve(
> > > >   		struct dpu_rm *rm,
> > > >   		struct dpu_global_state *global_state,
> > > > -		struct drm_encoder *enc,
> > > > -		struct drm_crtc_state *crtc_state,
> > > > +		struct drm_crtc *crtc,
> > > >   		struct msm_display_topology *topology)
> > > >   {
> > > >   	int ret;
> > > > -	/* Check if this is just a page-flip */
> > > > -	if (!drm_atomic_crtc_needs_modeset(crtc_state))
> > > > -		return 0;
> > > > -
> > > >   	if (IS_ERR(global_state)) {
> > > >   		DPU_ERROR("failed to global state\n");
> > > >   		return PTR_ERR(global_state);
> > > >   	}
> > > > -	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
> > > > -		      enc->base.id, crtc_state->crtc->base.id);
> > > > +	DRM_DEBUG_KMS("reserving hw for crtc %d\n", crtc->base.id);
> > > >   	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> > > >   		      topology->num_lm, topology->num_dsc,
> > > >   		      topology->num_intf);
> > > > -	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
> > > > +	ret = _dpu_rm_make_reservation(rm, global_state, crtc->base.id, topology);
> > > >   	if (ret)
> > > >   		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
> > > > -
> > > > -
> > > >   	return ret;
> > > >   }
> > > > @@ -705,48 +697,49 @@ int dpu_rm_reserve(
> > > >    *     assigned to this encoder
> > > >    * @rm: DPU Resource Manager handle
> > > >    * @global_state: resources shared across multiple kms objects
> > > > - * @enc_id: encoder id requesting for allocation
> > > > + * @crtc: DRM CRTC handle
> > > >    * @type: resource type to return data for
> > > >    * @blks: pointer to the array to be filled by HW resources
> > > >    * @blks_size: size of the @blks array
> > > >    */
> > > >   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > > > -	struct dpu_global_state *global_state, uint32_t enc_id,
> > > > +	struct dpu_global_state *global_state, struct drm_crtc *crtc,
> > > >   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> > > >   {
> > > > +	uint32_t crtc_id = crtc->base.id;
> > > >   	struct dpu_hw_blk **hw_blks;
> > > > -	uint32_t *hw_to_enc_id;
> > > > +	uint32_t *hw_to_crtc_id;
> > > >   	int i, num_blks, max_blks;
> > > >   	switch (type) {
> > > >   	case DPU_HW_BLK_PINGPONG:
> > > >   		hw_blks = rm->pingpong_blks;
> > > > -		hw_to_enc_id = global_state->pingpong_to_enc_id;
> > > > +		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> > > >   		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> > > >   		break;
> > > >   	case DPU_HW_BLK_LM:
> > > >   		hw_blks = rm->mixer_blks;
> > > > -		hw_to_enc_id = global_state->mixer_to_enc_id;
> > > > +		hw_to_crtc_id = global_state->mixer_to_crtc_id;
> > > >   		max_blks = ARRAY_SIZE(rm->mixer_blks);
> > > >   		break;
> > > >   	case DPU_HW_BLK_CTL:
> > > >   		hw_blks = rm->ctl_blks;
> > > > -		hw_to_enc_id = global_state->ctl_to_enc_id;
> > > > +		hw_to_crtc_id = global_state->ctl_to_crtc_id;
> > > >   		max_blks = ARRAY_SIZE(rm->ctl_blks);
> > > >   		break;
> > > >   	case DPU_HW_BLK_DSPP:
> > > >   		hw_blks = rm->dspp_blks;
> > > > -		hw_to_enc_id = global_state->dspp_to_enc_id;
> > > > +		hw_to_crtc_id = global_state->dspp_to_crtc_id;
> > > >   		max_blks = ARRAY_SIZE(rm->dspp_blks);
> > > >   		break;
> > > >   	case DPU_HW_BLK_DSC:
> > > >   		hw_blks = rm->dsc_blks;
> > > > -		hw_to_enc_id = global_state->dsc_to_enc_id;
> > > > +		hw_to_crtc_id = global_state->dsc_to_crtc_id;
> > > >   		max_blks = ARRAY_SIZE(rm->dsc_blks);
> > > >   		break;
> > > >   	case DPU_HW_BLK_CDM:
> > > >   		hw_blks = &rm->cdm_blk;
> > > > -		hw_to_enc_id = &global_state->cdm_to_enc_id;
> > > > +		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
> > > >   		max_blks = 1;
> > > >   		break;
> > > >   	default:
> > > > @@ -756,17 +749,17 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > > >   	num_blks = 0;
> > > >   	for (i = 0; i < max_blks; i++) {
> > > > -		if (hw_to_enc_id[i] != enc_id)
> > > > +		if (hw_to_crtc_id[i] != crtc_id)
> > > >   			continue;
> > > >   		if (num_blks == blks_size) {
> > > > -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> > > > -				  blks_size, enc_id);
> > > > +			DPU_ERROR("More than %d resources assigned to crtc %d\n",
> > > > +				  blks_size, crtc_id);
> > > >   			break;
> > > >   		}
> > > >   		if (!hw_blks[i]) {
> > > > -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> > > > -				  type, enc_id);
> > > > +			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
> > > > +				  type, crtc_id);
> > > >   			break;
> > > >   		}
> > > >   		blks[num_blks++] = hw_blks[i];
> > > > @@ -801,37 +794,37 @@ void dpu_rm_print_state(struct drm_printer *p,
> > > >   	drm_puts(p, "resource mapping:\n");
> > > >   	drm_puts(p, "\tpingpong=");
> > > > -	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
> > > > +	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_crtc_id); i++)
> > > >   		dpu_rm_print_state_helper(p, rm->pingpong_blks[i],
> > > > -					  global_state->pingpong_to_enc_id[i]);
> > > > +					  global_state->pingpong_to_crtc_id[i]);
> > > >   	drm_puts(p, "\n");
> > > >   	drm_puts(p, "\tmixer=");
> > > > -	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
> > > > +	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_crtc_id); i++)
> > > >   		dpu_rm_print_state_helper(p, rm->mixer_blks[i],
> > > > -					  global_state->mixer_to_enc_id[i]);
> > > > +					  global_state->mixer_to_crtc_id[i]);
> > > >   	drm_puts(p, "\n");
> > > >   	drm_puts(p, "\tctl=");
> > > > -	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
> > > > +	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_crtc_id); i++)
> > > >   		dpu_rm_print_state_helper(p, rm->ctl_blks[i],
> > > > -					  global_state->ctl_to_enc_id[i]);
> > > > +					  global_state->ctl_to_crtc_id[i]);
> > > >   	drm_puts(p, "\n");
> > > >   	drm_puts(p, "\tdspp=");
> > > > -	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
> > > > +	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_crtc_id); i++)
> > > >   		dpu_rm_print_state_helper(p, rm->dspp_blks[i],
> > > > -					  global_state->dspp_to_enc_id[i]);
> > > > +					  global_state->dspp_to_crtc_id[i]);
> > > >   	drm_puts(p, "\n");
> > > >   	drm_puts(p, "\tdsc=");
> > > > -	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
> > > > +	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_crtc_id); i++)
> > > >   		dpu_rm_print_state_helper(p, rm->dsc_blks[i],
> > > > -					  global_state->dsc_to_enc_id[i]);
> > > > +					  global_state->dsc_to_crtc_id[i]);
> > > >   	drm_puts(p, "\n");
> > > >   	drm_puts(p, "\tcdm=");
> > > >   	dpu_rm_print_state_helper(p, rm->cdm_blk,
> > > > -				  global_state->cdm_to_enc_id);
> > > > +				  global_state->cdm_to_crtc_id);
> > > >   	drm_puts(p, "\n");
> > > >   }
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > index 2240275080c4e97e91f52eae329a3457ec2bc538..893344bf1141046a45f32a1834f857a56aa2b9b6 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > @@ -61,15 +61,14 @@ int dpu_rm_init(struct drm_device *dev,
> > > >   int dpu_rm_reserve(struct dpu_rm *rm,
> > > >   		struct dpu_global_state *global_state,
> > > > -		struct drm_encoder *drm_enc,
> > > > -		struct drm_crtc_state *crtc_state,
> > > > +		struct drm_crtc *crtc,
> > > >   		struct msm_display_topology *topology);
> > > >   void dpu_rm_release(struct dpu_global_state *global_state,
> > > > -		struct drm_encoder *enc);
> > > > +		struct drm_crtc *crtc);
> > > >   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > > > -	struct dpu_global_state *global_state, uint32_t enc_id,
> > > > +	struct dpu_global_state *global_state, struct drm_crtc *crtc,
> > > >   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> > > >   void dpu_rm_print_state(struct drm_printer *p,
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry

