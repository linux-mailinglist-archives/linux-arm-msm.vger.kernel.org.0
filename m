Return-Path: <linux-arm-msm+bounces-45372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BFA14A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E1B21650AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 07:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918331E102A;
	Fri, 17 Jan 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDFeRXov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF319155300
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737099179; cv=none; b=pFu5tNrTss1XzMM0KoQzMBUXT9jfdA/AmSLbGodEF6xLl8XrOWlmYNq/qrSu3LHS1OmuBlC3cIalorvpTuCGoGGt8sHTR32oL0zwcC9vNRn0AJcLaphIywEzjIOpI0n2FMXbI17/kWUmZTtqI0jpHKHrqoMJwDECWR7/L2Cu7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737099179; c=relaxed/simple;
	bh=zSeXU3KikGphLgJvcmBDtb1ZOeBeHDXEO7APrZWvWVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBetR/7msncFyuontSq849U6FxtmNBfvjQ5Qylgp/A+idJY6c60APwpET4VTCLd4IX4XOEDCDfL0Njp//V3u9DhIV1D9FQttD6W6xpQsQrgjrNeHzpvOTG3pSFhDvJGi9Kl3Zy99Y+pL7Vwc/zwIOcD6aXfEmVgspF1gAp1snFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDFeRXov; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2814364276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 23:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737099177; x=1737703977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5hN3WCRaDcwfEGZIF7HwAWSSytle4jyv+q+dyIgSdU=;
        b=fDFeRXovuuXV6RuMUY1F2YHolQjVCBlkmJ9nHBypvwR8AD856iFUU1GJIHn2oKRW5R
         A4ekYXclQl0su9Yyt3y9fT42NiWmFGjF6T3+HRwyll17EMQOY19W5r6tYqUsjiMOSCst
         bKIHER9LrkWDFEGhm5htG8LtTuuFrLquhNzExsQ7lSJuod4HWGcBXhkRLmnxnHiSAHp+
         32/RYs/UJw45FeZ5fZP98aPsHC5tThdVTXXUwRqJwgIEfO2ZihVBBWm75EkUfeNBvC+6
         a0hZs4oAlORs2g8pdC5bSAQPTUB5kvOj6aZtbxjfXgHu4/ULGv0iWZ8+zeJwRk+LktZR
         wW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737099177; x=1737703977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5hN3WCRaDcwfEGZIF7HwAWSSytle4jyv+q+dyIgSdU=;
        b=ppOmeaYIcz8eSEYxI6ck2/bPuMqytRXrfYT/ecp9+/eILSuKg+dF+MSjhTsNxDaLbY
         5Ldb122Xap0tbCg7jfrwmoofcUywsIy0M7hD1CXeXsFOZO4vpkdm3USQxM+VAWQuIQuu
         f1guLT6BAj0lo4Ab6kUJuIN9b0kozomsSpMdMfqmgo7NhS1zuFuRAEyo8CyIVNSU9P0E
         16GQhrcw5XttJWQOnJDyXYo0o5YZ4WnjGRoWXCVum1ACkAZvWkk59apiZUjQsMf0z2gA
         2mtREBWI4MVWSqrK0wuHDVgEqzYXdjR6aaF2B6rOJHpdbR2tUEvMNTK4okCQ05guv10m
         6Lpg==
X-Forwarded-Encrypted: i=1; AJvYcCVmmGp6fyPctPJEGDbHiiAN/LGrBYyTCf9dfsMKt7nPUmQ/lxG//zMgnkwwUTGzIlHgiGkq8TPbmc3XITRc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1aSMGNdqlgNMI8IiSQKE+Dw+tzTvfS+6J0r6GRXVw6q7NuoBc
	sYeXwE1WOgU8gCdInJfMLR2piu96Ugq0c3R0HCHx3ft2F6Cu2+1uGYGeI5F+tQEQcWFiExfkkLK
	HJgjOvJL4Vs3ZLhAt+UUSpTO9GFqZYd2J+HvugMOM22MowaxgLEt1BuKP
X-Gm-Gg: ASbGnctoBfZT38KdDIWZ7ltrI/puvjeaFrvIyg/Uxv71KFJxcH8A2KXHLsibWVQi6r+
	9kNgddvK1tTB4vOLrASzOT+nv/zaa34jPf9Swemt43B0=
X-Google-Smtp-Source: AGHT+IE+XYh2alu1rY2U8oCgLEh1aqoCMjyJMFnHicZCBv3oNDm+hi8vM03R6tYssS6lGIrrrW8gy6Wp3lPsC3GuOFk=
X-Received: by 2002:a05:6902:140c:b0:e4c:e9b8:eb37 with SMTP id
 3f1490d57ef6-e57b1030127mr1141878276.3.1737099175190; Thu, 16 Jan 2025
 23:32:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
In-Reply-To: <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 17 Jan 2025 15:32:44 +0800
X-Gm-Features: AbW1kvbp5yJi4HYj9X5TBWCrEONnlBk4y8iKuerYlGqjnYqdJtYg1reAc_pA1gY
Message-ID: <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
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
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled.
>
> Why? What is the issue that you are solving?

    To support high-resolution cases that exceed the width limitation of
    a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
    additional pipes are necessary to enable parallel data processing
    within the SSPP width constraints and MDP clock rate.

    Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
    and dual interfaces are enabled. More use cases can be incorporated
    later if quad-pipe capabilities are required.

>
> > 4 pipes are preferred for dual DSI case for it is power optimal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 29 insertions(+), 14 deletions(-)
> >
>
> > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >       /* Datapath topology selection
> >        *
> > -      * Dual display
> > +      * Dual display without DSC
> >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >        *
> > +      * Dual display with DSC
> > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
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
>
> irrlevant extra line, please drop.
>
> >       if (intf_count =3D=3D 2)
> >               topology.num_lm =3D 2;
> >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_ge=
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
>
> I think this part is thought about in a wrong way. If it was just about
> power efficiency, we wouldn't have to add quad pipe support.
> Please correct me if I'm wrong, but I think it is about the maximum
> width supported by a particular topology being too low for a requested
> resolution. So, if there is a DSC and mode width is higher than 5120
> (8.x+) / 4096 ( <=3D 7.x), then we have to use quad pipe. Likewise if
> there is no DSC in play, the limitation should be 2 * max_mixer_width.

Both width limitation and clock rate contribute to pipe number decision.
To support high resolution, the MDP clock may be required to overclock
to a higher rate than the safe rate. Current implementation does not
support checking clock rate when deciding topology. We can add the
clock rate check later with a new patch.
>
> >                */
> > -             topology.num_dsc =3D 2;
> > -             topology.num_lm =3D 2;
> > -             topology.num_intf =3D 1;
> > +
> > +             if (intf_count =3D=3D 2) {
> > +                     topology.num_dsc =3D dpu_kms->catalog->dsc_count =
>=3D 4 ? 4 : 2;
>
> This assumes that the driver can support 2:2:2. Is it the case?

The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work yet=
.
How about below code for DSC case?

                 if (intf_count =3D=3D 2 && dpu_kms->catalog->dsc_count >=
=3D 4) {
                         topology.num_dsc =3D 4;
                         topology.num_lm =3D 4;
                         topology.num_intf =3D 2;
                 } else {
                         topology.num_dsc =3D 2;
                         topology.num_lm =3D 2;
                         topology.num_intf =3D 1;
                 }

>
> > +                     topology.num_lm =3D topology.num_dsc;
> > +                     topology.num_intf =3D 2;
> > +             } else {
> > +                     topology.num_dsc =3D 2;
> > +                     topology.num_lm =3D 2;
> > +                     topology.num_intf =3D 1;
> > +             }
> >       }
> >
> >       return topology;
>
> --
> With best wishes
> Dmitry

