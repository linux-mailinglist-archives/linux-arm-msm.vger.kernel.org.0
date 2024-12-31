Return-Path: <linux-arm-msm+bounces-43749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C23F9FEFE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 15:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C418E3A2936
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D84EDF59;
	Tue, 31 Dec 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXTFbuo8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E9910F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735653876; cv=none; b=n25IciiPgZN6UHt3eOZYNOxjfB5eKh9xr5+ROtNLlc7zo2/7j7cOa2uX61KG0bQL/PI/l5RSgy8GoGjpAup4Z0xaqOSGN4cB5QzuLV5nCE8zG5/UCeDVvorlNJMEOoDLZQvW3zKU1HWSD4Zxb+37i2RkORMVz3U1vBDG4AWDYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735653876; c=relaxed/simple;
	bh=3Zah2kQVNmo5+DGtkTNxYewn+4KVz6Lk7ITgIMLM0eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNlHFKRNzmEkyezhzR7morXEuxo4hCvUXinIDgkJu1nkc3BevnPat4mIIFq+JdAB81iVZX6x12X+8U7lCJ4TrINMwrKQWBKL1GaOdp5zfCcN/XEUBtmPaj/bRH26y5vZ9KHyvPsFHs1VCD86iLwT9M7G2iESy4EQRQe+Z4ERhZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXTFbuo8; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so552498276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735653873; x=1736258673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
        b=qXTFbuo8EeLaNXVKXWAtfcHFzhMOEySoB/aQcqOOd1kds1WOQdMygncqmq5aTtmztB
         O9eeJVvOhNPNrwdJ5LCWqtVL0OYBvjN8JwhXfrL6UeYpeB+i4ZxGff2OoPNH5Tc40jBz
         lYwBRqJWPkwvTKzVYgdiO11PrC8gcQJdGV5moL8Z7mHoqEZ931C7oiSHxqRujGzde3XI
         lIz78p8VchoH8nZiYkaU6dXW/beQkCifdYF+55kOMZUGjru2KDBce65tUlwkUFLOSGM1
         ZylfkbDK7lZqU15wxQYpdhUwfmM605xu+ci4+1a6UwJMB1t0Z+uiSZA9cG0U7npLIl+p
         Vc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735653873; x=1736258673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
        b=dbuxw7Z432M5y6j3V7QxuNqLjyhSthD2z9IdvtbAQTIpyeoQ4/LUXEBUbpO9Ly5keD
         pzVmmIzZHqASr3GMGyivCULmZEVYNZOznhBEpZudOV6KdpH/mcNdaGBzhnvpAV068la7
         MVkTjSQpqi4D3m7xsjh6PZBSuhKaW7ZlpDoZt4Z3arb5C9m/UFR/5v+RAf6i5BJvp500
         pmTFtlnC7ccs4/on6Ic3+tCDrJcC01X6UgdBwS2UnqbDYVpki4N/8ncEmE9qPDrbsh1F
         vRzafYe88NcV9gj4KYVm/p9v0Gf9yo1YjcB+6uTOTonqlLyLP+zeQnZ8fhlS28IgB3Oy
         92nw==
X-Forwarded-Encrypted: i=1; AJvYcCU5lhoB59ydwyxo7VlnunxeS2ugFf7tmsl2T+mXSuv7Clqe+WrUeSluiyMaBc6VuzOLocWSmIPWWeMF1frl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xQmcsDl+B/EptyY6drVsREndfLO6Q4eFdV9J9ybwZulIrNdt
	HtArKCWSQuVNVl2i8n9BrrBIuPL23QmQC41CDCnZ2FcITkyDw4Ac8p+66NX4AXit92K0CQQ6bkV
	BvksrJdDe6yPfaSS37WNhRON23V0ZKTVTVBuf4g==
X-Gm-Gg: ASbGnctRgkRvi1IP/e9rCMAl/2ouqqNFMd8Z/tzyi9Hz82ln7NVJ0QwZmKqkG2JgLmh
	ZVWNhV5mKVuD9xdxPA7x92fOKbkfu1cNjxfN7BNEKaBrw74YX76r150Bm4bsT1sVF438rzMY=
X-Google-Smtp-Source: AGHT+IHu5RvYyC4nB2qf+XDJ+++3gqSi2Op4GcMB04A2jw0fnQSrmJDmXEVSJBJcKxrFc2tdYxydWafdNf7U76/hxNI=
X-Received: by 2002:a05:690c:113:b0:6ef:96f8:b609 with SMTP id
 00721157ae682-6f3f821a21dmr343989677b3.31.1735653873018; Tue, 31 Dec 2024
 06:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
 <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3> <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
In-Reply-To: <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Dec 2024 16:04:22 +0200
Message-ID: <CAA8EJpp-sRDLWMYHO_m6J=iFQArqiRF143QEj-KzntQXgyc0ow@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Dec 2024 at 15:24, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=
=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 06:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
> >
> > On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> > > Add pipe as trace argument to ease converting pipe into
> > > pipe array later.
> >
> > Isn't it already converted in on of the previous patches? Also you are
> > adding it to a particular trace function, trace_dpu_crtc_setup_mixer().
>
> It is converted in this patch. But this patch should be earlier than
> the patch to
> convert pipe into array actually. Will reverse the sequence in next versi=
on.
> Yes, I am adding it to a particular trace function. Do you mean I should =
mention
> the specific function in title?

Mentioning it in the commit message is enough.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
> > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 72ed8749cd716..6841d0504d450 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm=
_crtc *crtc,
> > >
> > >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> > >                                  state, to_dpu_plane_state(state), st=
age_idx,
> > > -                                format->pixel_format,
> > > +                                format->pixel_format, pipe,
> > >                                  modifier);
> > >
> > >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d mul=
tirect_idx %d\n",
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_trace.h
> > > index 5307cbc2007c5..cb24ad2a6d8d3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
> > >                struct drm_plane_state *state, struct dpu_plane_state =
*pstate,
> > >                uint32_t stage_idx, uint32_t pixel_format,
> > > -              uint64_t modifier),
> > > +              struct dpu_sw_pipe *pipe, uint64_t modifier),
> > >       TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> > > -             pixel_format, modifier),
> > > +             pixel_format, pipe, modifier),
> > >       TP_STRUCT__entry(
> > >               __field(        uint32_t,               crtc_id        =
 )
> > >               __field(        uint32_t,               plane_id       =
 )
> > > @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >               __entry->dst_rect =3D drm_plane_state_dest(state);
> > >               __entry->stage_idx =3D stage_idx;
> > >               __entry->stage =3D pstate->stage;
> > > -             __entry->sspp =3D pstate->pipe.sspp->idx;
> > > -             __entry->multirect_idx =3D pstate->pipe.multirect_index=
;
> > > -             __entry->multirect_mode =3D pstate->pipe.multirect_mode=
;
> > > +             __entry->sspp =3D pipe->sspp->idx;
> > > +             __entry->multirect_idx =3D pipe->multirect_index;
> > > +             __entry->multirect_mode =3D pipe->multirect_mode;
> > >               __entry->pixel_format =3D pixel_format;
> > >               __entry->modifier =3D modifier;
> > >       ),
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

