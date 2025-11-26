Return-Path: <linux-arm-msm+bounces-83487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CCAC8ABDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC0E3A494E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBED733A6E5;
	Wed, 26 Nov 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PEhmnWRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029E13054EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172089; cv=none; b=MhEPc4LZe5RxFk8V9lcNKHxfS5U8gTupo6Y5y/PkO6/ZJpgTg+lWlMiPVW6UwXraBVIG+YJHGeZrBNddc9/8tGkPUb3ojdyAyTmjnuwYT98bMHFsJO/RhalPLsJpi5pwFp4eO2FzVxfsed4J2LGAsjg4cKtN/n2Ts3k6h91JsT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172089; c=relaxed/simple;
	bh=S8LmYUH9KEaLTuJ7OFfoJvQ2MvHXl9U2/WgqG1bny/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjKoTK64w4zHc0BqBlqte1QrVLAbGadkm/H/Xoy02nIiHNb+TzC8/AQ+TxAG6fir3BGwopjWG64h7JZUWE29BT4URdQzsd5D/ePVc9DwonMDVQC5xVBsV/pjZzLm+LoCGobU3LA9F9SiRV9ULnL3S7RutOWNl76yzppIlb0fyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PEhmnWRO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a34702a20so56510431fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764172086; x=1764776886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=PEhmnWROe/ZKxaaEu3ZS342A7CTYpt5wk8eBtVxZtVDgNsFqeCLlDRD/EhT4eJQnhN
         tvtbJ1pmmK0amjF67PFKanVkAHKcqbZOBoy2j/tc3sJISGsK6wW4nTqbYL5ye2ZM4/MB
         i+vTot0lX+9AclQNQS74zk9hG4tV5X4Zy3MJRjwLcM0nAajoIfSP8GeLVupcxu3Wu+Ne
         Cd78IBbDubDFM5CbVJzkbuMAlu4pIBQLYT6Hzp1LEVOHJUptjRWdXRhSRsTvIFKldsbm
         WMs9vxd9NGTDZHo5NuSR4gNZAC8lUuxtDzckT15lpWeeimr1CbYglA7gVllI2UkcaCPg
         dnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172086; x=1764776886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=mlL2MzOqfii0L0gwvxN8m8g/O/YPQ1i5N96kD4ybdtZiyWgBGeni2zEmOSmKQmdCM0
         kODSQAZdXDXmXp3ghZKmOWtAVx7W0NQmVKbDxTycTgBW8AbqQzd785qJT0QwteonQryO
         UhA6y77URy3OOtc1m/oB6pg81F/z+7YUJ9nJclC+LZFjs5VadD5zZqI26b0mcqjqiiwv
         LjqvgQFhC59UekolgU9Bzw68OJFyxlzVX9RaiRIKFlDbHY2tYCicZgmlV03kLn0v6luX
         Kd0wE7I0NT/J0W5KAfhVgOBZ2dutjwLikvvJDkcCe0pEhP5Emfz5Sx0LjVB3Gcx6b2Am
         HWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWwEZzvzSnHT27bW9CSq8stXLjj/88Iv74YVd/vbCi4yMnEIq7zNRVguoaUxfiKFP8dHEVu+oxQjjb3fGUV@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7Q3SMkoRpF8LFAlNpOe+VXOjGqgQ7lqU5dLFZpqC1zHdRdvw
	qjZiCoGWl2k7lKCcFm6p7OYAeZPI1eW9eDf6R+rPSs/6azpIdOZOiCCXNKJelus2mHcvKIuJAIM
	Lm71r+bE0ZLJc0+ReKLv21SXWHje9zoEr0obfK3bccw==
X-Gm-Gg: ASbGncvUDMFF68imwEgzjDKQsuFA29gKa7GM3jk/TK1Ay45e/aiO2Gpng8p52Eutj3+
	MZhS9U5QmX+G/mbp0wgKCJ7hs+HB5/NbyDX2z/UWZ6UTIf39AbquNKp4pQoFDoCkgZVJKco5Elg
	i2eb6za3OTI+f1pBYK4sLCbpKuq5KvDKs/IJgmSRtk5e2G6qXh7l0vjf1XlkY+6STAyso5OuyqH
	EUoTq2aK9AaMNPsttARLa4ibcTBTOp71+fZbFaKpfAtU6KjIIqJIz5op7dxMuSgPwfgdbOB1z0G
	xMQX/7E4v6p7v5N/g2TKK/4V+Ps=
X-Google-Smtp-Source: AGHT+IEhUl1jNda9/yp2GCLrKXBikNNwXFAiy8yPxeZdtimGdt9zzATr5ITlVaihFGQ0IjBdRUtALikJOU6Bmen20go=
X-Received: by 2002:a05:6512:10c2:b0:594:51ac:148 with SMTP id
 2adb3069b0e04-596b4e5618fmr2340043e87.15.1764172085977; Wed, 26 Nov 2025
 07:48:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
In-Reply-To: <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:47:54 +0100
X-Gm-Features: AWmQ_bnK-S4TlEVeOIf3ITE7TZsWB2TJ1MXZpLcLB_4C4obVKenyvukRrMrvtB4
Message-ID: <CAMRc=Mexa9eSe+qy9dm_q=+gBKtc-EZ7M0RXsgSe6fhWj1FV4A@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Cosmin Tanislav <demonsingur@gmail.com>
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

On Wed, Nov 26, 2025 at 4:34=E2=80=AFPM Cosmin Tanislav <demonsingur@gmail.=
com> wrote:
>
> > +
> > +             count =3D of_count_phandle_with_args(curr, prop->name,
> > +                                                "#gpio-cells");
>
> This call causes error messages to be printed for gpio-hog entries, like
> this one from arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:
>

Thanks for the report.

Please trim your responses to just the relevant context though, you
included the entire huge patch.

>         sdhi0-emmc-iovs-hog {
>                 gpio-hog;
>                 gpios =3D <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
>                 output-high;
>                 line-name =3D "SD0_IOVS";
>         };
>
> For gpio-hog entries, the first element is not a phandle (gpio-hog is
> already under its parent).
>
> of_count_phandle_with_args() will however try to interpret it as a
> parent either way, causing the following error to be printed.
>
> OF: /soc/pinctrl@802c0000/sdhi0-emmc-iovs-hog: could not get #gpio-cells
> for /soc/ethernet@92010000/mdio/ethernet-phy@2
>
> RZT2H_GPIO(2, 6) expands to 22, or 0x16.
>
> Coincidentally, in the decompiled dts file we have:
>
> ethernet-phy@2 {
>         ...
>         phandle =3D <0x16>;
> };
>

Yes, because behind the scenes, a phandle really is nothing more than
an integer.

> Maybe a check for gpio-hogs should be added?
>
> Something like the following before the call to
> of_count_phandle_with_args().
>
> if (strcmp(prop->name, "gpios") =3D=3D 0 &&
>      of_property_present(curr, "gpio-hog"))
>         continue;
>

Yes, that's a good idea, thanks. Let me cook up a patch.

Bart

