Return-Path: <linux-arm-msm+bounces-44493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79330A06AC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 03:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534DD3A2565
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 02:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569C77DA88;
	Thu,  9 Jan 2025 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCTvlLTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088532AD31
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736388903; cv=none; b=hhIGuLfMt/FtnD/GrSRBv/krrHbX/YezVFe6d/aW634CPmAZvzxsVoa/+0RSFcteYycRI34IrlFYHrAQT3wYkwHh5y+5amcVqDSDdGxmUWqqvvVPzSO8zsyRltI/Wb9/rKjbV9lVgGyk6DUtJk1nRt+l605O3M31rvUv3nWeKTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736388903; c=relaxed/simple;
	bh=CUYNrmNMXFn5LLD9NY/WcjJmWEX/cXemk7bkxGenKAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Avuf1h3jJ+haWW8RoP34mxOLAyPTlIIc3Ag/DcE0jZGOwA1g93JHX7SfF6B6hvSeXFlG94r8rtN42QGH7Jm9NN6h/Ei3T+7kyvvFA225OS0lc5XvFEFkLkA6JgODxOwXshSmkpLztJxKNuv1UdWTUf2s390nYV6aVV6GbDWvgAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCTvlLTz; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e46ebe19489so509461276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 18:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736388899; x=1736993699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eotnh/rc2GT5BSx+dJLr2x53Uri3bInhkP1K+WZoSwU=;
        b=TCTvlLTz4yTZ67Fe9x05kOIMlkdAL51b9mxOlpwoQAJEFiC6677eRNnhod/4lEFn7t
         acuNuFtefYTTQ208PcSB/qbT+85N+WsSWy9LHTeGA80bc9oXEEyRrrA7dyfdGebFfFT9
         lgP03I54VMFXhm4Er+1Nhu5kvs2cEcpmdjlDD5muyT9C3gt36mU1IFT4dLK91XUnuVop
         VVK3+JNzSHpTk0IwXgnVeyn7ECxEhkADFCVnV8RiMe5nUJF7XQH8Ph3G5s4QnvCrMmv3
         Ky3fpnufXam/IghE7CPv54/0qP7/HYp8iJYhdjh+wn0yj9EGW2zTuKbQjaYCCVmu5u5s
         bz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736388899; x=1736993699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eotnh/rc2GT5BSx+dJLr2x53Uri3bInhkP1K+WZoSwU=;
        b=A2cAQGaVlLuil7cjAsN+LECH7QCCkupeGSLF13BcZ49YuOc1xsvecEDqCQinGSq91/
         JuBnVEZyq+PDt71ogaKtCXkZBt+G3ElQJg9YnnZNCsnKSq6nbgyCJJ3VP3e7f7unH+r/
         GF7iN0u67oO5jGrLEgXpCa1Zxo0VODj6/n4jePFx5yDfERSAhC6Il0+RGLxE4GbRInBu
         uAjNCa3WWnNHmNHsM2r5yvForTbcSOQ2AdFc1JGBwZiNg814M0FMDiN0tweRmoSzv9ma
         /e9LJCOgGb3xSkosqZYj+ge2mZUH7qSBIGYnqHBlCNavWDWBqmbcD79eQKnDkU6hNJbD
         WkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8NMqLL+JQXSKAAhNjGEE1zuvuhud09FGePTQ9NJSCr/IKLmf8eoI/5L05DWRGNQ4EMt+Q2AvGH6piDBkJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzotJLjHcHutU0sWES5078drIpBbqnwSFvveo0wDpvwcnsYrKHA
	PBSGUz7vgSRa64Qyxr553WqgEdHji0CzpIUs07ZZ9u0m/pB6WUnaWj2udhVTsk/38dBT0xNU97p
	eAfvd+gJW8jTuGJdOVLHmDe4LqfHKziOiYSss/g==
X-Gm-Gg: ASbGnctTUK814cn021giZ3cHU1vwKojehRZHk2+aXKy8VhRkQc9L139ExwC07ecTBjp
	ig6tdB2A+ReZjVMdYGAHTK234mm+jslkBDRMuptSpRTo3iZB96DMM
X-Google-Smtp-Source: AGHT+IGjfqKZ6z5xvthsUHml25xipTkvDZPvjr+OG2gBVqutU+a7E7waIrDTvnI5P56r2mBBU38O0qYe4GAOhnLFRCw=
X-Received: by 2002:a05:690c:b99:b0:6ef:668a:e55b with SMTP id
 00721157ae682-6f53124fb46mr33896227b3.15.1736388898942; Wed, 08 Jan 2025
 18:14:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com> <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Jan 2025 04:14:48 +0200
X-Gm-Features: AbW1kvYI3FHAGXC6HOXi2oPwfHy5-ovM4aYoEFGmwgV5YlmN5CAk-FmWEstrCbY
Message-ID: <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async path
To: Rob Clark <robdclark@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@quici=
nc.com> wrote:
> >
> > Force commit that are disabling a plane in the async_crtc to take the
> > non-async commit tail path.
> >
> > In cases where there are two consecutive async cursor updates (one
> > regular non-NULL update followed by a disabling NULL FB update), it is
> > possible for the second NULL update to not be queued (due to the
> > pending_crtc_mask check) or otherwise not be run before the cursor FB i=
s
> > deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> > context fault since the hardware would try to fetch the old plane state
> > with the stale FB address.
> >
> > Avoid this issue by forcing cursor updates that will disable the cursor
> > plane to be blocking commits. This will ensure that hardware clears and
> > stops fetching the FB source address before the driver deallocates the =
FB
> >
> > Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm=
_atomic.c
> > index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631=
dd28d4cdc2b8c7dc0 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *s=
tate,
> >         struct drm_connector_state *connector_state;
> >         struct drm_connector *connector;
> >         struct drm_crtc_state *crtc_state;
> > +       struct drm_plane_state *plane_state;
> >         struct drm_crtc *crtc;
> >         int i, num_crtcs =3D 0;
> >
> > @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *=
state,
> >                 *async_crtc =3D crtc;
> >         }
> >
> > +       /*
> > +        * Force a blocking commit if the cursor is being disabled. Thi=
s is to
> > +        * ensure that the registers are cleared and hardware doesn't t=
ry to
> > +        * fetch from a stale address.
> > +        */
> > +       if (*async_crtc) {
> > +               plane_state =3D drm_atomic_get_new_plane_state(state,
> > +                                                            (*async_cr=
tc)->cursor);
> > +               if (plane_state && !plane_state->fb)
> > +                       return false;
>
> hmm, I suppose we want the same even if the fb changes?  Or
> alternatively somewhere hold an extra ref to the backing obj until hw
> has finished scanout?

I think a more correct approach would be to run a worker, waiting for
the commit to happen and then freeing the FBs.

>
> BR,
> -R
>
> > +       }
> > +
> >         return true;
> >  }
> >
> >
> > ---
> > base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> > change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >
> > Best regards,
> > --
> > Jessica Zhang <quic_jesszhan@quicinc.com>
> >



--=20
With best wishes
Dmitry

