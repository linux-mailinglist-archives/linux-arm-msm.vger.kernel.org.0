Return-Path: <linux-arm-msm+bounces-75654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BCBAFBA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A95189C22A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A3A284899;
	Wed,  1 Oct 2025 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkfrDGu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C92494FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308564; cv=none; b=j2sw0iicPRfRShwvB+EMZIwnrVzvOaNSNDq+E6TGhq+iXQKmtdPAseuzTb6oqfLeLHXSiHDbx3e/LFLpRb2EPurQVEbmrraPuUJD0yujO/wQeHbQ/aQZUrnDPxCj4F+iCXAhN9NIApTdpakcY9gtc7KZ7dF8KBNvgA/WZaWpdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308564; c=relaxed/simple;
	bh=8rIcT1Pqs3Ea0y+ldBE56b1g4vr0kel/gXDqeQVGlIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8p4TQ+IG6CATh3YDEPPeYgDak1jJM3+V/hsMrtG7PEgw8+YMlGVBKobiEkVvvx6u+K9X52WJamsu/mtc3ONZ53hRMVcpqE9bFs2CQJipjf6ajA26IPGDpCtuoiAVniGroB5XN2tS0F8YziV6b7XQdZa6R9Hfkj7XWLdvlYM2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkfrDGu+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36c0b946cb5so56010721fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759308561; x=1759913361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=zkfrDGu+OWGi3FG8ITAaOuQBN1lu+3NuDJaQ2yrnNFnH/u4ixV3mjNpWXUlAp6+tpa
         EX6re+C2MTBLzc8+tP2BGCqAmohTb6v4M7n01C4APyZ6weYstslPeSeKGecOJzJZWXBO
         dHUTGYoXnL/KSJbvNr8GWGvwo/Fb45TO1CzVJ4i3gOzmtLQgGyieA4xc3OaVmeumXkwn
         8lhRf7ibgDZsV1U/4E/J13OYbqg6YgoBJ3XS37jH3D74Vl/Hal+T6qhgJXZCzPRyBX5N
         mVMJbwIiMb3Qhyuq6WZKybFR1gzRX5URh/ZKdRBuwn2ltYr++hyKpz0xopO4lH4DySv9
         qXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308561; x=1759913361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=kga+ajmyGZO3lHf/ye4prkzYYvEoI2mHhuWLfi8MnTwOnvvyC3oJktT/Ucv2vJThC2
         /Svbut2bdS2U0ytuleaOi6m8guuHTTxPtIsYAEUE9ymxhgM3EylZdIcqdmk9HFB4M+7S
         4YHmAXCn1BumeZ4vG4IsLPXOocd2g2pgV1jdqPeKQhaYWXRJiSXPHjbEn0UwWRasRPNv
         e0NeNyFjZxd4oSnuvME1rjOHwaJ2MlWWtaUSY1j06Om154bEyLJp2urZ7Bo6xeeGiKpA
         idvW0WoFXTKfFC8HjPV5/WXerBnD2xP5J+MCd3Vb7QzxlOBZtva8gMv404tL30ui2Hd5
         +Q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpFc/oJPATJv7Er3mSAXgSRUmIJRQkhT3CWU63NbL4KBfzm8XIt6iu8MOpXhJz/rd/xTOSi5E+AQCEP3kG@vger.kernel.org
X-Gm-Message-State: AOJu0YweqFb6n9bgxu9+VBaH6m+46lY4CCDbC+A//NMoJiVvOJgFPpTU
	Kz3NIeSf+4EVUPLz3HSigT3cuDx9mDUQJOm7p8eVbATbTmFyZdEo/+eUWCmftxzj85pp9Ti4ruq
	M01o8FK3vrB/yHq9JNIu57T7DQoMCLvEG2IBRRRY3pQ==
X-Gm-Gg: ASbGncuUz/YDqXwTQJ/DwTYqVahLLXIFiMS8DRYqPwcnTiyOOWVo95M/2fNfodkqucE
	zBaMKrx2voTTb9/lce17wryUT1HWIq3Wbzq/DFCvxduH4VEz+UKu0LDhp44wWt0NiItCtxRk8z9
	roiOVdRFoJJZ3g8GM6+oHmNgTU444DR+waYr1ZJzojhbGxJu2D7TgUmWyC4MThx1dHTRYgFnTKA
	ZnMTtKXNKqsE7QNWV+he8KSGDDbefI=
X-Google-Smtp-Source: AGHT+IE/zKf4qFF1V06mzijknnV4vH7ubPftpR9/pcWP4CKpLmmmcoKCGAvUGlvDb6zfdbCLMmIHYOCJfvmvwXDpg0U=
X-Received: by 2002:a05:651c:1592:b0:372:9468:8f99 with SMTP id
 38308e7fff4ca-373a752cee4mr8095951fa.35.1759308560647; Wed, 01 Oct 2025
 01:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:49:09 +0200
X-Gm-Features: AS18NWD8uQhySPgdZVvT54DJFS2VbD05G4rr5WTDsYs0mXBgIhMrAJorsb0mOuY
Message-ID: <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

I see the big picture of this plan!

One quick comment:

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core),

...and that is what I thought as well, so:

>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

why would we be selecting this per-subarch?

What will happen is that CONFIG_REGULATOR will select
it and since everyone and their dog is using regulator, what
will happen is that every system will have this enabled,
and every GPIO access on every system will be proxied
and then this better be fast.

Two things come to mind, and I bet you have thought of
them already:

1. Footprint: all systems using regulators will now have
   to compile in all this code as well.

2. Performance, I didn't quite get it if every GPIO on the
  system will be proxied through a layer of indirection
  if you select HAVE_SHARED_GPIOS
  but that would not be good, since some users are in
  fastpath such as IRQ handlers, and the old way of
  sharing GPIOs would just affect pins that are actually
  shared.

I don't know of a good generic solution for (2) to be honest,
last resort would be something like runtime patching of
calls when a GPIO becomes shared and that is really
advanced but maybe necessary to get a performant and
generic solution.

Yours,
Linus Walleij

