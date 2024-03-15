Return-Path: <linux-arm-msm+bounces-14285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4F87D656
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 22:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2153B217FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 21:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7819A548F4;
	Fri, 15 Mar 2024 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WP+cAXoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52317BB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538875; cv=none; b=DD/8Dto4mr5+QHdDGtZrp1H/xuGGGmur+j2i65UYQtiGGRM4Yx3lLCDxZOJ14bT0HC/zKSRPkj410gFVJo74pMEsu+y7b5ZLUUA4wySzQ+26+FemyBGGOhoRZ6CMwElyUruWwFy+CYZFbqd3i9PI2eHT0pbvryPRjZ/Kvp0ag6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538875; c=relaxed/simple;
	bh=e+MdelWcouBWrzG5vmleXYm/BqFUODKFt3Mb+0U1G88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmIb/RO4u6Rbp/MBVZu9FwYGlBmoeogkMLIMszuJ/2NqR5QXuR0AdzuDr+oLr2+DMN2IW1irqWlDXN0SQqna971Q6/axecG4IBM0YzOKX5ggRnA18wuUjXSEVEEFBI2i+kdmantJLlvtdr0xioLbialnl2Nr5SIyerNsvaeAe9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WP+cAXoe; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2652132276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710538870; x=1711143670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQIyog+V+hDOz6P/17DYQkVpq9nNe+yutAMO1vEHDgE=;
        b=WP+cAXoeTV2eL6Prc7z5dQeTBBCa3kPvkdzZbS28Zd0mP3P2p3OG0O1Qk7+II4qkB1
         6OZ3mDhuxAy9Q3jgBWCt6amj5uKoJsMzCFfix/d1WWDueB8MNxOUrhEwP2DMqa6flZJm
         8cC62Hr+SPSY66NifCCHxVl2v7Hn3ub9eBvDS2A2rKQVIc6eP48GdPEvbPxDD/ozLlbV
         DSOT0gLGem/CfjwX78hyDMua1wkfzDbY3usqiVdGCNyd5sMacneT0d4IgEELZFBxjeUf
         nYfdGQbTm6KcEFPen8I+gQrNRf0KGjCLCRib4QHX1y9RZVydt/C2h86VXA1ssRJnTQJd
         mKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538870; x=1711143670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQIyog+V+hDOz6P/17DYQkVpq9nNe+yutAMO1vEHDgE=;
        b=K7joDioyiDJeYSxYRhk40LDmkl6u68YnM0kyUQIwQuLezEF9D+1mzA5xBqOfECMma2
         w7R/Lhv3biOrsetcJ2h5lnTAgpQdjiWwIiHIVVUFEiAyQti7TzoxXvvvS+IkE8wTsGEd
         nb6jSqFRGVs/jcr9xLhi4VRAp1PcCs4tO4GZm9UFeHOH1Rd124xEQkXwOhvWRk7fh9lV
         VqAlHzheluOC2M6vXJ5Lx4KVHxny5Oa8GhdqNfZlNxnOch6uZL7mIapN6RI9WETj8+vg
         IKKMEWxXo6lZNAxXA499jsWgA1Yk4IQpz4XVSXQlPXlilBtmarkIbVLHTwlIFrSaFkoE
         qxag==
X-Forwarded-Encrypted: i=1; AJvYcCX4mdvnrA3t377hXKmjt4ST/I2JouzKh1TQ6GKLFUCeMfCXt/BEqpRaaYCZd2vFK0OSt+RuLCZKm4e5inwpj/kYGiKqBVBYLDO+SWWseQ==
X-Gm-Message-State: AOJu0YzNuwDgD92JWvS0FWIqAlE3usyvqvXkBqun8jhnTiP9qHQTaRy9
	b3jR2OLOc8D6Sz7HjpjHHQHfzP/fwd+jA9etRQMkuW8zA9KactrLfxSK8xcfqklXrID0Nf2Z2an
	16b6Ew20LwOJt1QSsrkBOnkwoso7UOWGUqDcsvQ==
X-Google-Smtp-Source: AGHT+IGkFWhHBndUjNRvX85twH2BG12l/RgBN92Ky0LJE7Oaz6Ep8+Pl/wLqIh6+hAWEvDmLKEyjzMjOZ3OYh6EKHUQ=
X-Received: by 2002:a25:ad64:0:b0:dcc:5b7e:ddfe with SMTP id
 l36-20020a25ad64000000b00dcc5b7eddfemr4607628ybe.4.1710538869766; Fri, 15 Mar
 2024 14:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org> <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
In-Reply-To: <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 23:40:58 +0200
Message-ID: <CAA8EJppek+zDUxE9q9NivE7T1KHigP80NOfy0oLYJd8z_DdoXA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/12] drm/msm: generate register header files
To: Rob Clark <robdclark@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Mar 2024 at 22:02, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 15, 2024 at 4:46=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Currently display-related register headers are generated from XML files
> > shipped withing Mesa source tree. This is not fully optimal: it require=
s
> > multi-stage process of the changes first being landed to Mesa and only
> > then synced to the kernel tree.
>
> I think we'd more or less need to continue following this process for
> the gpu .xml so that the kernel and mesa are not diverging.  I guess
> we could drop the display related .xml from mesa.  (But it would be
> nice to have a decoder tool for display devcoredumps, like we do for
> gpu..)

Yes.  But syncing XMLs is much easier compared to syncing the generated hea=
ders.

For display-relaed headers, that's a good question, whether we want to
drop them from mesa or not. I think it might be easier (and more
logical) to get such a tool into the kernel. Note, that it will also
require us to describe DPU registers in the XML format. And also maybe
to sort out the DSI registers finally.

>
> BR,
> -R
>
> > Move original XML files to the kernel tree and generate header files
> > when required.
> >
> > NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
> > Once that MR lands, I will update the script and commit messages and
> > send the next iteration.
> >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Split XML and git rm patches in hope to pass ML limitations
> > - Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7c=
d68ecc4320@linaro.org
> >
> > Changes in v2:
> > - Removed the _shipped files, always generating the headers (Masahiro
> >   Yamada)
> > - Replaced headergen2 with gen_headers.py
> > - Simplify Makefile rules, making all Adreno objects depend on Adreno
> >   headers and all displau objects depend on all display headers
> > - Also handle Adreno registers
> > - Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86=
bb6c3346d2@linaro.org
> >
> > ---
> > Dmitry Baryshkov (12):
> >       drm/msm/mdp5: add writeback block bases
> >       drm/msm/hdmi: drop qfprom.xml.h
> >       drm/msm/dsi: drop mmss_cc.xml.h
> >       drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
> >       drm/msm: import XML display registers database
> >       drm/msm: import A2xx-A4xx XML display registers database
> >       drm/msm: import A5xx-A7xx XML display registers database
> >       drm/msm: import gen_header.py script from Mesa
> >       drm/msm: generate headers on the fly
> >       drm/msm: drop display-related headers
> >       drm/msm: drop A5xx, A6xx headers
> >       drm/msm: drop A2xx-A4xx headers
> >
> >  drivers/gpu/drm/msm/.gitignore                     |     6 +
> >  drivers/gpu/drm/msm/Makefile                       |    97 +-
> >  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
> >  .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
> >  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
> >  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
> >  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
> >  drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -----------=
--------
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
> >  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
> >  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
> >  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
> >  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
> >  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
> >  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
> >  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
> >  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
> >  drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
> >  drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
> >  drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
> >  drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
> >  drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
> >  drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
> >  drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
> >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
> >  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
> >  drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
> >  .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
> >  drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
> >  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
> >  drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
> >  drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
> >  .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
> >  drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
> >  drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
> >  .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
> >  drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
> >  drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
> >  56 files changed, 22480 insertions(+), 39792 deletions(-)
> > ---
> > base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> > change-id: 20240225-fd-xml-shipped-ba9a321cdedf
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >



--=20
With best wishes
Dmitry

