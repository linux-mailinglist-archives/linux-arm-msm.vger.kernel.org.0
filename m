Return-Path: <linux-arm-msm+bounces-83406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A54C88C95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF8F3ABE1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3273131B818;
	Wed, 26 Nov 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oa/7Eu9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41931A55B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147421; cv=none; b=qFTkYsGFID8IU9SvmTD5IhvXUlW4JFoYyAbhMCbD6S27efousG3bEzYA807X5WweQTOudS3OSJouhBnZ1wGXxDJkxreKs1BYsN9ORvW7WzBfQUDr7aPuhWCwSrgEfFz0qeV6m4jJxqFMTqnJQPBnnQY/4XZpzrcTG5OLn6/krHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147421; c=relaxed/simple;
	bh=TQ0XfhrhncmUXl4LGCH1qXBbqylHN0M8urjMFSB/s5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzlFmYvd1x+K6IWrtL08GXGPi4YJRROR8tENgd9SLRHs476sJ+Dakn1iEdf2vJxXhImGh/SLJ3G6UeSjC8kSicKwhIzXHN9lQkTn7X47c8Vx4bgsBZfvr0qyfwjlSNcYsdJfo18At+PT0pf7xIw4wJquh4T4QkYFn36mz8LwODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oa/7Eu9a; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5969c5af23bso6742516e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764147417; x=1764752217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W36nTnT0YKqMQzYxxzmpFkak27BWdp/kaoDVRpSQ0W8=;
        b=Oa/7Eu9aWmdPVlu0FyZMAkB2b0frM+KS8roCdvHq661A0evEzbIfHAOVumfa8CAw6K
         cfo3Vue434oWHeP6XjxxRgPWxxYaOToIRdWpxTjLntRiyGEWguB8S4MCOBsP29p/bEDc
         eboPm4BN9KeO1u72h3+m0dK0GLx26Wox85K2t0CPHaIhoJilbWypkbuZG1MlL5zlUO+F
         iyUpS0+OO5Txf3hTauPtG6pAps+flqfPvBXw4j0eiio+J+5gc0ShemYWTsC1dVFPLeM/
         yCMmATfmxFnTZFNqbYPX3XBcaH6ck/yrTznE6CGeHREHnuGKcddK99G8Os8/LCss5TCE
         qoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147417; x=1764752217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W36nTnT0YKqMQzYxxzmpFkak27BWdp/kaoDVRpSQ0W8=;
        b=iiFGQ2Svq8ISTBvwZ46gDXhWm0d8VsvAcFO7jFzZ3JhQbqX2awhwp0AtDXvXrtn9pc
         GG/baSZb8rjrqeMyQ/70ful28wgrbVreScJ7FRWtj2JL3QaR2ZwU931Ql98vTg0tsjZg
         ofaSGbDuKeQyED0iWWVSOiBcEmgNWXtrVbPZtqtHD7b0ZK3rG2QsWpFIcqLjzNTP4gj6
         jCqAIsQFbuCTu6CkicnLMB3OhgaA5BQ1REeM/L0j4KAlksb1tYV6K0dZS/I+0oetorKf
         mf8p1ZfpaWOaAATkFNQbB9qvEocZxaYKDmqfVQVplht30upSRNokl6BAbjSMgcbXd40m
         0O6A==
X-Forwarded-Encrypted: i=1; AJvYcCWiBzM/FpBdLE4K4iLi1ozQiCJFWdinQ1JSxe9pSycgT7Trs6turhxgfqDkkBqc9ZGPIQ4VIBzS6yyS/Uq8@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVAVSIuS6sZuw0X2tiofgQIUop0zYDbd9E0qoQ5rl/U80zchy
	oFuS+Sg5q/AAeN3HroIo8HNk3XtB/658cuSWHtG8VrYPVjM9rav9R3oPJDgjnB3NpHoe1h/KP3h
	j9kS/8N5PatdVVBGjsJBiDH8XLKBvn7eGAxNZTiw2sg==
X-Gm-Gg: ASbGncsaZPJEAIrVAtX+6S//1+OpfWRFVFCP4eUMNeX8UrSJY+DDn0d5sdYsmwCI20q
	SkWM5ldbtLbX9KeWsrt6119qCjgEcnsf788kOgQRV1mxofHtWryFiqilaIwFecuy6tQQG8nbVQn
	jBQ0VXbMI4VTtmcjWqpdB2VzlKbOKidWe3+wCm23xT/VcEKYaCi9uJ/kErJvyfHZ1Vmkli7vFoE
	jTzIT7yPbAOauEa4RmJCWqO7bUPXnyVH4PHt/PF3Um4nFZIxTumbDlewdxW1GQ4liLGPQULbS78
	MgSjWDFonr/Xmtd1nr741VXJPrs=
X-Google-Smtp-Source: AGHT+IF9MIXfLI2f+l3vZrmpWsVMAbDQ6m2k/bXdDwdP6GtxYOfKes3CaFLYE70qbRu56RhriQZNEKgooZzENePgkQQ=
X-Received: by 2002:a05:6512:3f21:b0:594:74f9:3b3 with SMTP id
 2adb3069b0e04-596a3ed9656mr6294225e87.29.1764147416687; Wed, 26 Nov 2025
 00:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org> <c478f7a0f3b91585618ec8e5ee57c5c4efd59f32.camel@pengutronix.de>
In-Reply-To: <c478f7a0f3b91585618ec8e5ee57c5c4efd59f32.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 09:56:45 +0100
X-Gm-Features: AWmQ_bkAPGoCaea5uJw4-olaFakaRhMEfIb_7ReFSIvCMQZe0Q_79HToib-ZsjI
Message-ID: <CAMRc=Mf7CMeZSUJLnteC9Xk5WvG_EKn3vx+jzcWNaWAvpvT00Q@mail.gmail.com>
Subject: Re: [PATCH] reset: gpio: add a devlink between reset-gpio and its consumer
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:33=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Hi Bartosz,
>
> On Di, 2025-11-25 at 13:55 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The device that requests the reset control managed by the reset-gpio
> > device is effectively its consumer but the devlink is only established
> > between it and the GPIO controller exposing the reset pin. Add a devlin=
k
> > between the consumer of the reset control and its supplier. This will
> > allow us to simplify the GPIOLIB code managing shared GPIOs when
> > handling the corner case of reset-gpio and gpiolib-shared interacting.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > This change will allow us to simplify the code in gpiolib-shared.c in
> > the next cycle, so it would be awesome if it could make v6.19.
> >
> > Val: I'm Cc'ing you as you're already playing with audio on hamoa. If v=
2
> > of the reset-gpios fix works for you, could you please also test this
> > and make sure it doesn't break anything with soundwire?
> >
> > Thanks in advance,
> > Bart
> > ---
> >  drivers/reset/core.c | 73 +++++++++++++++++++++++++++++++++++++++++---=
--------
> >  1 file changed, 58 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> >
> > -static int reset_add_gpio_aux_device(struct device *parent,
> > -                                  struct fwnode_handle *swnode,
> > -                                  int id, void *pdata)
> > +static struct auxiliary_device *
> > +reset_add_gpio_aux_device(struct device *parent, struct fwnode_handle =
*swnode,
> > +                       int id, void *pdata)
>
> This function grows ever more similar to auxiliary_device_create().
>

I could have used it if not for the fact that it calls
device_set_of_node_from_dev() and we don't want it.

> s/add/create/?

I don't mind but would prefer to not overload this patch.

> > +
> > +static void reset_gpio_add_devlink(struct device_node *np,
> > +                                struct reset_gpio_lookup *rgpio_dev)
> > +{
> > +     struct device *consumer;
> > +
> > +     /*
> > +      * We must use get_dev_from_fwnode() and not of_find_device_by_no=
de()
> > +      * because the latter only considers the platform bus while we wa=
nt to
> > +      * get consumers of any kind that can be associated with firmware
> > +      * nodes: auxiliary, soundwire, etc.
> > +      */
> > +     consumer =3D get_dev_from_fwnode(of_fwnode_handle(np));
>
> If called via __reset_control_get(), this just reconstructs the device
> from dev->of_node. I think it would be better to move the linking into
> __reset_control_get() and use the passed in consumer device directly.
>

That would affect all users, do we want this? In most cases they will
already have a link with different flags. I don't think this is
correct.

> > +     if (consumer) {
> > +             if (!device_link_add(consumer, &rgpio_dev->adev->dev, DL_=
FLAG_STATELESS))
>
> Who removes this link when the consumer puts the reset control, or if
> we error out later?
>

Nobody. Here's why: the reset-gpio device never gets removed. If we're
here, this means it's already registered. If the consumer is unbound,
the devlink stays in place. When we rebind, device_link_add() will do
nothing. If the consumer device is released, we purge all links
anyway. Let me know if I'm wrong, but seems to me, it's fine to leave
it and make it stateless.

Bart

