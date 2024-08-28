Return-Path: <linux-arm-msm+bounces-29823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF69630A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC6F6B214B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDF91AB525;
	Wed, 28 Aug 2024 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJe+zApf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340651A706D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724871680; cv=none; b=uhvq6uDqrwNS1bcanZdXAx3hRUqSzjbEkYPsWcDJvydZuDXlruQlElQGG3gJ7Mzb4A8LqNybU/gLAz6f9Z6e6ntZQqQaHlD86/5u1m+0mJ9Vb2ox5tAmElX8RfORxd5ZBodu0TwJW4mNDgTU7AEPE2fG662mPM4OLlQYtkkvSDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724871680; c=relaxed/simple;
	bh=zoROEG6LxDGv/s+Lry7tKouwbWCdLvULTmTvfjzwJSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIHqirJdx4gacwpxHgjSgxulnReRwWh+SI0LQ7b2gKtLUqW5pY9PZJhU1AidjJWFhZksNXrvfHlCykpN0u5wyhHmsPan7CwQ9hqhj2Y64qf20R7k1VlNQotUlLerE2MugMDd4quz7JUT19By9WPWrx4dYfRYTjwaAwwYhaw8gQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJe+zApf; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-68518bc1407so78429197b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724871677; x=1725476477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYzFfi1Ev8FYH7LbPgUAbnhfyZJ/W0bJypa32oGuPbA=;
        b=SJe+zApfdByDWrHjH4BuHH8I8l9navhbarQcwx82yud2/ALM/+JP/8Kfy2qrL0wTUJ
         HffwJpM2TThALgi1GWxDFPcuORlhMMWvHGaLGv5oRaf+Nv7sihsFKhCON7lGqQcokK3h
         qRjoy9tAzvJFJmV6owTRoBijZbJlJzAVfFS6HmzOPDW4OC8HL3mlVaKCe4RGJMFukWna
         gOg9xukrzwSUw/BDYFqahTI5aPgHoaZLTu7al2nF63OpwiJSSShB0tE9YeaVZcUWhHmG
         U7d2sEI8922Z+76xRw8NXqN/GBvbWae7VFlvQbxspgz1ZU4jMdwLk5jIFZYc3UWfiQ6i
         aEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724871677; x=1725476477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYzFfi1Ev8FYH7LbPgUAbnhfyZJ/W0bJypa32oGuPbA=;
        b=b0hqYs0UGVmpkVNTTCenZ7fuqbAffhvOg9q+UqkgldATBPYO4UOMfBh1kIi+y6JzSF
         wCN3AK9FzhzkuV/MHEl1SWVP45d8195h4Tvfevf7nKbjFSX2Nb/O75UcYFWu/A4Jkaut
         Pqn5vbbm+zEIF9nNSgrEw5yB25e01rpKvSjDnTMl1g4WejQr4wDVbv+cSIMqy79ZtC19
         /80TljhxYU7MvSOFIGnm9V28xMJ2E0OiC7Hb7S3LUMZu9ZZgTnr6Zc+5ObNAOgPg+r8w
         AFFdhliT7gpiMNbQsxsCoY97PxJBk0zptKgkX1RuA/i9cP29J8i0wMY1YG89SWsFmyii
         i2/A==
X-Forwarded-Encrypted: i=1; AJvYcCVer76fvN+q721+d2/Klt/R34USd+diVOMTlG32WML6MY8rSQDaM5P+8tnABLVUjzLfrzfEz3+d02EvxN42@vger.kernel.org
X-Gm-Message-State: AOJu0YwXdK0O1tdHIjGnPUfhxp78ZuYttkh08nx+GNF7gLu8XmY6yjAe
	d3Nm3gRy22ZIrLjA6FYdOiiET47wfelNThfGvdXj2b4ej8cBbeRcEkwt9Gmss7A/WB1KbaW1JpL
	pSTr+o1CGCEBMb9iJ+zx1xrdxvMUC/FDkjhPUvg==
X-Google-Smtp-Source: AGHT+IGJYJaiyppejd5ObRamMazn56n61yTMuG6h2FkwRazQCApHZZ81rdnAm3LStaOt9Ioz5dEdwp3A+3m9uphydGA=
X-Received: by 2002:a05:690c:3391:b0:6b5:71b2:13da with SMTP id
 00721157ae682-6d277777516mr3672957b3.32.1724871676826; Wed, 28 Aug 2024
 12:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
 <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com> <CAA8EJpqzu0E=Cj+FpdjXdvterkPeXqwz_GFsut9jLaOawQTRjw@mail.gmail.com>
 <5ce9489c-6fb4-435c-b461-e1774817218f@quicinc.com>
In-Reply-To: <5ce9489c-6fb4-435c-b461-e1774817218f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 22:01:06 +0300
Message-ID: <CAA8EJpqgR0i5VC0eNhi6G1gcnuxk6gtUmEhkT9sm=81Q3HPfEg@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2024 at 23:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/16/2024 4:06 PM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jul 2024 at 01:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> >>> Historically CRTC resources (LMs and CTLs) were assigned in
> >>> dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> >>> resource tracking to crtc state") simply moved resources to
> >>> struct dpu_crtc_state, without changing the code sequence. Later on the
> >>> commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> >>> modeset") rearanged the code, but still kept the cstate->num_mixers
> >>> assignment to happen during commit phase. This makes dpu_crtc_state
> >>> inconsistent between consequent atomic_check() calls.
> >>>
> >>> Move CRTC resource assignment to happen at the end of
> >>> dpu_encoder_virt_atomic_check().
> >>>
>
> I just realized, why is the subject saying
> dpu_encoder_virt_atomic_mode_set while the patch is moving the
> assignment to dpu_encoder_virt_atomic_check(). It should say
> dpu_encoder_virt_atomic_check().

Ack

>
> One more commment below.
>
> >>> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
> >>>    2 files changed, 39 insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> index 9f2164782844..7399794d75eb 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> @@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >>>        drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >>>                dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> >>>
> >>> -     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >>> -     cstate->num_mixers = 0;
> >>> -
> >>
> >> Any reason this part was removed?
> >>
> >> I think we still need this part.
> >>
> >> In dpu_encoder_get_topology(), we do not assign topology.num_lm based on
> >> state parameters, its based on catalog and intf_count which are decided
> >> at init time itself.
> >>
> >> Which means cstate->num_mixers will remain at a non-zero value even if
> >> we have NO_MODE which is what happens when we are disabling the CRTC
> >> during suspend or hotplug.
> >
> > In the disable path the driver calls dpu_rm_release(), releasing all
> > resources. So there will be no assigned mixers, which matches num_lm =
> > 0 in dpu_encoder_assign_crtc_resources().
> >
>
> Ack.
>
> >>
> >>>        /* disable clk & bw control until clk & bw properties are set */
> >>>        cstate->bw_control = false;
> >>>        cstate->bw_split_vote = false;
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index 7613005fbfea..98f3a8d84300 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >>>        return topology;
> >>>    }
> >>>
> >>> +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >>> +                                           struct drm_encoder *drm_enc,
> >>> +                                           struct dpu_global_state *global_state,
> >>> +                                           struct drm_crtc_state *crtc_state)
> >>> +{
> >>> +     struct dpu_crtc_state *cstate;
> >>> +     struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>> +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> >>> +     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> >>> +     int num_lm, num_ctl, num_dspp, i;
> >>> +
> >>> +     cstate = to_dpu_crtc_state(crtc_state);
> >>> +
> >>> +     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >>> +
> >>> +     num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>> +     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> >>> +     num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> >>> +             ARRAY_SIZE(hw_dspp));
> >>> +
> >>> +     for (i = 0; i < num_lm; i++) {
> >>> +             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> >>> +
> >>> +             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> >>> +             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> >>> +             if (i < num_dspp)
> >>
> >> Will there be a case where num_lm != num_dspp?
> >
> > No, _dpu_rm_check_lm_and_get_connected_blks() makes sure that num_lm = num_dspp.
> > I will drop this condition and add a comment.
> >
> >>
> >>> +                     cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> >>> +     }
> >>> +
> >>> +     cstate->num_mixers = num_lm;
> >>> +}
> >>> +
> >>>    static int dpu_encoder_virt_atomic_check(
> >>>                struct drm_encoder *drm_enc,
> >>>                struct drm_crtc_state *crtc_state,
> >>> @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
> >>>                                        drm_enc, crtc_state, topology);
> >>>        }
> >>>
> >>> +     if (!ret)
> >>> +             dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
> >>> +
>
> Do we need to protect this with a needs_modeset() condition? Like why
> should this get called every check?

Sounds like a good idea.

>
> >>>        trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >>>
> >>>        return ret;
> >>> @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>        struct dpu_encoder_virt *dpu_enc;
> >>>        struct msm_drm_private *priv;
> >>>        struct dpu_kms *dpu_kms;
> >>> -     struct dpu_crtc_state *cstate;
> >>>        struct dpu_global_state *global_state;
> >>>        struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >>>        struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>> -     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> >>> -     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> >>>        struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>> -     int num_lm, num_ctl, num_pp, num_dsc;
> >>> +     int num_ctl, num_pp, num_dsc;
> >>>        unsigned int dsc_mask = 0;
> >>>        int i;
> >>>
> >>> @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>                ARRAY_SIZE(hw_pp));
> >>>        num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>                drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>> -     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> -             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> >>> -     dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> -             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> >>> -             ARRAY_SIZE(hw_dspp));
> >>>
> >>>        for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >>>                dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> >>> @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>                dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >>>        }
> >>>
> >>> -     cstate = to_dpu_crtc_state(crtc_state);
> >>> -
> >>> -     for (i = 0; i < num_lm; i++) {
> >>> -             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> >>> -
> >>> -             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> >>> -             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> >>> -             cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> >>> -     }
> >>> -
> >>> -     cstate->num_mixers = num_lm;
> >>> -
> >>>        dpu_enc->connector = conn_state->connector;
> >>>
> >>>        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

