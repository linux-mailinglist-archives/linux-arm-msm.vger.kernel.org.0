Return-Path: <linux-arm-msm+bounces-19728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB58C2DA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 01:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315E51F22414
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 23:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ACA171E4B;
	Fri, 10 May 2024 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EOp+hEZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3894513CF93
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715384188; cv=none; b=T/qTBS1GxKdtMgwbZxdxBVa8laUQIk2a/E3iv/XHjD+Ax3dy8i7xBR58+sdCRdXpb0j1G7/qJnypHoltNAmDovA2eBVeD8gKbKjnO7Am4W9qfje48W0T5a/nzsEVRyyjPXd3AT/EW3sMdbC6VrMQY8HjcKbC2Wcomx8hZ3FCm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715384188; c=relaxed/simple;
	bh=tdd3mEPr8R8mB7AxgVNrZK4bwy+sTsONs5ChPMw/qCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rb853qjFaVXrmoaHI0/e30aNYYwVwVEGjVfOo2ur0v0J0GMTBqIe1L+8skNwA55iin2b8MQcq/v1ahIC4JJ+uj505+nMFcKvHt1KSn/wRhTiBAt/H0gHlNsyfAdBU28FrlOYNHU86/e1kvYb6m5l157uFgQly3E5hLvBFCBF5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EOp+hEZP; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2600819276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 16:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715384184; x=1715988984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUDP9S9qW3rGQGeBPladTmxRNiWuw5gzHHPdJQsB0VM=;
        b=EOp+hEZPbLHdVERIbjfrCMKS3QGHGpU7p0BTHls+mSapjVASRd/SSmmQLKhGOy8FiC
         FUZit4smyMsrXe9rWZWIE34+jq1OLFjRRVB5IeRoqLg8H+8XhwrROU9fFgCcX8bSQ8bt
         1a4FXbNNvve8n28VeOYjJEVSwE/uax+k1MgIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715384184; x=1715988984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUDP9S9qW3rGQGeBPladTmxRNiWuw5gzHHPdJQsB0VM=;
        b=CNm/0pHvXaxls2AlM/SEtIcIEypUftzNAdKYfpoQSmEBQiuZnRr5DZw3MCNq9Kmegy
         dzfk3xpSs/r+dGgD53bO7mfq/tpC5fldVeg/WVYTkdirILaRoa1s1+TlSyuNrefxBwPU
         4OU6eN1QmZz3GtoImj8fINSlNd+BdwF3G/ZkjFV4prWMcj3HdDerFdW4tHsvcvPZWbFr
         SxHEcvBfsfexWvpDfJstxidkgIb6vBfynSmzu1IK3/OiEyOHcc9JN+ymcuATctpPo2Gx
         2ctP6yvpf3LO0j+liB87O7PDRYzsyKOE2PFBEjObt1rv5dpINow8kmgxeEL7FIuJwat7
         G0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVGR1jnfmHpmjmCY2R2IAej9qNjUPIfO6XFP8vbR64cLpFUK/TrHbJAvVmhUnr4pNLm0dxYG86XNSutQp/xV9X6s5/FIWnLARKC0H7Byw==
X-Gm-Message-State: AOJu0Yyn2LTOCRkhjvwPub39Bupc+C/ez+mpM7QWY3g3jkTEyIr53gR2
	XtFDy2nH5gnc1TWOZBDV5N48R76ajwicLJcnRu3tSN/OXtusTlEQ9C2chvEXuRqOiXqR0QW69SY
	=
X-Google-Smtp-Source: AGHT+IHrp60XfGUv2tJGFOWJJapRYoPqI15gehI5gy9taMoaYnLwJAsx7/1rIjdzhWIWOcYhHYZTOQ==
X-Received: by 2002:a25:bfc4:0:b0:de6:4ff:3157 with SMTP id 3f1490d57ef6-dee4f312322mr4399782276.44.1715384184250;
        Fri, 10 May 2024 16:36:24 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54f216esm26557951cf.31.2024.05.10.16.36.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 16:36:23 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43dfa9a98d2so31691cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 16:36:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4CI82anKSlSfStlGa4QZ0QOo0JjsueQjLWXNprD6Noo8zlhMc4xxVkQx3WNPrw0RyI/b/PoPOqGtA9/Ye3en+mJX4QUZVpPlRh48vmQ==
X-Received: by 2002:a05:622a:1f13:b0:43d:fce9:684f with SMTP id
 d75a77b69052e-43e094d0423mr1201921cf.10.1715384182762; Fri, 10 May 2024
 16:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507144821.12275-1-johan+linaro@kernel.org> <20240507144821.12275-5-johan+linaro@kernel.org>
In-Reply-To: <20240507144821.12275-5-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 16:36:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>
Message-ID: <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] HID: i2c-hid: elan: fix reset suspend current leakage
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 7, 2024 at 7:48=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> @@ -40,17 +41,17 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *o=
ps)
>                 container_of(ops, struct i2c_hid_of_elan, ops);
>         int ret;
>
> +       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);

Could probably use a comment above it saying that this is important
when we have "no_reset_on_power_off" and doesn't do anything bad when
we don't so we can just do it unconditionally.


> +
>         if (ihid_elan->vcc33) {
>                 ret =3D regulator_enable(ihid_elan->vcc33);
>                 if (ret)
> -                       return ret;
> +                       goto err_deassert_reset;
>         }
>
>         ret =3D regulator_enable(ihid_elan->vccio);
> -       if (ret) {
> -               regulator_disable(ihid_elan->vcc33);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_disable_vcc33;
>
>         if (ihid_elan->chip_data->post_power_delay_ms)
>                 msleep(ihid_elan->chip_data->post_power_delay_ms);
> @@ -60,6 +61,15 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *op=
s)
>                 msleep(ihid_elan->chip_data->post_gpio_reset_on_delay_ms)=
;
>
>         return 0;
> +
> +err_disable_vcc33:
> +       if (ihid_elan->vcc33)
> +               regulator_disable(ihid_elan->vcc33);
> +err_deassert_reset:
> +       if (ihid_elan->no_reset_on_power_off)
> +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);

Small nit about the error label: it sounds as if when you go here you
_will_ deassert reset when in actuality you might or might not
(depending on no_reset_on_power_off). Personally I prefer to label
error jumps based on things I've done instead of things that the error
jump needs to do, so you could call them "err_enabled_vcc33" and
"err_asserted_reset"...

I don't feel that strongly about it, though, so if you love the label
you have then no need to change it.


> @@ -67,7 +77,14 @@ static void elan_i2c_hid_power_down(struct i2chid_ops =
*ops)
>         struct i2c_hid_of_elan *ihid_elan =3D
>                 container_of(ops, struct i2c_hid_of_elan, ops);
>
> -       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> +       /*
> +        * Do not assert reset when the hardware allows for it to remain
> +        * deasserted regardless of the state of the (shared) power suppl=
y to
> +        * avoid wasting power when the supply is left on.
> +        */
> +       if (!ihid_elan->no_reset_on_power_off)
> +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> +
>         if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
>                 msleep(ihid_elan->chip_data->post_gpio_reset_off_delay_ms=
);

Shouldn't  the above two lines be inside the "if
(!ihid_elan->no_reset_on_power_off)" test? If you're not setting the
reset GPIO then you don't need to do the delay, right?


> @@ -79,6 +96,7 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *=
ops)
>  static int i2c_hid_of_elan_probe(struct i2c_client *client)
>  {
>         struct i2c_hid_of_elan *ihid_elan;
> +       int ret;
>
>         ihid_elan =3D devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_=
KERNEL);
>         if (!ihid_elan)
> @@ -93,21 +111,38 @@ static int i2c_hid_of_elan_probe(struct i2c_client *=
client)
>         if (IS_ERR(ihid_elan->reset_gpio))
>                 return PTR_ERR(ihid_elan->reset_gpio);
>
> +       ihid_elan->no_reset_on_power_off =3D of_property_read_bool(client=
->dev.of_node,
> +                                               "no-reset-on-power-off");

Personally, I'd rather you query for the property before you request
the GPIO and then request the GPIO in the "powered off" state just to
keep everything in the most consistent state possible.


-Doug

