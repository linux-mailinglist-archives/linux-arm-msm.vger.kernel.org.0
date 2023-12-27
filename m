Return-Path: <linux-arm-msm+bounces-6031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DA81F18F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 20:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C08283C92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 19:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E18547771;
	Wed, 27 Dec 2023 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CMLOCkL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2C46B88
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4b743e64cfeso270582e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703704402; x=1704309202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3qLwklk9U4gMAhrladKe1ApGulYoEDWa19ngg2KpQ4=;
        b=CMLOCkL7tc5m/B5sWs6PP7QghzaQh/TET0pi7s7h33BoKdrp3Bq6HaQWawAHtChm+q
         NOSacPWN5Na1qd3xtav5uG3SmsCC372kCjnkqj2fCmFk8m66jAvw0NlQcRKUcgwwGnlg
         mr4NJrp3atN/uzmUYhPCyOcRdW4jEyzSJZakNFv2L+tndskjSH8F5mUGlXsSnCrrcVYO
         g3w1PZjdde+S41Q1pL6mohdlHBGgNpaXD55v0d/AIkZmzwy0XjFt6b+ZrkaKgD682eyP
         /rHPJ5pnwCWxF35P/WuO0AQi+5XCX699aTH2io5x8nOLVkYErZw0iCfqEQV0VC/R+Y+a
         0npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703704402; x=1704309202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3qLwklk9U4gMAhrladKe1ApGulYoEDWa19ngg2KpQ4=;
        b=Bo4zMpYn+DBSExaWLVBBVgWiFUQ4m4Dg3zDrDAYXpJkL+GJmSq4VjbPAyj9baX2m3H
         fYSxGaIaIf0oNLDYzrI3dy7LVVF1u5uKUng3plK3YrxcF1kqCWCd/6AdenRHe2UKgtpO
         5yiWMwYdiQRs4cDkx8W2/S4dMVWPjDpxZ/PCVxmiDNDUB42IkMn05dYsj9fAK0edo7gC
         s2E2IIhtTCUWQuxzIA+DeRT0dzcVeKIv95tE3ZbDvXPxAGdVYp8N14gknl1AnousLbRl
         uyNYIuooHGHgnf+uivi7lexGYMACKGm3WNqWKN/CZGH5Etm4YuAv7xMey2qqKSFyjlIc
         iPxA==
X-Gm-Message-State: AOJu0YxMsJPoE5TkM790Ypv8luj3oNMtejec9AyFih2SZTjd3wW8iHSj
	OacOBJLlp9eqcoTEpHUbD3kr7cPT9U+efo5XYHKUdWrbn19EkA==
X-Google-Smtp-Source: AGHT+IFUs7dm3S3V4xYhOPFC9E9EgbP+SpH3MAbAicqVRSXicJa9l3Z7CFlOmIGFjC7GBisXfF33h7pkFtdX1T+HNa0=
X-Received: by 2002:a05:6122:a02:b0:4b7:3eee:3a3f with SMTP id
 2-20020a0561220a0200b004b73eee3a3fmr1614353vkn.31.1703704401898; Wed, 27 Dec
 2023 11:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-2-krzysztof.kozlowski@linaro.org> <CAMRc=MdYPuW8C_+EAY4UTCjqNggx6RAkp9OmLU-hRxjZNRQRHw@mail.gmail.com>
 <e9bcea6e-922c-4903-996f-1677e6eb6e1e@linaro.org>
In-Reply-To: <e9bcea6e-922c-4903-996f-1677e6eb6e1e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Dec 2023 20:13:10 +0100
Message-ID: <CAMRc=MfGOr4yF50fOwfvahe=CV2Xf9oTrPBLC1QPAb2hw1FLUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] reset: instantiate reset GPIO controller for shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 1:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>

[snip]

> >
> > I dislike this approach entirely. Here's what I would do:
> >
> > In the reset core: parse the phandle of the reset-gpios property. Use
> > the resulting node with gpio_device_find_by_fwnode(). If the device is
> > not up yet, defer probe. You'll now have the GPIO device object.
> > Retrieve its label using gpio_device_get_label(). Now you should have
> > everything you need (the offset and flags of the GPIO you'll get from
> > __of_parse_phandle_with_args()) to set up the lookup tables. See
>
> I don't get exactly what do you want to use as the cookie for lookup
> reset controller?

I'm not sure what you refer to as "cookie". :(

> 1. GPIO controller node? No way, not enough
> 2. GPIO label?
> 3. Or some combination of above? This would work, I guess, a bit more
> complicated cookie than just one pointer/unsigned long.
>

For a GPIO lookup you need:

1. The name of the target device (in your case "reset-gpio.X", you can
either keep track of device IDs yourself or live with the fact that
you may have one deferred probe between when the device is registered
and bound and when you are able to read its final name for the
lookup).
2. The label of the GPIO chip (whatever gpio_device_get_label() returns).
3. The hardware offset of the pin (which you can get by parsing the phandle=
).

You may need additional lookup flags but the above allows you to
correctly assign a GPIO to a device. No need for cookies.

Bart

> > include/linux/gpio/machine.h. An example of that would be in:
> > bcm2835_spi_setup() in drivers/spi/spi-bcm2835.c.
> >
> > Then with a lookup table in place, you instantiate your device and
> > it'll get its GPIO as it should. This is not ideal but much better
> > than the above.
>
>
> Best regards,
> Krzysztof
>

