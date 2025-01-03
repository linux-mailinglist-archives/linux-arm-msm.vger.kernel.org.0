Return-Path: <linux-arm-msm+bounces-43903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A5A00BAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 16:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A741880143
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 15:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8A21F9416;
	Fri,  3 Jan 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT4bW1MA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE91A9B5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919362; cv=none; b=ghmkabELwa+WsCW4jWEV5cBRCgtsoDYVkkgsj5vcJCqxO3WQxBWjz2Tsxx9qxu+z+Rum1xwtKJ6bu2fj7fyMTIl2Au8BVP/Pqyj9C8sejVy02TCrNr8fwfaTuH1v+nEYdO5IJgmFg8gasPJ2/PP9jH4Jv00Y11qtSC/MORkcC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919362; c=relaxed/simple;
	bh=ablD/cfSdIJ9JoBtO7hW2RpkUoTdCQBf7onwV6QnHbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHnN80oFqbD2Zb5OjPwEAX52FtxV3bf3fO/GJqpdQwrR5iD/Xqxao8j8ntsedBKYJwv3nRvfmyTi1I4P5n+VTcyYQxPeSclBXbhy/bBhVPDjWy0agAIxkgWYs8yWYSaIUHONXI81wdRAvq6Wbjt/KLcMR/7rrGBz7jt9zsc7S5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kT4bW1MA; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53537d8feeso15535461276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 07:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735919359; x=1736524159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
        b=kT4bW1MAxt7Kv3UaB65SgCT/Wm8cxB2cXn2lR20C9l+BCemX0sSy0wvGjBWEAdP1zU
         Kf0+zdIwR/lTwkxNZyhkuc8EBXRpXFZdXfsK7cETSYgU+99U6KILn7+HPOyW92YfQeRP
         Au+tUtNkzbxW6UKTildvKyM6IFJG4fPvJbUMB7v/nIIuA9FuB3iV/DUepa95f4Rp0zjd
         UFQrWmd8c/4AOJ+KwAc0/UwoNQZqul6CXUQ74bjZN5vbP4PWKLRJlTxdMa4iFrh6/fZW
         rSVUXcIGC2S5xn+878GO2S5Jhcac6LD4SwwoAc6YGIotfduVFliOtBYRGdTlzAYcU/Fh
         EdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919359; x=1736524159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
        b=iR4TR7UzB7ji0s1lh7CevogSoy5S9/U8LhQJBsUP1UsNMTyxeoPn0SGCGQgnsxOP40
         4/WDvDDiwVOmD0OLGsAMWU/sgNDUJj7QODLmrf+sh4H+0lH5UVN/B3bIDn1jKDPlCnDW
         wvlXuEgYAAv7cOadRu5SqUymzfMnqzg3KNpEgUuid4c4aLPTcKYbGAh1d0879mFP3Gda
         dhTbxwpu/hn9C2nJer1GKCMfGz5wGoj9BnUXWRByRXz8IwCIhetALdiRQHHQQiP2h1L6
         8Dxi6IkhnirpsiFvrqoKZipof7DfTYdEpEPeRX9pwrN1gSpOK4jtg4TJbzvDX924Su97
         Fw5g==
X-Forwarded-Encrypted: i=1; AJvYcCUXb8WY03qnI+wJ02qtZyRQZ0hpE6b5MIk0/NFyCSKdJ6pMrFAeGRT1fbpbZQRymPnC1VtdrotX83qPgPLj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9kmdFHosTb9FLJNkdF6Xbye/HduP6eZJSNphQinzLtFxtmSX
	jHg78P8PqMCWerw2ISjbbcZC2K7BHvgfcbHKmHG/KbI/DH79R89jpBUfC+LCGCQ8dpLXxFDyrjW
	PbyrVKqXUbTEfhBC38xyPg9UoVNSyOk5iiHxMhA==
X-Gm-Gg: ASbGncsw7Ov3Xg8WWYfxuzXQEwkTcQ89t0+Z4Gk+0voRPS1A9TY5sNO7K49dty/wlK2
	8Fs4ibwybLVX/nPlTY5cSQnfC2Owiug3ZLnwlL6o=
X-Google-Smtp-Source: AGHT+IHP341a3Glhoebec/iBg+1TPClIJwYbMaeZSLdG2H0oSM4QkjKRRdcfeCchDng3ZFDT0KD37a5a4f3XQ+95vR0=
X-Received: by 2002:a05:690c:25c9:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6f3f81253fcmr386260287b3.15.1735919358957; Fri, 03 Jan 2025
 07:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
In-Reply-To: <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 3 Jan 2025 23:49:07 +0800
Message-ID: <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 07:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled. We prefer to use 4 pipes for dual DSI case for it is power opt=
imal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> >  7 files changed, 30 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index bad75af4e50ab..3c51c199f3e05 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crt=
c,
> >               struct dpu_crtc_state *crtc_state)
> >  {
> >       struct dpu_crtc_mixer *m;
> > -     u32 crcs[CRTC_DUAL_MIXERS];
> > +     u32 crcs[CRTC_QUAD_MIXERS];
> >
> >       int rc =3D 0;
> >       int i;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index d1bb3f84fe440..ce41fb364f3db 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> >
> >       bool bw_control;
> >       bool bw_split_vote;
> > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> >
> >       uint64_t input_fence_timeout_ns;
> >
> > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> >
> >       /* HW Resources reserved for the crtc */
> >       u32 num_mixers;
> > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> >
> >       u32 num_ctls;
> > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> >
> >       enum dpu_crtc_crc_source crc_source;
> >       int crc_frame_skip_count;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 96d06db3e4be5..6e54ddeaffacd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -54,7 +54,7 @@
> >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> >
> > -#define MAX_CHANNELS_PER_ENC 2
> > +#define MAX_CHANNELS_PER_ENC 4
> >
> >  #define IDLE_SHORT_TIMEOUT   1
> >
> > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >       /* Datapath topology selection
> >        *
> > -      * Dual display
> > +      * Dual display without DSC
> >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >        *
> > +      * Dual display with DSC
> > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > +      *
> >        * Single display
> >        * 1 LM, 1 INTF
> >        * 2 LM, 1 INTF (stream merge to support high resolution interfac=
es)
> >        *
> >        * Add dspps to the reservation requirements if ctm is requested
> >        */
> > +
> >       if (intf_count =3D=3D 2)
> >               topology.num_lm =3D 2;
> >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >                * 2 DSC encoders, 2 layer mixers and 1 interface
> >                * this is power optimal and can drive up to (including) =
4k
> >                * screens
> > +              * But for dual display case, we prefer 4 layer mixers. B=
ecause
> > +              * the resolution is always high in the case and 4 DSCs a=
re more
> > +              * power optimal.
> >                */
> > -             topology.num_dsc =3D 2;
> > -             topology.num_lm =3D 2;
> > -             topology.num_intf =3D 1;
> > +
> > +             if (intf_count =3D=3D 2) {
> > +                     topology.num_dsc =3D 4;
> > +                     topology.num_lm =3D 4;
> > +                     topology.num_intf =3D 2;
> > +             } else {
> > +                     topology.num_dsc =3D 2;
> > +                     topology.num_lm =3D 2;
> > +                     topology.num_intf =3D 1;
>
> Why is it only enabled for the DSC case? Also I'd like to point out
> platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> condition here needs more work to work with those platforms too.

Because the DSC + quad-pipe is assumed with wide LCD case that dual
pipe can not handle due to width limitation. If DSC is not involved, the
resolution is not too big to involve DSC together with 2 interfaces. Do you
think there is need to support quad-pipe without DSC?

Of course, it is a valid case to use 2 DSC with 2 interfaces. Below logic s=
hall
be better.

   if (intf_count =3D=3D 2) {
           topology.num_dsc =3D dpu_kms->catalog->dsc_count >=3D 4 ? 4 : 2;
           topology.num_lm =3D topology.num_dsc;
           topology.num_intf =3D 2;
   } else {
           topology.num_dsc =3D 2;
           topology.num_lm =3D 2;
           topology.num_intf =3D 1;
   }

>
> > +             }
> >       }
> >
> >       return topology;
> > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struc=
t dpu_encoder_phys *phys_enc)
> >       struct dpu_hw_mixer_cfg mixer;
> >       int i, num_lm;
> >       struct dpu_global_state *global_state;
> > -     struct dpu_hw_blk *hw_lm[2];
> > -     struct dpu_hw_mixer *hw_mixer[2];
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> >
> >       memset(&mixer, 0, sizeof(mixer));
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 63f09857025c2..d378a990cc0fb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_he=
lper_get_3d_blend_mode(
> >
> >       /* Use merge_3d unless DSC MERGE topology is used */
> >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
>
> Misaligned. Also isn't it enough to check that num_mixers !=3D 1?

Yeah, num_mixers !=3D 1 should work.
>
> >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> >               return BLEND_3D_H_ROW_INT;
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 3ab79092a7f25..d9cc84b081b1f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -25,6 +25,7 @@
> >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> >
> >  #define CRTC_DUAL_MIXERS     2
>
> Do we still need this define?
>
> > +#define CRTC_QUAD_MIXERS     4
> >
> >  #define MAX_XIN_COUNT 16
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 27ef0771da5d2..1fe21087a141a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -33,8 +33,8 @@
> >  #endif
> >
> >  #define STAGES_PER_PLANE             2
> > -#define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_STAGE                      2
> > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * STAGE=
S_PER_PLANE)
>
> This is incorrect.
>
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES            3
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 57ccb73c45683..b5c1ad2a75594 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_=
plane *plane)
> >               trace_dpu_plane_disable(DRMID(plane), false,
> >                                       pstate->pipe[i].multirect_mode);
> >
> > -             if (pipe->sspp && i =3D=3D 1) {
> > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_R=
ECT_1) {
>
> Separate change, please. Also I'm not sure how does that work with the
> shared SSPP case that I pointed to in one of the previous replies.

Maybe we can add a peer member in the pipe to reference each other, then we=
 have
chance to use multirect across all pipes in all planes.


>
> >                       pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >                       pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

