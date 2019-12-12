Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DDC11C9E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 10:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfLLJu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 04:50:59 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38606 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbfLLJu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 04:50:58 -0500
Received: by mail-ua1-f68.google.com with SMTP id z17so615361uac.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Th0Gxjy39UzyWkgaaSlqfUVGyatOKXBlhrJ1etVX5js=;
        b=Lr4zFJbm8S7HgAMSDwABkA/wyND+xwdWGQnbqBjKgGo7aCnTiK8exjImHHk9GVigub
         OaEkvndf8/JCWjrVQnkebzikIg3uTiUuNMj9PK+Hdz5dbj8KOi1h7JaRhq4Ez9J8mYN8
         7GY99n0HWRrJq8+wjtLytVQYXZpJHijWwBw8hvMh5YDK0gY9LpzoPD4hzf6bjwToMqTF
         BXYVG570RYgua0JseTb5oaqV7jIcHoZd6nBTTnYqs1ev1K36YKDKg2oPPhbyY5JbQT6G
         EQhIA+/kNaa5FMfQh/+KDZ9zr9pZf/sXj42yi6Fu1wwHRpA+yK6HeCzVmaEhNuZBgrh8
         Atmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Th0Gxjy39UzyWkgaaSlqfUVGyatOKXBlhrJ1etVX5js=;
        b=I6wRFo6WSvPEOn5Yhr3cmOQyKA/wWxYSTDMXce3Xl85EYbqFtFlwW0PyNOz1P7NsnN
         RcgbBqpoD2GKCgt7iTfG2BJDUlwX17pJe6gQP3FtBzVeC+Tu12F00NZW6qg/OEnL+0Oc
         ByJasn0+11tLt9spw0SasJfL3zUZayHCrLP7O7zChHOqndZ+4T9UpqrQqGudJEnWeGEF
         PTH4W5LtyLmGXE7cF2DwgP6sumoF+iH1/GUtOC9ucTl3amw5yo0GIg1FS4qgwKPRHXz2
         wYdAUxd7mN5KSuEk39SCoJGoizRzMMZP2lgXlCRuMF4o3AgNHiB2UiLRqgQ8WgXljyTf
         006w==
X-Gm-Message-State: APjAAAWVVaHhWAx0sH+OuOMgJaHgeH9iMqvpLkQtqFWkcUvFFhaHOC6i
        Gxz2Eu7N99qcHFBke4m0swPYyMqpMFtvn8pIfnFyhQ==
X-Google-Smtp-Source: APXvYqwKZRVjkZ142WpeRsqhhDVJVdjOwhdMN2XDbdsfhAIXiWHisLYDXPMxFD1KaEHk4XY7A7F6pkHxDLP4o1kLsjo=
X-Received: by 2002:ab0:7352:: with SMTP id k18mr7176180uap.77.1576144257519;
 Thu, 12 Dec 2019 01:50:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576058136.git.amit.kucheria@linaro.org>
 <39d6b8e4b2cc5836839cfae7cdf0ee3470653b64.1576058136.git.amit.kucheria@linaro.org>
 <aa9174c2-c851-4769-0f9c-5541047a7901@linaro.org>
In-Reply-To: <aa9174c2-c851-4769-0f9c-5541047a7901@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 12 Dec 2019 15:20:44 +0530
Message-ID: <CAHLCerPNMBFgFv6zAdKtzs21p9Y18d8fohJEMJe7o4ufNwdS6Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: thermal: tsens: Work with old DTBs
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Olof Johansson <olof@lixom.net>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 9:42 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 11/12/2019 10:58, Amit Kucheria wrote:
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
>
> 'ret' remains uninitialized here.
>
> > +             dev_warn(&pdev->dev, "Missing uplow irq in DT\n");
> >               goto err_put_device;
> >       }
> >
> > @@ -118,7 +118,8 @@ static int tsens_register(struct tsens_priv *priv)
> >                                       IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >                                       dev_name(&pdev->dev), priv);
> >       if (ret) {
> > -             dev_err(&pdev->dev, "%s: failed to get irq\n", __func__);
> > +             dev_warn(&pdev->dev, "%s: failed to get uplow irq\n", __func__);
> > +             ret = 0;
> >               goto err_put_device;
> >       }
>
> The code now is unable to make a distinction between an error in the DT
> and the old DT :/
>
> Why not version the DT?

Versioning the DT is probably overkill for this driver. Just checking
for ENXIO as suggested by Stephan seems to be enough. We don't lose
the error checking for devm_request_threaded_irq either.

Regards,
Amit
