Return-Path: <linux-arm-msm+bounces-82432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9651C6D4A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 693092D179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC75E32B994;
	Wed, 19 Nov 2025 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygix6mE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1847329C48
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539306; cv=none; b=AwxsnIM2SASjCUASw8o4wjVt4+/W8aXoXfSRr2zWHYSzfboQjI7l2sV1tL86loUhMaoWiplhNGhV1AoZ2KUv792jiQ1mYD40QDjNHM94x5RTnov1aCoNYTVLF27gXv6u+Z+2csc6UFH9zQeDu66ypxTTd5Fs7mfly3DZ6RzoTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539306; c=relaxed/simple;
	bh=z5K1y6faf5b2+1zAlrcaMcsQVzqujnONb2bvp8XlHlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFM1xnXRN+cvaT1m5QNL4cyt7qqmDumPKBF5Db8gbM2v4fL7nv/eaFvbtGg+TOpgbnGLeRa81w9M+9xlxzexbD1db3YwBj1OOEnccqAa0BcTbkn8IBNOOkme7ApaxOHSmkSoUI8iNlif5dMmYTskalSm03Rr+pmt0t1MT+d7aLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygix6mE0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73545723ebso1156429366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539303; x=1764144103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=Ygix6mE0t+lL9vVChi+j0aakCDJHrlG0vtP0LfLCxiMDI8cka2ystTXErlWmqFuvex
         DdjALhxDQYW0o3zjsP08QJB9W5LmaLPBvVcO2LNFGGv08vhND9Q6BnYME/rJPuU4RKUd
         2lp7IEyS1eo/yac4OYzpo9GTJ/h4k9MlCtWKFYDeCnRrz49R19dSV7+pTmOTXlToGDGm
         h2TxPOgdWfY8P4/f7QEJQTjVjmnF25azg2feGV3qcseMfOZdOjYwlgnTe5RiVsGnwj3L
         jL87/gTDwaKuGalT1Abb55cDuGn5pns1OKf3jK6orxZ80g6o0uQvrfEZzLh/+eYCvu0F
         fZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539303; x=1764144103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=L+6hHZV5zklm5gxx34jdRRQle3JWcHsxywAcV1gCM5RfCYaWAs0u3JkCE4MX9ItlE/
         n0V13qfF2Cft0pCGR2JTAbXcbWbDiiqds3HMyf5GSA8Wsr7oqWqmwqlhcbvupf5M5/g4
         wjdDAASyK8kR72Q2sq+p186LU1RKY9mOLWCUFSMeFRBt7aGzU+grq45ikXR7/m+BGO/o
         NSJO9zYsuSG3lEyb8fm5WHT/IOSlkmIM+ChdTZI5syR1dM85046CPf80VCHbF8qgMANh
         9dXq7/5vRkiMdKpQJgjY/aEV5LmOzOTmltdbzM6Y1TaRUYWHKHw2FoIFIo/FA4qGyWrj
         qwwA==
X-Forwarded-Encrypted: i=1; AJvYcCUcg2uaNeV8tarUR5DmrkCVhAEVv5NC9QnWxa1uqe4TinU9ZCafvyNPrVw+2r5+zKFKiQHUaOxKE6mKJLT8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1NDdCmtx0IAwA0DxIoaahJTP62nMgdDjQGB20NamMgzTp9QGE
	bIcpXFf2aBROzpYecAG6+hm1Ek9LbNN89PrO4mGz4amnDwZaAPD0E5Xm0Sj18TFr5xEsVzF0c1f
	jizcCNvkY4NReFHbsFVJ6+uxLj3io+ac=
X-Gm-Gg: ASbGnctryYaCwH2F3B8L+OR22NjqqHtx8mOimTvV18HiUVwuvJ1fOfvaLXE4lmuwrua
	g6dOj0wdBBqG+Q2TXffnv6uOKSSRPWJFttBXgV9rlIVOd57dUhiO3qzmzYY8kFFhQe5386myNY1
	VDf1wza/tSKM+uysmCHC9F4nwGZOd8YitpvGlP+zDRnPYjAivVd1xy4GpRNsyJbnYMm2bzWM0+j
	ceN5i3KrRTsb+t3V9kzRzM2aQnPyZsOalD6+LJGRysE0cY7DR1D5BJtgV8mm/jV89GUu7nu1oww
	NBV1JMBQDRHXlhsD0SqhwPWUwRRqON/lZpGOu/OjS1Oiidi+rSvXBMUrakr5hwyQBkZFBLohntP
	oUBJhrNEOFhmgcQ6H9A==
X-Google-Smtp-Source: AGHT+IH9RLmrudJYiFQxGBpWdalp0RNvdPE1jKRqx1L9zjBC+zs6TZNN0Aq/tWyMeDQCJfcJOrE+KpnLw+AjClRbY58=
X-Received: by 2002:a17:907:d09:b0:b73:4816:7494 with SMTP id
 a640c23a62f3a-b7367868812mr1750251666b.8.1763539302927; Wed, 19 Nov 2025
 00:01:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 10:01:06 +0200
X-Gm-Features: AWmQ_bnZWE45z8dq-W-vFJmONbGs-165GBHB7vG7G8yZKHS0TzpNGV8dz1PBcfU
Message-ID: <CAHp75Vd56XYo6PgoJWeUcH328uD2svUCBX7SWT_WUZEH2AvoDw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
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
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 1:24=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:

...

> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
>
> Fantastic solution to a lack of GPIO lines.

I feel a poster "SARCASM" behind this line :-)
That's what happened when old-school (in a bad term) HW engineers who
try to enforce their experience on the modern SoC-based platforms that
run GP OSes in multi-tasking, multi-user manner.

> This reminds me of the Amiga 500 power LED which was connected
> to a GPIO which was cleverly also reused to control the audio filter,
> with the effect that when you turned off the audio filter the power LED
> went out and music toggling the filter off/on for effects would also
> give you an incidental stroboscope.
>
> > If you have any idea how to handle this, feel free to reply ;-)
>
> Isn't it pretty clear from the system-level DTS how the line
> is used?
>
> If it is connected to a gpio key it gets assigned for that usecase
> and handled by that driver and if it is connected to a gpio LED
> it is handled by that driver.
>
> For the input usecase the status of the LED is a byproduct and
> should not reflect in software I think. It surely should not be
> controllable and possible to set into output mode because
> that sounds like a recipe for HW damage if you drive it
> actively high and press the key at the same time.
>
> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

This is my understanding as well.

--=20
With Best Regards,
Andy Shevchenko

