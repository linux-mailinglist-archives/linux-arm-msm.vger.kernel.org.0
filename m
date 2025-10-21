Return-Path: <linux-arm-msm+bounces-78161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A200BF6596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 825FD3540BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF2B32E6B7;
	Tue, 21 Oct 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kodxfLPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88C2F656A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048408; cv=none; b=ppOTKeLb5Y1zCj2lSmuz1rwb/UMoevAGqA96mOmMrOSkdX1S0R8XaaIwLVgW45eg5L897GKqWtvBgm0OHLw0DQLlpNdKKP1lp9PAlBuFediKAQOy7xu7j8nhzYh8qr9czZESWDdm9dvb3F5NGE5CGWzUKk1AiT18cleIFfT2C48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048408; c=relaxed/simple;
	bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCuqPCVBqTsJoPHCM55RXh0PceQPLbxUaLWJfI8NvYirkkf7B5MAfKCEar/PSV6BWvYsPGEoXs1Uv533JK5TxmpD59o31IWCxXA1lDXLACToQXrqgEj9Bc86zzbK5UrYiXoV5PafMliRqaaBJiqZ1OcYprKuk4tMZFy4ckvPTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kodxfLPW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso6458747e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761048404; x=1761653204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=;
        b=kodxfLPWCvn60ANlu6wEwYBuLNqOWU0vRD7zbL/zG8/twxJs7dvVJ6ya2nco6xkNdB
         Yp0Wk5pxuH4HoaZLJFFsqYimZho7fgeEOuLTxv4/Mhb416Rgvw8eGlk4xZuqJgMHLHnC
         84+MbTK/xxpGLglEcEzCtb4dy1c8NN5v2QcSup8kzsvAUlBYQfbZCv/YzpVZ93u2gsTr
         uPYsRkFNuJisnxCZQzsr6HmzQpZ3AmIpQXUm7f4NanIlWdmyHfF1jE59xCeNtTXmaCc+
         luPm/hk1Uoo4dEi1TLysEavhwo7u6gMSTdoRaesRGQe71kHoEc9e+J4Uv/r1jl8aaoY8
         5M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761048404; x=1761653204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=;
        b=KFofGBHx9G5gRMmyAiSqk//8/7CV8VfQJgV798IIkj8bkcNihBkGij5Se0qgeT0VAI
         ZEjL9aCG81Uqj28PckeoqUdPD6r3H6vUXTaAOFipcuClrKjpRnFYqorUC5aR7l9zLEBr
         2rOBSo/t4TvhTogxDSW3fOUE1f1hYL9ldC9bAGaBBiEBmeOr8nBYUi6q4XtpNVJ+Vaw3
         wQoilTku0ZHvN2HLIeLTZxPwkp8lF55Pxx2PbJP5wTN/efumJl1vIo5rx36Z7ZhOeJ9z
         bH5fhdyyc5Mqb/WvffB2nvOL4K2qX4DcBm3OakX2W2gGJW5Ltb0ZtLliXvjwa1SFLSns
         ExLw==
X-Forwarded-Encrypted: i=1; AJvYcCXSQicVdfDoNeBrpw8X+AiJk4p+mLf9NmMiz0hnfiZae4j44tkZ16rsODdVAk9m83JivLjyIRRdNXCQTftE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TyM9X+9BXD2pSweHie9o8rmd9mtlnOE+vN335eHiU34125Z8
	1i+B2H2CazH6ET6q9MFs99ZvLTP0CwihgGFA66cBdVSRd0Fp9n4rW2XPePmu9Y9zaV/G5nuMAF9
	JWW+mY0nMNyHWjdLZ2abPWD82EwmNXN7PX/94sCS9ug==
X-Gm-Gg: ASbGnctwcRMYCDRJb6HRy2FiAI7auQi9lXVG+YZ4pQdV74M7TkdLRE1FNLLZ8WtkCUa
	KVbrgrSx5bR4TORTBHfpv+jHfb3H0ZIj44Q13GvAFfELJ5+2VDd42OsD2mJbt7u9Ka+NzS1v+Qm
	om6KnZhJ77yr8NhOBh3FKXZqltnZ6QMSPjVbYym6im4rG1wXE6QCSKAPZD5JAVK7gkwlzZpiUXw
	w6SOMLRp8+k4fyWvDjzC8xntldJACCvSEqogJxbYe5yYyC0S9i4/p+C7mxj214oWIKULuXyDpfh
	3J0AJEEv0u/YJHoE
X-Google-Smtp-Source: AGHT+IEeA2p1C9mduUxezytlThTWwIAafPtXXWLk0U+AE68AlD8B/b+fLCobL77uAw7zXcaVlFRH47WXQcM6fRGa51M=
X-Received: by 2002:a05:6512:130c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-591d85516cdmr5498056e87.43.1761048404206; Tue, 21 Oct 2025
 05:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com> <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
In-Reply-To: <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:06:30 +0200
X-Gm-Features: AS18NWCS0bDo5asDO54GB6xpnkDJCZdNkOPsf7p5f8WdpHmgmskO8LgWJsfISW8
Message-ID: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
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

On Tue, Oct 21, 2025 at 3:53=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
> >
> > That only happens if the driver uses the reset API. If you go with the
> > GPIOLIB then none of this matters. I definitely don't want to change
> > the existing DT sources either but I want to find out if the code in
> > this series is suitable (with some modifications) for supporting the
> > PERST# line or if the logic behind it is more complex and possibly
> > requires separate, more fine-grained handling.
> >
>
> All PCI controllers relied on '{reset/perst}-gpios' property for handling=
 the
> PERST# signal. Now if we change it to a reset line, then the drivers have=
 to
> first detect it as a reset line and use the reset APIs, if not fallback t=
o gpiod
> APIs (for DT backwards compatibility), which will add unncessary churn IM=
O.
>

Ok so some platforms define perst-gpios while others use reset-gpios,
I see now. Yeah, it's better to go with explicit GPIOs then.

> But if there is no way the GPIO subsystem is going to support shared GPIO=
s, then
> we have to live with it.
>

Well, there is going to be. We already de-facto have it but it doesn't
work very well and is fragile (I'm talking about the non-exclusive
flag). I very much intend to bring this upstream.

My question wrt PCI PERST# was whether this is useful for it because
IIRC all endpoints sharing the signal will assert it (or rather their
pwrctl drivers will) and then only deassert it once all endpoints are
powered up. This would translate to the pwrctl driver doing the
following for each endpoint:

perst =3D gpiod_get(dev, "perst");
gpiod_set_value_cansleep(perst, 1);

Do the power up.

gpiod_set_value_cansleep(perst, 0);

And with the implementation this series proposes it would mean that
the perst signal will go high after the first endpoint pwrctl driver
sets it to high and only go down once the last driver sets it to low.
The only thing I'm not sure about is the synchronization between the
endpoints - how do we wait for all of them to be powered-up before
calling the last gpiod_set_value()?

Bartosz

