Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88FEA11C9D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 10:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfLLJrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 04:47:40 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38308 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbfLLJrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 04:47:40 -0500
Received: by mail-vs1-f68.google.com with SMTP id y195so1098127vsy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMdYxxFfvBek0xJ9ws+XcV7OOK6TvbtKYblfPXo5Bx0=;
        b=YaRmG0heHRTf1YamJewuwAaiScR2GhbNbuFYwcWc774QrWgGn/hDMHYjrvYeU/DYec
         cMcfapTQsaH8k+N5fBhhDROkyzgZQDNeGp9uJp1QBVXQ21hQHFiTmCEuY/TvgDo5tv7m
         RU09slsydMagH6yxibKUjcgugntALY8e2zRAggP/1tfg3dX693SU9ta/i9LI79Md9Ih4
         lQaCQ7W7TF6D866/pFhPtRaqD6aUhJQ0ry+w+6QsFxIY039aSSKHSqVsQJqtJAiNgJzA
         1Sp3LGvRApxwMgSj+MBq1b3P/Lqngavqp+MjuhAhwjdgM8YS0NvJGev3NDgjsamNsI5p
         SSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMdYxxFfvBek0xJ9ws+XcV7OOK6TvbtKYblfPXo5Bx0=;
        b=F4DpKiW9i273a838R+DaVDYDXPRIEjDgdVL+p6PbgKa43afTycIYOJroS21dCPFanT
         iw1Z5q9fyrR8VYRFLa51wqeWkveHGVPxuBNyaokJF0RHxs+uvHfRxc9FWDLlQVLa/msK
         oSE0iz6jC2Bnpq64LJSRMYegW3tRtMmZJLfKyKa6uR7LTjeYQ/PQJ1ikGpXLc7WvV1TX
         MlrvGkVovS4Viu12GvSkd42ZTqYqx/WrRWnaiJ3hdHDNN2ElowpFUHZVNkSqWmkeuXnK
         AaHqukL7tbKf5SgpocDP9JHAf4oN8uw+YGpSFyhF6cIiNZiClrWXQ8T/ONMxg5Msl7/b
         jidQ==
X-Gm-Message-State: APjAAAXnxaHUqN9dPkMgTmz4KhUy/u/8MzbqeQ65ZGo82quNZ0drLTns
        b+cl7IkI1bsUIqkzs3ZVjJsHZaS5frVJu4Fl6Zr0HA==
X-Google-Smtp-Source: APXvYqz8bK51w8cXg8sOtlUH7nWrRPa31mFluvuPeG5or8/JqfR3jGZ+5D05DuNVCe7n2wO7bU++jdNTF+FXWAL0llg=
X-Received: by 2002:a67:f496:: with SMTP id o22mr6244893vsn.9.1576144059117;
 Thu, 12 Dec 2019 01:47:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576058136.git.amit.kucheria@linaro.org>
 <39d6b8e4b2cc5836839cfae7cdf0ee3470653b64.1576058136.git.amit.kucheria@linaro.org>
 <20191211171313.GA1530@gerhold.net>
In-Reply-To: <20191211171313.GA1530@gerhold.net>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 12 Dec 2019 15:17:27 +0530
Message-ID: <CAHLCerNYiuu_KA7ixjDmXLx0x8Bbodf5=BBEDBBY3qS_P5GAPg@mail.gmail.com>
Subject: Re: [PATCH] drivers: thermal: tsens: Work with old DTBs
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Olof Johansson <olof@lixom.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 10:43 PM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi Amit,
>
> Thanks for the patch!
>
> On Wed, Dec 11, 2019 at 03:28:33PM +0530, Amit Kucheria wrote:
> > In order for the old DTBs to continue working, the new interrupt code
> > must not return an error if interrupts are not defined.
> >
> > Fixes: 634e11d5b450a ("drivers: thermal: tsens: Add interrupt support")
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  drivers/thermal/qcom/tsens.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> > index 015e7d2015985..d8f51067ed411 100644
> > --- a/drivers/thermal/qcom/tsens.c
> > +++ b/drivers/thermal/qcom/tsens.c
> > @@ -109,7 +109,7 @@ static int tsens_register(struct tsens_priv *priv)
> >
> >       irq = platform_get_irq_byname(pdev, "uplow");
> >       if (irq < 0) {
> > -             ret = irq;
> > +             dev_warn(&pdev->dev, "Missing uplow irq in DT\n");
> >               goto err_put_device;
> >       }
>
> platform_get_irq_byname() already logs an error if the IRQ cannot be
> found: qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
>
> To replace that error with a warning (not sure if that is worth it),
> we would need to replace the call with platform_get_irq_byname_optional().

I didn't know about optional, interesting.

> >
> > @@ -118,7 +118,8 @@ static int tsens_register(struct tsens_priv *priv)
> >                                       IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >                                       dev_name(&pdev->dev), priv);
> >       if (ret) {
> > -             dev_err(&pdev->dev, "%s: failed to get irq\n", __func__);
> > +             dev_warn(&pdev->dev, "%s: failed to get uplow irq\n", __func__);
> > +             ret = 0;
> >               goto err_put_device;
>
> In case of the old DT, platform_get_irq_byname() will return -ENXIO,
> because no interrupt is specified in the device tree.
> So we should have already run into the error earlier,
> and jumped to "err_put_device".
>
> Is this hunk really necessary?

You're right. Just checking for ENXIO should be enough for old DTs.

> In other words, wouldn't it be enough to do something like
>
> @@ -110,6 +110,8 @@ static int tsens_register(struct tsens_priv *priv)
>         irq = platform_get_irq_byname(pdev, "uplow");
>         if (irq < 0) {
>                 ret = irq;
> +               if (ret == -ENXIO)
> +                       ret = 0;
>                 goto err_put_device;
>         }
>
> ... to essentially ignore only the "IRQ does not exist" condition
> for old device trees?

Thanks for the review.
