Return-Path: <linux-arm-msm+bounces-48820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F3A3EDE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97E081887A15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80181DE892;
	Fri, 21 Feb 2025 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUdPnFqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F011D7E2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740125280; cv=none; b=d7ye6+sqfv6OIBzJD8iDnRjJehutT7cIh5orNzoLshvx1w3AADlrBJK27DL+kJFT7b+enhUByo5OPYW2VJU23FyeEa204bme4s0M+hvjoxSTZ5xgfnMH56RlhfJlGdYukucwodsXZwXP9sEl3IQlodyDF2gBV4VhzBB4pVuhggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740125280; c=relaxed/simple;
	bh=9YbDTyTVwJh/Wep/XJvSHI2vVNDbOVH4FnwOVPQxO0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IppflsvLlk9sImXZYtDKh/xQlX8Jj5Sl+1I25m58Uf7dcm0R0lQREVk6heayG9oc9vFaSF4os9GSnaEgWaCGTXyum5jsH9RPDBmcnfG2Oiauxy6FZBIEWqTcnjnUyID3mioWUjJuj46sqO+HNQ/nfPXvCS9/rubaQIwdBZpqvnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUdPnFqg; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f74b78df93so17619077b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740125278; x=1740730078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKLARkfaaKwz/7mRhDEGEg4d9xF3Ru4DEnZAZer9QI0=;
        b=kUdPnFqgjWDO9j+jNORnaR0//TBEcoXjgjeO9xu85VeDQ4NL8MIf/2PpXsx7TksXwg
         RFeTonF7ib03tTQ1LcEmX/ErukaHmPGFEOgXnhhlKXVyKIzWZd8luv3tQKd5N+wY4OQw
         Cb9voXZhkYcJD4uE+RcNv/3OqaFetiU+ueb8iUQodFiMTOyYQl6BRyr1Tmfo/IqRJk/Q
         ciw9x1zN2E9Z++hIytVI+LhSklEvmo8Fxtq3J421nNR7GaLL9A2bZ6LB3ohVayNXrQJD
         wx5jPduJa/+WbnhCcayMTl/Fb6DmBvfXnPf6Cak5r65QfyEcPi5FPGJmQDGJypccv7/D
         NWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740125278; x=1740730078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKLARkfaaKwz/7mRhDEGEg4d9xF3Ru4DEnZAZer9QI0=;
        b=kU49fPu4UXbvabFV2kKgsCY227rdPbJOv1PfdsnLwE8w5buZsBiupSxqJVsZtWYm0k
         w/4hptjY0EYtLA3b+JnCuTAD+oV5m5Wg8nyDFgFpS/goKEOakX4DLArDYOXqwsWxOsHl
         vkg+EixXTRP23yQletTO7Ow4M/Oz2+ex4l86znHASGLKkjiQ8aB+RdUwYCXOkXGw8JPh
         BnspbWic6YSbXjChCkLgRX8nNVhU4J33whZX4Ov7G225lM7eU05e2RInnYZ0iY8bKmlC
         oZ4SFzKlQ7y0a1ZXdNYd6fViv158AHgngx3qDowdv287o0NS/oG6N+ACpKTJ0hAeuC2A
         h7qg==
X-Forwarded-Encrypted: i=1; AJvYcCXCE9j/y+OuUAw+EdUzlJHBftMtlZe9WKaJm7uPi/bkkx5Q09+yTCNUq4Rxzeqx9W9+J2xhyQ3UsfJzqyA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5YgAuEtUdOwdF3pXtwE2lOVOuEXdZcgApsW3f+aqxDFQ6bCB
	esCLcQFdFEklR1ThrFZ/1U2ifLbgajOshSgVxp1tCY7+jfoLp8ZO5g9jijyzmhRXEBwtKKnn052
	0vw4dhnkCDZw2nYB7NsK4wSbzQ1kS10ZNUXKS0g==
X-Gm-Gg: ASbGncvS28HzoOfDm32x/Kw3hgg7l1v86dU8Dt/noeXUhVtZfC/5AJSaXvF5yas8hiO
	2iq1RHFLBz9a7Yr5pA7qeuYaJjRKSTaOP+J6qiLKFXGZ6v9I3Td2W0HIYU5XIno1xXH0cGzdW+v
	jWjZjbFpiZBUdt
X-Google-Smtp-Source: AGHT+IHr2Wt5r/ae1OtDGgTQeXf4bmm0pRkFgOlmNseOyKuTFSKX76LPYNlKpjw3JATtGd1XmmsjYnJQVJjXE60Qut8=
X-Received: by 2002:a05:690c:7409:b0:6f7:406e:48d with SMTP id
 00721157ae682-6fbcc3942efmr21304927b3.35.1740125277969; Fri, 21 Feb 2025
 00:07:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com> <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
In-Reply-To: <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 21 Feb 2025 16:07:45 +0800
X-Gm-Features: AWEUYZlT0zegnUUFwqf9cd6gL2K4vN_ADtmplkuq26WeBuVh9ov_dWbeEYx7A5c
Message-ID: <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 00:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=
=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > Currently, only 2 pipes are used at most for a plane. A stage struc=
ture
> > > > describes the configuration for a mixer pair. So only one stage is =
needed
> > > > for current usage cases. The quad-pipe case will be added in future=
 and 2
> > > > stages are used in the case. So extend the stage to an array with a=
rray size
> > > > STAGES_PER_PLANE and blend pipes per mixer pair with configuration =
in the
> > > > stage structure.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++=
++----------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354=
faaa816fe74566784844c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct d=
rm_crtc *crtc,
> > > >                                      struct dpu_hw_stage_cfg *stage=
_cfg
> > > >                                     )
> > > >  {
> > > > -     uint32_t lm_idx;
> > > > +     uint32_t lm_idx, lm_in_pair;
> > > >       enum dpu_sspp sspp_idx;
> > > >       struct drm_plane_state *state;
> > > >
> > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct d=
rm_crtc *crtc,
> > > >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->multir=
ect_index;
> > > >
> > > >       /* blend config update */
> > > > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > > > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > > > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(m=
ixer[lm_idx].lm_ctl, sspp_idx);
> > >
> > > I almost missed this. Why is this necessary?
> >
> > It is protective code. In case there is only 1 LM, we should not
> > iterate 2 LM in a stage.
>
> That's not what the code does.

I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
num_mixers set as:
cstate->num_mixers - (stage * PIPES_PER_STAGE).
So lm_in_pair will get the LM number in this stage to iterate.
>
> > >
> > > >  }
> > > >
> > >
> > > [...]
> > >
> > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_c=
rtc *crtc)
> > > >                       mixer[i].mixer_op_mode,
> > > >                       ctl->idx - CTL_0);
> > > >
> > > > +             /*
> > > > +              * call dpu_hw_ctl_setup_blendstage() to blend layers=
 per stage cfg.
> > > > +              * There are 4 mixers at most. The first 2 are for th=
e left half, and
> > > > +              * the later 2 are for the right half.
> > > > +              */
> > >
> > > The comment is invalid until you introduce quad pipe, currently there
> > > are 2 mixers at most. However you can just say something like 'stage
> > > data is shared between PIPES_PER_STAGE pipes'.
> >
> > Accepted.
> > >
> > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > > -                     &stage_cfg);
> > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > >       }
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d=
02074505c5474a547a814 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > @@ -34,6 +34,7 @@
> > > >  #define DPU_MAX_PLANES                       4
> > > >  #endif
> > > >
> > > > +#define STAGES_PER_PLANE             2
>
> BTW, This should be 1 for now.

Yeah, it can be added in the last patch.
>
> > > >  #define PIPES_PER_PLANE                      2
> > > >  #define PIPES_PER_STAGE                      2
> > > >  #ifndef DPU_MAX_DE_CURVES
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

