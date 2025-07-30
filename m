Return-Path: <linux-arm-msm+bounces-67149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0FB160BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1788E3BA3B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546D429826A;
	Wed, 30 Jul 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N/kuqWZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2D2980A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880033; cv=none; b=CUvzt63r8D79vD8ZG/LZCGWd8vjaE+7jeaZ5VljSQMv87xBqCOKzcpw1syZ0S8ndXIGA53QuD0MeJ9TTxQOTAW/gEAmayXhgVqcHSlVTKlDtS0EAaV22X6yXooM6U/ORsPvl15d3tdnt6afYN77LMAqRfOZsRpJ0UIydTmBC6rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880033; c=relaxed/simple;
	bh=RNeM7UB4fAERU2LPOJtuWeYJSG/9TTk9Yot9abhDF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeWWh7lYNl/0gUctfN5l4O+yQW7pHWrw6NDi45ovfAHb3hg4goN0xtZ2l5zfUTPt9zBaPfa/qJHEfVNTdGLbV8bLCHLxP/leJAcFCVWenkL6gudcGgXNhsdoVCX6QIdQIK2icXRcOh85qfiDg6ULgRYCXjOqDDpkG4Ty6KWm2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N/kuqWZ+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3321296a8cfso9999391fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753880029; x=1754484829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=N/kuqWZ+n2E10szoUZ24/6F4JuCqCRJgIiSJ+13vx4RL08ntqRjKnWOUv3CReInxOU
         RHq+XhAf2t/ltRbFuhsbgN6TO4nPzRBRVuYk9xYDQMSzjwBn4vRQklSpSF0n4x13/Akp
         HltCRODxOSbnP3MX3m0jV2K0dfXv6tdEODM+V8GbBhMQAjLnJ4mC448itgqV7a32K2zG
         6huj2nFU0UyK5TCqYfapyzNciidjWGBZEhjUPUxsGrUibrXSt1YcgTE/WVtg8c93RDxU
         cNIJuMLyavB5KXHA8bfnDrlGWvHGd/mWQHprk+vfnlwGskSesPW+AbY6GuMT3nAC2BlH
         1dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880029; x=1754484829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=i1gUpmTrM7vfWASZXgzNRFL9D/79BYvZq4v/UMcNS2mOeY8RC7/ifUng+TtUhG6Jl4
         xLs+UTRz0MXlZFkSmWMKFTVONeD4YP4edMh+KVaOuZnGn4+tHpqXFkK/hqzPnRGMzU/H
         rasarD9uukrkiQW+b+iuxTJJNeHAzILHe0gSODIuLbU2UKdmedgO/tPtiFZVeviVU5M8
         j+sM3sX6E5EcV4qIXn4WmHz5Svq3HQD6GIV7ACmP5R17+cyTOq/ZLhGRiVmHtBEPeF4J
         gIw2xzi2ywd/AnKFR+Z3Eqtw0APiiDjMtejGfYyW5U756ymWYaMXQNz9SHvBbT5GRiCo
         H2gA==
X-Forwarded-Encrypted: i=1; AJvYcCVFzb9oDcbmvY5AbMeSo782NlPDHwDyXBd4P362/pkwlxAUIVgOX6jx9LaZK7Fn7MFsW2GiIwmpfW8aT240@vger.kernel.org
X-Gm-Message-State: AOJu0YzYA+s8A8Qdw5hJ/pIqjHkhgvtUs63xgGp9Obc3xnTR0BURuSTn
	LYMupmEpxCpfU9Wod+Uvv9rBKgCANLiqvsg2rW7GrBwhqW4JRjzIRj/9pK9ri1blLQnTs/8gbeg
	6YS0dRkm2wtEgzSfpMld9VfSbaTPpVj7DDkCiShYduA==
X-Gm-Gg: ASbGncuOpuq4OuN6+EZ7jezmZErDhyRGkIMgk3AsrJeBbm8uC1N5CAN7WGYEwO0yqXO
	uo7HC7y3Ulen6WZPP9RQQ4QJILH+Vmkel+lyTaPNq29tsfLGdrGVE93ciTVMLcZuFH36JyTg+Rq
	2fpG8fzvnV6AHNEKpMmcVWePIEyJuExYMqf05zNZGrIWe7tWs+qUExWpGwLb8iA7sCwt83CMCB0
	wWevpUMDIKr4ThfnwRg0q5LDj4l5XFAoeBsSAs=
X-Google-Smtp-Source: AGHT+IGSuyPnAInz8gQT37fKK4pgrT4+RIAYI9IrKjK2MWPd45oP6K0zUhD/GSonCiRI3dzBbJ8n7cWJZ+qNt54xgoU=
X-Received: by 2002:a05:6512:ba1:b0:55b:83cf:b260 with SMTP id
 2adb3069b0e04-55b83cfb693mr305928e87.11.1753880028944; Wed, 30 Jul 2025
 05:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 14:53:37 +0200
X-Gm-Features: Ac12FXya2mYA_HSI46S7KktzTvTwdWuT-o4vBrrr3z0vtr46fp0gRnU_ZqynDBk
Message-ID: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> > >
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.
>

No, that's not at all what this series does... gpio_owner is the
consumer label of a pin used by the GPIOLIB framework. The flag I'm
introducing it telling the pinctrl core - before GPIOLIB is ever
involved - that *this pin can be requested as a GPIO by GPIOLIB*. It's
the other way around - without knowing this, for strict pinmuxers,
GPIOLIB would never be able to request this pin if it was muxed to a
function (even if the function is called "GPIO").

Bart

