Return-Path: <linux-arm-msm+bounces-42702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A59F6F87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 22:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A5F169EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 21:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44E51FC11C;
	Wed, 18 Dec 2024 21:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf1H1YkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E171FBEB7;
	Wed, 18 Dec 2024 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557842; cv=none; b=UxdNOvpVp/xLhNMTaYEw1kkwXjL0asbbT00Vt507hFjdRChuypOHZX7iszFGt5WHT3qqt/8yxYZjdl79t2RenHpttydMTQitz3lbLEZD5U/SNieV0gq8RUDga6HJkRENXBiv1d2M7FkWvwUgZUWtI5n3Afm2MdoKUGO+KTSui4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557842; c=relaxed/simple;
	bh=3xeEvDDYWW2Yt6bv1YrE84suKZrHbM4J1t0iS9EDfbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNaDxrl/5ZjE1JULF4nGp+ftOTxdqc6Ai74TGHCEHIUiaN1cSbyUEnyiOlxo4tK1wX0e2kACwuRqIfX5WOFzl1z1wchYAR/kkh/9s+mL5c1X3v5q2LjzMe8bAoMkAzXKi8bcHSvaKuBjcwuK3MspP5FlgL6JWbkTVHhEZQesSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf1H1YkQ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29fbba47ca4so26045fac.3;
        Wed, 18 Dec 2024 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734557840; x=1735162640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmXRKgmeI+8m19UP/6Z3O8N0tBLaZsNqRj9FTnQ81Og=;
        b=gf1H1YkQy79rKJQURU6IcPnUCE2fEze37glI0VcOlNy9wz39LqL3EY9F/3e34OfSXw
         mbMHbAosyRQrfh1YwPtvX/NRCrNBlQI/TfAmAh3V5/h5Zk0QBtOOZQNMDCd1lgsqRVpR
         baA02E5I3qU3M/iGfEIDbO6rDi6ojpUoBAj8eaZty9JIRT8Wrm3+T2Sw1KUmf3/b7aHe
         +tmtpdKvyLCOfOAq2BR3eTs20FCH+ACYe+qq1uLfG6+Bv5qaOXyVIT1VXOEmJXUdoqmo
         3C8qpVzixdufMRgx9hxkqknBOL1pBmp+j7ZTHOxPeNnKNXQ3XjnYjKH2wYGopPjQ8w1q
         6Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557840; x=1735162640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmXRKgmeI+8m19UP/6Z3O8N0tBLaZsNqRj9FTnQ81Og=;
        b=UfRjqc71aw2FmqDI5uz1w1GN7IXV7HDBx0gfc68U+7yW/XpB6NwU39a0bh8lgMNQp6
         aUOgOZ+LAvRXeJuXgo4Lj4eUPj5Pifoeha6xFGP+p+Rw+JKQFxRQZPhBxsQ7mCPyJwis
         uuMfajA1y6suaKUIUKDQif0A0i7WMKe8TRXLG2FPPwqNEmaHrKdOToM+inKYYvmacoBY
         5VrSnjPd2wLiobyJzIrBsuOFuCSVI3sOVN8QTglnW9DM0qE4v1hXJ16Ng/dc9tCgZC8l
         /WZuu6iHuQ+H5BtY1bQRbDv2SCQ1rEQUNg3uF5reJ+DW5R/CPqFs5ot7QDfyoZ4r97qZ
         t87g==
X-Forwarded-Encrypted: i=1; AJvYcCUuVdkJqV7WyLwDTqFkbFljO28uT9O7fVAj3fORwKSK6GwHGlJ10wVWR6TodLEnBWa1by+FtO/7ITusKU96@vger.kernel.org, AJvYcCWczYyRt18iuI/Z8LcftpLX1V8Do817TTFG2x6tFv03zK+6E6Sb4mcgtHi2BLxRNs5fK541Uiq68rWW@vger.kernel.org, AJvYcCXmwN8gb/febIjmmFOu/p25L9iwemc95kVfunwEF2O6r3EJDsFXM/Y6Onns1iuSx8Zi4BzGn2X9PZtBQgnd1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GClgOfUBjQCXWkdI3DEekdQVtDNOBYnYvRA1L/gl/z5CyQ0Y
	DEITzGYBYHPXKryPICboaeHeu15CwAC5Rgc9SjLu9J2tM8KuzpLxOeb2X3sIBGYZMOSek4xrZJb
	KZUkqiCqgU8czifo0dnb/m2I14jFsJCUV
X-Gm-Gg: ASbGncu00kyZgZpfto/DcPZEdxjKLgdLjlmeINY6DEbXi79P57XdW1ZH1ZX5YcauMYY
	DZ+JPoi84sFLvDOalTAjQrqWjSxHSZM1W6p35EGZEfQ42fIPynk/fSSnVsUIHY61tSUrkBp+V
X-Google-Smtp-Source: AGHT+IEE10SjMkpkh0PyaLyICOUQ/ZVXyUOjdSJQfqAxLkAFi1snj0eh5n47YRPoToq7kVK75riXxx1hquFJDYKstKU=
X-Received: by 2002:a05:6871:339a:b0:29e:5dfd:1e17 with SMTP id
 586e51a60fabf-2a7b3145c32mr2648135fac.23.1734557840078; Wed, 18 Dec 2024
 13:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cae52ea6-e86a-4b86-af06-01a8a93d2ca0@mailbox.org>
In-Reply-To: <cae52ea6-e86a-4b86-af06-01a8a93d2ca0@mailbox.org>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Wed, 18 Dec 2024 22:36:44 +0100
Message-ID: <CAO_MupKCUk-w4=-0yDWo4m9XC1-iEuF6YHYnYw4T0oF2aKFxvQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch
To: Anthony Ruhier <aruhier@mailbox.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice to see it finally working!

Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>

=C5=9Br., 18 gru 2024 o 20:02 Anthony Ruhier <aruhier@mailbox.org> napisa=
=C5=82(a):
>
> Add the lid switch for the Lenovo Yoga Slim 7x.
>
> Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
> Slim 7x this pin seems to be bridged with the pin 71. By default, the
> pin 71 is set as output-high, which blocks any event on pin 92.
>
> This patch sets the pin 71 as output-disable and sets the LID switch on
> pin 92. This is aligned with how they're configured on Windows:
>      GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA |
> ctl=3D0x000001c3 io=3D0x00000003
>      GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA |
> ctl=3D0x00000000 io=3D0x00000001
>
> Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>   .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index ca5a808f2c7d..311202aa9015 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -6,6 +6,7 @@
>   /dts-v1/;
>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>
>   #include "x1e80100.dtsi"
> @@ -19,6 +20,21 @@ aliases {
>                 serial0 =3D &uart21;
>         };
>
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               pinctrl-0 =3D <&hall_int_n_default>;
> +               pinctrl-names =3D "default";
> +
> +               switch-lid {
> +                       gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
> +                       linux,input-type =3D <EV_SW>;
> +                       linux,code =3D <SW_LID>;
> +                       wakeup-source;
> +                       wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> +               };
> +       };
> +
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> @@ -811,6 +827,28 @@ edp_reg_en: edp-reg-en-state {
>                 bias-disable;
>         };
>
> +       hall_int_n_default: hall-int-n-state {
> +               lid-n-pins {
> +                       pins =3D "gpio92";
> +                       function =3D "gpio";
> +                       bias-disable;
> +               };
> +
> +               /*
> +                * Pins 71 and 92 seem to be bridged together (pin 71 and=
 92 show the
> same
> +                * events). By default, pin 71 is set as output-high, whi=
ch blocks any
> +                * event on pin 92. Output-disable on pin 71 is necessary=
 to get
> events on
> +                * pin 92.
> +                * The purpose of pin 71 is not yet known; lid-pull is a =
supposition.
> +                */
> +               lid-pull-n-pins {
> +                       pins =3D "gpio71";
> +                       function =3D "gpio";
> +                       bias-pull-up;
> +                       output-disable;
> +               };
> +       };
> +
>         kybd_default: kybd-default-state {
>                 pins =3D "gpio67";
>                 function =3D "gpio";
> --
> 2.47.1
>

