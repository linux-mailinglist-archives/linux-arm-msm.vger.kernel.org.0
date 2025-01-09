Return-Path: <linux-arm-msm+bounces-44502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A947EA06D04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4661B18869CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D6F188722;
	Thu,  9 Jan 2025 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRAL5i2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435B4C7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396811; cv=none; b=qEEKpB9/+jl5+ctCAAvuEh9XzqNqgZO6ThQjWDXBsqQAHpKtezY1LSFB2ICyKf5NyJ4Aa7nlYxH9kYoMqi6cGEaNeEIQXJw6tOzIAsTwNlP6CrK7CWaeTEj3joQdWcyFBGkPXslv9ladPpCOCuljjXcRpPocgvYs5OaBamnNR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396811; c=relaxed/simple;
	bh=uM53NlxKqa+qNgh1Xx9xKIKn0YWcAnTh7sufidAgNog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyaS2+6HMCo6iMdtvbbImljbBhRSWVsqeuVljXJtZUPLl8iyqWXwUaX2FTmv29ZBMT4sb9/YNPT1VxXuogDccWlzeFLRTVn6bFhaBBnvT/pPG5VFV3tz6njazhCJq1PJLLl8R7YMVtdTUOGCvDiVwhJsR7EKtzeFvteONAUv38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRAL5i2Q; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30227c56b11so3752181fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736396806; x=1737001606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/Om4C21cxOdacF9bVr34DOZ7Jn+auy/uMpOh19Wfhk=;
        b=QRAL5i2Q1/uTnCNfTlVobB8Pcx9AmYrwTUafClQ6PMQ6VojVPrZ0fDl9BLBN14Vh9l
         6INGUHDoTbfGftTtDUv7I9tpCQ23HJl/JnH3snwyYHmVCCMBBjpBp7XluU2vilefWgiS
         /QTBeCsYiBHVmT3bwEgjVwtAdzHoxK2sD7Mmhvwi53MbeWyYzD8EXlL3qlqjl0MUEDYl
         +K4a2gc4jkPwIZwg9eTrwVHAz4dh6Gg29qZBUxgWUiCpInj5Y/SqNAtg7AL9qYlt1j/V
         RLItfLZzvaH1KIjF3QOu53HQck5I4zDPwhcmba9DAunvScYGdDWG/SSY5kSqq23V/sI9
         kQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736396806; x=1737001606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/Om4C21cxOdacF9bVr34DOZ7Jn+auy/uMpOh19Wfhk=;
        b=KbfO6ArDPCnq2PjlA6quELEZhZqsiK/xO8dxRaKW3E/36yu+yXL58G5qfkCD6JXAgc
         TIzXhIi2D4jDGmkzRNT7X6rgjFAZXGxyqhJlXSaSuUQnuqEneMQ6sAFe0OENwNzghgEt
         H5qMI4UX0pV38Oes7iHJGNoVUqd90tS5mtsDlCSseprjFX09/J19kADWcE3jjz72x8hy
         XwNMvcYK38WDYwTKP8uki0oyYGINHBrwHAiNitIQzoH8GfWt07nQXwZWZbaWcSGz29Sp
         Pw1nqEJlwRrov9QvkrFFSq2vYSrv/ars70q6nGU5cj85IXR3rDH0eWDSDywYWSyvydLI
         iH+A==
X-Forwarded-Encrypted: i=1; AJvYcCUepiUQ18Za8pmoN3eDdAKPJu8JI1yfprByfScylnr2LIPszHU2QgZXKOTQFqqjZ7eqzR+AyurcK9BbhAM2@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDx9U+JZN/Ewdy/aql9Bs+66x9viECZ1397w66mz+eiSAbDTo
	ey5MQERpw1kAt+FWNszhd+CPj3/lSBsqC65cYKvC112K8UZ+ZwN28Q/im0+nNng=
X-Gm-Gg: ASbGncsdEG8dX3JwUOfaIpO9WroP033MJo8i9kV+rMgqD4GS+CjwQqOXvxvxVuYGLvE
	0c1xefwY1ph1RGGpoeJkqjaYTPPkrsyXWo2g6csSjVqQbXtiLT5GFnFir7SZrBB5lXHaBteKrFm
	7Ms0OryFuldlmZdAoDlfBvz7BVaP5X2rOLcdwlhlIGhZ6Xr/WSU3iZ8PsAHbyuYjRXDQL1TF+9i
	amYEdZdbxmzziS4tT7b6P92rTjPUmWbyrozGJowaG3tkdQs4JowaK6GxzwgRIKD3dmrOczHCrkw
	r/IlgdFC7bESTDoWJfWfUqNg8uyImaQyFic3
X-Google-Smtp-Source: AGHT+IHHq4gspYEdhTHMyXcmezEY1+Djfi+48+qomerqe9AIj5PpdcpYlixd2t1tkYNF4w8cqaCEbg==
X-Received: by 2002:a2e:809:0:b0:302:4130:e19c with SMTP id 38308e7fff4ca-305f458cfc4mr11016961fa.19.1736396806486;
        Wed, 08 Jan 2025 20:26:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7aaasm632581fa.70.2025.01.08.20.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:26:45 -0800 (PST)
Date: Thu, 9 Jan 2025 06:26:42 +0200
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
Message-ID: <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
 <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>

On Wed, Jan 08, 2025 at 08:11:27PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/8/2025 6:27 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > > Perform corresponding check before calling the drm_atomic_helper_check()
> > > function.
> > > 
> > > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> > > in case of YUV output")
> > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > Closes:
> > > https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32
> > > +++++++++++++++++++++++++----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26
> > > +++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> > >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> > >   5 files changed, 77 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c
> > > 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -753,6 +753,34 @@ static void
> > > dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > >       cstate->num_mixers = num_lm;
> > >   }
> > > +/**
> > > + * dpu_encoder_virt_check_mode_changed: check if full modeset is
> > > required
> > > + * @drm_enc:    Pointer to drm encoder structure
> > > + * @crtc_state:    Corresponding CRTC state to be checked
> > > + * @conn_state: Corresponding Connector's state to be checked
> > > + *
> > > + * Check if the changes in the object properties demand full mode set.
> > > + */
> > > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > +                    struct drm_crtc_state *crtc_state,
> > > +                    struct drm_connector_state *conn_state)
> > > +{
> > > +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > +    struct msm_display_topology topology;
> > > +
> > > +    DPU_DEBUG_ENC(dpu_enc, "\n");
> > > +
> > > +    /* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > +    topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode,
> > > crtc_state, conn_state);
> > > +
> > > +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > +        crtc_state->mode_changed = true;
> > > +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > +        crtc_state->mode_changed = true;
> > > +
> > > +    return 0;
> > > +}
> > 
> > How will this work exactly?
> > 
> > needs_cdm is set in the encoder's atomic_check which is called inside
> > drm_atomic_helper_check(). But this function is called before that.
> > 
> > So needs_cdm will never hit.
> > 
> 
> Sorry, my bad. after change (4) of this series needs_cdm is also populated
> within  dpu_encoder_get_topology().
> 
> To follow up on https://patchwork.freedesktop.org/patch/629231/?series=137975&rev=4#comment_1148651
> 
> So is the plan for CWB to add a dpu_crtc_check_mode_changed() like
> dpu_encoder's and call it?

I think dpu_encoder_virt_check_mode_changed() would transform into the
dpu_crtc_check_mode_changed() together with one of the patches that
moves resource allocation and refactors topology handling.

> 
> 
> > 
> > > +
> > >   static int dpu_encoder_virt_atomic_check(
> > >           struct drm_encoder *drm_enc,
> > >           struct drm_crtc_state *crtc_state,

-- 
With best wishes
Dmitry

