Return-Path: <linux-arm-msm+bounces-76203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 583E9BC15D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 14:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6737418940B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 12:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E952DCF43;
	Tue,  7 Oct 2025 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LdleBcLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC084227599
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840157; cv=none; b=eu9E7SG9OGs0xk4fORp3461r0A/EzohIdJssKmZMwPjvqO5JpwI0SakOqh2vXEXh0TJCU/rlBv5nedh/uZdMzoAiIr5UC5tAXOgqoOchrpYRuMcGmR9OBdQtF3s91dW+JePZw14ElKedxcOZBuRGisBrAmWXjLVaQUlhgrfwiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840157; c=relaxed/simple;
	bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDbt3zYIp+92SvBwwfM7ShFavsBS1FJ2WiugFPYKsW53pIvxU/YFz6jWGI4X3mx5ieYKjfHpg1x/GlhB7r2yZYgVXmRHYhqmZe8Jmgyx4E1FkMgBVit3nGnptDHqziYyCmSj/ZbRuvS9DM5zaZWr/SvlSCrVTk0HTzmGkNGMmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LdleBcLE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso7408149e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759840154; x=1760444954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=LdleBcLEXMPxkGZZ4IH7OHM1RCEfGKmTVWJ7BemZ0ohKWk3OZepLgJvzL2xrSFg4iW
         CH9OqqPR5znp1hzBs1NwrthbL8u9+PG0T5BZ3zcpfTsOtAYzDaU7qkEbOC1HKo1NPJ7d
         BuUkAPFGSIqB66oOCyrgods7ODqHz2NvVn2LTnCJU6Y+sdpB740semCvRU3NHwZcPnOM
         J7LqBsetSjjrQJB/xYTgdog+u9uwGlaEy3wS+YasHk3chLzB0brWBFz6xB4bgPMQiu50
         QGjKVnRLaFQIWA2hfnFCQ89dwUAJL41fACPNVmbBoEbTPq9oDn2VIh+wl/x1aGZWmHwk
         GwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840154; x=1760444954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=VRzV7rfk+hhjqrqOwArEkFrHi3QK4UehNqF9HyUEsfz6lZIJ6NVocyWsXu+z2Ka8K/
         EOstECxI1OzZ8tEv38F8jt4zk1idPaxXO6eXcPW6LVPaVGNPz3HM+2Z4iPC3Y8/LDq/m
         PzFOIMZjfih6sIRdpmHttFKj1ogiuqQTcRKC+NC0Uw8ThC3Gadd7I486AfRDugWvX5H7
         HNmWLVqbnys7U0EDrHFuKBvTBJ83H3ybuS0FE0bzA+qPbxGvab507BonoiUtCfUQNOV4
         s6cq2XS5bm+cJx0BVEyqvGXVQodlnZ5I+MDWyqkg2S/Zez6HwCaI+y0yG8tfcuN3//B+
         /cKw==
X-Forwarded-Encrypted: i=1; AJvYcCXmIbwmcYiTUwAWuV/84UI0gW2c6Pl4V2dw+0Nzp7KeCMt1nqjNWIXaOCq7xYJg4HSpGoGQNq4t8nApmOcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBEzAR9OL3Qugcmo00cOVzu15qBl7txBxc6UWu8ngYgfj/bc4
	rQ7Toqc6XEDW+5TA4AauZPPxR/+viAWX15hIL9knoe+Dpe3gXQPjrVU8Cy2/9UyoYB7HsHbyVkI
	g9ALPC1R4IGbh4rVPY4hXxDIySIs99TZGJedH1b9gcg==
X-Gm-Gg: ASbGncvaweKU2EzSuor8nweAMLO0qFdZzIu8lJXB2QvlxsrLHTykdAcHN/w8U/pJOml
	CCAby5dSAJcPkmr5miKaTwz2N81ScjlJEhWYN/ANOxg7/YFBiZ4VKKeC41XupIUk/a2yW+bKNtd
	9Sp7D/gbP+BMVv++ReTAdHarp9u3MI+t95S2RX8ZvDlGoPVjVZbFLQtpid44RVf6CsKN/yONvt6
	xcr/F+FmNqoHvgm/lPw3gryEQ6B+Buw54MOevy6W4se1yGAkIVxaivD16PyeNc=
X-Google-Smtp-Source: AGHT+IFvEXq4IGvOkBEwLnkFzMNYQoqXWta+MRuNZ6zy5QIvEZlr/9df2gaJ9h0Z2yhh4+vKPvuKBvTOlCdfwhpYHf8=
X-Received: by 2002:a05:6512:3e2a:b0:55f:6fb4:e084 with SMTP id
 2adb3069b0e04-58cbc776474mr4804386e87.50.1759840153971; Tue, 07 Oct 2025
 05:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com> <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
In-Reply-To: <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 14:29:01 +0200
X-Gm-Features: AS18NWAtiT9xc4AHDK2XxNjFXsHbeG0TTtUUuLHamMaXYLyXs_iBH5F444RGyw8
Message-ID: <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Tue, Oct 7, 2025 at 12:09=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> > >
> > > Not always... For something like shared reset line, consumers request=
 the line
> > > as GPIO and expect gpiolib to do resource manangement.
> > >
> >
> > They could use the reset API and it would implicitly create a virtual
> > device that requests the reset GPIO and controls its enable count.
> > Except that some devices also do a specific reset sequence with delays
> > etc. That would require some additional logic in reset-gpio.
> >
>
> I was referring to the PCIe PERST# line, for which the 'reset-gpios' prop=
erty
> already exist in the schema. Now, you want me to model this simple GPIO a=
s a
> fake reset controller and use it the PCIe Bridge nodes through 'resets'
> property?
>

No, not at all. It's just that a shared `reset-gpios` property is
pretty common and Krzysztof implemented the reset-gpio driver[1] to
address it. Drivers that request a reset control via the OF interface
will notice that there's no `resets` property but if there's a
`reset-gpios`, the reset core will create a virtual device binding to
the reset-gpio driver which requests the GPIO in question (once!) and
registers with the reset subsystem providing shared reset control to
users. Basically the abstraction Srini mentioned minus any reset
sequence.

That only happens if the driver uses the reset API. If you go with the
GPIOLIB then none of this matters. I definitely don't want to change
the existing DT sources either but I want to find out if the code in
this series is suitable (with some modifications) for supporting the
PERST# line or if the logic behind it is more complex and possibly
requires separate, more fine-grained handling.

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/reset/reset-gpio.c

