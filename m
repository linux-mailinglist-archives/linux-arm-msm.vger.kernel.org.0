Return-Path: <linux-arm-msm+bounces-77813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21ABEB103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED4F062423E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5C71C6A3;
	Fri, 17 Oct 2025 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lKX+h+at"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E732FF674
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722026; cv=none; b=tK3aGzWVQdWeFtHFCiPnuGffWZfvuDfDDH8k2nMFfgWCLc9xhdEwX0ujr5Lg0k18v+wdrd8hMdHPGu0exHVsqGyFngTov41mDNwttG8Ox5jpUNmqTD8j08UONc9X1TA/zf5ZM8bFdrwPvjbTcqon2zjk4sE2mnzuNwtKthSfW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722026; c=relaxed/simple;
	bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMHqzzMNvhysuAWJHkBBF+f3Q417BSpOFHU7qk5GxiygQ1lHHgHDEb64OgvesITTf9NE/oU/+Yfebb3CWksYxvyCP4AZgsVDcUWzw2sptOmhLH5b6agC0OSPytBV7lnUWfDba+/mclePc5mtTK8yq/a4oyXXqtwEESJ7eOuydkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lKX+h+at; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2696331e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760722023; x=1761326823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=lKX+h+atSh/zaXOsjLobaX21WkHh58ezfi30YgGOQdUKbp0BMeje339NJHne/5JMpb
         YIQSpjti8Jk9IQtAFdG2RCTJJxhovDl1cz5E0hqXu+QLthicuZP7UIJqrTxTI1nxO99d
         h0GgieTf2XB6l9hyEtR/5HUZt9LXSqyXyXKZZIMMkAkcRaED+uGG6oCV5q8RqVU11CzR
         s67o4QsV6DFjfOz4GvfhAJJj1Ej2X8+R38CigDfA0AdAMcOVbxoVpkOlv03gZ0js3XX0
         ARvLnfLwCBpAwSTmmA+CYGgVz2Vy5mI9uejbpvOojiZewL/ejZ6fHbxrjFPrfhUk7PTa
         P8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722023; x=1761326823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=s3MiMgDxC5e+GkDJfEsoct2Yj+MYVGELgQ+nJauLFEO9i54a1/dO7jjs1Gh2ZAMd1v
         mbiBuNcwVW87gtDKKkiH2mzFUnaKBhhiw9kCo7eUCb6PmUcJc9fPSTnQuaWkAd39HkEG
         s2TUEvNlZ+hX8qaNcxGn4Awk5z/y+GZgMQe8NxvItDARiApX5srX7XUKwZFyDlaFXKrN
         9Mrg0Le6G2i3RbAiIR4G59xCOzwxvwwJBioUXYXlrXncOCK6bIES0zp5353/wJFX7nUX
         9xZYtJ4UaDp9F4NiKmxNqb90nwc68Vi7VSB4jdLwGgp8vvWa81hWBUichor1rBkuOV3a
         qr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmVJ0GRl1+lyEBLFqFRoRh1sbA6i1OedDnHBJoASEXSBRern2TdCgJBr/Jt7jpG0zNi3UMrlcxsF9IM7rp@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJZRm2ZBX64GyZ3lyzAxygqYRW8B7WXsMsL3RFRoFdieaynvG
	fWlnLAaFZFhyR1/pF5CR2+JQbr6u4CdZWzs7FAJ2QYl8HVn6bdTMBH3jWalI7KCn5lOriTk94So
	280tL7xgPNP1vZyWfNqKwgdx0NFo/C+IGiWlSeBReEQ==
X-Gm-Gg: ASbGncs9TIPqMRufrO40k8wRX4spegSRi4h6URiGVBLQhH0QjsVItr9GpsdSkI0KDhR
	LO6/Wr5mmEZxFMxUvyWbjVg3NaPpC5bb8nOXsvyOR/gZqC+yWvLduOUv0+BfjjGPZmYr540MfCe
	MC+ucOSvLUjhdMIIWmevXOjkfCLmvvAq37Icg+mKNLsnuHcplFwOM+Isd0cFTlnvSUB1qt72OEB
	AbA/F+ZnFwep52Vl3CXq6UaeSpLNgU5XNw/AuwCIN0oLkk94qn4kZl34If9qVU7ZRLdwqRYtZr5
	lt5k/Bqs82+fhKlAi0Pcs2PJRBE=
X-Google-Smtp-Source: AGHT+IEnROQjyiNXa20y9fdKGDuy8cXUgGRQbjpjaM5VjMNNuXFx1RyY7/MYDJo1ov+PfI5vPHyhYoMIz6wqTgC382I=
X-Received: by 2002:a05:6512:3b96:b0:58a:f7e0:7284 with SMTP id
 2adb3069b0e04-591d84fed59mr1542688e87.13.1760722022961; Fri, 17 Oct 2025
 10:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 19:26:51 +0200
X-Gm-Features: AS18NWBvQScHzFXgOzgmGaLsZFy2d0XcQpPFsgGo-dqtoYRGPaRXMw7LL4aRoyw
Message-ID: <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
>
> First patch in the series is a bugfix targetting stable, I'm surprised
> nobody noticed the lockdep splat yet. The second adds a library function
> I use in a later patch. All remaining patches implement or use the
> shared GPIO support.
>

Mark,

I was working on extending this series with patches that make the
regulator subsystem aware of shared GPIOs managed by GPIOLIB. I admit
that after our previous discussions I was under the impression that
the regulator core not only manages the enable count of the underlying
non-exclusive GPIOs but also emits the relevant
REGULATOR_EVENT_ENABLE/DISABLE notifications for GPIO-driven
regulators when the physical pin actually gets enabled/disabled
respectively.

Upon a closer inspection it turns out that this is not the case - the
ENABLE/DISABLE events are emitted when the *logical* regulator is
enabled/disabled even if this does not involve a change in the state
of the shared pin.

Example: the tlv320aic3x.c codec driver may use a fixed regulator that
uses a shared GPIO pin. The regulator in question may get disabled but
its GPIO might not change state as it's still enabled by a different
regulator. The driver will still see the disable event and put the
codec in reset.

I'm not saying this behavior is incorrect, I'm just mentioning it as I
thought that there's a need for some GPIO descriptor notifier that
allows to signal the actual change in value to users but it doesn't
seem to be the case if we just want to maintain the current behavior.
The only change we need to support the existing NONEXCLUSIVE flag and
the new shared GPIOs at the same time - until we convert all users -
is providing gpiod_is_shared() and just making regulator core skip the
descriptor comparison and referencing via struct regulator_enable_gpio
if it sees that a GPIO descriptor is shared.

I will post a v2 early next week.

Bartosz

