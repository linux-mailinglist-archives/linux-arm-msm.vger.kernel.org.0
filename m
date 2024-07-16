Return-Path: <linux-arm-msm+bounces-26399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83B93346F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 01:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC2B1C20FC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C0B13CFA3;
	Tue, 16 Jul 2024 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNz0SPCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B713C693
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 23:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721171188; cv=none; b=I/+o+wceI5EOD/gP7U6hTGC2LW1NwLgmXtkEwbqMR0LYjPy06W4CnTciGxXNTT6qXkmD1vqUhkvvH1xnVVhJ5My7xyRPSgZ3q/z0FaSWWIFJWfTOYgpfVoHA1nEgJLik3+KVm8CQxKkYfhyGqDXHLbzwfGZ3LmpUCr33Vp6G7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721171188; c=relaxed/simple;
	bh=KPSjDvzbvP2zTTithoXYROhNIquigi6UMQsLvkIabPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cik2rPfLl+ZUGL6Id9osGiey1HIISw33+jT44Mk7z/9FvlmxMW20muuGn8rNLK2lZLfTlk19ncA2NdZApBsoTkGFe3Ciw6yjTiJzu3f02YMtGYZbYqV6teZevwrYPUKPhPm4nbvpHTKELs+5MOlxDiZvCwdSpkegc+K0ySyZsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNz0SPCe; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-66108213e88so28892327b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721171185; x=1721775985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=geR8HEQJ2bGMG0XRMen9/rHxBwkBnI0tdcutBuJsBQE=;
        b=oNz0SPCeEVmhLMa4YtmqV3KxB2qx4UNPah4c2Ni8rTiTIV0hy8KejCJWAGm/oRfPe8
         MR+fiLW10L1zM2ySvqLtQ8rTNESsYu+NPjdjToSRr2Y5pqbVyig7DTfWkPM5TmpqkXS/
         R6WqlD2Bmwagr/YpwC4lpdzWF8C4jwFMQEH9ouzpSB1mkxi0KPz0XY0ea7Z65a5198el
         0x4mUtLvjAqk9cKs7c45VZPqXo2XtxrynNmq33llzLmkHJPJ6RtuUhZHr1Ara9554Mc7
         1/zLsfSAwh9t4h6KWW7nJlskojATv/VJUBhUUvdvvHhUJHVdP7QRbYVar8+EXSsfkS6b
         8M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721171185; x=1721775985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geR8HEQJ2bGMG0XRMen9/rHxBwkBnI0tdcutBuJsBQE=;
        b=q6Aj/LuFxtS9ayFRhD8ebKlYNzveqmcahl7OTljklc1uUIXkEmEXDZjwEiIi6gB0Hi
         jQioF0m6Tt5WBleN9j3bWpZjDCRioPIqgkCpkZG+fla8BSvCpnO82N0LXdwuSqbyJOCW
         Jmd1bkxkZ+x353WYegK8F4b9jJotq3D08s27mJmGth6xodmPFZZKvPuq5u19cxEjhSsM
         mG0tt5SSnCc2UPl27I5yA4kZIPA+2P38UvMPWuZQBZJzVuAU3bQb+cqAkqeES4WQHQNV
         CALlz1DKb4ygYSMc7T0ogpjbu0YgFwAQcthPZl8y+d1IB+kH6y7X493qYCCXhg3gY7hr
         uL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLk8+K5KzERBbOEU10wpW5qIvvNk6mY7oD60hPcZ2GSqo+X1+dA8z9pSMM16EkXqLXBLS6PP4xhtj1cWOx9zXDKbl++4Y3MRncYYRFIw==
X-Gm-Message-State: AOJu0YzRkJHOyCCzwb0GpwGtcNyZ/Dz3iRh/mA/go4agrEjCXEDDeCxk
	LQ7npTnyOmkCP3GBvLam5FT30iN/G3EFmJYD3wBTiOy8mr3lcCvm3ndNEFL4WERatEA/zE0r6yb
	I9kYiRdd4VVPVip8gC7MLLxM6UVJzDVCPvJkEnw==
X-Google-Smtp-Source: AGHT+IGCvTxrVjrGYURqfNRPgpP+tIApJOhxeOYSLqGNjJ41tT7Mfk7QpLLfpuy1vcjiucRT2l/A47lcvnjrQ/7Iyz0=
X-Received: by 2002:a0d:d204:0:b0:64b:2a73:f050 with SMTP id
 00721157ae682-664fe933b54mr557647b3.23.1721171185597; Tue, 16 Jul 2024
 16:06:25 -0700 (PDT)
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
Date: Wed, 17 Jul 2024 02:06:14 +0300
Message-ID: <CAA8EJpqzu0E=Cj+FpdjXdvterkPeXqwz_GFsut9jLaOawQTRjw@mail.gmail.com>
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
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 9f2164782844..7399794d75eb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >       drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >               dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> >
> > -     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > -     cstate->num_mixers = 0;
> > -
>
> Any reason this part was removed?
>
> I think we still need this part.
>
> In dpu_encoder_get_topology(), we do not assign topology.num_lm based on
> state parameters, its based on catalog and intf_count which are decided
> at init time itself.
>
> Which means cstate->num_mixers will remain at a non-zero value even if
> we have NO_MODE which is what happens when we are disabling the CRTC
> during suspend or hotplug.

In the disable path the driver calls dpu_rm_release(), releasing all
resources. So there will be no assigned mixers, which matches num_lm =
0 in dpu_encoder_assign_crtc_resources().

>
> >       /* disable clk & bw control until clk & bw properties are set */
> >       cstate->bw_control = false;
> >       cstate->bw_split_vote = false;
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

No, _dpu_rm_check_lm_and_get_connected_blks() makes sure that num_lm = num_dspp.
I will drop this condition and add a comment.

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

