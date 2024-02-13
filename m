Return-Path: <linux-arm-msm+bounces-10926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED72853945
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41E701C248CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445C45FF0A;
	Tue, 13 Feb 2024 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFpUcjw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD43604DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847058; cv=none; b=d2zURmZBcQAudyQrn1ArdUwtfAS+UcF2gd2GOJVe85Zh/lRE1hTBtObolXYBtCaLBmcAPo89j5eWsV/ocW8TI9kD8bh1lcc8c0O3OqfCtHWBtNz7ylkuEefqrOb1Nd+WpfG+rI1NhNPfaCeZrQ2Zw8xELCyL4ZIYF6V9fdlYSsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847058; c=relaxed/simple;
	bh=vGsPH/6NepigkHWNcE1Gp/jZaGblgkAQJ/VePx7mqOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svTQLwez9Yq9si8ZAqWv/OxGTEozKwpwPJHWTKO5fdEv6HuXCTKehAw4zvvC30o0DTb1xL64iz/SFX0AR7xutvZy1UyRJMYXPA9N0H7IXHuyFj23pZcywz0IDSUkD4SP6bId8j8CBzB+3zUn8iWfvKLdQzCx4EOzbgv3cbNkStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFpUcjw9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1091159276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 09:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847054; x=1708451854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThFEwmSsic89kjVyr0919FUZo6LtjSuhDb8efYOkiGI=;
        b=BFpUcjw9EZMmAMaQ2bsTun7bOnEVMJRwCHAZ56Nq23BqXa/cq+ZiknNpfs2CVPWUgC
         zqd3CNLT2tlGuDHlYAetKIHcyQlPWbFCFAUCpMr0NtVPH1Av7QNX7QEl6AD+NbZNNy0D
         8HjHA47CrLAQoznlmHTNh8S2aTbTGtOhGvtA0IFejHKwYGMjTEMSbYG2t4adDjrx64n7
         GI3wcAFM0L1r8TKgIIm7TB2GVAlROo3RFT+1z8PICwUIjweLm4av35HMsQcCEiCkZVcq
         SMh6/gajowAlID7p3cj/JFnfRKXLfFn/65MtF09Lc2DnEkNBa8Cp/uwCmP60kJ2MS6wO
         VInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847054; x=1708451854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThFEwmSsic89kjVyr0919FUZo6LtjSuhDb8efYOkiGI=;
        b=ky8zEI+l43+imlT45OeY+op2H1mRxi3E3KQ5qY3VjtUfDYDx0j3aTHUYwVk9V7G84d
         rUyi9kWuD4dMnqWOOVpBIkV8dRxng3NaQUKHs747ml4BClvoCQWnLUj7QVbpLozBN4hG
         E3hhtstaTd7/G3p3exfAYzrypjVRp2b1W3gWahm+uBoiW2M3R0P6qWPEFxwBEfhl0V+B
         ClLE2lJ89MzFBgB5PyjZGzmPN60spemh04Sk9D3RLqhsfVPs8q6NiFiE4Y5mUSQ3dDgO
         o/jGAVcW9pnwGmhWWOBHouuBf8I3aDw9a+f0HsmY0f2tZSv7CZmXN9I5GhkuEiDNNidP
         E0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUS3bKCczZTzvENGoC0eNSyUWTCCSjpr/SYV3lchyhmF6BTNNHvhTV15cPBLndaB51xbI8HZ2dhG63VKqHBEa3ggZ7womqGYVbWC3MTbg==
X-Gm-Message-State: AOJu0Yx+IN2hNXWODXIhdnPaVdjJ293M4tU2PRbJSJVWkyOSj8rOr7Ku
	GoHEqYY81fJFgodfc6jlp5lVwShXVKEuva7sjOJTfdzg34x5Q29mg4SR0i+b5CAcmI95SO+mahO
	fTAkW2BJplAVWQ+c2KPs7yekeDlUJTnDb7SN2DA==
X-Google-Smtp-Source: AGHT+IFRRPRaR8chVvPorzyjWv+0RJ/A9PgRqWUgzNW1aKca1HP9qDR/iO3FDMZxa24LIqZrVhfY5xeJjXYhOT7SiAk=
X-Received: by 2002:a25:ec0c:0:b0:dc6:cd76:5ddf with SMTP id
 j12-20020a25ec0c000000b00dc6cd765ddfmr8977451ybh.39.1707847054395; Tue, 13
 Feb 2024 09:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-3-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-3-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 18:57:22 +0100
Message-ID: <CACRpkdaxW+2q9=CPpkJZK7tWh5T7smnvqoEhEGezV9TvOw9wqQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

thanks for your patch!

Overall it looks good I have a few nitpicks

On Sat, Feb 10, 2024 at 8:09=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:

> The ChromeOS embedded controller (EC) supports setting the state of
> GPIOs when the system is unlocked, and getting the state of GPIOs in all
> cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> expander. Add a driver to get and set the GPIOs on the EC through the
> host command interface.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: <linux-gpio@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
(...)

> +config GPIO_CROS_EC
> +       tristate "ChromeOS EC GPIO support"
> +       depends on CROS_EC
> +       help
> +         GPIO driver for exposing GPIOs on the ChromeOS Embedded
> +         Controller.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio-cros-ec.

Classified as "MFD Expander" but I honestly don't know anything better.

> +#include <linux/bitops.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>

Do you need init.h?
I guess maybe... I thought module would be enough for this.

> +static int cros_ec_gpio_request(struct gpio_chip *chip, unsigned gpio_pi=
n)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               return 0;
> +
> +       return -EINVAL;
> +}

If this check is needed, it should be in gpiolib I think?

> +#ifdef CONFIG_OF

This ifdef should not be needed these days.

> +static const struct of_device_id cros_ec_gpio_of_match[] =3D {
> +       { .compatible =3D "google,cros-ec-gpio" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ec_gpio_of_match);
> +#endif
> +
> +static struct platform_driver cros_ec_gpio_driver =3D {
> +       .probe =3D cros_ec_gpio_probe,
> +       .driver =3D {
> +               .name =3D "cros-ec-gpio",
> +               .of_match_table =3D of_match_ptr(cros_ec_gpio_of_match),

Nor the of_match_ptr() business.

With these fixed/addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

