Return-Path: <linux-arm-msm+bounces-82519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E598C6F599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92D303A74F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F283235F8A8;
	Wed, 19 Nov 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s18TSfPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ACC35E557
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562602; cv=none; b=FH18Wfc9gw84Fz55lBPkDWHyssMYc8ymYj7JpKhHT8dcg7kbpQmO9x4C8HOnbnAXSLDTeS3MwEM/5CGiRr/dbucdkhr0pecmviLtGFjOcNxmatKDgVpoy1gV+PQD3kFUcesEdwDy5n/UHvtjn+12OsnzVeIlzFao5xGwv4gtltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562602; c=relaxed/simple;
	bh=QYkJ+KAJptP8x+/Lo+OPyvZfeeVlUCQUdUVwwHK0tdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuRth/RjEY2Y3bmFsWEHFDaDPi1+6INEjUARdoOp9jpLyX7f6c4ItBYzyl7fj1f8dh06j3sCGEDzr2+6Q0etuWeVrS2Fs2cPPrFnfAngLbyS4sn1hWB4bFC85wMYXTN6zjNxdEHT4wj7CH+kS5mg9fBunxeb1hKNTF86joBDFpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s18TSfPU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957e017378so7692506e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763562595; x=1764167395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=s18TSfPUarVrfVD9Q289QlNx1XEDTfcU8bi5GXrz3W+DSMQoea3Lv3herjQOmTFxWf
         RnCJCTg1nmGcgFlw4R2OxLtmInTDyHf5IZhwpwNhJxOsxEN/gjUh5N96v0rM4nXMsgHj
         3/ZFfkBTBzj/4pRjkvMtZmZIbjctGR8/BGbLbGmewCcwCUrg36LgPbevDP2cNPjovcfk
         eME/KNWlNnmFtlL4BNoV2wwmA8rwPnCeI0jJUXxeHWqN3rrElCznudkbcVbYx8FLHJ6+
         gpqHIvcybbH5PGjn7hX4wZRttrc6/Bpj/4/qlsbYFUAQiDGbBGd2KwHR7vsxt5H1MEVi
         RsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562595; x=1764167395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=YQTlyG1pH33Uy7uDTqUe+tER8sqMe/ErgYOto1ZM3T8h3aTiKDF47YgGNBLUwIEdpo
         Ivze41WzoGnf/XeBIOBaeuCnwzblcFk5etRw1iu5X09NfxT7UfFL6R+/Vae0sfJLzKt3
         5vJk7p2pbAMPTJFCFW8UlCEb1i+JLpXp+K4RBcXKhETwTa6aW1FCiRImD4hD4FB0Ftwp
         xvK1XXkzGBXDBQMbKUBgB+Oqi4goTHkFr8fkznFeGripfN9rzayLiL12eOSsTyYatbj4
         f8VTB8KQPEAdymtJLs/iwJhpLSChzbx3xE3QAa13JqJ8Athxt9DDEPjH1lU+9megD7LY
         IXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAX3FXnwCF8zNJqHWCp1xTyazdoQDHdyebBdGCZQhnKyYqTdh6nkgW+NUSNraJgHCaYVwcIN4uqStsvbLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+vLb5VDCYO6IvzyUTHXOMi7q9zDKfKQETQqVbbliZxC/9iAc
	ul93gv5KaQdLZNFEt2nEMIv0wqHO6Jj/dgSafJLhk0JuAWYIWQ83XiJ44bz//LIsDkeRE1zEovL
	qf3uEJaaAQCGUaAk19GQD1g2icTTYKLkkxQymW+X9HQi2uI8AmY7W7vU=
X-Gm-Gg: ASbGncuYtUdxxEdVz+1rZe7eED9EUfwseM11kNnjJbxWkco/Pj2hMIVRDflHSgxj2nv
	JRbnLd4JRw2GOAbKKnd9PscWVBy6g1pvn4e/FtCMoAIm80v+xg/5zNi/OorvQ8evM6catc0dup7
	7OcW5W3v6PvBYAImISPZ1m8nV8DnJut8J73kuKKnjndISqcDU+oO/qlNSjQGDTfa9u7koOhJ1zC
	DUsgStPgce2WxrlHCEkPAWozAzkiwCtone2k57QFNf56Bmnw6wr/cnuTZD1AhAPapXudkc=
X-Google-Smtp-Source: AGHT+IGp7GKe1RKdp3EifTfSeaou18jsyywYSKyMxPvf6+wpNti41ngxOAgDWBsE8YIo1EJMFQbA1mHAun4y/oak87Q=
X-Received: by 2002:a05:6512:138a:b0:57d:b8a1:832b with SMTP id
 2adb3069b0e04-595841af20bmr6916107e87.24.1763562594938; Wed, 19 Nov 2025
 06:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com> <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:29:43 +0100
X-Gm-Features: AWmQ_bmc-n1cuVY24_yDbxt_0pYfljkKCrIONDdezzzLDg_EEB1-VOCfHUUS2FA
Message-ID: <CACRpkdZp3zKVCeJPXJP4UCAbXz-j=81zYfXntxuBp5BK5ettzw@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 9:38=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > For the input usecase the status of the LED is a byproduct and
> > should not reflect in software I think. It surely should not be
> > controllable and possible to set into output mode because
> > that sounds like a recipe for HW damage if you drive it
> > actively high and press the key at the same time.
>
> Suitable resistors are present to prevent hardware damage.

Aha, clever.

> > gpio_keys {
> >     compatible =3D "gpio-keys";
> >
> >     button-ok {
> >         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
> >     };
> > };
>
> But only one of the gpio-keys and gpio-leds drivers can bind to the
> GPIO, or am I missing something?
> So I do think I need a new combined key-and-led driver, like Bartosz
> suggested:
>   - When the user turns the LED on, the GPIO is switched to input mode,
>     and the switch works,
>   - When the user turns the LED off, the GPIO is switched to output
>     and driven low, and the switch does not work.

You will also have the byproduct that the LED being "on" in software
does not necessarily reflect the actual LED status, someone
may be pressing the key and then the LED is off even though
in sysfs it is clearly "on".

So the status in the LED classdevice also has to be forced to "off"
(brightness 0) anytime the input subsystem detects that the switch
is pressed.

It's going to be a lot of work I think, but I guess it can be done,
with a lot of special-casing and custom APIs.

Yours,
Linus Walleij

