Return-Path: <linux-arm-msm+bounces-44401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51270A05E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF3B3A562B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF151F2C50;
	Wed,  8 Jan 2025 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soirqxjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B4199FA4;
	Wed,  8 Jan 2025 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345501; cv=none; b=RodHYO/IlR6YAtGhdYoyyzxQ96DXp3TpgIUqMAaLDMHy6mgDPr8dwNZseaNTZrhhWzEr5oHOiEYH0DDGHaXIRkFAeNmJq/QvCYimhBwZ5M3noU8WD+GjfuJ/wmE5nPdj3ADw9/OoUf4N/XYElTfqC7LKA3ejH7hLOS4jGl6i4gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345501; c=relaxed/simple;
	bh=JMqN0FMxKNJX/JfmYS6rGjbOvbZNa9hglHI1v60kBbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ+GnNyCD6pDAptpOea7IQIgeQG+V9AiI2RjqJoU6Tj7g14KICqVUVF+ygHuuJ4aZ6vZibObWZlxIrrSoBv5dQMTbd3Iw7GlmBvCw6x9SPvsl3LzQOwFl5j64J0IDngcWKywtmj8w/tp88wXvFliY+7cL8jV01O6RbohQXcb7X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soirqxjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C56BC4CEDF;
	Wed,  8 Jan 2025 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736345501;
	bh=JMqN0FMxKNJX/JfmYS6rGjbOvbZNa9hglHI1v60kBbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=soirqxjULBREkvMUEMz97SNJHXXZqahmoIXNP6J6EQkOHWRDQ2RPnXhSz3jW7M4Gu
	 4Ol+5ZirdSQRTaaoTnR6XoRdkZiI/3cP1PJOIJswFN20503PzUmQhKXKnQGrrPTBjB
	 ulTaUlznyBC7BVR8tp+WS0aE4HwrZ6uo3iRRGRZGIPeMk1qVyQoQYXGqNJqvJvEEOj
	 WEaVoCJl5lbpFWIoDRaQnyfqA3J2b3n2yhpVDTYtim8KaSGTR+j8LTuqsYPRKC1Q4j
	 t1R8xx89WWrY90HVI2r6Zz05/UBmK1PM+KNauX4IjFQWkBmFRSZJNHQzkM8Se6rEJl
	 8AcHlnmPq6xog==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53537d8feeso22355141276.0;
        Wed, 08 Jan 2025 06:11:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiQPZlVcY7jgHNScoCP0sR55jqmSDh4p814eUuWORmFJVYsa2+PeGfMERF5PwXmuODbsxyeToW4kWqguwPoA==@vger.kernel.org, AJvYcCWHJAbttvmruC49oXbTsW87abW3HUfg1LBJJ4HOVcM8KuoV5832JtOw8U8LciKp92Rx8DR4xWS3Qh1ig0HJ@vger.kernel.org, AJvYcCXra8vpNPhVp+VtzeXanZZstLjFQB//mmnCSKpVhBTvH0BkTOh5jQ6fomLNnoIeXRo5ojutNtiDBy4n@vger.kernel.org
X-Gm-Message-State: AOJu0YzofbFGqxWo6gtQyWkvekcFxnJgdbLgDR1UEUvdAslN32U/qzIy
	l9tYa/k02TJpUB2TOuYWZ6PhGNWlONQeBJC0hiZ9ZfhOr6sJGTLhAeS0ciz314he1EdY2OgVxjD
	kfJRKd93Zrtwg9orckZjTp2km/Q==
X-Google-Smtp-Source: AGHT+IGdhCLG62Mh6aIPPiC9srOlBBhzGQ11BLoEicaV94TASjDeEtcCBwDQ+9gbltwMrrjmduoyh2qTvXcRfmcZObs=
X-Received: by 2002:a05:690c:6702:b0:6ef:5ca3:d0d9 with SMTP id
 00721157ae682-6f53123988fmr21886957b3.20.1736345500429; Wed, 08 Jan 2025
 06:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-2-swboyd@chromium.org>
In-Reply-To: <20250108012846.3275443-2-swboyd@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jan 2025 08:11:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
X-Gm-Features: AbW1kvaFOTBHEZ3cFJ0pUUPpuln7GgG7io7PpzUCZXYgw14QZ4clQXIRvz2ZW1g
Message-ID: <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:28=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> Extract the simple bus into a self contained driver so that devices are
> still populated when a node has two (or more) compatibles with the least
> specific one being the generic "simple-bus". Allow the driver to be a
> module so that in a fully modular build a driver module for the more
> specific compatible will be loaded first before trying to match this
> driver.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: <devicetree@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/bus/Kconfig         | 23 +++++++++++
>  drivers/bus/Makefile        |  3 ++
>  drivers/bus/simple-bus.c    | 79 +++++++++++++++++++++++++++++++++++++
>  drivers/bus/simple-pm-bus.c |  2 +
>  drivers/of/platform.c       | 50 +++++++++++++++++++++++
>  5 files changed, 157 insertions(+)
>  create mode 100644 drivers/bus/simple-bus.c
>
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..7c2aa1350578 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -261,6 +261,29 @@ config DA8XX_MSTPRI
>           configuration. Allows to adjust the priorities of all master
>           peripherals.
>
> +config ALLOW_SIMPLE_BUS_OVERRIDE
> +       bool "Allow simple-bus compatible OF nodes to match other drivers=
"
> +       depends on OF
> +       help
> +         Allow nodes with the "simple-bus" compatible to use a more spec=
ific
> +         driver which populates child devices itself.

A kconfig option for this is not going to work. What does a distro kernel p=
ick?

> +
> +config OF_SIMPLE_BUS
> +       tristate "OF Simple Bus Driver"
> +       depends on ALLOW_SIMPLE_BUS_OVERRIDE || COMPILE_TEST
> +       default ALLOW_SIMPLE_BUS_OVERRIDE
> +       help
> +         Driver for the "simple-bus" compatible nodes in DeviceTree. Chi=
ld
> +         nodes are usually automatically populated on the platform bus w=
hen a
> +         node is compatible with "simple-bus". This driver maintains tha=
t
> +         feature but it fails probe to allow other drivers to try to pro=
be
> +         with a more specific compatible if possible.
> +
> +         Those other drivers depend on this kconfig symbol so that they =
match
> +         the builtin or modular status of this driver. Don't disable thi=
s
> +         symbol if ALLOW_SIMPLE_BUS_OVERRIDE is set and there isn't anot=
her
> +         driver for the simple-bus compatible.

Giving users some rope to hang themselves?

> +
>  source "drivers/bus/fsl-mc/Kconfig"
>  source "drivers/bus/mhi/Kconfig"
>
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..f3968221d704 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -40,5 +40,8 @@ obj-$(CONFIG_VEXPRESS_CONFIG) +=3D vexpress-config.o
>
>  obj-$(CONFIG_DA8XX_MSTPRI)     +=3D da8xx-mstpri.o
>
> +# Must be last for driver registration ordering
> +obj-$(CONFIG_OF_SIMPLE_BUS)    +=3D simple-bus.o
> +
>  # MHI
>  obj-y                          +=3D mhi/
> diff --git a/drivers/bus/simple-bus.c b/drivers/bus/simple-bus.c
> new file mode 100644
> index 000000000000..3e39b9818566
> --- /dev/null
> +++ b/drivers/bus/simple-bus.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple Bus Driver
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +static struct platform_driver simple_bus_driver;
> +
> +static int has_specific_simple_bus_drv(struct device_driver *drv, void *=
dev)
> +{
> +       /* Skip if it's this simple bus driver */
> +       if (drv =3D=3D &simple_bus_driver.driver)
> +               return 0;
> +
> +       if (of_driver_match_device(dev, drv)) {
> +               dev_dbg(dev, "Allowing '%s' to probe more specifically\n"=
, drv->name);
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static int simple_bus_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       const struct of_dev_auxdata *lookup =3D dev_get_platdata(dev);
> +       struct device_node *np =3D dev->of_node;
> +
> +       /*
> +        * If any other driver wants the device, leave the device to the =
other
> +        * driver. Only check drivers that come after this driver so that=
 if an
> +        * earlier driver failed to probe we don't populate any devices, =
and
> +        * only check if there's a more specific compatible.
> +        */
> +       if (of_property_match_string(np, "compatible", "simple-bus") !=3D=
 0 &&
> +           bus_for_each_drv(&platform_bus_type, &simple_bus_driver.drive=
r, dev,
> +                            has_specific_simple_bus_drv))
> +               return -ENODEV;

If this driver is built-in and the specific driver is a module, this
doesn't work, right?

I think we're going to have to have a list of specific compatibles
that have or don't have a specific driver. Today, the list with
specific drivers is short, but that could easily change if this
becomes the way to handle things. We should consider if new platforms
should just avoid 'simple-bus' and use something new.

Rob

