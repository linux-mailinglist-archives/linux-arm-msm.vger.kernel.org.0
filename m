Return-Path: <linux-arm-msm+bounces-43748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF249FEFB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9FC03A2E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8C419ADBF;
	Tue, 31 Dec 2024 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBPBiV2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C31199E8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651466; cv=none; b=tTgpZ4tX9NCyL95uJo8g9OnLdAokH5PodmkQ3DazCmeAZw5lBLNZG6zgK+bo+STkcb2uOayjWsmIVHZ1vqO4q3DdTcAVz+uDl6oO8HihzO8RFpLjqU12eu0RRjhBeo1VmVF1qAPuIZ8LVnGHiaQRDo1/gDyyOawgkLTYf0ifX2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651466; c=relaxed/simple;
	bh=gMnEP4VhbPB3UmJ2D7qdX9exJlV6vO7k/3srVxKWsZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTDR04/ubE3yyO89ODUgNts/eVMiRCSQ7pMeL50OSoLKGNfRyGcFXZTyCmJ0g5GH4qT9tyO65Q1c3PAhihjZrEnvbNY63bUCRtIwxlL+8FfjqFZUCSYobHUhCqzuugmOQk5E9UzLWCDfm2dWrVzTqAtIxZfFdxYtIZaKDzqSZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBPBiV2W; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53537d8feeso11832520276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 05:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651464; x=1736256264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snA4yvwa/jOkFHRQZhhZPLDBB7J2xJa1ZDzy4VT0d/c=;
        b=oBPBiV2Wi1QrsSG5OZu/SSH+HLrbjf0NDwuTWwkcAXd6dWxAQoTxQh3QaPbBkhMdJ0
         hOMF/XzFEkGy+WzcEIUjv1Ax5NpXdlsP6JTSVv6vqLPJDMwDVpxmpIcQlvPrwcA0xLZR
         Ml6Yh3sRR82a13qX1BDOpXJIdqRTJ8N8wzaesFE5ZsKeuJewYRpG3bL3GpejZxlqCLnx
         Gygnn4aIJ2sF+dDVISHQC1N4ko3z8wcyltrdxfAQOJP82V6rOy5d6ms2zI4Oa3iigkk+
         4ha4Rkap7g0abJSG5KwPPiE2O4Gtj5cNL+wZJWhS5G+2lT/tusUUTisvvWJQhlC3dUqA
         FK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651464; x=1736256264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snA4yvwa/jOkFHRQZhhZPLDBB7J2xJa1ZDzy4VT0d/c=;
        b=XsrYEJ8ISR8Bdu9T3InfJyzLoAaH6c30Y+409obBnpoiTSLKExIk60sWaeQzfhvWnP
         9pKbUSF/mUN4SInEbNa8TMlCGQdp8IINcnHMS9ytKqN+kZoWCs63o+U+rorBljObqZGU
         XKg3fe/YHsC5XH7f6p2+sncOXzm42Czw4tf0I+HbhqDkh+qkhCUFjY5wUXNX0+jjg3if
         xuiDUc9UGZDeNlDiZcHCHPEK1SCDZgUPVKnv1FCMlVHRGz++MpnMX7DiQH0Bzv/1ZH0G
         cWBUdNHe6ZskUbp//vpzvtxYQiAzfIpouV74yKbDk3yLxqlQDTSfr4fymIbkx3yIEyBc
         uEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlOMPNn9+h2r5EqSB+VZ9z4xQ3uVvLVko2m7Qh2ZjmLEK0z9sS+ILtwy5+ntfmfA/RKWcbK9ZyGntOolGL@vger.kernel.org
X-Gm-Message-State: AOJu0YztiewEeig9y6bDx/sT9ZQQYwhethzkRL46p0YbzWIXctQzpUcU
	9q6X4GYpoLao4W5SFv31YN+ouwL5NUGUyRrlZqOYpixv+qVCpxR6RbBxqZw7EhaUmajNGYms1xK
	F3o9D99fFLKnNyfFXlymSxKZO3gzmBoCGLrbqDA==
X-Gm-Gg: ASbGncva02pMIyxMGf6AfzCyiWyMv9uiMkhGZETxlrbLtuT/iIGcUcuk8RJ8wVGZoXx
	XBsC4+N2ZZEx4B8oERZebpyuduabEf/OvYXooSjA=
X-Google-Smtp-Source: AGHT+IFGsk0fupDwzj9lh6jZbL4bQlBTGOG6UckivqlqvTqjTO3DMHgfMLp19aQljkDCpVAtfntkoLcWya4LkRi7Rz4=
X-Received: by 2002:a05:690c:708a:b0:6ef:a187:f3a3 with SMTP id
 00721157ae682-6f3f822353fmr264399617b3.27.1735651464161; Tue, 31 Dec 2024
 05:24:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
 <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
In-Reply-To: <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 31 Dec 2024 21:24:12 +0800
Message-ID: <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 06:29=E5=86=99=E9=81=93=EF=BC=9A


>
> On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> > Add pipe as trace argument to ease converting pipe into
> > pipe array later.
>
> Isn't it already converted in on of the previous patches? Also you are
> adding it to a particular trace function, trace_dpu_crtc_setup_mixer().

It is converted in this patch. But this patch should be earlier than
the patch to
convert pipe into array actually. Will reverse the sequence in next version=
.
Yes, I am adding it to a particular trace function. Do you mean I should me=
ntion
the specific function in title?

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 72ed8749cd716..6841d0504d450 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >
> >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> >                                  state, to_dpu_plane_state(state), stag=
e_idx,
> > -                                format->pixel_format,
> > +                                format->pixel_format, pipe,
> >                                  modifier);
> >
> >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multi=
rect_idx %d\n",
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_trace.h
> > index 5307cbc2007c5..cb24ad2a6d8d3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> >       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
> >                struct drm_plane_state *state, struct dpu_plane_state *p=
state,
> >                uint32_t stage_idx, uint32_t pixel_format,
> > -              uint64_t modifier),
> > +              struct dpu_sw_pipe *pipe, uint64_t modifier),
> >       TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> > -             pixel_format, modifier),
> > +             pixel_format, pipe, modifier),
> >       TP_STRUCT__entry(
> >               __field(        uint32_t,               crtc_id         )
> >               __field(        uint32_t,               plane_id        )
> > @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> >               __entry->dst_rect =3D drm_plane_state_dest(state);
> >               __entry->stage_idx =3D stage_idx;
> >               __entry->stage =3D pstate->stage;
> > -             __entry->sspp =3D pstate->pipe.sspp->idx;
> > -             __entry->multirect_idx =3D pstate->pipe.multirect_index;
> > -             __entry->multirect_mode =3D pstate->pipe.multirect_mode;
> > +             __entry->sspp =3D pipe->sspp->idx;
> > +             __entry->multirect_idx =3D pipe->multirect_index;
> > +             __entry->multirect_mode =3D pipe->multirect_mode;
> >               __entry->pixel_format =3D pixel_format;
> >               __entry->modifier =3D modifier;
> >       ),
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

