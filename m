Return-Path: <linux-arm-msm+bounces-82403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8EC6BFC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 00:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7F24E2C710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA1930F939;
	Tue, 18 Nov 2025 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV/TgF/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68768277011
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508252; cv=none; b=C+Fw1iEQv0AsRaBVnhuT6f8spUfuztPF1GucvCaZ2dmOeHz1usItAQ6jpxQzsci1kQqI8Bw38KGb36HfBzV0KNgbEkvBVt18wFY3Oqwhz0AIHpPOHAEwGJ0Mrpv1XLIh4HZizsZBHq5CYShSGtr54HwLcG7h4yx4RdB53J4Wfso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508252; c=relaxed/simple;
	bh=W7pcPwr+HQ1DtHd5FgFi1WUcp3JgCAPSk1CS0dBa6sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJJLt+1x8qa26Rcz4LTTm4q0YZZ/1eZbMxBpOyY7W9LFMSRn1L50dBkiClzy1cE6GXdk05/tPn9h+Rpr5A1yqrNZ9pSoTzArRHTYY6YgXpZ2VXKTPfOB6wjfU4Iwwsi/CEVHTmYJFmJ29fa7UyHw+e1mMvKp+mckRI3A/ywmJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV/TgF/u; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787c9f90eccso65749357b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763508248; x=1764113048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=BV/TgF/uOgrXpqAY/wX0NC3SXEKfyzVDENCie11YOlfGTFq94ENVFtFH6ktjbDcAD8
         /2QUwTQwgxSDz9JButnQJTHb3qDC8tZEWckmkyTxAkhd0EELB86aPabtMfqbDsiEXZJg
         xoXG3UXcAna2m+XHfIiQuCetEfC4gd2Zah1n0GKOTEAoI+fwDBWegkDNvzujS51fCwv8
         cDd5lTJci1tNUE8wu/El5qnP1TQZ57eIgzTgAhqNO7Qg0nJS3s1aXTXvR2JFoFY8+RAE
         7j32/EXyJpNDLicpjmE6TBM+R0PkZavjK7VHnZ1zML+UvPPNWR93W4oTdmJEcismlG3S
         yf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508248; x=1764113048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=duL5RzBfX5M8CD7YANu09HWq745RBHlO0La7476PLHO09ur8I6U7ihUNTJyE1k78wd
         TrMUTUjUDivo0ggeSBnHsXQqmtNZpkxs1y0T/DUn6Nd4ajzmqJqHDktwKI18zyhyWida
         HnMBQcd5po4Mq11vuXYT0ET+m+Z2xtD+rQllHNbl2/IFtyvpAjucFjSAP/zHj2GPyEnL
         dVu6r7PpIs4fQV+s/pvktzcxPpp3dAScqsVL5T/QrW6mAh+OaLhnfFbiI6+mLIpaQ1AW
         QkhyGD0wmgEhfSuEAJ0HBzvwewQM7+vnyqFGpU9a/wnmeqKcu9lNNP+P6ImKyqP2mraJ
         Sw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhzs5sEvKA6PRxAHSQ4me1DCf4iSVhgCE5nX7ybfSPjgysnaKlXHOSKan2e5YCEQ9ZOvT3+ax0nkmKgfnx@vger.kernel.org
X-Gm-Message-State: AOJu0YyN04KAaARsGZ3jl83ABtGiKzlyMNTe2Y+mwS3+HvKE1gnxH/So
	czdRJw3OiTXAMUmQ9Lt10W0NKB6lTbUONUfrcTRNhfIBJq12zDyHj+PbePudR8D9r6CqbdCqtbV
	WBu3XRhCUwWBy9Sz/6lPjJ0rHN6yoZ7A7YhE3O5JvMQ==
X-Gm-Gg: ASbGncvaEE6rqIWmxcrdZWVCXDk+Dp/CTynfvzzpmDvVCc+WdFk2mL2gcwqFrRXS/rW
	2wn9ViG9+U1kcxnZcfuW3oELwCdeI7GvUZ9OCikoT/Ix11e/HjNTfG8/Y2Bu/UKz8nARHzm4UrV
	ciFHpqKxfAl7kEQf8vvra8PsNiAEPYjeJluomY7JCz7XuML0yYetg/k/0Q7Kgy5wQZeG676aEeP
	zcvU2H9jPKnyoHXWOPhmVdnRJngrlsTFDQp+Ig26VZvNW1uJcnOVinDMi7dijFGdKdZfbF5GI8s
	oubNgA==
X-Google-Smtp-Source: AGHT+IFyBO03TJnQUlzqci/5MJ4HTgz/fgmqOzYPPzLJFMjECkvojkE8ZLq0wzXV0U24gpbvqdWxMWsnSwsdREunK9g=
X-Received: by 2002:a05:690c:6706:b0:787:e9bc:fad4 with SMTP id
 00721157ae682-78929eed6camr148903037b3.46.1763508248199; Tue, 18 Nov 2025
 15:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:23:53 +0100
X-Gm-Features: AWmQ_bk2_VJnze8bWKsmcQjt5Ax-Z34cI2HnH2M84uK1kPWn1ddtleYK9nAAhL4
Message-ID: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> We have a long-standing use-case on various Renesas R-Car Gen3 boards
> (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> key switches.  Basically, the GPIO is connected to:
>   1. A key switch connecting to GND when closed, with pull-up.
>   2. The gate of an N-channel MOSFET, turning on an LED when driven
>      high.
>
> Hence:
>   - In output mode, the LED can be controlled freely,
>   - In input mode, the LED is on, unless the key is pressed,
>   - Hence the switch state can only be read when the LED is turned on.

Fantastic solution to a lack of GPIO lines.

This reminds me of the Amiga 500 power LED which was connected
to a GPIO which was cleverly also reused to control the audio filter,
with the effect that when you turned off the audio filter the power LED
went out and music toggling the filter off/on for effects would also
give you an incidental stroboscope.

> If you have any idea how to handle this, feel free to reply ;-)

Isn't it pretty clear from the system-level DTS how the line
is used?

If it is connected to a gpio key it gets assigned for that usecase
and handled by that driver and if it is connected to a gpio LED
it is handled by that driver.

For the input usecase the status of the LED is a byproduct and
should not reflect in software I think. It surely should not be
controllable and possible to set into output mode because
that sounds like a recipe for HW damage if you drive it
actively high and press the key at the same time.

gpio_keys {
    compatible =3D "gpio-keys";

    button-ok {
        gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
    };
};

Yours,
Linus Walleij

