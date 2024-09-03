Return-Path: <linux-arm-msm+bounces-30475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 322379695AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 318D11C232CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4371D6DAC;
	Tue,  3 Sep 2024 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+DMdsWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FE1CE700
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348859; cv=none; b=pzVgBok2vRSjkEd1AbQ5ia5gDnjNCOz2jY7YdmXtewjAW55lkaEMJ470qq8TIfTrtH1S8Z80QxYQxFYRN8zDqSqqA+fwd2EO96xrIGAk26Ki/+VCDf5ANa9OdwBdYDa7LFI5qgn1wTw6mJ5rGSomihBvvsxpTkKShdzCl+I6ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348859; c=relaxed/simple;
	bh=bRwlCUB8PeDMdPsAkufS9wFbbrqGJgQ0876oWE41DWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VELQK2UDgxaG/ZaVE9r0NHQh5FWzLUUXZsgZ2CXycILKUsBRKt0kUX2w8AW4zMklDgmKiU2XQZ5HRMGeLi0c6QFE6gK6iDvGIQKL0t98wNeOWJLA9tOqs0Bdrx53fAsYRycih4W1SA8RH5UJRkZwwO3GHbl358hXyn2ugM1MvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+DMdsWq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so70828811fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725348855; x=1725953655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vliWi3Scy6RbjNeD5IhoobKc4xR9iQkqtP489fUblNA=;
        b=D+DMdsWqvVsDk4C562dvzGuE/qKAZ3rXNGNfD1O+JWWCbjB9ioYp65YmLaSYi9kY6e
         lpFX0gePllzon2gQD+Q5Y37b06OUbu6l6zfbDxigRyQ2v02BlqklCFLxrQtJimR39yQj
         dRbNqaKpkbJpc+z5H2OfiCsGdGUIxw11KzZevFsPf2JbnKAUW0zO3q7qLNPBy714O1ft
         D5YfV0f+qfOq1gGviX/hoFNtvtd5ksmx2XEhHRz7o7hcmUq/pKi7OteOPigt8zsO1e6t
         sTiznqK43NemwRVzsUL+fq8JjVi69XPPfpBa0hl3/4XlA7oflJNb45wo2mXdzkaM9wGP
         m7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348855; x=1725953655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vliWi3Scy6RbjNeD5IhoobKc4xR9iQkqtP489fUblNA=;
        b=gDITlAEjgPxnBys81a+yKjbM7AAkEzcxqvDhTulb3bYTCOL7F3nWrm5VuqdJun2QKt
         6ecGWOmIbIGinNcUp4GdeM5VATxqRIQkdTkd7+oekAyJ6BwMuZXoc8AZjT9ZjkDZIquF
         ss6QxCqwohETYnc+OZRDs2g4owFtFOMUhOaikBRT4tEtobZ8G1w3WrCL1/LchnDpUWgg
         nsXYBV1VWZ/HU+iUHS11iCWuPWLg+TOWMmEn0vBasmoHH8Piw6w/MnfgjubLHak1tcTK
         DMwMEdOX8cYcsMnYRoaYdMCey0rVHsLgxv4xqgyebANY57widu0M6BoCyd+CQA/Pn30/
         x62g==
X-Forwarded-Encrypted: i=1; AJvYcCW80BhUS8W/mSuM+cggTj4t/zfH1NdfPgAjGyNKSYQyZDBGzqeZW2KqwPIOkmiFC0QgcxKr5T80a/mSpU9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyho6eonVhQC4PdNJEOocX+v9s59bDqMWWkKs6bLBojSRVVae5F
	6V5FzW7V5ytSunQVEwPFUHai2g+qbd1vL20ooti27qfKZl+GLbNfZBizjyT2fgomi7irkJa1tYe
	T6zUb5nAqOGI6TwiEd7kiSyDT/QCh7JoGwQAtbQ==
X-Google-Smtp-Source: AGHT+IHikyCHpHDr69r3AMp2hdtbS/gza98nV+dXCxjEmDuwsCsZHqpmx08yOwWIt7zcbWMhhcpZyTO9rvIXl6UZ4Wo=
X-Received: by 2002:a05:651c:551:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2f6105d7954mr149363671fa.17.1725348855335; Tue, 03 Sep 2024
 00:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
In-Reply-To: <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:34:03 +0800
Message-ID: <CABymUCOsF5gL_i-uEyBBpgV_9qO_T3hNQ6vSX-dMGRsdFfgPXg@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Data width for dsc engine is aligned with pipe, not with whole screen
> > width. Because the width may be halved in DSI bonded case.
>
> Can't really parse this.

Please forgive me for my bad English. Is below words better?

Data width for DSC timing is aligned with the width that goes to a DSI
interface, not with whole screen width. For bonded-DSI case, the
width for DSC timing is half width of whole screen.
>
> >
> > The dsc width is not related to the timing with back front porch in
> > later stage, so update dsc timing earlier.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 7a4d9c071be5a..5abade8f26b88 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >                         return;
> >                 }
> >
> > -               dsc->pic_width =3D mode->hdisplay;
> > +               dsc->pic_width =3D hdisplay;
> >                 dsc->pic_height =3D mode->vdisplay;
> >                 DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>
> Two separate commits

OK. Will split it.

>
> >
> > @@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host *=
msm_host, bool is_bonded_dsi)
> >                 if (ret)
> >                         return;
> >
> > +               if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +                       dsi_update_dsc_timing(msm_host, false, hdisplay=
);
> > +               else
> > +                       dsi_update_dsc_timing(msm_host, true, hdisplay)=
;
> > +
> >                 /*
> >                  * DPU sends 3 bytes per pclk cycle to DSI. If widebus =
is
> >                  * enabled, bus width is extended to 6 bytes.
> > @@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >         }
> >
> >         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -               if (msm_host->dsc)
> > -                       dsi_update_dsc_timing(msm_host, false, mode->hd=
isplay);
> > -
> >                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
> >                         DSI_ACTIVE_H_START(ha_start) |
> >                         DSI_ACTIVE_H_END(ha_end));
> > @@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_host =
*msm_host, bool is_bonded_dsi)
> >                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> >                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> >         } else {                /* command mode */
> > -               if (msm_host->dsc)
> > -                       dsi_update_dsc_timing(msm_host, true, mode->hdi=
splay);
> > -
> >                 /* image data and 1 byte write_memory_start cmd */
> >                 if (!msm_host->dsc)
> >                         wc =3D hdisplay * mipi_dsi_pixel_format_to_bpp(=
msm_host->format) / 8 + 1;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

