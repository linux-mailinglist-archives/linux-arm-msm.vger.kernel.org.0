Return-Path: <linux-arm-msm+bounces-21519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D448D8B76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB1B1F268FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A45C2746B;
	Mon,  3 Jun 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFYK0TER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E513BC18
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717449424; cv=none; b=VSJrujheomqOyTadgDDbiICgCwGj3MEnsmlohm0PIyHTg6kat4emdpa3QUurXJ7zw9NkhIYg0GtEYAvSfuGPH4ftJW9XvvvNegsAL0ZhqbFEzNDLgmS3qCMUmk+18IIHe2VTF7kQwIOTta2P2FXfuQCuBgNWTprdbNGuUSfoHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717449424; c=relaxed/simple;
	bh=Jc2iCpFoy4WYLyiXe7WnK/o1BsKaCDn0TNMpewUFiDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2YOJnW1EC7uwtTSuUj+iZQm14CdfKOeieRVoPWt45PCsQtWTSfTPr8rwabWuZVUQJ/HCf2edxoDzHlDA8LJEpn8Ha7X7Eld+Ss2jdh1gn7InAoZ6DwfPRfEJ7UHUfeC+oFsGRxkwKiWMSlERrP0bISw9c69Mw66EX18IaGrujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFYK0TER; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa48f505a3so5000962276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717449421; x=1718054221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
        b=xFYK0TERaDI++oGyOk9qTjaxsHtIBwMYNWBHsEZ1mY1VW+xy+Pct0IdMIDbCWaVf0V
         rtaf57thulYeME2b74igZe3YpyBoWYb6Ef+Vrd+/FV3W13xH8pMssISWQMQh0AtQcvAu
         qRTitKNwIOORvsTNd3IOUr2Zz33ozH/5rQzkR+9Xmv25P/HCTftxSq1nZTSv86AfZX8C
         bjFeW02n4OPPUpumL33gckxoVOgmZDR37gQcGJg7XqDxETl6POU4TKj7L7hf2H6DL/bR
         yYst7ZnpcC/25p+ybib2PQC841gRnBLeB7111zgyyEMSUTUNr0SWWhnWThTOESvhtk2H
         A9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717449421; x=1718054221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
        b=tmVmj/4D0tFpbv/hvlHAKIsAe5F+sQAbJv5vs44zU6fAYCxfHxD70EdpcvFeYWkllz
         P8I2t0E04mrUiol4WseC9lhxEL5/AK9ypzmzlM1Q9DY+uHfW5T/ukr5rF9oPUss/LtIF
         t1pVBCAr1Pi9k/ufGVQsKnrBxuerwxsZzm2r55A+rYqPgkpIJosauDzzP93SfEN3UQxh
         bWBThz6xfHlsHM+MXc70w/IJWjDWK6MK4JJgSQc5Sg1IaxTEW/wIVKQXbdm08eIFBYvK
         W85843oCOMjpSFxL6/RKYRnYi54qmQbu2QC3yh3J9u2w7YmXDAl7g8d0T8EeDL9l9Ext
         7fMg==
X-Forwarded-Encrypted: i=1; AJvYcCXxiaCZp7PikGBjrPPRiXjnLnYF6tctuLczuEpwwN495MqThRoG1ymkAan1uEocDIzw28dTMEfTTqrxQWkYrNBCj9Yq90/pp5PhsbRrgQ==
X-Gm-Message-State: AOJu0Yw6bMN0s72Ja1OoXxCAk9WaRvMHNo+/qPwe2Guc+ZbXWYyyVVJ7
	dhFcgpG0CdbqDtaWN1XOx1U/Lc32DKV0VsXXBxhx3Gw4vkBfBgYO//zvFp1FlOlE8sTHf/1p17Z
	PIVhz8RBClUuoYFGgmC6onfG7J2a/bpuY2HxTQQ==
X-Google-Smtp-Source: AGHT+IHXBjCG+hUE2uaiUa+TcyWv3gn4Tkioc8ie/Opt614FYx8Vk2I7G56tZfNuyxfaaO9hBJ98lE/p0E1CJ6Hfad4=
X-Received: by 2002:a25:a1e1:0:b0:dcf:411f:e78 with SMTP id
 3f1490d57ef6-dfa73c21968mr9024488276.25.1717449420670; Mon, 03 Jun 2024
 14:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org> <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
In-Reply-To: <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 00:16:49 +0300
Message-ID: <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> > Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> > LM requirements.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index e3b1e5f55a92..c5e874a3656a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >       _dpu_crtc_complete_flip(crtc);
> >   }
> >
> > -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               struct drm_crtc_state *state)
>
> Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?

Ack, I'll rename it.

>
> Also, prior to this change, we never had a bounds check for each LM
> which we should have had . Does this qualify for a Fixes tag?

Probably no. We currently have a limit in the drm_mode_config, which
ensures that the CRTC isn't too wide.

>
> With those two questions addressed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> >   {
> >       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> >       struct drm_display_mode *adj_mode = &state->adjusted_mode;
> >       u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> > +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >       int i;
> >
> >       for (i = 0; i < cstate->num_mixers; i++) {
> > @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               r->y2 = adj_mode->vdisplay;
> >
> >               trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> > +
> > +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> > +                     return -E2BIG;
> >       }
>
> > +
> > +     return 0;
> >   }
> >
> >   static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> > @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >       if (crtc_state->active_changed)
> >               crtc_state->mode_changed = true;
> >
> > -     if (cstate->num_mixers)
> > -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +     if (cstate->num_mixers) {
> > +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +             if (rc)
> > +                     return rc;
> > +     }
> >
> >       /* FIXME: move this to dpu_plane_atomic_check? */
> >       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> >



-- 
With best wishes
Dmitry

