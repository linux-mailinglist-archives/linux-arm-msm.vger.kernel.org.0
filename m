Return-Path: <linux-arm-msm+bounces-82304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14919C69844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 7E14D28D09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2AC22576E;
	Tue, 18 Nov 2025 13:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D030277D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470922; cv=none; b=qcaGkDJV5dLeypLZ3f9jLcqL/WZsagehXuGW0typiaD18d140d6mujq3wzcidxHrAdM0XIA0nn5tHHB41QvkBtIG0/s0THnWy9MYIPtVKuHOrmTdmA+fdzvTeLfnBc8jj8qIJiChSKap2zmcaGDTeHOgkEwXGXAm7STOFrk1tPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470922; c=relaxed/simple;
	bh=/zVQ3caVQJG3gQBJgK50MyXyKcMooS7fUfIbjJLVF6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbvVM2JmUv/D8G+5qDxeVvwKvKRntlkTSTDJ69IpGPAhGyuReJJx18u49ode2gDa9ttErjLIdYexysCLDdx2aSRHZ3CKBn1vGR/MeuwL2/ibITRCgAdEdg2+LoDKDOOKLlnRHnu1WMD5ZnLFpEEsXx8AbPBJIrux0i0KXZfs8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-880576ebe38so57373676d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470920; x=1764075720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=;
        b=ThSvjyiIp9aF85pkK+F8gsmj7LVgaxe71d0NDx99SPAOyW8BeaVu8Q0mDqsik8ACQi
         gPhqhgHo8oPhz2yIcDn9uQD4bo74p7GYAYh7wkm55eR1U4Q5OMG2M54srPWjdEFgpPEC
         59+aaXco+KUpL8qk7sLDhmqKqj99YLXiD8aUKtClSUBNzgnoUgn+P49l2DM9bGkUpEGI
         bDBfn+FMR3Gjrrpqd83o2oHYWI88hFMjCg9/9LdhdjWRiqN4eXeaZrD8LQf9pbmZdn4u
         XUAWgQ78UW1eB56Jrp/hLHAxTo//quQo+oahGYhos11kVhL5+ZvV8zZbytKObfLih8/B
         3gFg==
X-Forwarded-Encrypted: i=1; AJvYcCXF6HV9c6A4ywaxr/iZ5l6c+HroEXEczSSQBOYQbKAtppmrMThuPwJVKxhlRdvM4gKCm6gvdaZDgeGTZ3bB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4WxvLiDLG2cyqu5D9tCPpr5d0D0xLr3QHFsdT9TQ3U4Qjh81
	GAvbVPiG08smWj8E/o0KPYNhA1YFRARH8a7egfzUkoeyvswMMRgrfgQIDPkWc19C
X-Gm-Gg: ASbGncv7IT0wh8G1G+abdYsJv2+afBULEmvHqtbM2XchLbqw81RX6f7fykHJP56kapn
	8ro67/jsO7mBnHzymKbrTOmzn0ctDl49aYN0UuFZHUWOY1WrSXJS3DCeSb10GIrUSgR5D6lX7KE
	eQaCPEOKo4N9YTW2sQQl4e4pXOeVSJJ1xMKTBWWTYsI14+teHMwN52CDILs2tL14Nc58Sr4HiL1
	M/IojXCQruuqT93owi6LCDm7z3TSDsoc4VxzBDQ4v/9vuY/riA/lVGUASI8QISogooKkONm6L1R
	3nIAqCVijvtT9hUWUddFicFqV6rQBKJrVIPRFH4z0oYPmBN6AyYnSiar/QoWwTCOUmszx16bmiO
	lZMq5k5GSklLon0kmJAjmJEXZooci+nW77GpIckVKaGHiyuOTtu5KBqq0gRSkr9jOFjKne1h/Jt
	00OJprpiT68HmIVbWSX5cTyb+X07mLhpS2IgqqDiA1XKFiLeUlkGQv
X-Google-Smtp-Source: AGHT+IEA2iMZszuEv+MSEI5cl8IfXb6IclgsCC1mrtbhshnuyrerRXImR6GJGNUhX0n0FFnP8qC69g==
X-Received: by 2002:a05:6214:d67:b0:880:3293:ce75 with SMTP id 6a1803df08f44-8829258f204mr226449276d6.5.1763470917569;
        Tue, 18 Nov 2025 05:01:57 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882863138c0sm113180806d6.16.2025.11.18.05.01.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:01:57 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b21fc25ae1so545663485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoLw0mSHZfS+s5iKO6qNimGRsbt/JbXUowqmBGbgvuiUPe7kVHeN6sDaGPgu7OHOjmkl17ZFhReENhevpu@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:5db:e0fe:985c with SMTP id
 ada2fe7eead31-5dfc54fcc32mr4842088137.10.1763470566608; Tue, 18 Nov 2025
 04:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 13:55:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
X-Gm-Features: AWmQ_bkC98gq3Hx-nk9zI-w6kSG9BC0TZLZ6VioIzu7f0ulaeAjNY59_KJ5q6hs
Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 18 Nov 2025 at 12:55, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with wha=
t
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime depend=
ency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it in=
to
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > >
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which singl=
e
> > > pin is shared by multiple devices which don't communicate so need som=
e
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just h=
and
> > > the same GPIO descriptor to all interested users.
> > >
> > > The proposed solution is composed of three major parts: the high-leve=
l,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level share=
d
> > > GPIOLIB module that scans firmware nodes and creates auxiliary device=
s
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > >
> > > The changes are implemented in a way that allows to seamlessly compil=
e
> > > out any code related to sharing GPIOs for systems that don't need it.
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > Thanks for your series, part of which is now present linux-next.
> > IIUIC, this requires the direction of the GPIO to be fixed?
> >
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
> > If you have any idea how to handle this, feel free to reply ;-)
>
> How is this done currently? Even without this series and using the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> direction so it's not possible for two drivers to request it as input
> and output simultaneously. The second requester will override the
> previous settings.

We do not handle it yet:
  - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
    the keys (key-[a-c]),
  - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
    (key-1), and the others as LEDs (led[56]).

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

