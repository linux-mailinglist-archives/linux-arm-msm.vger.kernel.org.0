Return-Path: <linux-arm-msm+bounces-21523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (unknown [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA58F9A51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8D20281A10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B08E80603;
	Mon,  3 Jun 2024 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3C6O/6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488784F1EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450817; cv=none; b=ja3nftkrnbn5PtpivRlng9T2lqm3c1DguncZizbBWPKBTtFOs7TL5Gs4ipX91/ioi+eSjuO/BwwiR/OF2RrBDtHkic3Yipz6w7UnZPi9X82zgRquEcV1P6mDtRKlQsqjxeBGz6boqxpUkLpQRa24HUb/epmMUOpG70CGlybjsxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450817; c=relaxed/simple;
	bh=BCZK9HvzCWKQPKFwHKeBxT5zYGBAMgJmDn/puB4RzmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WC9EEXOpPwHaQKrGDnOgRyxT5H7bhQHj5BDoZFK9BZTqdga+iXYWLtF1/GU3334l6nNWV24Gq0Kk7Dekuj/ZxiqYhZ/RaDtNw57JirbWHo1XEwf88IC1PUNhh0L7/auTMatYgYc8UcseWusfRK0u8HQdvPNJWN/qF5jTmcWzCRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3C6O/6x; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so39082171fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717450813; x=1718055613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3llFp6XU62QuqTiOvMfdzgxuqUgZrpZeZJw1lK9U1xg=;
        b=a3C6O/6xOvXFEkYAXFBVCjiHyGbkAmnfMh1KOL4dkBLrKtJgTT1HKrI2u7XT0Hti23
         X/kxicVDtW8djoH3JhvunRvkjj/obJpXsp3WhuVZbchV+kqYSmeDZaz2qxOJPSfVgBE0
         4yDRPIX79A5HZjAF5O0wWK++Q9tkzvDtDCP37w5u2yr0BOzw3DDUqC7sna7g0Z7cqwbm
         wXUQlJFNQALlrZPy3mmOD+odPa6nNGEwq9FtvlGqUTGgYRzS2tPp4lYL9t+Er1wc5pjd
         ei/mWM8mr9ljnL5hU8n385K9YBPIph4fqxVLdxpIxKH9KhNWCOOc6WFJEvuKwYrm1kZO
         drNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717450813; x=1718055613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3llFp6XU62QuqTiOvMfdzgxuqUgZrpZeZJw1lK9U1xg=;
        b=XJob/VR07YigPvKNAQHY6B10gWMqJY6TAjwy17KJDUren5QqGBP4r3AuaYA9EWIMGy
         2hwkJrkXcXlEdjUFZ6CUMnKcceBulzn7wk+ME8kTI7xyPhQBfSLcqMnjcznKiaNkf2dL
         FRzxA/AaT68OQXJ+XinkyLgDYmtxx6idYvbp5X+P6bTuVPo086QczYRJUaAMqN2rYWOq
         Ir7nZOHtSnVTV6jbhTF8FY3GDQWKzTTExfaeMqXLiSp03VSj+JzzvFgCRlOE0Z87KAbG
         d+wyYjWevrFf1vm4BzbrXA1Wu318MINxLabmlACnqJs9poVrx1QvtkZM/wv/tfcauUEg
         hlqw==
X-Forwarded-Encrypted: i=1; AJvYcCWJX+8bmpcJFrb4Q3lXJhUuhbEP9wCHy8kyvBjKZp+5j2KThPcNuGSHnI60mzEiYn6fjKb7maNenXfYJXevhFUXeBn/0i8cCP1peibkxw==
X-Gm-Message-State: AOJu0YzkI2aGXxRkRBq8A/q3lxIlbhykMHdOCxkulTqN9RZ3MUSzhd1V
	AYbp+WTwSCuHJuGKfk57Ym4Ag411q+G+08U9BtgtfduhhJNvLskCKtJgVGc9qRc=
X-Google-Smtp-Source: AGHT+IF8w25sByMAnhCrm0+slEMM4u8+QRDWCNHlVFFQ6GFKpbT4RCVbJBdiYhEi+BeqNtX5KbGNRQ==
X-Received: by 2002:a2e:9907:0:b0:2e5:685a:85b5 with SMTP id 38308e7fff4ca-2ea950e7b63mr89166921fa.1.1717450813268;
        Mon, 03 Jun 2024 14:40:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf107fsm13085771fa.122.2024.06.03.14.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 14:40:12 -0700 (PDT)
Date: Tue, 4 Jun 2024 00:40:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Message-ID: <zxta54l7bny2buyc35bhhfh5pusujb5acs2bk4qt5yrzo4uwbb@jgvcuc54lzww>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
 <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
 <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
 <37b56f66-4e71-51cc-a09d-fe4e1469f665@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37b56f66-4e71-51cc-a09d-fe4e1469f665@quicinc.com>

On Mon, Jun 03, 2024 at 02:24:27PM -0700, Abhinav Kumar wrote:
> 
> 
> On 6/3/2024 2:16 PM, Dmitry Baryshkov wrote:
> > On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> > > > Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> > > > LM requirements.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
> > > >    1 file changed, 12 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index e3b1e5f55a92..c5e874a3656a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> > > >        _dpu_crtc_complete_flip(crtc);
> > > >    }
> > > > 
> > > > -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > > +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > >                struct drm_crtc_state *state)
> > > 
> > > Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?
> > 
> > Ack, I'll rename it.
> > 
> > > 
> > > Also, prior to this change, we never had a bounds check for each LM
> > > which we should have had . Does this qualify for a Fixes tag?
> > 
> > Probably no. We currently have a limit in the drm_mode_config, which
> > ensures that the CRTC isn't too wide.
> > 
> 
> The limit in drm_mode_config is to ensure we will not go beyond
> 2*max_mixer_width for the mode as we support only upto 2 LMs.
> 
> This check is making sure that even for the single LM, we do not go beyond
> the max_mixer_width which is valid imo.

For the case where 2*LM mode is not possible? Yes, it seems to be a
valid case. But in such case I'd prefer to rework this patch and pull it
to the top of the series. I'll take a look.

> 
> > > 
> > > With those two questions addressed,
> > > 
> > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > >    {
> > > >        struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > >        struct drm_display_mode *adj_mode = &state->adjusted_mode;
> > > >        u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> > > > +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> > > >        int i;
> > > > 
> > > >        for (i = 0; i < cstate->num_mixers; i++) {
> > > > @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > >                r->y2 = adj_mode->vdisplay;
> > > > 
> > > >                trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> > > > +
> > > > +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> > > > +                     return -E2BIG;
> > > >        }
> > > 
> > > > +
> > > > +     return 0;
> > > >    }
> > > > 
> > > >    static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> > > > @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > > >        if (crtc_state->active_changed)
> > > >                crtc_state->mode_changed = true;
> > > > 
> > > > -     if (cstate->num_mixers)
> > > > -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > > > +     if (cstate->num_mixers) {
> > > > +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > > > +             if (rc)
> > > > +                     return rc;
> > > > +     }
> > > > 
> > > >        /* FIXME: move this to dpu_plane_atomic_check? */
> > > >        drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> > > > 
> > 
> > 
> > 

-- 
With best wishes
Dmitry

