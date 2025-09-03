Return-Path: <linux-arm-msm+bounces-71738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4388B416B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E3D5E0EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785FB2D94BC;
	Wed,  3 Sep 2025 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="or+O9yqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB72D73B2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884830; cv=none; b=l4q+wBUq2FB6qXRCDe/6y16jwjhbihp0JSGeAzs3yroApcv+VkELsC94zwcRqw+MQPWZqW4Ac29O2jM9Yw91bZupgJuqWLXbzI7RUbtTvH2/j9I4v8yurtS1yci1V7+maMpxy7AxCtxKWAjvfRMXqH9g5aQkHlsZbZ+rPHhPnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884830; c=relaxed/simple;
	bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulj+FndezMFygK+VG8+DX5KmYKmUj9nRgRuBJ7hQfW19xW3re6obE/z64OffuEiJwOb3NOqwP7GEU4RfMo/wJeQIofXv/E/Ku5ETgCldDFOYadlaVkH8YJmbiZIQGJJN6KQE9XBG0+rB24c+9ojiY4I6GH+fkcJbO1fxAse+r/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=or+O9yqi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-336e16f4729so23691791fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756884826; x=1757489626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=or+O9yqi+Fme2yw28jrJWT8dtYwgRPniIwPzJq/SW1Nz+gCVTeyG6kXv/ETbj6pAhP
         PfQwrdCC0J8IPpaDld0dGTwBdTo8HgnCEkfxiGdnUigPylEtYkHH2IXCnVKHreljZ7Nk
         yHXifcsd/RJwRpJCpaQE+Sf2RjCLIX11vWitdQbTjymxY5bZipIdoVLk6nUFtZwlsSaz
         vVuiSathFGm9kWh20Hjen/wxlqVIDx0Hhapdh62TMS/Az+TzXdY6phHYf1p4+FACfmNQ
         a33uBd4f12xTbiEtFTsqIEUUIOQCbxgmPtVspR8B+qHxFZeR4C9svVPCUa/bD4YF8ja4
         SW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884826; x=1757489626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=HaR8A5fCtpT0BK9dmi2I/D7ETggeCDzmNWpSsvKXyn+0L6lomY1D6l5PnaIL4a1TEV
         IYNjhehe2SzUSubQf+5ukA1LMhfbo3CyxvkqjCTeIxr7YBK7Ju5adgxNEsL4KtxGyWv/
         xcHTsV5DJ2GlSDWeIBkkibK6YrVNgvzErc/fgKG3DKC9OGyPipY3ECc8/eewGjUi0icL
         xqKSo9QSV9B7B9l6v5R35h2plK/hX2jS/+6aAKQ3AYRoSJcrBDn1ebotRVKS1NB+yEkP
         u8sztdJfZWvlWBPcAAZPQOzfv1WI7Lbzh7ws/ZHrmhVAl/EroSVtI6xFEMYBw9qIruai
         5q8A==
X-Forwarded-Encrypted: i=1; AJvYcCXXIBQ2X9GaQplIbUJg57oTnOzVqppSHLmsUqm27x5a/oUTNPYwB5dI2DLNZOCxNw0j3z7eApw/A3Y4Akoc@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+qpkTSGjnGyJ6NOHguRhJgN6VOYJ/WFFbtdVrDXEq/jcY6+8
	tvTneoSPYkKga8jYAMF7go2RBcb9OHPJzTIilgBn4wbn+7M6ZnLnjBaWxOKOte6gQ8y7pWiG/Bb
	pKIJ8l762rKXXEPvQIALVXEybbIcFVWyhl15MEkzMWQ==
X-Gm-Gg: ASbGnctePaerxQ/lSCUGaAMl0mo0jO6hF8GHZJ/cNXq62q/O4rIaFoD2MTA6/PvoeSx
	2EPDmqfSAZ16l2TmyOwx2EdatgqqSa/tlBlmcJ7rANA5+RFQmxVwG9ozWZ4E0rK7x76VC4LwV8p
	sMUit58uGpMffER5L+T6pSkqP69wCbl2L5xWqxkPXFyRkUxisWvvFqxuUVGR7rwjv9oRA+vLC1Z
	siWp15NFIZRpGfgvCFRtuk2t9Q0eLjAAModpLs2K1yiDfohpw==
X-Google-Smtp-Source: AGHT+IHQMDojBvXdcYFr83Du1enPEHK0Ti//rRC94x6rK+6MbJgsPNbFLU1zOeSW5BOM5GJv9hHYWvwxYnse2nh/rU8=
X-Received: by 2002:a2e:a58a:0:b0:337:9e3b:895f with SMTP id
 38308e7fff4ca-3379e3b9b47mr24730131fa.0.1756884826262; Wed, 03 Sep 2025
 00:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 09:33:34 +0200
X-Gm-Features: Ac12FXwfTFesdkv2AsVGJLh1I6xBKdxxPYffotwRnf3CookQp3k-WXkxYMLzaTo
Message-ID: <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The strict flag in struct pinmux_ops disallows the usage of the sam=
e pin
> > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > process with enough privileges (or even a buggy driver) can request=
 a
> > > > used pin as GPIO and drive it, potentially confusing devices or eve=
n
> > > > crashing the system. Set it globally for all pinctrl-msm users.
> > >
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).
>

For some reason it was displayed like that[1] in my client. I see it's
correct in lore though.

Anyway, what is your point? I don't think it has any impact on this.

Bartosz

[1] https://postimg.cc/7GFtxzzR

