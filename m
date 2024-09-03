Return-Path: <linux-arm-msm+bounces-30437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4E9691B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927D11F229DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E22433BC;
	Tue,  3 Sep 2024 03:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICZwZYUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBFE15E81
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333437; cv=none; b=q4aj/h6DnrMlxWbs5YWPGorF3e5xCgK9Ec6w6WnIMdrWGzdFj147o2XCblx2sz31Od4Y/GfuqgIvY0gvKi+bURnJ5p3/VzYWfEJEOb2azp00woVaC8oL+CCfrEkwKghEfNTprVMqAipHEQfAEAeJTyNu0EEq5jBFxBF0E3z6u0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333437; c=relaxed/simple;
	bh=NbHwTVarbymz32io32+5uP8fZ5n1zemHxbxSXqgFmPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKrlRq/CsBHJcJRhvh+yaLhxjUGzwRO7vkFdoU7H1OUcfhkcM+jBsPwXBCqcVJqQFJCXP46EzEAZ4OYhYHPPxr9Vp71+I0SSukUP6yqxbKeU0jR/TOK6g60unFBhRGr0iKQ4DBnI4nSpydr4eTOCdFuU8mH44nGwcgaoqDB5E7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ICZwZYUn; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6d47d860fc4so24883407b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333434; x=1725938234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UUufsIJyHoy9RDK1kWaUN/LAKR3GALHApq+wLIQw3+Q=;
        b=ICZwZYUnXelV0Vaao1M5+Dm5rmXoX1Pl1OOyjCgTzqYr5NyE+5gWw7yKC6e85nwVLn
         dwGoV9qnyNDpiEfBQiMxLlN23SOUFGpuPggDM86zaGDaySR2LOHoI9Tq21cPH18J2kml
         f9XqIpnGhjqi+0eD++KrOztWEcv6y/ZTIJo75UP+PI0BZ21ouOrEJCrfU/bmuk1P3GBq
         jNe8XPVEClzxFXsdai2q9Giz+13jNLARY6aG6zYo306ie+WeYZzIL64RR2yPGz46B+JO
         l9Oywa0C2kVvUtxQsXB+iQvJEDbSgintVQp0VvN7Emq/tRYlJXGfcQXUhOYwFCXPkZvZ
         aSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333434; x=1725938234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUufsIJyHoy9RDK1kWaUN/LAKR3GALHApq+wLIQw3+Q=;
        b=I5MRZZfxKhUWZBYzb24ZBac3TMPjphxwe5z9dX9JMNLF7cwEaT1wwX9NydPDn5v7ZF
         QhFFJl0YWXqKvpDm8v0ygAsih/CVhtkavxxEsIldLDV6VrhYUTG+Y46OiaIKhPxj1uNJ
         qEH+AG+xBQYJFUU60ob3KNJrjEFUTPDrjhTertPJLCBcqUywVwJkdYp1BQrIB/2w9IMr
         7qZKjoDo2qwUFcYRH3TFRNhsEDqqgZXlJXFdN2dj4NevDe1RGIZVP6tiu+TgukvQ7A1Q
         FHePj4o7Vvtma0a1wSdZsdCSIV80JOSKPW2+XPj90xIMnY5i7/TX6HkB9tQZZTq8+lx4
         BiNA==
X-Forwarded-Encrypted: i=1; AJvYcCU/9r0p6L/ibDGsv9VWy66RwcvZ7FBTwc11fg/h11tFa1OGFcaIrQxVb0vp6bMycTB2KdZo4eTHZ+CJhDPq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3Y4tTLepn4VPSaYodC2UbZUTagLvr3jnfQsCnhml4rXPLf9g
	dtUoi1VkeAN0wHtv9Cc6hUuHXsbOWeMqzfRhlIYSvVu2Wo0qkTTd8LFNS9+b2qzQr4j21Whv+/a
	0caN1XKtYd7CH/m/LDWk4zPritQhEgbLoCSTVWw==
X-Google-Smtp-Source: AGHT+IHvvS/9h79ps7+GR2ul1mK14Sytg43Z6RoKgzmCiYkcQPCnUcSjywSaXN7Kh56xMRmxdmT3Z7QwTx6vIsjZmRM=
X-Received: by 2002:a05:690c:ed2:b0:6d3:c673:e57a with SMTP id
 00721157ae682-6d40d987ad8mr129839817b3.5.1725333434116; Mon, 02 Sep 2024
 20:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org> <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
In-Reply-To: <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 06:17:02 +0300
Message-ID: <CAA8EJpr3oz7Rphg-HEJg=4yQuPZeWCs688-QoJwC=EjSArK+-Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 01:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
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
> > Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
> >   2 files changed, 39 insertions(+), 24 deletions(-)
> >


> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 7613005fbfea..98f3a8d84300 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >       return topology;
> >   }
> >
> > +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > +                                           struct drm_encoder *drm_enc,
> > +                                           struct dpu_global_state *global_state,
> > +                                           struct drm_crtc_state *crtc_state)
> > +{
> > +     struct dpu_crtc_state *cstate;
> > +     struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > +     int num_lm, num_ctl, num_dspp, i;
> > +
> > +     cstate = to_dpu_crtc_state(crtc_state);
> > +
> > +     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > +
> > +     num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +     num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > +             ARRAY_SIZE(hw_dspp));
> > +
> > +     for (i = 0; i < num_lm; i++) {
> > +             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +
> > +             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > +             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > +             if (i < num_dspp)
>
> Will there be a case where num_lm != num_dspp?

And there is one. If DSPPs were not requested at all. I'll handle this
by setting hw_dspp to NULL instead.

>
> > +                     cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > +     }
> > +
> > +     cstate->num_mixers = num_lm;
> > +}
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >               struct drm_encoder *drm_enc,
> >               struct drm_crtc_state *crtc_state,
> > @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
> >                                       drm_enc, crtc_state, topology);
> >       }
> >
> > +     if (!ret)
> > +             dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
> > +
> >       trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >
> >       return ret;
> > @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >       struct dpu_encoder_virt *dpu_enc;
> >       struct msm_drm_private *priv;
> >       struct dpu_kms *dpu_kms;
> > -     struct dpu_crtc_state *cstate;
> >       struct dpu_global_state *global_state;
> >       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > -     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > -     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> >       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -     int num_lm, num_ctl, num_pp, num_dsc;
> > +     int num_ctl, num_pp, num_dsc;
> >       unsigned int dsc_mask = 0;
> >       int i;
> >
> > @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >               ARRAY_SIZE(hw_pp));
> >       num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >               drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > -     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > -     dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > -             ARRAY_SIZE(hw_dspp));
> >
> >       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >               dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >       }
> >
> > -     cstate = to_dpu_crtc_state(crtc_state);
> > -
> > -     for (i = 0; i < num_lm; i++) {
> > -             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > -
> > -             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > -             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > -             cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > -     }
> > -
> > -     cstate->num_mixers = num_lm;
> > -
> >       dpu_enc->connector = conn_state->connector;
> >
> >       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >



-- 
With best wishes
Dmitry

