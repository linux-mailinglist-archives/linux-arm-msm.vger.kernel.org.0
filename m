Return-Path: <linux-arm-msm+bounces-44552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FDA07567
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C9E164350
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C2D21518C;
	Thu,  9 Jan 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+emDWtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A90217642
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424774; cv=none; b=VEJKBfDc37nFIMh4Gc/PgwL2UrACwpP4RjDdrS28vDp4z6HVQHOkkokI02KsPeZH0L3n56fWFfLQ6BabTEHraBBcYGFeV83QAnkL49pONteUnxr6q/RZ7oFOluaNqPAgVyytrbu0/zJQyIkVgeztzyVMiyiEt86LlLyl4qYdS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424774; c=relaxed/simple;
	bh=fGcDtiB6fhZQzLY51FLsKTo0G3UbW8dEyylp3AIs2Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYgwFPLF3cCrnrJ0lYEX7WZNOXW1XvhGjIZq25B+c/+/s0Vjhb5pqxcxbPvGLPf69WwmM8jkUuHIadJaihKFadhq0av0PTbEpt/+ve7+0nhoOjS135CPNzypLYU1RNyJVzSZD3UkC5fhr4lvSkyg7mRrZMdTzEYp0tyc9UM7450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+emDWtw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso638775e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736424770; x=1737029570; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KdeRkbfFs33TxRcMnl/YLeLF47rmay+guENZ9SOKZfo=;
        b=p+emDWtw3TxTjToRbsM7dEDui1v58LLUcd3RGSJ2dqrGmCdvoyO2aV+YoYoxepGoAl
         jGeUYA+DgrbCOhknxTpNlwmX4X4e4QbPMRrnPRqq/GJ33hMN8q9UwTy//ADijPVLJQzQ
         jMgd1Vkae+rxMg88F5sa+d6MGav6gSPj0vZ1+J0hqzrAV2gK78aKgm10UqRfsi5uL5UT
         cuFCkdRRPgVk0DZ6E8jGe7hsipR2MWJdGMo8FuE/z4C416lRvmD5V6v0Z7kvlt+f1mCi
         VVF/Wjdr3PuHI2LR8FkFKUepXMptFiD6Y3PiUbMWptgF+jzm/84B+IIGtcM1y152aQK/
         sRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424770; x=1737029570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdeRkbfFs33TxRcMnl/YLeLF47rmay+guENZ9SOKZfo=;
        b=s9AO70rZ3nUXC3d6IR4yvP3FA9oL+LbJo9J9lseBR+xlXxwDAniH4lZJpUtUxShs21
         Bitpm8Vg9M63av8UW1xIu02meXRhmtDZJ1t68OKTphSRG+rCnQtgVunTALKYAn0LMHNd
         lEz2fZjFau7xWztRgDQXKKY/ntZoyPGN6UiWulY90lfGpPICMdCNdHNNO0QwZvLzyrMW
         nAVcyg/DSlNJFBM/XZM8H9l1JON+k4VZ5JUxbPe6pr/jWFAsLu+mNVoemVkxa0uZ8b5u
         HBbP/5h+7md4ID7SRzkX50H2Iw/N8Kb5pJK6kzBSJKaznUzIIVSYgINMTe0I3KBHUXbo
         VFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUHoK2XfqPHErzOR5l1MzBnbufVbWev2MCH3ICrrIalsoN9gdJ36VNqj8248Wmk1lBhTWYCaLMad7KNL32p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6hON3te0KUmZSdDi8ADmLkiH1rFfCbhItH1shtLsmeUMg+zG+
	JML1LFfGpTAKTPO0WvJlwFiYUIgHXB/E7RDslYIr+q2hrtdiRyOOyV61NYY6Qx8=
X-Gm-Gg: ASbGnculnCq5O0jBtPD7xOyXePUrhfjxes1IgLMpSCGe4cxvjlumHozszdWLXXku4Rr
	Vrc0zJ4oeP/VJYk1ko7gm+7gsipbd9CRV1koJSY4mkxx0w6WElcOduy9oJRByWgkLowFWoMSP13
	okneGP92bSgmdXblfQws1Zekzk+t/PM551D/zd5NeBSGvOUvmIPbz0oDpRH7MqesGXfK+Fhe2J7
	+rv8vdSKecP0Kz+jGi/41X97ByETOZdBKsmstXXr3KQ+iyDWXiBXdJWGsXEz0NGZ0rYifGGONo3
	44dEJik7hnfsjs5v5TimW3sHpKNr1lZYXLZp
X-Google-Smtp-Source: AGHT+IGcLOACthHe0DypjNG0/hG6RbfroIonsbZtEI6aQmGGUITF0LHYrpPPJqro3Chg+GyOAZCpfQ==
X-Received: by 2002:a05:6512:15a3:b0:542:2f5a:5f52 with SMTP id 2adb3069b0e04-542845b9037mr1567997e87.13.1736424770156;
        Thu, 09 Jan 2025 04:12:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49dfesm176082e87.39.2025.01.09.04.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:12:48 -0800 (PST)
Date: Thu, 9 Jan 2025 14:12:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <ncbiyesfrhm5723ydrdkdkwbji2yq7dgtzqx5y74c6iqfvws5s@elaxa5ysjmbo>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
 <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
 <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
 <a0c48f70-2a0f-45b0-b179-91dd544b5b59@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0c48f70-2a0f-45b0-b179-91dd544b5b59@quicinc.com>

On Wed, Jan 08, 2025 at 09:22:56PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/8/2025 8:26 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 08, 2025 at 08:11:27PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/8/2025 6:27 PM, Abhinav Kumar wrote:
> > > > 
> > > > 
> > > > On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > > > > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > > > > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > > > > Perform corresponding check before calling the drm_atomic_helper_check()
> > > > > function.
> > > > > 
> > > > > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> > > > > in case of YUV output")
> > > > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > Closes:
> > > > > https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32
> > > > > +++++++++++++++++++++++++----
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26
> > > > > +++++++++++++++++++++++
> > > > >    drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> > > > >    drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> > > > >    5 files changed, 77 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > @@ -753,6 +753,34 @@ static void
> > > > > dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > > > >        cstate->num_mixers = num_lm;
> > > > >    }
> > > > > +/**
> > > > > + * dpu_encoder_virt_check_mode_changed: check if full modeset is
> > > > > required
> > > > > + * @drm_enc:    Pointer to drm encoder structure
> > > > > + * @crtc_state:    Corresponding CRTC state to be checked
> > > > > + * @conn_state: Corresponding Connector's state to be checked
> > > > > + *
> > > > > + * Check if the changes in the object properties demand full mode set.
> > > > > + */
> > > > > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > > > +                    struct drm_crtc_state *crtc_state,
> > > > > +                    struct drm_connector_state *conn_state)
> > > > > +{
> > > > > +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > +    struct msm_display_topology topology;
> > > > > +
> > > > > +    DPU_DEBUG_ENC(dpu_enc, "\n");
> > > > > +
> > > > > +    /* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > > > +    topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode,
> > > > > crtc_state, conn_state);
> > > > > +
> > > > > +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > > > +        crtc_state->mode_changed = true;
> > > > > +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > > > +        crtc_state->mode_changed = true;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > 
> > > > How will this work exactly?
> > > > 
> > > > needs_cdm is set in the encoder's atomic_check which is called inside
> > > > drm_atomic_helper_check(). But this function is called before that.
> > > > 
> > > > So needs_cdm will never hit.
> > > > 
> > > 
> > > Sorry, my bad. after change (4) of this series needs_cdm is also populated
> > > within  dpu_encoder_get_topology().
> > > 
> > > To follow up on https://patchwork.freedesktop.org/patch/629231/?series=137975&rev=4#comment_1148651
> > > 
> > > So is the plan for CWB to add a dpu_crtc_check_mode_changed() like
> > > dpu_encoder's and call it?
> > 
> > I think dpu_encoder_virt_check_mode_changed() would transform into the
> > dpu_crtc_check_mode_changed() together with one of the patches that
> > moves resource allocation and refactors topology handling.
> > 
> 
> hmm we need the cur_master for cdm. That will not be accessible in
> dpu_crtc.c so we will end up with a separate dpu_crtc_check_mode_changed()
> for CWB from what I see. We will discuss it further when we re-post CWB.
> 
> But overall, I think we can make CWB work on top of this.
> 
> Hence,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> I do not know how important patch 2 is for this series and I would prefer
> not delaying CWB even more than what it already has been.
> 
> If we cannot reach a conclusion on patch 2, can you break that one out of
> this series so that the rest of it is ready to land?

Yes, there is no dependency between patches 1-2 and 3-6.

> 
> > > 
> > > 
> > > > 
> > > > > +
> > > > >    static int dpu_encoder_virt_atomic_check(
> > > > >            struct drm_encoder *drm_enc,
> > > > >            struct drm_crtc_state *crtc_state,
> > 

-- 
With best wishes
Dmitry

