Return-Path: <linux-arm-msm+bounces-82444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 195AAC6D78B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id B99B828F3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732B923C512;
	Wed, 19 Nov 2025 08:40:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41D2F3C07
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541638; cv=none; b=PLM/XTL1w6rGIhCSYGMXSjLZpm3SbEiox8NFXIKpvl4X7ntYg+K/Gf4M5d2fF8u3YZyW5U+x+Os4g2KU1kb4iuueYM3ihnos5tD52agnNre4qFWex6t7EzK1CqM1f58iAVoTM9VhRHJ+vscnNvgDwQxlxY1519qTtJf+7FAknxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541638; c=relaxed/simple;
	bh=Dz2RNjo2Pw0XOcm+SGn1fEPdASUKESrZTRijPS7lbP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxzkpTb9kasuox7OTQuKyjupEL5IMg7NkPk4WMgRy0ir+FP6zTbUfMSJhK910QAhlXegKS7v5Qg05XILHpy2ZN61GhEDCX+d5eAStstr5R1+HGHhxBRCbxWFquCinjR501i5NrePM4WSwukrrkmqpW8FopQJYbPQgItyYFcqhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9371aca0a4dso3681723241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541635; x=1764146435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=;
        b=mOutGjQaFq0SufB96gWCCCKUCpBC8u8+N7M4Risl7u18ooJkBPwZ89OYbJN3CcSnQh
         /RhIpTcn4SopuKAR8C0Y4L00KQmICBkayTHiHhv1KFLI++dZDYBY5AkuW2grLR/wrT1Z
         8Lg3UXRrTHh6CyBc4d7Tu3j07tMvwVfhIrxqeGBOuSVHg2ZiUBJOTM7UcHoEdFWo/8qw
         irtTn+rVO//UKn3LVXc4AushnrX3Ns136NQ4937MLZbGzzV6vmLoIkYOlmLqZNnB7EYD
         AQYx8q0NorWVoBcsVUehj9wEKNyLkX9BECdizjnWhq68e6zxsyl+5y9hgFYgB5xJtQDY
         fqMg==
X-Forwarded-Encrypted: i=1; AJvYcCVSd6wHOtVEFPG+zAcb3SIVNX3bnrUVGtN4Nnrm9Ip1rbcVfIKWJm9EfNP7FEjIq7kV/FvSzhqfoT1PwNhI@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIPeq9GsfFLH9kyahId9lhU6dj0G9HrbLpC5qvEYgh598HnOl
	Ty1C7gEFCVrIhoR1LFgOZxNT69N6o5x3On0jyQSn4zObzaiAnNqgVCrulwAR1wgI
X-Gm-Gg: ASbGnctb3GfGkdfzQkmbF2WtT16MI23+/6pLuyxZAtFqZz4BZ3/3DWsgyqR2NFpqLCA
	LBmIemYuYClEfXjr2VHH28YgLtWQN0I5p+iSwRXX56R97NzUxyp+qZQI8zTd3vRN9Fl7uiyGgBc
	l144uLy6NwO0NMr57uZtcJkVCZaN7J3G27vxxyLWZsMfgI+gPiG/PFDDEzv1m3u6EmQLZCdukHK
	wblJoOyyaJVNaqUADRKNqOy0TRnhUPRN2RbynnpMIgHoyJJ9X6FFH1umOvnPsYuume+olBSzvN/
	fnEGcXxIE7t6wAchmI3T4eH1x+ZENJCKUUzCVcVhIlUK41BDqIFT7EgX4owkmJzAi8UBqzoca0y
	gp+cpIXbN64Z+N5mZ+5UFKn4bG7D72SoBtq282BcqDTgOL3barqKER2CHQE/oN87n9iFsvLPxnx
	QFzXSaR6pgH+Txmv0A0BUZfIiS+5BuZe9GW0fWXWYnPEwbglqtOresgOYxK2A=
X-Google-Smtp-Source: AGHT+IEBJlHVq4NgNQElfgpnPOK8AGqcu+LxDriQunTj92AnoellHB+PAxj3JwmowYtIYemgB6FWVA==
X-Received: by 2002:a05:6102:5810:b0:5d7:bd54:974c with SMTP id ada2fe7eead31-5dfc5b93fe9mr7028132137.26.1763541634705;
        Wed, 19 Nov 2025 00:40:34 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb726d37fsm6447449137.13.2025.11.19.00.40.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:40:34 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-935134ef989so3868475241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:40:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKEVXU2sco+8qO5IgqKyfV3NdQXY3Ply51v2E1jy1tSUd92VYRVlUzq6N0i5PZhc2Oox0mRu1CyE47yeWI@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id
 ada2fe7eead31-5dfc5c0488dmr6881252137.41.1763541207113; Wed, 19 Nov 2025
 00:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
X-Gm-Features: AWmQ_bnsTpUUScnL6xOjY4S7f_b3_VnG_mVkF87eF8BY7eFC84gNc7MAR704Al0
Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi Linus,

On Wed, 19 Nov 2025 at 00:24, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
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

Suitable resistors are present to prevent hardware damage.

> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

But only one of the gpio-keys and gpio-leds drivers can bind to the
GPIO, or am I missing something?
So I do think I need a new combined key-and-led driver, like Bartosz
suggested:
  - When the user turns the LED on, the GPIO is switched to input mode,
    and the switch works,
  - When the user turns the LED off, the GPIO is switched to output
    and driven low, and the switch does not work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

