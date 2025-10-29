Return-Path: <linux-arm-msm+bounces-79456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB15C1A7E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B76A5025B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99713590B2;
	Wed, 29 Oct 2025 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zLaB1x6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF69341AAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741591; cv=none; b=on4C0HFzpBCb/Oc/5Oi3Jm1CR/n/E1NIOmVdT+nGA0YtiNTB+V18vYOUuqzWDwxb9ZMUeoqaGN+kJj4ybuS41PXsOXtUCTMZGz9EyHSQibQhRWDRGSggQPHvtKgVeV59YNSn/zUvWv0R3vofD2z0nEp0MVvlhUUw1QkCKQ+ExaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741591; c=relaxed/simple;
	bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVXVwtgBKgGZroj2Tchl2fevMOpctMonxNO32Qq+qbaJRipeMHxqLu+huCHrhwxe/FnPddpylekKAbOndcd7wLCnAoDCaiHiIes/Mld5mPARkBralWVHh+GACeONzOEZ4xfJYjkTcRDj5zslzvwVo7fGnti4NfmEKA0Vt55aARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zLaB1x6e; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592fdbeb7b2so7557156e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741586; x=1762346386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=;
        b=zLaB1x6eVAZ9zfhQy6mSs3ecSMXcJ+JVEo1zGzm3hfwCYi/HQPwtjF72mbfH497Zos
         xLTx+if13zunBkqctues7h4Vq6i8shg9uN1pakRywLuKUZer555LgPwgdcYeWKSo9Nmb
         KDTgh0KR/tgB2EXzcoD0VHK1j8VR9nzrc3nG699wYLtd3oinPDd6FTFfJX10mLL4od5p
         MqyNXtgOeAXut5OzP+7XwcQ0h+PaBKbGOH42g2TdWx3tkQB+YCqi8ddMEiH6MFK3jLjW
         jutS4B1dSTvCuVY7MPgEAShWU3b0dnc4EG7I5u9Z744+QV9cYocrSEJhIhgvzQ/uBOAQ
         nlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741586; x=1762346386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=;
        b=h+mHVbQQk5h9KDvP7b0s600l+knCiH91AJk2mD/iYcm7/05PVKMQYZU2gGM9Pj5zAo
         kloXKpl8vL/d0H/h1n9EBYXwjxRaWyiVmVG/bmiZpDk7x4IM5R1JO7cQs/nijUDCrTeY
         bLu9QYx+LNWHMOBA+ItOD9YnfIYhxhOgjOUBCsatbH2irXKjECMvGzlmGr5ZR12OVzRI
         Bw80edvnpVXgGAUxQdKzoSj+gDe01DwSoSjazZlYXelGE/Xu/5aR46SXoKbjCgK447W0
         3h/W//Irhj9sIk4Kf3AwoqeXe5etMU/imWILRp+1B3cnUc6k+81VmkDpvUB/YcNHk75b
         RtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW+gcvtl8ltmf0corVy0k8Jm8Zb05Dz6VIY68Z+MS4XtQ3g1FoF1N0rw2qNnlUc614IAtcHDq73+bPSjrk@vger.kernel.org
X-Gm-Message-State: AOJu0YwR5s/TrOJltM46+4WBGVxOF0THFuMMRVVQE8EvFlizi4g0J2eF
	RxaOBMO1HAk8s2Q7ZcIhj0TEW5V7CrNu2Zoos6slObxGax4JJlD0e3RtEGp3QGZoWPWpH5zWLTv
	TgQVI3Gz+FH0f69qkhnWBNkTAcFP1I+VioAR3qIawhw==
X-Gm-Gg: ASbGncuZh3rGXZPGSiwOAshgyg3hF38Bdw94omveeWwB0ln4/Gge2ImHHoVb4+2irbM
	n7EmeitZR3GgAHxONsNyxkGJHA8N2zDRJFbPmAppLnGZAAsjNltgGAypaEZTbSGoZF+cZREjkcq
	8HwXHfJ6K+Ry2LKIf2dJCbxhgY6qCszXjKMNj3eX200X1+4lTffjv9EDi2rXGLBkVRWH4HB6E++
	v6U0Isceojq8NO36mCqTNRAae7Hhl+06f8RikIypjxn6M/rVKnpXjc9HC37CZilZjomHESbm8sb
	0JxO4hfaxgVvYORU3oglN8M7NJM=
X-Google-Smtp-Source: AGHT+IEhlmDPn2tgHOCgKXhItr9HaCh2am9KNpwJ0IjxOJ3YFVumxgTyoy/YlwjIRIN8akgjhohEFSM52fM0JyvB8BA=
X-Received: by 2002:a05:6512:1383:b0:592:f315:843 with SMTP id
 2adb3069b0e04-594128f53f0mr1119595e87.50.1761741585982; Wed, 29 Oct 2025
 05:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org> <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
In-Reply-To: <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:39:34 +0100
X-Gm-Features: AWmQ_bmg8NCddAGmpteBxJYDcYFplccsm6nERfQwYpmUT3SY-Zt_nlxAn9CZjjE
Message-ID: <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> >
> > This module scans the device tree (for now only OF nodes are supported
> > but care is taken to make other fwnode implementations easy to
> > integrate) and determines which GPIO lines are shared by multiple users=
.
> > It stores that information in memory. When the GPIO chip exposing share=
d
> > lines is registered, the shared GPIO descriptors it exposes are marked
> > as shared and virtual "proxy" devices that mediate access to the shared
> > lines are created. When a consumer of a shared GPIO looks it up, its
> > fwnode lookup is redirected to a just-in-time machine lookup that point=
s
> > to this proxy device.
> >
> > This code can be compiled out on platforms which don't use shared GPIOs=
.
>
> Besides strcmp_suffix() that already exists in OF core, there are also so=
me
> existing pieces that seems being repeated here (again). Can we reduce amo=
unt
> of duplication?
>

I'm afraid you need to be more specific here.

> ...
>
> > +#if IS_ENABLED(CONFIG_OF)
> > +static int gpio_shared_of_traverse(struct device_node *curr)
> > +{
>
> I believe parts of this code may be resided somewhere in drivers/of/prope=
rty.c
> or nearby as it has the similar parsing routines.
>

I don't think this is a good idea, I want to keep it within the
confines of drivers/gpio/ and the use-case is so specific, there's
really no point in putting parts of it under drivers/of/.

If I could only iterate over all properties of an fwnode, I'd have
skipped using OF-specific routines altogether.

Bart

