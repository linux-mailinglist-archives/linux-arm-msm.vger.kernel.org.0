Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C271016A654
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 13:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgBXMoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 07:44:15 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44736 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgBXMoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 07:44:15 -0500
Received: by mail-lf1-f65.google.com with SMTP id 7so6690638lfz.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2020 04:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RqVbf+yX/EbyvbniGxwMX8pWWpjIuygOZP3gXQQJI6A=;
        b=Z+j2VuAgzOlGqCmnW0/EjPQxScny4nAUkCwxEWWYOzl7DpD41nUrZt7FioRvJuLp02
         V0GhSfEHSso6sGY6K1Fq5QsljoxjTyoGX0/X1rzWZJREXO6SXttbIcpbLSJEZyxQtizz
         UW4UVfMNZNXUf1P5u/lL+WxC5ZJ1A28h/jSbuIGGnVafqIbg0+6K7Lky1CzxZWbHkZ+H
         rddz54pHjaWmcLEw0Nutdg1+gMPnzXhRrDa3CNjajUpTyxtJy0kHiB/nFjHLF8RSmqbn
         frvnAnHYSYICNZgkY6gugFWm7/DgE2aLabr7OZHtbrjH/es3i5W/8KsOtQ01V5jwZNY0
         +2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RqVbf+yX/EbyvbniGxwMX8pWWpjIuygOZP3gXQQJI6A=;
        b=KjAo5Is9u8BlJSENnXj5okc8o0KxPp59O3SjU0P2mFJdCYzi5/G5KEMzxkyREgzaQV
         JQKb/zcBEqkXWRsKxgQZYGNln7C7JILU/1wnoXTqEbydHi36aMqeGiRf6f1NsteCHkYM
         7n2lYnMNkTNh0mupJzJaYEsuBrQ02MiXyTN0Pil/oJN33LnUtNTHp+3Tev4CTfRrxQrR
         +7tifu1OwEbtf7cfyjJJ8TrWbfuE3aoZIPUt7BW00Ne5lldrles2w7W915o0Q+ZL7SGX
         KpLsg2E5kGPsCUqexHJ0UHJ4soX440FwQ6u0VQ55Q4vc4wieP57/QXZpeusapt64yYBi
         lvBQ==
X-Gm-Message-State: APjAAAU5Fd3UThwj369l/VjlP3oGcv50KlZUHIifz8odXnnrkRMnxBVf
        A8mLgdb7vGNmra2+cS5HqCVtSTzX8+5L/xsNsKdKcA==
X-Google-Smtp-Source: APXvYqylJfq3rATezEsUBf+r45PPCY8dAE3Qwt2tVxkwhDcOEpXKiANmplEGxOt1S0zIvDXyrq0LQ3O3r02nf3eD0Rk=
X-Received: by 2002:a19:6d13:: with SMTP id i19mr26465541lfc.6.1582548253189;
 Mon, 24 Feb 2020 04:44:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582048155.git.amit.kucheria@linaro.org>
 <4f5a4175371ac7973061cd4f9d19674ac308672c.1582048155.git.amit.kucheria@linaro.org>
 <158215713699.184098.4863049384855658604@swboyd.mtv.corp.google.com>
In-Reply-To: <158215713699.184098.4863049384855658604@swboyd.mtv.corp.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Feb 2020 18:14:02 +0530
Message-ID: <CAP245DUfcfcjMKixpJ9jkvN76nnAKdfBiDcNhSH6rSy0cUY=Bw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] drivers: thermal: tsens: Add critical interrupt support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, Amit Kucheria <amit.kucheria@verdurent.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 5:35 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2020-02-18 10:12:09)
> > diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> > index 0e7cf5236932..5b003d598234 100644
> > --- a/drivers/thermal/qcom/tsens.c
> > +++ b/drivers/thermal/qcom/tsens.c
> > @@ -125,6 +125,28 @@ static int tsens_register(struct tsens_priv *priv)
> >                 goto err_put_device;
> >         }
> >
> > +       if (priv->feat->crit_int) {
> > +               irq_crit = platform_get_irq_byname(pdev, "critical");
> > +               if (irq_crit < 0) {
> > +                       ret = irq_crit;
> > +                       /* For old DTs with no IRQ defined */
> > +                       if (irq_crit == -ENXIO)
> > +                               ret = 0;
> > +                       goto err_crit_int;
> > +               }
> > +               ret = devm_request_threaded_irq(&pdev->dev, irq_crit,
> > +                                               NULL, tsens_critical_irq_thread,
> > +                                               IRQF_ONESHOT,
> > +                                               dev_name(&pdev->dev), priv);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "%s: failed to get critical irq\n", __func__);
> > +                       goto err_crit_int;
> > +               }
> > +
> > +               enable_irq_wake(irq_crit);
> > +       }
> > +
> > +err_crit_int:
>
> Why use a goto? Can't this be done with if-else statements?
>
>        if (priv->feat->crit_int) {
>                irq_crit = platform_get_irq_byname(pdev, "critical");
>                if (irq_crit < 0) {
>                        ...
>                } else {
>                        ret = devm_request_threaded_irq(&pdev->dev, irq_crit,
>                                                        NULL, tsens_critical_irq_thread,
>                                                        IRQF_ONESHOT,
>                                                        dev_name(&pdev->dev), priv);
>                        if (ret)
>                                dev_err(&pdev->dev, "%s: failed to get critical irq\n", __func__);
>                        else
>                                enable_irq_wake(irq_crit);
>                }
>        }
>
> Or if the nesting is so deep that we need goto labels then perhaps it
> needs to be another function.

So the if-else form only slightly improved the readability. But moving
it to a function made it much better, IMO. So I went with that.

Thanks for the review.

Regards,
Amit

> >         enable_irq_wake(irq);
> >
> >  err_put_device:
