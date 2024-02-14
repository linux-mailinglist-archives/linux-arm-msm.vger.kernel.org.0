Return-Path: <linux-arm-msm+bounces-11080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD12855317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 993EFB20FB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ECF13A862;
	Wed, 14 Feb 2024 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJkHd11E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958B134738
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707938307; cv=none; b=I6FdxxuFfvHtFx1Cm1Uv6awfADhV7s5sYD3nIYu+zcGUK4jE4qeMtNtqbwpeC6RinMricF+joaxfh5u4w6bD1yAZY9lfXveH673w/KbY1+2pZ5ytcatQw3IJVC7uTJLgdBFok4iZpqOKvlDPf1FSeT5GQ51Lc009sQGwGibMY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707938307; c=relaxed/simple;
	bh=HM/aqNowpDm8X9UslrhZbariNIeQguxFURa257TdBGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSTs6gacfPQV0fNYnKoJ21Ra14lHXW1P7x4+WBNR4QBMd8FY5S9zmAcHJSb5F+wgkN8mnsBXSgTedgm7zayv+JLhKW0wejf2hfw00npkPU4rPezC8Gyyu2/+qsbWGtZ4RY5qCv7jFywz98qIarWMelg0qxBZYBHZqTIB9yqDdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJkHd11E; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso9724276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707938304; x=1708543104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vX31/EzD/EWKcus6lCA8zVhfltgaK7sFq7I9qzmQtfs=;
        b=GJkHd11E0s9Yg8f2LeJXICVpRuu57bmr8tqW6SWxMfw/S5dMEPt/tCAzBE3aMtHGKy
         vO7pttliqAHwrO6uCY3EorassjnjswIElcKhdKhQyW9nmiy5YcD59B0a8Sy4WARZbZM0
         izOYZbO/PHZPN+Nq9P2OqwKEavi7IN94ossi0c5CBBCGxhcvLQSN1oLUgwNGHuU2Ma+c
         9cTaVWz2HtEJwg+8tmuQ0dKiYKZyK7AUN9RutNdYT1PtP2xSWRRHOlDo56SardEDpFTm
         f5rFyNJDAjYhNL2XzrhT64CsEWktkzpm0kqB/9SdRTj3fGeh2lmkcSJd2KJUzwTbA6NE
         Vpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938304; x=1708543104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX31/EzD/EWKcus6lCA8zVhfltgaK7sFq7I9qzmQtfs=;
        b=FhxE45pANMJJw9HFgIhl791GjRxf9NiMmIoHhtzO/HwG1a89pi4/QJUvvgemW1KZia
         oUIc938C4muTzYKdzdPl4eDoimr4l/VrXabqwFokbWnKeLnko1MGg9JGSLbeXYW62nD+
         91vCwC0nXn76n0mc2DuoFFCzAtEH7Jlg1BC5iSH6ulNISRlG4B0cw32QPRP8RkwvR3pa
         wzdza0RCjF1wn17C+0Fs1K4093uqDcwIsYGA3802O6xRx30VToBa3s0IQPXZLi7gpsWr
         JFl8ZE7p7A6/lGko/In4Ww0C4hh+92HdFL36Mc5F1y+miIWajYNMSwGzCCUenBI05Oov
         DIYA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Nd4LRW9+UwiYrsGJO1w3IIz27I1oCa57ato7+jyebNVTg5ypHX3Jp2euMvllBvykfgfxcihh4m6lKfDI8bA/hgbKaSbT4UiX/umtbQ==
X-Gm-Message-State: AOJu0Yw7b9tRDnSKt+btwJ8tF631RUYAZbSe2ZLfZiHyAIKSFNLqi2Pg
	Yyh/VbQ+EKu/kSqWEfZS8Ybbw2dH7QN8JogHBBEZicK+rOELjnYf2vWOid0n+Lkz+aC9fkJRn7m
	zKHaRIx/HEr7V+jQJho4ZwXJW0kFc44Ljj50IpQ==
X-Google-Smtp-Source: AGHT+IF4aOVnL4Bd3VrS8xHPrKHuOlpm4uq7GLf0etCj1mf7gTKYmLfKqrL9SvEfzUISs1HpP36UHgZNvqQJmZKizwE=
X-Received: by 2002:a25:854d:0:b0:dcd:5e0f:19c7 with SMTP id
 f13-20020a25854d000000b00dcd5e0f19c7mr2748331ybn.54.1707938304299; Wed, 14
 Feb 2024 11:18:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-3-dmitry.baryshkov@linaro.org> <311b5714-47a8-7170-5b14-cde3ac05a314@quicinc.com>
In-Reply-To: <311b5714-47a8-7170-5b14-cde3ac05a314@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:18:13 +0200
Message-ID: <CAA8EJprQb=xDZ8e2bsLg-d3RmXQbjgda7K7BLsYb7zxMuAxGZw@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] drm/msm/dpu: add current resource allocation to
 dumped state
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 9/13/2023 10:06 PM, Dmitry Baryshkov wrote:
> > Provide atomic_print_state callback to the DPU's private object. This
> > way the debugfs/dri/0/state will also include RM's internal state.
> >
>
> I like this idea !
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 48 +++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
> >   4 files changed, 62 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index ee84160592ce..172b64dc60e6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -362,6 +362,7 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
> >   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
> >       .atomic_duplicate_state = dpu_kms_global_duplicate_state,
> >       .atomic_destroy_state = dpu_kms_global_destroy_state,
> > +     .atomic_print_state = dpu_rm_print_state,
> >   };
> >
> >   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> > @@ -375,6 +376,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> >       drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> >                                   &state->base,
> >                                   &dpu_kms_global_state_funcs);
> > +
> > +     state->rm = &dpu_kms->rm;
> > +
> >       return 0;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index ed549f0f7c65..dd2be279b366 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -130,6 +130,8 @@ struct vsync_info {
> >   struct dpu_global_state {
> >       struct drm_private_state base;
> >
> > +     struct dpu_rm *rm;
> > +
> >       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> >       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f9215643c71a..5e3442fb8678 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -652,3 +652,51 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >
> >       return num_blks;
> >   }
> > +
> > +void dpu_rm_print_state(struct drm_printer *p,
> > +                     const struct drm_private_state *state)
> > +{
> > +     const struct dpu_global_state *global_state = to_dpu_global_state(state);
> > +     const struct dpu_rm *rm = global_state->rm;
> > +     int i;
> > +
> > +     drm_puts(p, "pingpong:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
> > +             if (rm->pingpong_blks[i])
> > +                     drm_printf(p, " %d,", global_state->pingpong_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "mixer:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
> > +             if (rm->mixer_blks[i])
> > +                     drm_printf(p, " %d,", global_state->mixer_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "ctl:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
> > +             if (rm->ctl_blks[i])
> > +                     drm_printf(p, " %d,", global_state->ctl_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "dspp:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
> > +             if (rm->dspp_blks[i])
> > +                     drm_printf(p, " %d,", global_state->dspp_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "dsc:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
> > +             if (rm->dsc_blks[i])
> > +                     drm_printf(p, " %d,", global_state->dsc_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +}
>
> You also need to include cdm_to_enc_id now. But otherwise LGTM.
>
> If you have run this before, do you have a sample output to share?

No, I don't have a dump at hand. But I can post this patch separately,
including the CDM change.

>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 2b551566cbf4..913baca81a42 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -92,6 +92,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >       struct dpu_global_state *global_state, uint32_t enc_id,
> >       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> >
> > +/**
> > + * dpu_rm_print_state - output the RM private state
> > + * @p: DRM printer
> > + * @state: private object state
> > + */
> > +void dpu_rm_print_state(struct drm_printer *p,
> > +                     const struct drm_private_state *state);
> > +
> >   /**
> >    * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
> >    * @rm: DPU Resource Manager handle



-- 
With best wishes
Dmitry

