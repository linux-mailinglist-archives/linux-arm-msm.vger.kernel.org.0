Return-Path: <linux-arm-msm+bounces-28219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE994CBD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165322819B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16D4C8D1;
	Fri,  9 Aug 2024 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aEo6xKLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2D18C927
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723190573; cv=none; b=KK0b1typKPoNYkApsrXyF+niGqTHj1fZ11K9mwrXtMNlkyWK6Kbm/EqHmqM+JlU88IPlWibPN37Ja5HTSONTKLDf+jpjmq2t7Xqzl4IvmfGzZIZuq5h5eNf9JIUd32VZfQd18zU+UAchby/5MGvHMJfVooe4GPttMNmUtmfeuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723190573; c=relaxed/simple;
	bh=MiupinPYtVFVoULAp4AM0FSVF1A0l2X2WcE1JaT1WzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZxftesQFs3DO09OaGO4dRBgMdOLXokIhYNmZJAdLQ/ag6V8LZK2piptewtOH5VxvT5MSX9G4QxpFjwR5tDA0k2nT20nD3OigGMHGt+mP6p7f4/61cegA5U+vDtIhiNNdPFSLI5LvtJM4tPGPaT//H2Pj8xDedoz7IiHxllBADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aEo6xKLy; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso19169751fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723190570; x=1723795370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=aEo6xKLyl5i7XTCiFHrq0JXA+l7Q3TjVypgjtCbtUc3DtsVayirX/isG8HRY4uYXnv
         9s5nrJ5n4pNtCqB5RM0ojjXRfueFmwkjoDgRcU6DDX0+IX2CaZm1wGiG6tCuuDCPYG9s
         ej+920PdWYGV00YflhH9IJcds7JMtxf2oJ2Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723190570; x=1723795370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=DhsWCQN27Gfbm94JPR8v4iJaNm7GgjZq3V8WwXFp6jrShLrhdA4pvx1eKDre+zpUw4
         zBmQJB9kgporH/Io0mSOoWg1sRdStBxhWt28vl2+Y9rqu6+bjuZvMuCmWrjVS8PFeMGn
         YE6/XJQPb0hRBIIdqCpTK2m9Om482rKuaDUzDy0I3TbKzTbojdS94fizInDOgeiurncK
         uIE7UeDALo3ljFXOQUKJuVNjgfwE/VBNeSNi47kG9lCz+BmkKxBEQ0ao8QujTjlhu41F
         MmPqqv2tA9ZrvgnOQtxOfBQWhVGUqbD32kMkD1R6HykQK795n8RtU8Q7wkalGQXjEgLK
         ZRlg==
X-Forwarded-Encrypted: i=1; AJvYcCW2H3dWRUcL6zEwOc9xZqNkzUMFiV0kAjmFDknRtwWjAjQ2r27Iu/NXmpjxvRAGww4BX1IWt79U4cjT2+lr9mRvAyRySQacecy5M7/yZQ==
X-Gm-Message-State: AOJu0YzKjexiQB/y6gv9ffRUk1uq/icwqw03EBibAl1tRUkrtpfbVXkH
	X6/TaGmS0ZddmxlUxE7YgkG2a8LuFCfKpGwwezn1HVDzvSc9el+t+me3vCeftDZ3VJYhr8t/dgc
	=
X-Google-Smtp-Source: AGHT+IGUBXSamnQNyr8kXq4/R5FnvW6rXj3mKcHt7j/3KCMWuAjLUvqrPg0nTGJCcDV1uDCzODCp+Q==
X-Received: by 2002:a2e:8395:0:b0:2ef:32bb:5375 with SMTP id 38308e7fff4ca-2f1a6c5a3d8mr5944641fa.12.1723190569752;
        Fri, 09 Aug 2024 01:02:49 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f192d9aa5asm9690861fa.61.2024.08.09.01.02.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:02:48 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f0277daa5so2439364e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDVJOmuUZeD46vi+PxFWS/3fG2i6H0Eff5rGa5FlyqfO+UJp5/VnGvMEaWITr49qRq5Ekq+JOJMyavyDXAziaqA9MhdHDCdWVCOt0E+Q==
X-Received: by 2002:a05:6512:3e1c:b0:530:adfe:8607 with SMTP id
 2adb3069b0e04-530ee9f3594mr770871e87.51.1723190567467; Fri, 09 Aug 2024
 01:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org> <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
 <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
In-Reply-To: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 Aug 2024 10:02:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

It does not seem that we will find the datasheet.

Any objection to land the patch as it? It is as incorrect as the
original code ;)

Regards!

On Mon, 13 May 2024 at 16:26, Michael Ira Krufky <mkrufky@linuxtv.org> wrot=
e:
>
> On Mon, May 13, 2024 at 9:38=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
> > >
> > > Hello Ricardo,
> > >
> > > On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > > > I am trying to get the DS, but
> > > > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf i=
s a
> > > > dead links now.
> > > >
> > > > Anyone have access to the datasheet?
> > >
> > > It's kind of available on the link below, but for some strange reason
> > > the download fails after downloading the first 128 KB or so.
> > >
> > > https://web.archive.org/web/20080907185532/https://www.nxp.com/acroba=
t_download/literature/9397/75015931.pdf\
> >
> > Mike, by any chance do you have a copy of the DS?
> >
> >
> > >
> > >
> > > > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.or=
g>
> > > > wrote:
> > > >>
> > > >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wr=
ote:
> > > >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > > >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > > >> >
> > > >> > > We do not expect the sample_freq to be over 613MHz.
> > > >> > >
> > > >> > > Found by cocci:
> > > >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_di=
v() does a 64-by-32 division, please consider using div64_u64 instead.
> > > >> > >
> > > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >> > > ---
> > > >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > > >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >> > >
> > > >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/=
media/dvb-frontends/tda10048.c
> > > >> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >                          u32 bw)
> > > >> > >  {
> > > >> > >     struct tda10048_state *state =3D fe->demodulator_priv;
> > > >> > > -   u64 t, z;
> > > >> > > +   u32 z;
> > > >> > > +   u64 t;
> > > >> > >
> > > >> > >     dprintk(1, "%s()\n", __func__);
> > > >> > >
> > > >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >     /* t *=3D 2147483648 on 32bit platforms */
> > > >> > >     t *=3D (2048 * 1024);
> > > >> > >     t *=3D 1024;
> > > >> > > +   /* Sample frequency is under 613MHz */
> > > >> >
> > > >> > Are you sure about that? Some DVB devices have very high frequen=
cy
> > > >> > clocks, specially if they're also used for satellite, so I can't
> > > >> > be sure by just looking at the driver's code.
> > > >> >
> > > >> > Also, we had already a bunch of regressions with "fixes" like th=
is
> > > >> > that actually broke frontend drivers.
> > > >>
> > > >> This patch preserves the existing behavior. The sample_freq_hz
> > > >> variable
> > > >> is a u32 so, in the original code, z couldn't have been more than
> > > >> U32_MAX even though it was declared as a u64.
> >
> >
> > I agree with Dan, we keep the existing behaviour. So it wont hurt to
> > merge the code...
> >
> > All  that said, if someone has access to the DS, I do not mind reviewin=
g it.
> >
> >
> > > >>
> > > >> It's possible that the original code was wrong.  We have seen that=
 in
> > > >> other places in this patchset.  Adding a note about the datasheet =
is
> > > >> also a good idea.
> > > >>
> > > >> regards,
> > > >> dan carpenter
> > > >>
> >
> >
> >
> > --
> > Ricardo Ribalda
> >
>
> Nice to hear from you!  :-)
>
> I believe that I may have a copy of it on an old "spinny" hard drive
> somewhere in one of the ancient desktop computers I have lining my
> basement walls, lol.  It will take me some time to locate it.  I hope
> this isn't urgent o:-)
>
> ...It so happens that the dev box I used when I worked on that driver
> is up right now, but the datasheet isn't in my home directory.  There
> are two other drives in the chassis but not connected / powered - I'll
> give these a look and let you know if I find anything.
>
> Best,
> Michael Krufky



--=20
Ricardo Ribalda

