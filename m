Return-Path: <linux-arm-msm+bounces-45641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83BA17681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 05:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACFAF7A34CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 04:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFB418E743;
	Tue, 21 Jan 2025 04:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+JL9k3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E521891AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 04:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737433719; cv=none; b=WgOhzsPq+2U1DwJpg2B2P4w4fbsuXOd6nOLtDxtEJ5MVPXqnKtSSsFDs6Ga8wvZKECElf0hmFGeLeWBpxPn9ddsDqBQs8PHrqIRaSI48ezEIP4iz14tK8ODPjTbKPzdYAH/dJjjnEsc8BXLBQio9/FNalzrzSbT6rjNF0m/fVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737433719; c=relaxed/simple;
	bh=JS96n9a8Ew/ZcOsqRQwMWuGWPKG/zGbXusccEo448v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmfrcfCi87957GmgzKr+ZJHONxAhrzEb/Gte8Iyh0wMhC2fHJlbcI1xKF+Vj87lvaB1DTmOC+aAmZqKyQQv7i7/UuBeDKhdKpDlshFTjBq35ytklqMbgATt36mJmK1lJ9arcEBHjdh/A1YPCrNjxC8iAPYn0fzpsTAzkj5D+Dx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+JL9k3u; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e573136107bso8550471276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 20:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737433716; x=1738038516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZSNB6g5UtUoImhML+UGNfXWXkjaOAV6MUUxlrXnbfE=;
        b=y+JL9k3u3tp6BQ8B0vlUyTh02fuTxGjIlw+VkVoGxPsZDZ06ZoZaeGDp34VormF5pv
         rQwtsU8M+VClIgE6fHfi0dWkMysfbglaU8nyPuSlrKHaCp9D6XekV6XLCr0sXECb5Vov
         coMCF7sgqLxJMUFvJOuS44d9EyfW8cVt+nSgr5a02aOMTU4nvqV6BB9zLDb5th8nINal
         upAGU2d1TLJCu3AKvKFCV1WPjBnfyOPS46xRO1EYLWGSXwrnf7mNSghM3P4HtK+iWeMu
         v4FSP4aTLvddhMJlv/oRhEvkYrz8pCe5lRxRN2FNa9nDTgHeBK48E34KVBlb79vyxl4c
         aLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737433716; x=1738038516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZSNB6g5UtUoImhML+UGNfXWXkjaOAV6MUUxlrXnbfE=;
        b=he8lNOl1IaF3Tttpq7ANLCi/lrcWPJkhCjEbg3+7SiickZK8zTbWBgvbHO1+NQp9SY
         Dub+XZdFCWEU7sljoLX+036noV8XLJsoupkTg72/o6K6MdbHhwNltjAH4W9QxsmT8slj
         C6k0SZVFNFsZ6FAAIiLo94IhCYTnZOPKf94KFWOMbGa2mgGOBK72SPtRde3aFuP0Oipm
         dMfsj/3vW3l2rc7M8+vVdhQDnRNWYbtVqqMdksxq59e28g1LikIwnD3wBB4/USaDG2PB
         902A4+eQLIjKrsZu21y1MQovMTedg10XJ+pzNZsbxy5OnkQD60skS0G2ZWfQd1P+a3Pa
         2MTg==
X-Forwarded-Encrypted: i=1; AJvYcCWbarYkUOxqeMUYRZWnDuSr0PIMpnkN55OIVB29yItEP8qeJYd8oBk17Q6O3cyDhdHid+PzznNKETjSyBjC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7sXRuDTuSr+j6/2r7nlk1LQkGQSHkvE4so3+/a5zpR9weYIq
	12S6Kpca7JsC/p36HwlhnVRLMQy2lz9sl+R5dro79inyRnm69kNzAOAwlMaAkzyxcuhbWjHIlxh
	gCY9eD+JTdfNUF7la+66V8LMqpEOZudzRkqMZeovjgIG9GwbuZQW4Rw==
X-Gm-Gg: ASbGncvF+ipicSADLF4Mu7uU2qpyI9FF62uxILWBbfV/5njkrV/kO+KYsikmByVkZTa
	dneKT2AZ9M2rryipQmRT9Q2uQJ02YF3iED1zXF7Rih+a2eD/J55g4mg==
X-Google-Smtp-Source: AGHT+IGq/MHXBnnIFfgM/13ju/i+ES42JwboBmO2dRvRxF/fPN5yr5dACgnwRZOQCQDqbtKLPqHPHxnGRY22awQjXhE=
X-Received: by 2002:a05:690c:ed4:b0:6f6:ccef:ef4f with SMTP id
 00721157ae682-6f6eb659ce5mr124991237b3.2.1737433716183; Mon, 20 Jan 2025
 20:28:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
 <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com> <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
In-Reply-To: <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 20 Jan 2025 20:28:24 -0800
X-Gm-Features: AbW1kvb-DeFP6oG56gSKdFoJx3QfWKxrxchTK43xDe6e8I2Ayaxn3a_6GSbRAjA
Message-ID: <CABymUCPviHNEhjV8sp7_dFDXNa5HMOMC+c0V83pyhRQND_0p8A@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2025-01-17 15:32:44, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=
=E6=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC =
are
> > > > enabled.
> > >
> > > Why? What is the issue that you are solving?
> >
> >     To support high-resolution cases that exceed the width limitation o=
f
>
> How high is high?  Some Sony phones use a bonded 2:2:2 setup.

The high resolution here means the capability of 2 SSPP without multi-rect =
mode,
or the clock rate requirement exceed the SoC capability. It depends on spec=
ific
SoC spec.

>
> >     a pair of SSPPs, or scenarios that surpass the maximum MDP clock ra=
te,
> >     additional pipes are necessary to enable parallel data processing
> >     within the SSPP width constraints and MDP clock rate.
> >
> >     Request 4 mixers and 4 DSCs for high-resolution cases where both DS=
C
> >     and dual interfaces are enabled. More use cases can be incorporated
> >     later if quad-pipe capabilities are required.
> >
> > >
> > > > 4 pipes are preferred for dual DSI case for it is power optimal
> > > > for DSC.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++=
++++++------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > > >  6 files changed, 29 insertions(+), 14 deletions(-)
> > > >
> > >
> > > > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >
> > > >       /* Datapath topology selection
> > > >        *
> > > > -      * Dual display
> > > > +      * Dual display without DSC
> > > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > >        *
> > > > +      * Dual display with DSC
> > > > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
>
> Are these always bonded (i.e. single display with dual-DSI link), or can =
it be
> two independent panels?

It can be two independent panels.
>
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
> > >
> > > irrlevant extra line, please drop.
> > >
> > > >       if (intf_count =3D=3D 2)
> > > >               topology.num_lm =3D 2;
> > > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encode=
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
> > >
> > > I think this part is thought about in a wrong way. If it was just abo=
ut
> > > power efficiency, we wouldn't have to add quad pipe support.
> > > Please correct me if I'm wrong, but I think it is about the maximum
> > > width supported by a particular topology being too low for a requeste=
d
> > > resolution. So, if there is a DSC and mode width is higher than 5120
> > > (8.x+) / 4096 ( <=3D 7.x), then we have to use quad pipe. Likewise if
> > > there is no DSC in play, the limitation should be 2 * max_mixer_width=
.
> >
> > Both width limitation and clock rate contribute to pipe number decision=
.
> > To support high resolution, the MDP clock may be required to overclock
> > to a higher rate than the safe rate. Current implementation does not
> > support checking clock rate when deciding topology. We can add the
> > clock rate check later with a new patch.
> > >
> > > >                */
> > > > -             topology.num_dsc =3D 2;
> > > > -             topology.num_lm =3D 2;
> > > > -             topology.num_intf =3D 1;
> > > > +
> > > > +             if (intf_count =3D=3D 2) {
> > > > +                     topology.num_dsc =3D dpu_kms->catalog->dsc_co=
unt >=3D 4 ? 4 : 2;
>
> What if there are other encoders that have already reserved DSC blocks, r=
educing
> the current available number of DSC blocks?  This patch seems to cover mu=
ltiple
> panels/interfaces on a single virtual encoder, how does one get to such a
> scenario?  Bonded display?  If one or more DP panel is connected, do they=
 use
> their own virtual encoder, and hence miss out on logic that properly divi=
des
> available DSC blocks?

Yes, it's bonded display. Your point is valid. The scenario will fail
at the resource
allocation stage and CRTC pipe fails to be setup if there is not
enough DSC block
available. But it should fail gracefully, so not a big issue. It is
always possible
that resource cannot support a usage scenario.

>
> That idea is what's been holding back a quick hack to support 1:1:1
> topology for sc7280 / FairPhone 5 to perform a similar workaround:
>
>         if (catalog->dsc_count < 2)
>                 num_dsc =3D num_lm =3D 1;.

Actually, I do not see issue here. Could you help point me the link
for this change?
Checking the discussion history helps on understanding more aspects of
this change.
>
> > >
> > > This assumes that the driver can support 2:2:2. Is it the case?
> >
> > The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work=
 yet.
> > How about below code for DSC case?
>
> I've been working on 2:2:2 support [1] but have stalled it to see how you=
r
> series here pans out.  Doesn't look like it's heading in a compatible dir=
ection
> though, going for quick wins rather than redesigning how DSC blocks are
> allocated (to name one of the many topics).
>
> [1]: https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualp=
ipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org/
>
> - Marijn

Glad to know that a 2:2:2 case can be enabled. That can be supported with
code structure of quad-pipe in theory and we can co-work on that. But I wou=
ld
not call the quad-pipe patch set a quick wins, as I cannot cover a usage ca=
se
that's not supported by mainline yet, and I do not have hardware to support
2:2:2 neither. What I can do is to add new usage case and make sure
existing usage cases are not broken. More and more usage cases can be
added later this way.
Could you help elaborate what do you mean by how DSC blocks are allocated?
I see DSC is allocated just as other resources. Maybe you mean how the
topology is decided. While that's about adding new usage case without
breaking existing usage cases.

Regards,
Jun
>
> >
> >                  if (intf_count =3D=3D 2 && dpu_kms->catalog->dsc_count=
 >=3D 4) {
> >                          topology.num_dsc =3D 4;
> >                          topology.num_lm =3D 4;
> >                          topology.num_intf =3D 2;
> >                  } else {
> >                          topology.num_dsc =3D 2;
> >                          topology.num_lm =3D 2;
> >                          topology.num_intf =3D 1;
> >                  }
> >
> > >
> > > > +                     topology.num_lm =3D topology.num_dsc;
> > > > +                     topology.num_intf =3D 2;
> > > > +             } else {
> > > > +                     topology.num_dsc =3D 2;
> > > > +                     topology.num_lm =3D 2;
> > > > +                     topology.num_intf =3D 1;
> > > > +             }
> > > >       }
> > > >
> > > >       return topology;
> > >
> > > --
> > > With best wishes
> > > Dmitry

