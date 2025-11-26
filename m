Return-Path: <linux-arm-msm+bounces-83483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801CC8AAC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90685341627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C0133A018;
	Wed, 26 Nov 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ekc7Rb5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CB433A03F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171241; cv=none; b=nB9pbpVAvv1oZmzCp+zNB7sqzIsBoMwJ+dgOHwwc/4GAKQE7X9dMvSxwr1+KdNX8cWFJfHNQhLMGEtOYUJ6mtfQROBLDGnkYyUs4bgN7wa2bAA9v8b+98wh/Ly7x8QABHMUI+aKkFmYo1ZNvgmX6h+q+5j5icbbKNJgGQFim6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171241; c=relaxed/simple;
	bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOzAmU4B9eoiCxOkUOv7L5jmxNw4SjgBiK9ZP0rQBHcimxoSlGSOhUtnXEhlnwkxRMxYmlQ2elL/2dSMiLHRkdWABJd7icw31qjZoVPYv+/KzbzbFJVkqrfs/7N1DOpWgiw44pBuL5AOh1iNVZ9UKyZjeOGQQzVcMZf8WMcDTOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ekc7Rb5Z; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37d056f5703so22702041fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764171237; x=1764776037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=ekc7Rb5ZoFqTdcd8CvsNN//6f6eriL7DrECX0IiUsuK8YcaAvtT/hlYyxGWhDnHEGV
         4waqkwmnQTetpoStQmgmxfz2PY4+LDpNfd2HFPL/zkFlWsFIa4eSXDku1caNf5kUa3lI
         Hc+Ex2cEXgMUCVrupcDM90b3RVDJGa+D6hcCxReTzL7osTYd8fcjq9yyE5qfKvxYF/up
         fVqdA9xKPKo1AFPP/FmRS80LaW9piOWyNXDmEHRLGQTpW7kD87PZJ/6UWp2BL0H2y+y+
         rj+lFOJ/vZ45iVnXIyQzdt5FUYoo7BDFfg8Gycp1WilvRpycRH1DSdXParqa4+oH/9ZE
         RBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171237; x=1764776037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=OyTBr1bfCgmUmY3i30XexBG53tbqxZopbcw0T/GOe3YtOEsLzF1Ruzt8EsRdkpSFxO
         S0UKNCnXeZMs1Pqso2gFs+BHBLnVhFvmulCtN+0YdYGuoYqgJb0eCN6sr40xq/8EhvSN
         Qu2ZHOaBQOWWvLhtstnCuDrr6VYRgyzOLyFQxIVVF9TDAP8ik25Mw8pHi3feVk1R1TUr
         eVzZ/riKYrODln/u2dwSyOFJrtdHSDkPjl6jonHFROq0piFrg8kmswgEgffo88AtE33I
         78ucafuE2O8xtfMPZRwGstPfJSRm9v0d2BOg9VVtfM9FpHTyfY6rG+ugDc535SZc5e9g
         8oaA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2m1XDJgKpKosgpGYvtpx9J/bN2hxpJ1WrOyWJyBqiUUQ/YMCPY6Bx3DRtv5+BQq+3ppOuSBZSsLlJQoH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2wcjZikaEE6oKKwpmF0XBFuym+4LXflUBEiN93taxM9RC5RF
	vjCQK65LAKWGgPHQBU0l01GnByZp3n9OHk8rfXUwIzzXD53bYd3BEkg0xZetPZYDIbQvJpFDx8B
	8FKoDJGMxIV2RkLPm2MAGFP/iHq2blcaP36tHOAkWOg==
X-Gm-Gg: ASbGnctgovqGAx/P3NhbtWavbYyTNkx/4BI1g0uf2jAFxSZZsxh4Ny0ynhfjR0x9DTd
	DKouZX2pTO1ROMVTJtcIPP78SawQUh4F+tCZ1bsOniyWR6wMo8CzwUGdnlnyQfwtjjIU9Sqtl1R
	hZlGEnpdMqOopjBrdmEiMv9wIhEKeTA3fjx9e/RhC8v0aA2wHYQD4HKmxNXPSfUy52JKDT3qXdd
	C/rurTcOviTdNJkxy79DNEl+zdRWXQNlhZD4By4n38RYUBmeANymDMKcCV3skB4qmtjCzMuCKH4
	/u+7T8wORI25VF5PQlq1cvp2610=
X-Google-Smtp-Source: AGHT+IHpiJdAZcmd7ay5hxpzMSKF161dOYZF4eYXQjGHf0aIOIU5+E3pjAtawzgBqB2Cu4BXgwWds+NFi8l3GMK+YEQ=
X-Received: by 2002:a2e:6e0e:0:b0:37a:4714:ff39 with SMTP id
 38308e7fff4ca-37cd923e013mr51455941fa.23.1764171237355; Wed, 26 Nov 2025
 07:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
In-Reply-To: <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:33:45 +0100
X-Gm-Features: AWmQ_bmsAdHo5JAtQV4uhxKNZhn_21Nb7ErF3vgXJlQ_8wKth0d2tGKqeTK5e-w
Message-ID: <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 4:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >>
> >
> > Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> > Kconfig and post the entire kernel log on pastebin?
>
> The kernel log is here: https://pastebin.com/7rBh3T3T

This is not telling me much, can you try again with the printk() I
posted earlier, please?

Bart

