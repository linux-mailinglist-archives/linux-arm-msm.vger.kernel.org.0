Return-Path: <linux-arm-msm+bounces-82786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F41C780AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6812F4E649F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26D933E341;
	Fri, 21 Nov 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="crNDnz7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105333A6E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715837; cv=none; b=ptF1vHDDTpau7g5hOsFB1au8k2fg3HjR93q5mByWXFQiDHTkl3v5M2ZePEH/AHF1Xvcs7cfTx83d8V1330zeZtbALqpngNTtTRJ3qXECm7l6nWktMV7RLKDNMPj2dX5f20v4iGa1XeSCDMaPok3+TxPn8yRfE3kfMqthrsD3bB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715837; c=relaxed/simple;
	bh=7oJ3FzW76jvcvPZYZdFnXMjjUYeOTlfsS6uSULymDYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXq+YA5xkCWavEuwCJ1MjMWqewjywI865XVql/rJb0G++oWglQMNhMRgeYU1Ly///ISfCIGzN2kDWhV0t1eyYDfxf51tPyATQJ/jNdQoaadiPf1vOoYc2cn21J6oiiraHVSjihVfZHNyyD93PZqR76rM5k9FttWsCWHb+Cv15jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=crNDnz7J; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5942bac322dso1575492e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763715833; x=1764320633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcWFlcuSs7Y0eO4oq2DsaroJj7DisvwmuRZnugA2UKI=;
        b=crNDnz7JsKDrVf+c9ML/Yi+wl+7ATQVsTeDb7bd1ZUZ70TcLTwxSohtrwcY8zcZDE7
         ebiP3Uph5U4pDL9jBv9CM9hmLkIqU+MRGi+0jwvV3MD52m6d09loKJvpDu7iZNQqNFZw
         UnE55uyAv8afXzudxDdS0IGR+MROfaDgUDAJHZYHYOIKlh5sk1+KVSfoDyfiXAStHGkC
         86niqR/buV09FsAgkYyVa2nRx5NqXW049/otL7pzrwneiSXiNCDwdSdEm7D5x0uo48T4
         YLxJIvgfOON7gtGahs584M6LoOsUB2OrS6zD1Qg2YtV58G30k5B3aIujKzHFKxjWIIdH
         v2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715833; x=1764320633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcWFlcuSs7Y0eO4oq2DsaroJj7DisvwmuRZnugA2UKI=;
        b=QWUoS8fGXs4ZEZoaJ3zmPUkD/qlwv0dnxKdigyEBCOvAq+Nle4x6Qd0fUEK/XbaQRV
         jtD0OvrskRltkq+hBgOwAOK3iCGULjZAMaex3tHGGrPEDlMBUnQAyt0u+zWcpzhh45XV
         p4hSn0mhiNP/DypaQXTX3mVemxq6POXob4Ix+qffcbAC6G9gADqMpKl7mY/Kjsi1Kg5T
         qEt0q4p6hray18RVA6gRgA7dggIic7qEdrtEsin4i99u1tatjsYJbXa0S23gkevBzF1i
         Ub+o+vwlzGsxhTubKnIEj8eCCCMu8EvZivyS9e4y3qPmwWkYrn46ZfkKujp0xMWoLden
         +tuw==
X-Forwarded-Encrypted: i=1; AJvYcCWkf8TjQgFWSuktDb1lHVopMAr/ZitqmMV3OdkDJQOW/88Y170YH0qRSHtMlIQa0IsPq6NILb6Q6rLmZD8F@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWC2NrpDd3Os0pyAZ68LNLXkwKDeJ6HY9Gj3hlq5yjgAdhevR
	VjUBt7FswBaZXIO9QOuG1c2l1QiSJq7L0p03ntJ/cyshUoYZsshyXiw4/mkpekZjIh0lq+IyzQP
	sDZYidrkm7XZZP1WgFWA9VIYwwrgku6QPTmcyc5zPvw==
X-Gm-Gg: ASbGnctuJS4Hb3xauiyzCDLHDctNk7xxSN3+TNTYmN71L2bivgSPQMrzrUK44WHTp5T
	x8A9zfR3IZ3UE7ifAfD00uLIlOjMD8svbl5BKBoP5eMaAS5/olQfHLYpCug1cVXjtVM7RErxlrT
	hG252wOES0ubMImXabiuI+3ozLPiE+8/BfDTEvo2Pz40cKm2GuNrCvvfUUayzJIMLTGH+UDsNIh
	6MzTR00xtJFghHfcBt/g8HZqbp5pt6c3kmnOasyEJOgj4Ya/s4Mt5FQOZfm6nuZ60ilQtd9lmxa
	Fr3GYa8roZO41jVOul1ZHgH5a0k=
X-Google-Smtp-Source: AGHT+IG0xMLdX41Lvo7vBm08ZV8ZEpQ5JhaXD6X3/W4zoN34NhHz8H25fTpuCQYyNb+ut5xnYF/JFxp9/xuV++nbU+8=
X-Received: by 2002:a05:6512:e8c:b0:594:2f72:2f7b with SMTP id
 2adb3069b0e04-596a3e9fd96mr603564e87.6.1763715833160; Fri, 21 Nov 2025
 01:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
In-Reply-To: <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Nov 2025 10:03:40 +0100
X-Gm-Features: AWmQ_bkRtfIm-ZUN8rNvHIz8drG7ooSNLpBN4-3cE0G66VIlgSyBd_sHX8YgQAA
Message-ID: <CAMRc=McHCG8N0zeVUUvYF+rHqBrBKe52o+pf+Hjp5dnG3+NmjA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Val Packett <val@packett.cool>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 1:28=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> Hi,
>
> On 11/12/25 10:55 AM, Bartosz Golaszewski wrote:
> > ---
> > Bartosz Golaszewski (10):
> >        string: provide strends()
> >        gpiolib: define GPIOD_FLAG_SHARED
> >        gpiolib: implement low-level, shared GPIO support
> >        gpio: shared-proxy: implement the shared GPIO proxy driver
> >        gpiolib: support shared GPIOs in core subsystem code
> >        gpio: provide gpiod_is_shared()
> >        arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
> >        ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO =
lookup
> >        ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO =
lookup
> >        regulator: make the subsystem aware of shared GPIOs
>
> this seems to actually have caused a regression for me, audio does not
> initialize anymore on hamoa due to EBUSY since upgrading
> from next-20251114 to next-20251118 or next-20251120:
>

Thanks for the heads-up.

> [   11.748781] platform
> 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 3=
0
> [   11.785864] wsa_macro 6aa0000.codec: using zero-initialized flat
> cache, this may cause unexpected behavior
> [   11.796964] reset-gpio reset-gpio.0: error -EBUSY: Could not get
> reset gpios
> [   11.796984] reset-gpio reset-gpio.0: probe with driver reset-gpio
> failed with error -16
> [   11.894662] reset-gpio reset-gpio.1: error -EBUSY: Could not get
> reset gpios
> [   11.894676] reset-gpio reset-gpio.1: probe with driver reset-gpio
> failed with error -16

It seems like it's the reset-gpio driver, not shared GPIOLIB path?
This driver has never used the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag.

> [   12.006938] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   12.006964] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   15.424657] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0x4e00c00f, flushing fifo
> [   21.994354] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0xe00c000, flushing fifo
> [   21.996001] qcom-soundwire 6b10000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0x4e00c00f, flushing fifo
> [   21.996239] platform sound: deferred probe pending: snd-x1e80100: WSA
> Playback: codec dai not found
> [   21.996248] soundwire sdw:4:0:0217:0204:00:0: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996250] soundwire sdw:4:0:0217:0204:00:1: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996251] soundwire sdw:1:0:0217:0204:00:0: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996253] soundwire sdw:1:0:0217:0204:00:1: deferred probe pending:
> wsa884x-codec: Failed to get reset
>
> gpio_shared_proxy, reset_gpio, pinctrl_sm8550_lpass_lpi are all built as
> modules and were autoloaded fine.
>
> This is wsa884x (not wsa881x nor wsa883x), failing in
> devm_reset_control_get_optional_shared..
>

Can you enable DEBUG_GPIO in menuconfig and post the entire kernel log
somewhere as well as the output of gpiodetect and gpioinfo after
booting?

Bartosz

