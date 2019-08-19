Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BF894F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 22:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfHSUvl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 16:51:41 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38155 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfHSUvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 16:51:41 -0400
Received: by mail-vs1-f66.google.com with SMTP id 62so2095943vsl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+KzCPfliyJhvJ1c0iMQplTZBNeAA1mxUAJd/xcjNV38=;
        b=ZihfdZckUcDLIFJ3PBKZNuHrFkrg+kl8Q6esH4q1/HG09NGkQVfscJhS9miTcnmWs9
         hceJ+fMwhxQGzS0Dy9BDD+njDCPCL+AijCDXvK7SmVsHl+YoMxmceVUYrKOcgGznl2yS
         OZjTRZi60IVwsHNDqxCqC/BCb48qPqWzB6cOmQCpoS+nSoynsxYXKC1v67kB7oEOMjUx
         d4qS6L6FJPzQsjexyx1rl4fX21XNUBdvlwjtv2AFsPKyatA11Da4oAkHVQD+iG7UVRBp
         s7RFnzAncWiSWDYWZEWm/VOXRHf3po8HA7y0L2/spCPNggZ+yUTZKNoz3vCGQ9w0mM53
         VYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+KzCPfliyJhvJ1c0iMQplTZBNeAA1mxUAJd/xcjNV38=;
        b=L0WAXBXxm1mcQEY7BDhrQth0UKOM49aOp/zbooX15zBkZZDcxxJC0czScNSQdevMHO
         COMTMHi4T82xDv7Xdxg22LW8k2rjndc4iAigd2aPD6m+FmG3Trn7GXIhBElhRHyo/6S4
         4vLUaomRUT3uKLHQNC4E6PySrmLANteJRUcKxW9gqpFcUye71/8H9FfM9V9xwi1OX5u9
         0IlsLCyFxiYgqtfKStWGg9ln7YGdlDbDrrwnGjGLIJ60f4uTseVIxbxn41Cr7xxrODIp
         D7O/mVcKJDn0TlRXz2ByeTv5nOPoAckTAbyMudxHJZN4AUw4lsaw/Iwlwl6qka2cfL+N
         gsiQ==
X-Gm-Message-State: APjAAAVaVXhCI3GWSCfunkY5xHhB0DQW6c34QEPuTudI/ykIFiWMrsdP
        7b0ppe6zvpDZ6oKZR6GRNOmTN1GOSy906mJCLU1/OQ==
X-Google-Smtp-Source: APXvYqwMeMBbIPB8ft3bcughnTjtU/edJ5Dpzo878P9xKkEJ1gCCS8aAJV2Gg+izjIwwMP3lPY6yhB4o44HWe21dUZU=
X-Received: by 2002:a67:df07:: with SMTP id s7mr11007757vsk.27.1566247899971;
 Mon, 19 Aug 2019 13:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <07de61a57cf2362169d3b128405d7305eb20785f.1564091601.git.amit.kucheria@linaro.org>
 <5d577f95.1c69fb81.6c07e.44da@mx.google.com>
In-Reply-To: <5d577f95.1c69fb81.6c07e.44da@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 20 Aug 2019 02:21:28 +0530
Message-ID: <CAHLCerN+xBTQapOeJRuX2=-Fo1GSVBhG-84memLHS4bG+SHyLw@mail.gmail.com>
Subject: Re: [PATCH 14/15] drivers: thermal: tsens: Create function to return
 sign-extended temperature
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 17, 2019 at 9:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-07-25 15:18:49)
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 7ab2e740a1da..13a875b99094 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -84,13 +84,35 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
> >         return degc;
> >  }
> >
> > +/**
> > + * tsens_hw_to_mC - Return properly sign extended temperature in mCelsius,
>
> Can you make this proper kernel-doc? Describe the arguments and have a
> "Return:" section.

Will fix.

> > + * whether in ADC code or deciCelsius depending on IP version.
> > + * This function handles the different widths of the signed integer across IPs.
> > + */
> > +static int tsens_hw_to_mC(char *str, struct tsens_sensor *s, int field, int temp)
> > +{
> > +       struct tsens_priv *priv = s->priv;
> > +       u32 mask;
> > +
> > +       if (priv->feat->adc) {
> > +               /* Convert temperature from ADC code to milliCelsius */
> > +               return code_to_degc(temp, s) * 1000;
> > +       } else {
>
> Please deindent and drop the else because there's a return above.

Will fix.


> > +               mask = GENMASK(priv->fields[field].msb,
> > +                              priv->fields[field].lsb) >> priv->fields[field].lsb;
>
> Why is the mask generated, shifted right, sent into fls(), and then
> passed to sign_extend32? Shoudln't it be something like
>
>         sign_extend32(temp, priv->fields[field].msg - priv->fiels[field].lsb - 1)

Yes, that should work and greatly simply the function. Will fix.

> > +               dev_dbg(priv->dev, "%s: mask: %d\n", str, fls(mask));
> > +               /* Convert temperature from deciCelsius to milliCelsius */
> > +               return sign_extend32(temp, fls(mask) - 1) * 100;
> > +       }
> > +}
> > +
> > @@ -112,15 +134,7 @@ int get_temp_tsens_valid(struct tsens_sensor *s, int *temp)
> >         if (ret)
> >                 return ret;
> >
> > -       if (priv->feat->adc) {
> > -               /* Convert temperature from ADC code to milliCelsius */
> > -               *temp = code_to_degc(last_temp, s) * 1000;
> > -       } else {
> > -               mask = GENMASK(priv->fields[LAST_TEMP_0].msb,
> > -                              priv->fields[LAST_TEMP_0].lsb);
> > -               /* Convert temperature from deciCelsius to milliCelsius */
> > -               *temp = sign_extend32(last_temp, fls(mask) - 1) * 100;
>
> Oh the code is copied. Seems really complicated still.
>
> > -       }
> > +       *temp = tsens_hw_to_mC("get_temp", s, LAST_TEMP_0, last_temp);
