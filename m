Return-Path: <linux-arm-msm+bounces-88113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DB5D04995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17FC3145B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC0F2BB13;
	Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usb4MmHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A112AD32
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887419; cv=none; b=LEsE2D3wkCedvT6B5c77AuFLYulXA0nhXW/VWn2/gz8Zj/7SU2BS2iUgF2RDHlrM4lvFBFNt6h6qv6CB768LgN6Ck9L4mAfGgctF1YnRHNq74gNpRdXXwHC3umU1/eO6+cyZ7UTnMx4fvSNnFKqy2yPlDT99n8qSvcuCj4R+gPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887419; c=relaxed/simple;
	bh=KGaO4EypoOGLhlEAtkWsb6d+AORWtthHeHFesJA4a2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxsX/1NniRwY4i9pxkXE5CdkW0OFUT2igxsp76D4ItDKS+yCKuHfdWyBcNIlK6M7BUQjFAvzR+C1Ln6VoDUHiu3iJdiOqf8DDfrvKeN9nKQLg3b5RBOLnSadxzwPrRjuJAhchj4laKFT7M/JCRxwKxFy9GO5F08bLBG6VPJKZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usb4MmHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E89EC2BCB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887419;
	bh=KGaO4EypoOGLhlEAtkWsb6d+AORWtthHeHFesJA4a2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usb4MmHJvMLPE8uELsbbUngRbBgpdUECKMmpwddwY189gnOVhVBEvsoZsN2ANAdRb
	 t7YJmkUsI9dpY6rq3gm5zN+eWtCpnRWzMnswxbZt/3shCn1wvzBb6oYQm2AxSMd8L2
	 aCjReJjs2BJSzqIfnDjwdIh0H+pIVeALv4Qb2w9gNm6PwbE6R8fAcA/k6cuBuzoyj2
	 NhNfiv4Ogfl7hnnK2f4+nk9nB3DplTx6QoLshFLps02T775YICN3NhywEhdZfnZKkX
	 vbjmlj1v8ZjzZvhG86NGzW0fQaG98pdSVWRSeYI9YPWE3FowX1Y01DeD7yYI2lNiZ5
	 Cbw/z69BwcSyg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b78886454so989935e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJlANHhGlaL5Anwsm94RqBkMB/nzhfuwqP/j9JKtel6LxjGp7N8vx6UJ67ts1pBArlIY6dBAyDy5va5b4G@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCgegEgHCYvXh+e9Ao8UqA2avb82v3a6n35LxfAvFVh08inNF
	gseykJgN/KrxYas54cZjifmrp7fZDcw58cW1Obu20L6tmurXTkQ/j5ICC3fE3kvWpCk71jucVMP
	1Dm3YGqUPYzBeZYHN8DBgbEALnke3H3CYGA3hiFs+lQ==
X-Google-Smtp-Source: AGHT+IG2+2F01A/KIFuHK5i46mt9KUdYZatvNxavAnjoIfZZaIpd0eF4zkN5fLaXr4bY1KSJ4MsEy0n1PYP8LkHGkdo=
X-Received: by 2002:a05:6512:6d0:b0:598:f031:dc2e with SMTP id
 2adb3069b0e04-59b6ef02957mr2037319e87.1.1767887416901; Thu, 08 Jan 2026
 07:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
In-Reply-To: <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 16:50:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
X-Gm-Features: AQt7F2obhuvUlvgUZPHF2Ox96e1T1TX-fbUl1bOPtAWt-u2PKGO9E-yuFxHItZY
Message-ID: <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Michael Walle <mwalle@kernel.org>
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

On Thu, Jan 8, 2026 at 3:46=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> >
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
>
> The problem here is that the aarch64 defconfig has ARCH_QCOM enabled
> and thus it will get enabled for any platforms, right?
>

On arm64 with defconfig, yes. I want to make it transparent for
platforms that don't have shared GPIOs though. I'm aware of issues and
am actively fixing all that are reported to me. Another set of fixes
will be in tomorrow's linux-next.

> I haven't grokked everything, but does GPIO_SHARED=3Dy makes any sense
> without GPIO_SHARED_PROXY? It seems to me that the probing of shared
> pins will be deferred indefinitely.
>

Do you have a use-case where there are shared GPIOs that are needed at
boot time when there are no modules? I am aware of the issue where
false-positive shared GPIOs are detected, I posted a fix for that too.
Without logs, I can't really tell if that's the case for you though.
:(

> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
> >
> > I'm Cc'ing some people that may help with reviewing/be interested in
> > this: OF maintainers (because the main target are OF systems initially)=
,
> > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> > in audio or regulator drivers and one of the goals of this series is
> > dropping the hand-crafted GPIO enable counting via struct
> > regulator_enable_gpio in regulator core), Andy and Mika because I'd lik=
e
> > to also cover ACPI (even though I don't know about any ACPI platform th=
at
> > would need this at the moment, I think it makes sense to make the
> > solution complete), Dmitry (same thing but for software nodes), Mani
> > (because you have a somewhat related use-case for the PERST# signal and
> > I'd like to hear your input on whether this is something you can use or
> > maybe it needs a separate, implicit gpio-perst driver similar to what
> > Krzysztof did for reset-gpios) and Greg (because I mentioned this to yo=
u
> > last week in person and I also use the auxiliary bus for the proxy
> > devices).
>
> This broke my board (using the arm64 defconfig, works without
> GPIO_SHARED of course). I'm seeing two issues here with my board
> (arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):
>
>  (1) It's GPIO controller (gpio-davinci) doesn't support
>      .get_direction so I'm getting ENOTSUPP during probing of the
>      (some?) shared GPIOs.
>

Unless this board really shares GPIOs, it may be due to the
false-positives that will be fixed by this patch[1]. If you enable
CONFIG_DEBUG_GPIO and post the kernel log, I'll be able to tell for
sure.

Though thanks for bringing this to my attention as I now see there is
indeed an issue when the proxied chip doesn't support .get_direction()
as well as a duplicated check in GPIO core. I'll fix it too.

>  (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
>      pins for the root filesystem medium, i.e. the SD card regulators.
>

I'll take care of this is you confirm, the issue persists even with patch[1=
].

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5d=
bf8d1b2f7d@oss.qualcomm.com/

