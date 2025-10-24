Return-Path: <linux-arm-msm+bounces-78683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8414C049B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AAAD74EAC71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B2626F299;
	Fri, 24 Oct 2025 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghKtyQUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9E1F099C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289411; cv=none; b=m5Y34W+XxCMwAUpe0SoDI/IByqQQzHd6gk1gYEcfnKboWQf8Kw0dOy+lzO0KMi6dum8XJPFN5gezODgyupyZjdBD8Uqlx8qCzG+eIMaJTm8utf3tTRG14Sq4jCXYyZ8CD0/+cwh/a/Gj0MQ0b1m9VjbwQP4cU0LlCiumNOhNiZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289411; c=relaxed/simple;
	bh=jwKwKoQ1je32EjVd1IL0UvZ2d8JBijczHCb0ou5rPAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmncAB79+ozlooCQ/s+I1dRaNZyRHs62utB/hxuGqy4H4Cb+aKzxXbU3Wei/8/1h62ihJrLjjOnMM3jrDiJ4Q7mr+vrtl5Lt69sHk/YXyuuYb2h+USTOal3BG+2hLJGUjt1iNGH2FkXfukq6zJLJIEXsiJ9Jq855RA21QWvr4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghKtyQUw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-592ee9a16adso2794538e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761289407; x=1761894207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=ghKtyQUw2YwzgTn4jwV0MMygeaEH07ARTCZQj7LVrdzklXZFeg5e9a2JesQQ482857
         pZ22jdPOqW5UJHxsyRX+kLLX/8AISxBwxKl/S7d7PD27ufB8YnBMLG46AXPRDLlOVURm
         6cEK6M2D/ZybW7pbGQVGn4UBQ43gWg8aqZDHkRMQa4BGCUcpyO/7wKWojW4CFLlClbtp
         ATiBS8tdQRwc6W7uooz9oYcQsoshDGh5HgfcTjrkWYHwsNAbrKiri6p3NlrxhwqDbfw1
         ux6eK0dkKLOtyjnjuL4HNTsi9nVcq14I3waUo+JadWzCqJEUQ9/GpC8rP4/TFrFM08w+
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289407; x=1761894207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=QfLk1oNJ89ME3GsYXWcRJ5ggjNfIG7oOQjnSWOkzll6P0ZMngNMOmY29aGog9AwDz5
         1mhLQIuFQR2DJ7vP0xv1ugJHoXAe6E/o3X8pc1LrttfTwBgK1Hx0zg87mhi6vKjRUYEh
         8fivA+Xs1Tfnd1QgvXPRmzxkiTf803lVdcaeC1+byXhfNHGtExrrLyyz9lkiY7LAqSJj
         LRVpHwfBAK+WJ6XL+Tt8YvxafkeO4WTOTF0XGmkyzeoIvEAX3aNLiLegXhEEuCxhAy5g
         PoPQqfVW6O4ukTVaY8NlSSxkyZG5yqdjXaGZLa6d1jIOPYpfWqZq5yfuW+FKoZrcXZxh
         aRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWluD4Z4Ex9YdG2XYG+kb4kce4VCDxa1lCm2mBk8Va+9Te1d2d/JQxdvOCac0vN8RGQzhAJSWgTBc9Zlzt6@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQF1L7NGT0MYNsg84wvq482E6aS9Y6FKiXAzwQhj2qIz+TyxE
	iIXbUVyQlc7cCkWgAV9B86tQo4nBdBsHlzXQeMRXWv+o+hm7FL4ehjPn5ku/7QpoXp20V+1W/jS
	4LqVQcoA2cr2j+rLdbJkfDozCBs5DFXwA+lfbRt0deA==
X-Gm-Gg: ASbGncs0rA6sdMn67lkzmsmuIbgZJEocQJorC10rMNDm5ibUz8B+XjKUjJB5XHz9pzQ
	uLSP29rZZMdBBc1u7UWN7m38D76lpmbhqIKphSSwv+x3mHtRea/RrAJOhV8PFnJGkWss6C4x87I
	bVGyUBamgngg60pdH+1Vz9v32Om3FV0+JdXdWFS8mvBuYcbwNCrlpv4qyGx3i9PFwBGCnXQJfm0
	spSEQsGg4TIg5KbztT++mkHaWbZLc+aWw0cWR9zalgn94UVVR5IW/HwcDuXDwX1ZZaKIpyZsMA3
	7WEVlBiUOkRNIj2fQ9VSgAXviw==
X-Google-Smtp-Source: AGHT+IGot33eiQ+BcQWl6UG0zv+FNQnQnMAkHHpWuHdoQFvVpdE10kN9LM8Ma75zpPJb50O7ebN6pjI2myaknhddpuQ=
X-Received: by 2002:a05:6512:31c2:b0:591:c6c0:9afb with SMTP id
 2adb3069b0e04-591d8546211mr8882195e87.34.1761289407199; Fri, 24 Oct 2025
 00:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org> <aPkcpTWfTb0HOF51@smile.fi.intel.com>
In-Reply-To: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:03:15 +0200
X-Gm-Features: AS18NWBS-Jd3edts4iMIfdLC_kiOaNMJiYsAVBHOjeSjhFk4sOt2_3x0nM3hP4c
Message-ID: <CAMRc=MduywsSKrN08_4F2xEjZrdnV--_3LZNmxwRHH=_QtceHA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 22, 2025 at 8:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> >
> > Add a virtual GPIO proxy driver which arbitrates access to a single
> > shared GPIO by multiple users. It works together with the core shared
> > GPIO support from GPIOLIB and functions by acquiring a reference to a
> > shared GPIO descriptor exposed by gpiolib-shared and making sure that
> > the state of the GPIO stays consistent.
> >
> > In general: if there's only one user at the moment: allow it to do
> > anything as if this was a normal GPIO (in essence: just propagate calls
> > to the underlying real hardware driver). If there are more users: don't
> > allow to change the direction set by the initial user, allow to change
> > configuration options but warn about possible conflicts and finally:
> > treat the output-high value as a reference counted, logical "GPIO
> > enabled" setting, meaning: the GPIO value is set to high when the first
> > user requests it to be high and back to low once the last user stops
> > "voting" for high.
>
> I have two Q:s about the design:
> 1) why can't the value be counted on the struct gpio_desc level?

No, I specifically tried to limit the impact on users not needing this
to a minimum.

> 2) can gpio-aggregator facilities be reused (to some extent)?

I don't see how but if you have a precise idea, let me know.

>
> ...
>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
>
> + types.h
>
> > +#include "gpiolib-shared.h"
>
> ...
>
> > +out:
> > +     if (shared_desc->highcnt)
> > +             dev_dbg(proxy->dev,
> > +                     "Voted for value '%s', effective value is 'high',=
 number of votes for 'high': %u\n",
> > +                     value ? "high" : "low", shared_desc->highcnt);
> > +     else
> > +             dev_dbg(proxy->dev, "Voted for value 'low', effective val=
ue is 'low'\n");
>
> You can unify and maybe save a few bytes here and there by doing somethin=
g like
> this:
>
>         const char *tmp; // name is a placeholder
>
>         tmp =3D str_high_low(shared_desc->highcnt);
>         dev_dbg(proxy->dev,
>                 "Voted for value '%s', effective value is '%s', number of=
 votes for '%s': %u\n",
>                 str_high_low(value), tmp, tmp, shared_desc->highcnt);
>

This doesn't make sense, we don't "vote for low". We only vote for
high. It's not: which option gets the most votes, it's: if there's at
least one vote for high, then we go high.

Bart

