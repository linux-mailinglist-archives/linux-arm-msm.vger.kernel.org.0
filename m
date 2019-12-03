Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5F710F670
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 05:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLCE5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 23:57:22 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40580 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfLCE5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 23:57:22 -0500
Received: by mail-vs1-f65.google.com with SMTP id g23so1521870vsr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 20:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ml7IBhdccfwW8j+1FG8S3XplDMBYZxcPTBvONmJE1w4=;
        b=hzBgzHbtVIyov5zqV3RPememS0AoB5zpkOlw8cfhalKrZwGNpYSLoE0xQf4l02oWrV
         FQIwZiBvAZGZJ/BLUAO+1ElZTAkEskhn665uiBkS/GtVX27yP0iD3c5CkHdCKNx9l6In
         UFupIM/RbBb37lwylN9sEEofwxfW2F/UqYr5luhxyHmAL1N16l9X7W2mEZvw/ZNL6z5H
         Bw0S6R/TIziKvfDb0bRK17RsVL3J33ww8NtVkfr2CaQtHOH+X9xfeD6ku0Dv40XKt/eg
         yOyby/1W9LCUCJpSHehZru40vphONetoeBGtYAtubxFjaRwoy0ue+KAF6POvHQs4DZ9a
         Fwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ml7IBhdccfwW8j+1FG8S3XplDMBYZxcPTBvONmJE1w4=;
        b=Hdvl8R3QkZ+yZmc7CPO/SWbOurqjaBcNIZDkp8Y3637arWwddH09FoC36Yd+Hb9TI6
         qHj6fHgWS87vCoR0eScT18xxfOqNQDciYx0EUE3M/+w7HAnXFYYx2UvxsEfOH4N+vPCt
         xjEyeTUi9z4lu1ElOfCJC8ryIPb3wEyG9R4J0WsPgy+mapQ0PB2wXk75iDXmlEfnXJ/7
         wd8NzyJUpPn55ypHvoHqmZMKTPgjFRV3eQM/EhGqdgnsujSBXZO/Q1ocY6oUanb2jd90
         o208RDSubFVkUp2D+wL2p9XALZUusRmd05QEXj/9TA5JQiE4F1JD6pN6Jnuh/RH+bWUQ
         vfsw==
X-Gm-Message-State: APjAAAWJpXXEPVH+Lou92H8bQupGm5JIuk2EAjd60Dame3LBRjKgFdW1
        MovYyO/fwIebhWBNeFXGBP0dXIPpWC0Er5n4FModCw==
X-Google-Smtp-Source: APXvYqzzuJ7zVrjIE0Y2zaZ/PAovWXEvXm3YYHoOqOoTi9vqEY52XFNHaanurVBB7nEb72UyUNt1t6NXf2SV3i7mJvQ=
X-Received: by 2002:a05:6102:1261:: with SMTP id q1mr1756256vsg.182.1575349040559;
 Mon, 02 Dec 2019 20:57:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573499020.git.amit.kucheria@linaro.org>
 <4b949a4f401a7f9d403ed0f0c16c7feb083f3524.1573499020.git.amit.kucheria@linaro.org>
 <5dcdda2a.1c69fb81.27852.ac35@mx.google.com>
In-Reply-To: <5dcdda2a.1c69fb81.27852.ac35@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 3 Dec 2019 10:27:09 +0530
Message-ID: <CAHLCerNw_FuFeqDfckjmsSE+=ZGCn5EkvquUtDn7EEVjrw9aVQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drivers: thermal: tsens: Add critical interrupt support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, sivaa@codeaurora.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 4:20 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-11-11 11:21:27)
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 4359a4247ac3..2989cb952cdb 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -321,6 +357,65 @@ static inline u32 masked_irq(u32 hw_id, u32 mask, enum tsens_ver ver)
> >         return 0;
> >  }
> >
> > +/**
> > + * tsens_critical_irq_thread - Threaded interrupt handler for critical interrupts
> > + * @irq: irq number
> > + * @data: tsens controller private data
> > + *
> > + * Check all sensors to find ones that violated their critical threshold limits.
> > + * Clear and then re-enable the interrupt.
> > + *
> > + * The level-triggered interrupt might deassert if the temperature returned to
> > + * within the threshold limits by the time the handler got scheduled. We
> > + * consider the irq to have been handled in that case.
> > + *
> > + * Return: IRQ_HANDLED
> > + */
> > +irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> > +{
> > +       struct tsens_priv *priv = data;
> > +       struct tsens_irq_data d;
> > +       bool enable = true, disable = false;
>
> Why not just use true and false in the one place these variables are
> used?

Will fix.

> > +       unsigned long flags;
> > +       int temp, ret, i;
> > +
> > +       for (i = 0; i < priv->num_sensors; i++) {
> > +               struct tsens_sensor *s = &priv->sensor[i];
>
> Maybe make this const?

OK.

>
> > +               u32 hw_id = s->hw_id;
> > +
> > +               if (IS_ERR(priv->sensor[i].tzd))
>
> IS_ERR(s->tzd)?

Yup.

>
> > +                       continue;
> > +               if (!tsens_threshold_violated(priv, hw_id, &d))
> > +                       continue;
> > +               ret = get_temp_tsens_valid(s, &temp);
>
> Can this accept a const 's'?

Yes.

> > +               if (ret) {
> > +                       dev_err(priv->dev, "[%u] %s: error reading sensor\n", hw_id, __func__);
> > +                       continue;
> > +               }
> > +
> > +               spin_lock_irqsave(&priv->ul_lock, flags);
> > +
> > +               tsens_read_irq_state(priv, hw_id, s, &d);
> > +
> > +               if (d.crit_viol &&
> > +                   !masked_irq(hw_id, d.crit_irq_mask, tsens_version(priv))) {
> > +                       tsens_set_interrupt(priv, hw_id, CRITICAL, disable);
> > +                       if (d.crit_thresh > temp) {
> > +                               dev_dbg(priv->dev, "[%u] %s: re-arm upper\n",
> > +                                       priv->sensor[i].hw_id, __func__);
>
> hw_id instead of priv->sensor...?

Done. Will fixup for older code in a separate patch.

> > +                       } else {
> > +                               dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
> > +                                       hw_id, __func__, temp);
> > +                       }
> > +                       tsens_set_interrupt(priv, hw_id, CRITICAL, enable);
> > +               }
> > +
> > +               spin_unlock_irqrestore(&priv->crit_lock, flags);
> > +       }
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> >  /**
> >   * tsens_irq_thread - Threaded interrupt handler for uplow interrupts
> >   * @irq: irq number
> > diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> > index 7d317660211e..784c4976c4f9 100644
> > --- a/drivers/thermal/qcom/tsens.c
> > +++ b/drivers/thermal/qcom/tsens.c
> > @@ -121,6 +121,27 @@ static int tsens_register(struct tsens_priv *priv)
> >
> >         enable_irq_wake(irq);
> >
> > +       if (tsens_version(priv) > VER_1_X) {
> > +               irq = platform_get_irq_byname(pdev, "critical");
> > +               if (irq < 0) {
> > +                       ret = irq;
> > +                       goto err_put_device;
> > +               }
> > +
> > +               ret = devm_request_threaded_irq(&pdev->dev, irq,
> > +                                               NULL, tsens_critical_irq_thread,
> > +                                               IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +                                               dev_name(&pdev->dev), priv);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "%s: failed to get critical irq\n", __func__);
> > +                       goto err_put_device;
>
> Do we need to disable_irq_wake() for the previous irq here?

Or we could just move the earlier enable_irq_wake() to after
successful registration of the critical interrupt to avoid the error
branch. See v2 posting.



> > +               }
> > +
> > +               enable_irq_wake(irq);
> > +       }
> > +
> > +       return 0;
> > +
> >  err_put_device:
> >         put_device(&pdev->dev);
> >         return ret;
