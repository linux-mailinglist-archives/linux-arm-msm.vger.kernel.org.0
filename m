Return-Path: <linux-arm-msm+bounces-76054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E56BBDEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 13:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C289D3AA789
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 11:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C434BA3A;
	Mon,  6 Oct 2025 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1B+Ndkfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173B26E6EA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751716; cv=none; b=WGWuvnmiTl4xG4/EyjauCVvxKBDLVpiZtjoUDsfH3hRBvxZv4JKO8zetexaSqJKaKD/28IjgqbU6sOgnE+Oq0ZtRUcoi6jJHYz+6j8TQKRv44T0i42pPfgMUFGsqjEGqxBqNg2gjH52gOyZj4+NEpt7FYV124Qg2YCBvNuNE6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751716; c=relaxed/simple;
	bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlN8by3eIuEsEVEKizBzRRASMxJC7NHPJxH4eM4GSH0dF5SGP21uaHn9aPvxoSc+SqzkpyJJFx4p7Cmhq8/xKjQOuDXogHaSLvCsamQ9y6M6W1iZ86qkTZUm9zR2ZF0p4aZ8OfnftLZIZDsxbvTm1m/yLBvliz58T9cHeHFrhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1B+Ndkfz; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-33c9f2bcdceso27862681fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759751713; x=1760356513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=;
        b=1B+NdkfzkKQImgJQQdFsgUKPpm8sBT3nizg6TZCsth3g6ipK1whKp5EaPdCR3SKyrj
         rRHbCnQ9D3FKPIbu7B1+CCNAcQ7mC3/cgjs+aL01zXGYynq5zeGzP2Sgu4LKEU7H+ghG
         BKBT2Vj1nl5PdArvm+xbi495HG80nQxdIWjCCgWnj1no0USINVQpoSP4EyyfHE1rHsAB
         7sP0OzVUR7gA5JBvFDjsqC/Wxqv+AFxQv/DaGLgFAhgSlc6eOO1mVyg/N0mqlA2GIe5l
         jX/6ZOkqGpYzNVBppW28NuoAWD2hqjYlsXMQcOWjgHHlOm7VOjXesOS/2BoTidx5br08
         qEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751713; x=1760356513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=;
        b=OXzmwH9v5ASPvwNaFJYZRWm/IrSSYtU85hQRGhsxLE+0eFCZMMRe4LeMVdxkRmUwa2
         WPKzjUA3VVCeRkl+zrpEIrC0g2I+JtNj4uA+xKhtD1z3uai7I5HiFpTAx5ITNRY7KAU3
         7UimCfGeSPtfGXdYbGUXSSbmWKmg/CgYJPAS1aPTzpo0iIYzjspgQ8+d3OmYUPCzzbhD
         56xQ5CLJVCtkA5OnKfsF3DtjSnCn5XpcTXW1KbJ16TdHqm9h44qVVRiTGeqqw7JoAqgn
         e9uVSIVlpqrorRax0QcQkbcAtKz1X3gpSeWbHAxVeGK3yBKfGWpBj3Olh1hAkGHlRN2T
         Iolw==
X-Forwarded-Encrypted: i=1; AJvYcCV+VQFKg39yN2Tybm7yvo2XVkBX8cGHn7oVPnx5M1Gphd4V7qYL00iPZ369EUqUl6hmhJB3Gl8YgJQ7AJvX@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRNJ/bKbzkPwv/2nnrnmbr/b9/tTAkMQAZaCQefxOWL9EroV3
	4izaeI42hllg6IXKc4JTLEOAlvj8wZobt+5z1hmROujlM+qdDIhoOjXSGlkM4sH6EX2mYBpyiuC
	gsliOvehFVOEKL+30pPQjn/TOmBPpGhOo9NG6B7HcAw==
X-Gm-Gg: ASbGncusJbqUg6VtL/HJrCGQiBYW9kL3U7rVywa8/+pUACSq0Elgy4LRb/PN/klndUn
	3lWG8BxuDzmNx+C0j1PVJFhTwKI2g6zKnJEwdHr67J7bsZR3rlcu1DPCSV09qhuaODOl/B6h1ub
	WKnrOEyWiZpTdUMTBHZOV77QPcO0IQLis77nqKJKv0dwHAFsVUS6TGipD95/MnBNh+TfUpqcNlI
	WtEj69DThtYULngQCKEsHx/fYOOPNlofYQQ6WYz3U4MTSp1eYCwg7GDXmBZYpUnSSlu2BApxg==
X-Google-Smtp-Source: AGHT+IFimUYcDrg2G1TEWgg30XOxFQcNPZ7in8UOx4Uq0QD6a7uE0edrd5tvO1JATw877D2GtEmmVeOuzKJjG1mqPQE=
X-Received: by 2002:a05:651c:1b0f:b0:36f:4c94:b585 with SMTP id
 38308e7fff4ca-374c3727355mr34984151fa.17.1759751712890; Mon, 06 Oct 2025
 04:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
In-Reply-To: <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 13:55:00 +0200
X-Gm-Features: AS18NWCcgxeUyOPczJhdeT-2OxosYn-Q0vbiWg2Io_Y9VuYPbgrPQiw2FGc9xs8
Message-ID: <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 4, 2025 at 3:32=E2=80=AFPM Srinivas Kandagatla <srini@kernel.or=
g> wrote:
> On 9/24/25 3:51 PM, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> >
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> Isn't the main issue here is about not using a correct framework around
> to the gpios that driver uses. ex: the codec usecase that you are
> refering in this is using gpio to reset the line, instead of using a
> proper gpio-reset control. same with some of the gpio-muxes. the problem
> is fixed once such direct users of gpio are move their correct frameworks=
.
>

If they were called "reset-gpios" then we could (and should) use
Krzysztof's reset-gpio driver here, but we have many cases where
that's not the case and the names (and implied functions) are
arbitrary. In the case addressed in this series, the GPIOs are called
"powerdown". The second big user of nonexclusive GPIOs are fixed
regulators where the line isn't called "reset" either. There are also
various other uses sprinkled all over the kernel for which no good
abstraction exists or can even be designed in a generic way.

> Am not sure adding a abstraction with-in gpio framework is right
> solution, But I do agree that NONEXCLUSIVE flags should disappear and
> users that are using this should be moved to correct frameworks where
> they belong.
>

I'm open to suggestions but DT maintainers have not been particularly
fond of creating "virtual" devices to accommodate driver
implementations.

Bartosz

