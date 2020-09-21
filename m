Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED83271B33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 09:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgIUHBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 03:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgIUHBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 03:01:46 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DF6C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:01:46 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so16195261eja.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjMYEEczJEOHA4JBA+9gW1syQIL4h1mALCkGQnpuf/w=;
        b=FOWnb6d/bbmT8xKmJWTtp1O6eqze30JKhqcnudvJgFs28fy6rUkwnrB9dD3JMV8lWF
         ZLgmf/9sk9b5Z8cYi4yJOALpFCH27Qf3oJqNhsR5nvTLjYOs94AEgmLzrbULtXOk5Y6J
         vjcB9kRMTo7ToaJJL/7XZz1SqO5kjkPrzszNXmPfNC2s86rHZ9UAP78B0HJv5vjunCjP
         VwDtTrhXIqJpiAnP7uN5rre8UfMCWKOOGYXYCjl0LeoYSh6jkChrZvtd9eTj60ANg8Hh
         rBfKr4wafwaVGY8hT1wpgNzJJqxlSfh3h74Oxn6yfc+jChCGrbPhKRvTqxDu/mU0gxwM
         +kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjMYEEczJEOHA4JBA+9gW1syQIL4h1mALCkGQnpuf/w=;
        b=N1APf2K+CuPdMaEyc8F6rzv4W9O5V3ufAf+DdpbqSGVDcbB2D/tbKRkPIsnq+jv0WW
         fl37ZL/w0jQk2CKEr6bYvyg4j7pqfM3zVMYFj+Wr0O1sRjZX/gFUjzKNvVLUOadndUjY
         whVTNYtoobSJaDYY8Zz7opVDgID3MbwuQMmOESXWlOyraLEh4U8GDLj8Rn9cSjjFuKVo
         44rFczlSxyNy5M5O8rXG1C/i+gdYOAWEkd3bNwBlC3tWL9VqrwrzZXNqzaJMzzq4YKic
         pRA3pp5Qs0IYOfQwtzHU+EsDohs9fPlewBF7NhGoXLVvYB6aNbi2pIamliq/v2bdzSGd
         oeuw==
X-Gm-Message-State: AOAM532ZQNYhayUX5dx2BC8iAL6XlKWw5IZ8ab6ATz3qZzrf1ssGOEe+
        X5uWNbfc1KM9vPVMhoqsloyXStfp2WJCIG3Cqo2nYm6Vjz9Hiw==
X-Google-Smtp-Source: ABdhPJz1dHb/oi9Euxf+YINz9rUIXnsx4eHtOrSMJqinhZBh8hLs+aH8CwcueNJDBRBJ85M4IuUNhhwD+TETy/wtp9k=
X-Received: by 2002:a17:906:4087:: with SMTP id u7mr48612376ejj.466.1600671705048;
 Mon, 21 Sep 2020 00:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <1600414128-5510-1-git-send-email-loic.poulain@linaro.org> <c7d5abb9ecb9d9558c154dddb53385b1@codeaurora.org>
In-Reply-To: <c7d5abb9ecb9d9558c154dddb53385b1@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 21 Sep 2020 09:07:00 +0200
Message-ID: <CAMZdPi-_56g7UYQRJLh9=EDuAb+KoXyTo-cWyK4vtJy25gON4A@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Allow shared IRQ for event rings
To:     bbhatt@codeaurora.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Sat, 19 Sep 2020 at 04:43, <bbhatt@codeaurora.org> wrote:
>
> On 2020-09-18 00:28, Loic Poulain wrote:
> > There is no requirement for using a dedicated IRQ per event ring.
> > Some systems does not support multiple MSI vectors (e.g. intel
> > without CONFIG_IRQ_REMAP), In that case the MHI controller can
> > configure all the event rings to use the same interrupt (as fallback).
> >
> > Allow this by removing the nr_irqs = ev_ring test and add extra check
> > in the irq_setup function.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/core/init.c | 10 ++++++++++
> >  drivers/bus/mhi/core/pm.c   |  3 ---
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index d232938..ac19067 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -113,6 +113,9 @@ int mhi_init_irq_setup(struct mhi_controller
> > *mhi_cntrl)
> >       struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >       int i, ret;
> >
> > +     if (mhi_cntrl->nr_irqs < 1)
> > +             return -EINVAL;
> > +
>
> It would be better to move this check earlier in
> mhi_register_controller() because if
> the resource is not available, we do not have to proceed to even allow
> power up.


Ok, will do in V2.

>
>
> >       /* Setup BHI_INTVEC IRQ */
> >       ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
> >                                  mhi_intvec_threaded_handler,
> > @@ -125,6 +128,13 @@ int mhi_init_irq_setup(struct mhi_controller
> > *mhi_cntrl)
> >               if (mhi_event->offload_ev)
> >                       continue;
> >
> > +             if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> > +                     dev_err(dev, "irq %d not available for event ring\n",
> > +                             mhi_event->irq);
> > +                     ret = -EINVAL;
> > +                     goto error_request;
> > +             }
> > +
> >               ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
> >                                 mhi_irq_handler,
> >                                 IRQF_SHARED | IRQF_NO_SUSPEND,
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index ce4d969..07efdbc 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller
> > *mhi_cntrl)
> >
> >       dev_info(dev, "Requested to power ON\n");
> >
> > -     if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
> > -             return -EINVAL;
> > -
> >       /* Supply default wake routines if not provided by controller driver
> > */
> >       if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
> >           !mhi_cntrl->wake_toggle) {
>
> Maybe another clean-up patch is also good to remove usage of
> "mhi_cntrl->nr_irqs_req"
> as it is deemed optional anyway and is unused in the driver.


OK, I'll submit an additional patch for that.

Regards,
Loic
