Return-Path: <linux-arm-msm+bounces-87656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD20CF77C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51BD9300FD4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545F8314B9A;
	Tue,  6 Jan 2026 09:22:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFAF314A65
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691333; cv=none; b=OdDwZMXv0eyo72ne3D7KMUVrmneE5oq6FXxjGYYXc2XTqW+QDddv7ufTwyo1rkuDXq1sfMrG7+ujG8bGCgnGh3wiNCLW/nrvdKBIEy18O5M+Zf8kBfoM6zo0TLhrKLpBo9rqmx97nJIcuFRFLk68kYthhi9NKG1hxlUbAUNQamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691333; c=relaxed/simple;
	bh=oGWEDzx0GCta1OvN+DPAb0Ri8GEUryM+YKckFtZpRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKGG802/XDjthEnxte6zXW7E3z932xK2RLLoROrJ2hO7A36iJz6uIdp5rvfw+DYj/x5Q+kQoMb/fBqFfcgxhy9mscrX7IAAw5EKAIn6G7/0kBO2HpXlQrhpRUcHQepUbiliUaZlmbp689XRB2G9alRrFXRBrsjXZQnzdWDYoMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso102930241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691330; x=1768296130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=ODKPWY8HxrSBJ6Dq7Whz4Qolv8SnvPomNmRz3n7P/0egzKllJ+kf3TVGtPavGbE5p3
         7tA6aKBBok2JoF0LTjpViANkoZ81M6Oas8tbtTrGTFxkvvc77NsyQjio3X1zOMuzi6d3
         +kGGR9aDpyuOpU4sEnjW6drJD1vTlOGNi2Z0INwnXo/EFspRkLVfNajDNYFD2gDsk0Cv
         mdZcVwyqtDMhO8Rt/qr76oK7JRTDrLGNjILYWE61Bxk8sM2F3imTmiT+DixSgSCjvy8A
         8v+L6enYqe7ibdaunng6QNIHUdd5z/BDufntMRTgkONu9w3EiFROD6gzl3LWJKUL9+I9
         0zfw==
X-Forwarded-Encrypted: i=1; AJvYcCViQtO8sJShz//Mu9Ym1/GIwAZ1G88aIDimeGgnSOV9M9n43xIjP9tCR+bDpWQiYgAXc5PzMDNGp+qNEXlU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8U6KxppfIQfFq/luz34Lf4YaCpxImVhQipGYWd2WmTY7mTs+w
	sjgtNZmRm8aNKMeRLtnbe7WijR73J0iAGDUBOMyw2LM9WysV2KC15H6R9/XCrvh+
X-Gm-Gg: AY/fxX6BhTeBDH/iQ+bceENVJRl547Sm8ektckmvq+ayR/ohmHtFlppCrrNOKjL8kIi
	I1lkviT0OnGjeGDT2qkhNsd+4yB3fLOj4521tROx0wi60SdhwI3y/lcoKbzuuz5BzDsy4gkqRnb
	L7/uwcZeIGA3tjEedKcsLn6C8UZHAcWFXkzAIXlfUpKN+RoFGpHMeYjStqXotN9hAPUdEPHNhvr
	uitoguZAJ3Rj2JO9hQDqGshiR8uq3TWo92eccA3sXiJvtPPiJtFZryQZ7AqJ6mpGuX/bvDApfoV
	hFC4Xy/8K439MCZc9NvkcJsx2PQKf6YxI0BuG1zMNys/57CZqrNC4/Gdur39PqnHLJNLR4eTNAO
	bB5ii7/1koUJqClRTSm+IjB2J3i7pN0hkZtwSv4+4QXKKl3tE0/TvdbQBa5ZU+X0+aJRKCoBlAQ
	8VbpEpVFHiEnvxs6woBKNPot8/pVn/LCLNeKbVcrSklirZTmFOnww7D9CZS30=
X-Google-Smtp-Source: AGHT+IHYPk1aBswa2/EBxyn/q1+77vuWksTMM/tGeQHxR05WvM3qrhgvz/taLXieCInavhEykD+nnw==
X-Received: by 2002:a05:6102:290d:b0:5db:ce1d:679f with SMTP id ada2fe7eead31-5ec74524510mr692887137.26.1767691330445;
        Tue, 06 Jan 2026 01:22:10 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec76e6804dsm512659137.0.2026.01.06.01.22.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:22:10 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so556472137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:22:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdt+xHWzGvrZjU5EIbvS+RGoFLkKCbetF1qgf1l0L2t93Dep1fQEjns/hL5an5J8BWSUUW/6/KIzzzi+yM@vger.kernel.org
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

