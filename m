Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1693D10F697
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 06:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCFC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 00:02:57 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42381 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCFC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 00:02:56 -0500
Received: by mail-ua1-f68.google.com with SMTP id 31so848290uas.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 21:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ERmn5rq1lNnKn/P5AfwLSlBRWPm9K3lY7uKonmiuBQ=;
        b=POxFZTmnXWUJj/QSh7bNjrQKeTsKp9x3JT1UUj5Ox6CqdlasjfT0Sd+kJ3yIifanpH
         HW2KVRp/PAkRCh2/C7bnkMFPgn4E1kk6Bzfl6NKEJgMromg15+AgJGXTCKsn4fDbGhNN
         OSh5T7Lb8Ux1Hea4sE7xKWAMtj2ar9CYDt0pFzeBeufb8xWPARB2lBCWO9vTD8ITG15l
         6tte8NbCCmSfn4qKmeTnC0WLC2yg8+vRWEd31YGTDiCbzpmVDG7f7SM2yJwQz9r5509K
         uLrb+EceyEOJqhtbWNSDxAD+Ll3BJHT3t2BjpEjLLZYAgHbkeB1sHX4dS8mduopLI8uj
         7NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ERmn5rq1lNnKn/P5AfwLSlBRWPm9K3lY7uKonmiuBQ=;
        b=guvMw0m5FcwLPdrOqyw/oTHVUAxde4kT8CMJGDX9b0mbo86p+o/Yp3XR7j9Z82WORp
         bBiQQy5tZ67t5rTdIJSNg8rdPBa0YM3yFj3Of+qr/DxlWHQti7UjdnQuTgRVVJWy37OU
         2AKoPYOgk6Gx4KQmihTcqmVDoUHNvBIkSEbbslCQNNc77NYhSD+fA+5sDe/K8ncgxBAs
         yD5TNz0wNWzXOEYQzidGbohjJUgD23Bj9Y88aoA3wi7VER0ddO2Y1JBJsMmR0UCymnU4
         T0EHweuu0walSHYk3Xq063rx2qJ5VgfFxbxjxPiuWKWw870ReMP2IcmpiPLfS8lqTZu0
         PBVA==
X-Gm-Message-State: APjAAAVJ3dF7d3ZfzQ8sgvjmcG4UzLvh8XmVgk3V+ol+J+ckVWD+lByo
        KK4N3eSIE7X+VSU4/RFxE6IUb6NyBPlUZOyjXhCiRw==
X-Google-Smtp-Source: APXvYqyk8mjX0oY3ryDpuMEExI9RS0dYRl+SayJdvhnyj2hjEpQI3jjLtCw/e3hNiCcN7gK3acNuNVLsVTiJEV5H3RE=
X-Received: by 2002:ab0:7027:: with SMTP id u7mr2136566ual.94.1575349375038;
 Mon, 02 Dec 2019 21:02:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573499020.git.amit.kucheria@linaro.org>
 <4b949a4f401a7f9d403ed0f0c16c7feb083f3524.1573499020.git.amit.kucheria@linaro.org>
 <20191112193852.GC3140946@builder> <CAHLCerN1VXhU0VQWN15PB2R16mkCV0i6Mn3+LW=xXtB5_7Z6JQ@mail.gmail.com>
 <20191128214339.GL82109@yoga>
In-Reply-To: <20191128214339.GL82109@yoga>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 3 Dec 2019 10:32:43 +0530
Message-ID: <CAHLCerPmdTTfANng2uNnTRs0-Sz+jtstOD9N0MbLEvV3DYDUFw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drivers: thermal: tsens: Add critical interrupt support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 29, 2019 at 3:13 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 28 Nov 10:46 PST 2019, Amit Kucheria wrote:
>
> > On Wed, Nov 13, 2019 at 1:08 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Mon 11 Nov 11:21 PST 2019, Amit Kucheria wrote:
> > >
> > > > TSENS IP v2.x adds critical threshold interrupt support for each sensor
> > > > in addition to the upper/lower threshold interrupt. Add support in the
> > > > driver.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > > >  drivers/thermal/qcom/tsens-common.c | 129 ++++++++++++++++++++++++++--
> > > >  drivers/thermal/qcom/tsens-v2.c     |   8 +-
> > > >  drivers/thermal/qcom/tsens.c        |  21 +++++
> > > >  drivers/thermal/qcom/tsens.h        |  73 ++++++++++++++++
> > > >  4 files changed, 220 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > > > index 4359a4247ac3..2989cb952cdb 100644
> > > > --- a/drivers/thermal/qcom/tsens-common.c
> > > > +++ b/drivers/thermal/qcom/tsens-common.c
> > > > @@ -23,6 +23,10 @@
> > > >   * @low_thresh:     lower threshold temperature value
> > > >   * @low_irq_mask:   mask register for lower threshold irqs
> > > >   * @low_irq_clear:  clear register for lower threshold irqs
> > > > + * @crit_viol:      critical threshold violated
> > >
> > > "violated" as in "temperature is above crit_thresh"?
> >
> > Yes.
> >
> > >
> > > > + * @crit_thresh:    critical threshold temperature value
> > > > + * @crit_irq_mask:  mask register for critical threshold irqs
> > > > + * @crit_irq_clear: clear register for critical threshold irqs
> > > >   *
> > > [..]
> > > > diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> > > > index 7d317660211e..784c4976c4f9 100644
> > > > --- a/drivers/thermal/qcom/tsens.c
> > > > +++ b/drivers/thermal/qcom/tsens.c
> > > > @@ -121,6 +121,27 @@ static int tsens_register(struct tsens_priv *priv)
> > > >
> > > >       enable_irq_wake(irq);
> > > >
> > > > +     if (tsens_version(priv) > VER_1_X) {
> > > > +             irq = platform_get_irq_byname(pdev, "critical");
> > > > +             if (irq < 0) {
> > >
> > > Treating this as a fatal error breaks backwards compatibility with
> > > current devicetree; and even within your patch series, tsens should fail
> > > to probe between this patch and the application of patch 3.
> >
> > Good catch.
> >
> > > Please flip this around and do:
> > >
> > > irq = platform_get_irq_byname(pdev, "critical");
> > > if (irq >= 0 && tsens_version(priv) > VER_1_X) {
> > >         request_irq()...
> > > }
> >
> > Won't this still break with current devicetree since irq < 0 until
> > patch 3? Or are you saying we shouldn't check for
> > platform_get_irq_byname() failure?
> >
>
> I'm trying to say that dtsi without "critical" defined should cause the
> driver to simply skip this segment, not fail to initialize.
>
> > I can see two ways out:
> > 1. We patch the dtsi before the code change.
>
> You're expected to maintain backwards compatibility with existing dtb
> files out there. The support for critical interrupt is an additional
> feature, so you should be able to do this by detecting if "critical" is
> defined (e.g. by checking the return value of
> platform_get_irq_byname()).
>
> > 2. We make critical interrupt failure non-fatal by just printing some
> > messages and still returning success.
> >
>
> Try to make it as specific as possible (without adding a bunch of code)
> and throw in a dev_info() if no "critical" is found.

I believe I have now addressed the problem in v2 explicitly overriding
the return value in case of failure in the critical interrupt irq
setup path and simply printing a warning.

In hindsight, critical interrupt support should've been added in the
same series as uplow interrupt support so avoid having to support
"intermediate" DTS file state for one kernel version.

Regards,
Amit
