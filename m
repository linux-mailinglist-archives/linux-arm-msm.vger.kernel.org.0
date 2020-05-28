Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30D71E52A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 03:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgE1BIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 21:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgE1BIt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 21:08:49 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBB3C03E96E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 18:08:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y18so12642595pfl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 18:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CL/IKWXXhgD7nYIcRM77gSNJoAiFSfa9BaKCTrGTTAY=;
        b=PVn9xmlsNpJBnmTG7486QBKPU4B72Pcbl2qmBfKYmIXiMih8cpnIr3UIEpPyUgvs2Z
         sKYYsC88fgKW9B9veGnXrBl1ICYi6SsNl5Q2Dytzu4A9uAB8LJ/qT8rYmMA54tSxalB3
         DQw+lWyS2VDPILubigwUOR2Liw263AYeZhrVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CL/IKWXXhgD7nYIcRM77gSNJoAiFSfa9BaKCTrGTTAY=;
        b=hn3YDObbii/GU7gkqb/gmLCt+5qX9AxE5coByafgOgDZsqf+VIeqkxykJ7BaG9Y3Y4
         XaMsSBewLG2+x7XRKWnyt6so3kinZ7iOXbB4adXTptgiLLBtK064oHtGGHZKr6ustPFD
         yGXsJc4YcJV3+WDzy0SpD6AE14cEZJUtkVrp/gGVia2NngMgBETnKJXBoio6Jm6TZPm5
         4ku5dloNYPnIUXMlWACrBqGm1ryA6N1Pa+AWjxZZ7s8APnCKBAW06kuZnNR/AmsLtwI8
         GwOx14CYoJd2pZuz5P5RFcLDw1lH5hO5VrC8MaqSy5Q2milAgnPppMZu+tfbw+XM5PZl
         1+Ew==
X-Gm-Message-State: AOAM533HWuVlOlIUfz/w+rVSNLtwvol3Mx/kURQK9KUdYUaYEaYk64Dw
        XbO9nkvB2/B+5TN5bRa0po9wBw==
X-Google-Smtp-Source: ABdhPJxIemgLPr3D6mtUM3FpmOsuWeq5aNiqkRnMIlOzQPkgTmCeYfEj0EISKOoBynt6RLBuPAu8VQ==
X-Received: by 2002:a62:e402:: with SMTP id r2mr501008pfh.300.1590628128117;
        Wed, 27 May 2020 18:08:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e1sm3033758pgj.0.2020.05.27.18.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 18:08:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4e070cda-8c22-c554-610e-172320045840@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-2-git-send-email-mkshah@codeaurora.org> <159057264232.88029.4708934729701385486@swboyd.mtv.corp.google.com> <4e070cda-8c22-c554-610e-172320045840@codeaurora.org>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Wed, 27 May 2020 18:08:46 -0700
Message-ID: <159062812628.69627.2153485337510882984@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-05-27 04:26:14)
> On 5/27/2020 3:14 PM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-05-23 10:11:10)
> >> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >> index eaa0e20..3810cd0 100644
> >> --- a/drivers/gpio/gpiolib.c
> >> +++ b/drivers/gpio/gpiolib.c
> >> @@ -2465,32 +2465,37 @@ static void gpiochip_irq_relres(struct irq_dat=
a *d)
> >>          gpiochip_relres_irq(gc, d->hwirq);
> >>   }
> >>  =20
> >> +static void gpiochip_irq_mask(struct irq_data *d)
> >> +{
> >> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> >> +
> >> +       if (gc->irq.irq_mask)
> >> +               gc->irq.irq_mask(d);
> >> +       gpiochip_disable_irq(gc, d->hwirq);
> > How does this work in the lazy case when I want to drive the GPIO? Say I
> > have a GPIO that is also an interrupt. The code would look like
> >
> >   struct gpio_desc *gpio =3D gpiod_get(...)
> >   unsigned int girq =3D gpiod_to_irq(gpio)
> >
> >   request_irq(girq, ...);
> >
> >   disable_irq(girq);
> >   gpiod_direction_output(gpio, 1);
> >
> > In the lazy case genirq wouldn't call the mask function until the first
> > interrupt arrived on the GPIO line. If that never happened then wouldn't
> > we be blocked in gpiod_direction_output() when the test_bit() sees
> > FLAG_USED_AS_IRQ? Or do we need irqs to be released before driving
> > gpios?
>=20
> The client driver can decide to unlazy disable IRQ with below API...
>=20
>  =C2=A0irq_set_status_flags(girq, IRQ_DISABLE_UNLAZY);
>=20
> This will immediatly invoke mask function (unlazy disable) from genirq,=20
> even though irq_disable is not implemented.
>=20

Sure a consumer can disable the lazy feature, but that shouldn't be
required to make this work. The flag was introduced in commit
e9849777d0e2 ("genirq: Add flag to force mask in
disable_irq[_nosync]()") specifically to help devices that can't disable
the interrupt in their own device avoid a double interrupt.
