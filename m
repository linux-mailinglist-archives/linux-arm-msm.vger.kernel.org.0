Return-Path: <linux-arm-msm+bounces-43971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B81A0208A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A5FA3A164A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2AF1D461B;
	Mon,  6 Jan 2025 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGuzCDIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0507A1D5140
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151718; cv=none; b=EY3xo9skIgBXINLdxgUO0xaCBb180YE1TmoNeTELGXyZvzgr0nCaLHmTDfmlHRIV1eiwqe8iOUT36ZSDaU5v65atrzvr3Ss8BYhZIk30lQ52T8ZNKYGufb5I+S998dzU6gDu9QYWuoxQJQRW5+2m1n1oTH783adMXbdqzieotw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151718; c=relaxed/simple;
	bh=Qkypo3gWGqL422KzSuFqnhLjkmfsHNjKy7WJglb9GlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slMAP6/bozO75IDv5sMV+uRhvH41pElPY20UBcJKGMo3/GLzysDz4mpCYyrCDTzXmIp5J/oabbwRUTIaxl2bxg0dq+6EY+GoPSi+oQK6Zq53UuhZLydSi/ZGiOezvWulpvxrVPu7/nUr3H/0Q+VjxsI74TpvFmNJUdKMjLCGrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGuzCDIN; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e46ebe19489so17797884276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736151715; x=1736756515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k2t8woJUb/meMdwAxlR+FqFbADBG5aadfc8KxHezWI=;
        b=mGuzCDIN1GdPjhYEkvJKMkOrXb7JShHs3rMsna1lQ2CEENdiH8ddPpcu54S1VDX5Xp
         u+wun0UQMO0nv9mvgF5BPaGzdtFa5bBYTPEKHwTcap5KnPmv6gLdWNJg12zV3F+e2og/
         dK+0jV38E3qSc7uEM4340e3vP6IO8b2pxdOka/zlE8jjsj2VJgzHbTQhumVgMePjw09p
         BwRoAgdJjAEKtCatxmhbVlwBFkurYt8tdL9pOX4ULIDsjx466foOEfx8Z3blHg7nW7jF
         qEsD4NpLGq6YlZKjyWQM63VJRQoZyO8TQq+QZpbhMjJtItgtP9jgupsqWUER4phsrA74
         yeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736151715; x=1736756515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k2t8woJUb/meMdwAxlR+FqFbADBG5aadfc8KxHezWI=;
        b=ITBzjPV87QKuaGusKssd0QDOYb4IQ69rtxfUb6QcsqCbsVr5IxNqkE20z0kBh+tb9X
         PBNJgdvkVRIioTXiD/iwa+dsA0NbOqVCsa7kJFAUylG+2+K25vxHgFddrGbmgS4QrdRV
         TkmNp5aGoKDprz0dSsHVhaE1wprAWo0U/EymaDcARD2/WkwJOK0zZfJDzR+eG9x/CZXD
         Us+U7VSbBbzPWhoBDky3y8bpZsghcCbkEit9U2ulmWoy7ouPudiiPNXrDC9NTZU8RI/9
         89XOm9/8HZCSlyqgo9aVkI92se6fDJbIjX+OGrjCJ6xxvnSfLpoooxGhOY25mZpNnU7A
         UuRA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+8mS6EI92wmMFeTBTxqul9db1MsONBaV8Y0OqwPRESfH37GAfttkFts8xzs5K3kHxYrCZ4TQoZUFB5as@vger.kernel.org
X-Gm-Message-State: AOJu0YzcabPcduEzSAKLZktGI7P7EKymYXQVSgBt4waQtFfS6x5s7yNt
	hBaQeC2sF5zFTB2k6ST3aybgMwhNwUSNKE1YSBf9tPN5qtnnfDKI9cTax2byQhUzCb1PRKj0JWG
	4bUY5FTLDPX+eS0V0eSkYNYiF6LZr6/sUzlKgfQ==
X-Gm-Gg: ASbGncu45GgdKrbzaFv1xRZcj94goPTuNATRLwlb7bnoDExqCBBLq3C1+dBfMi2Hvov
	7nbvyZGEZzcMRXu9j1M+NOgCwSTqoNvKxLp1DJg==
X-Google-Smtp-Source: AGHT+IFHUi70Kl+eoXF3pHbYJUMhwbBv092Ql17O/MOmuvFAOFRwHxNnkyfpzayfoS4/N116WsV+XE7a8BaHR5TB6rI=
X-Received: by 2002:a05:690c:350a:b0:6ef:668a:e55b with SMTP id
 00721157ae682-6f3f8110613mr452449597b3.15.1736151714946; Mon, 06 Jan 2025
 00:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com> <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
In-Reply-To: <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 6 Jan 2025 16:21:43 +0800
Message-ID: <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=884=E6=97=A5=E5=91=A8=E5=85=AD 01:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=
=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 07:46=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC =
are
> > > > enabled. We prefer to use 4 pipes for dual DSI case for it is power=
 optimal
> > > > for DSC.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++=
++++++------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> > > >  7 files changed, 30 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index bad75af4e50ab..3c51c199f3e05 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc =
*crtc,
> > > >               struct dpu_crtc_state *crtc_state)
> > > >  {
> > > >       struct dpu_crtc_mixer *m;
> > > > -     u32 crcs[CRTC_DUAL_MIXERS];
> > > > +     u32 crcs[CRTC_QUAD_MIXERS];
> > > >
> > > >       int rc =3D 0;
> > > >       int i;
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.h
> > > > index d1bb3f84fe440..ce41fb364f3db 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> > > >
> > > >       bool bw_control;
> > > >       bool bw_split_vote;
> > > > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > > > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> > > >
> > > >       uint64_t input_fence_timeout_ns;
> > > >
> > > > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> > > >
> > > >       /* HW Resources reserved for the crtc */
> > > >       u32 num_mixers;
> > > > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > > > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> > > >
> > > >       u32 num_ctls;
> > > > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > > > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> > > >
> > > >       enum dpu_crtc_crc_source crc_source;
> > > >       int crc_frame_skip_count;
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > index 96d06db3e4be5..6e54ddeaffacd 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > @@ -54,7 +54,7 @@
> > > >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> > > >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> > > >
> > > > -#define MAX_CHANNELS_PER_ENC 2
> > > > +#define MAX_CHANNELS_PER_ENC 4
> > > >
> > > >  #define IDLE_SHORT_TIMEOUT   1
> > > >
> > > > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >
> > > >       /* Datapath topology selection
> > > >        *
> > > > -      * Dual display
> > > > +      * Dual display without DSC
> > > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > >        *
> > > > +      * Dual display with DSC
> > > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > > > +      *
> > > >        * Single display
> > > >        * 1 LM, 1 INTF
> > > >        * 2 LM, 1 INTF (stream merge to support high resolution inte=
rfaces)
> > > >        *
> > > >        * Add dspps to the reservation requirements if ctm is reques=
ted
> > > >        */
> > > > +
> > > >       if (intf_count =3D=3D 2)
> > > >               topology.num_lm =3D 2;
> > > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > > >                * this is power optimal and can drive up to (includi=
ng) 4k
> > > >                * screens
> > > > +              * But for dual display case, we prefer 4 layer mixer=
s. Because
> > > > +              * the resolution is always high in the case and 4 DS=
Cs are more
> > > > +              * power optimal.
> > > >                */
> > > > -             topology.num_dsc =3D 2;
> > > > -             topology.num_lm =3D 2;
> > > > -             topology.num_intf =3D 1;
> > > > +
> > > > +             if (intf_count =3D=3D 2) {
> > > > +                     topology.num_dsc =3D 4;
> > > > +                     topology.num_lm =3D 4;
> > > > +                     topology.num_intf =3D 2;
> > > > +             } else {
> > > > +                     topology.num_dsc =3D 2;
> > > > +                     topology.num_lm =3D 2;
> > > > +                     topology.num_intf =3D 1;
> > >
> > > Why is it only enabled for the DSC case? Also I'd like to point out
> > > platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> > > condition here needs more work to work with those platforms too.
> >
> > Because the DSC + quad-pipe is assumed with wide LCD case that dual
> > pipe can not handle due to width limitation. If DSC is not involved, th=
e
> > resolution is not too big to involve DSC together with 2 interfaces. Do=
 you
> > think there is need to support quad-pipe without DSC?
>
> Yes, of course. The same logic: ultra wide resolutions. If two LMs are
> not enough for the panel / monitor.
>
> >
> > Of course, it is a valid case to use 2 DSC with 2 interfaces. Below log=
ic shall
> > be better.
> >
> >    if (intf_count =3D=3D 2) {
> >            topology.num_dsc =3D dpu_kms->catalog->dsc_count >=3D 4 ? 4 =
: 2;
> >            topology.num_lm =3D topology.num_dsc;
> >            topology.num_intf =3D 2;
> >    } else {
> >            topology.num_dsc =3D 2;
> >            topology.num_lm =3D 2;
> >            topology.num_intf =3D 1;
> >    }
>
> It all starts to look like a collection of use-case quirks. But indeed,
> it should work.
>
> >
> > >
> > > > +             }
> > > >       }
> > > >
> > > >       return topology;
> > > > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(s=
truct dpu_encoder_phys *phys_enc)
> > > >       struct dpu_hw_mixer_cfg mixer;
> > > >       int i, num_lm;
> > > >       struct dpu_global_state *global_state;
> > > > -     struct dpu_hw_blk *hw_lm[2];
> > > > -     struct dpu_hw_mixer *hw_mixer[2];
> > > > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> > > >       struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> > > >
> > > >       memset(&mixer, 0, sizeof(mixer));
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > index 63f09857025c2..d378a990cc0fb 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encode=
r_helper_get_3d_blend_mode(
> > > >
> > > >       /* Use merge_3d unless DSC MERGE topology is used */
> > > >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > > > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > > > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > > > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
> > >
> > > Misaligned. Also isn't it enough to check that num_mixers !=3D 1?
> >
> > Yeah, num_mixers !=3D 1 should work.
> > >
> > > >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> > > >               return BLEND_3D_H_ROW_INT;
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > index 3ab79092a7f25..d9cc84b081b1f 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > @@ -25,6 +25,7 @@
> > > >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> > > >
> > > >  #define CRTC_DUAL_MIXERS     2
> > >
> > > Do we still need this define?
> > >
> > > > +#define CRTC_QUAD_MIXERS     4
> > > >
> > > >  #define MAX_XIN_COUNT 16
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > index 27ef0771da5d2..1fe21087a141a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > @@ -33,8 +33,8 @@
> > > >  #endif
> > > >
> > > >  #define STAGES_PER_PLANE             2
> > > > -#define PIPES_PER_PLANE                      2
> > > >  #define PIPES_PER_STAGE                      2
> > > > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * S=
TAGES_PER_PLANE)
> > >
> > > This is incorrect.
> > >
> > > >  #ifndef DPU_MAX_DE_CURVES
> > > >  #define DPU_MAX_DE_CURVES            3
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct =
drm_plane *plane)
> > > >               trace_dpu_plane_disable(DRMID(plane), false,
> > > >                                       pstate->pipe[i].multirect_mod=
e);
> > > >
> > > > -             if (pipe->sspp && i =3D=3D 1) {
> > > > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SS=
PP_RECT_1) {
> > >
> > > Separate change, please. Also I'm not sure how does that work with th=
e
> > > shared SSPP case that I pointed to in one of the previous replies.
> >
> > Maybe we can add a peer member in the pipe to reference each other, the=
n we have
> > chance to use multirect across all pipes in all planes.
>
> I'd rather not. We have pairs of pipes. I'd rather see the code stay the
> same way: processing one pair at the same time.

I mean only use the peer only when the SSPP multi-rect pips cross
planes. This shall not change
too much to current SSPP management.
>
> >
> >
> > >
> > > >                       pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > >                       pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > >
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

