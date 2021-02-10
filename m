Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01353316F6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 20:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbhBJTAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 14:00:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:57964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234437AbhBJTA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 14:00:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4808864E2E;
        Wed, 10 Feb 2021 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612983587;
        bh=g/4VG2c1QADm/Zb00Hw+nSM374VQk4oUsiTAU6j2jnk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=le8LoqeXGim3M+Tn3MGDwneo37BZMCKkuSxJ8tN9wtRAq6hzQa87Fg+5PGOD3eP/B
         VaSD/fL0qhbgdgnLtfBjATRPml5IJ7IEglXZJbaD2MCQFAP/bz8ehYcUKKF3wQWgNk
         YprzERB0a7imZIvdPZNaek5wJnQxqNYRdjEqIGb3IMaY07wGqKydaA92wyh9yxfrRg
         xVULUvu5QDk0WqaDFhLLa4heIH9Xw7LHRRybX8xdcUxhp1Gvb51eqDSAgreXBlBoOM
         nxj2VxZwQJLX1i34Z3FLsOl9F9U5lyhGZFf7UYovH8jOgmsGYVBn9W2XCzh0JGoo6+
         fmNJY9HBcHgnA==
Received: by mail-ej1-f54.google.com with SMTP id jj19so6094978ejc.4;
        Wed, 10 Feb 2021 10:59:47 -0800 (PST)
X-Gm-Message-State: AOAM530uP1FN5r2C9eSVw2wMDRQFuRdgd63wYorXCqVhOXYzQfnyrCOa
        9Z7JRy5Yd7q8RR8DSg9b118944eBvQezNFCr5A==
X-Google-Smtp-Source: ABdhPJwdknA0prEbcDWyIKFlcx7c3hahyd4EtvIexUOIpPcRoP8E5GASI56pHhMBwdYljjxwMqbInOhiAscOPCG3vEU=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4398688ejb.359.1612983585844;
 Wed, 10 Feb 2021 10:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
 <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com> <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
In-Reply-To: <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Feb 2021 12:59:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRq-BRGkeEK19bGFsXpFNJAhu1W5esCOc3jN0wDVJvuQ@mail.gmail.com>
Message-ID: <CAL_JsqLRq-BRGkeEK19bGFsXpFNJAhu1W5esCOc3jN0wDVJvuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 12:40 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Feb 10, 2021 at 12:17:27PM -0600, Rob Herring wrote:
> > On Wed, Feb 10, 2021 at 11:29 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > In accordance with the USB HCD/DRD schema all the USB controllers are
> > > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > > existing DT-nodes will be renamed in a subsequent patch let's first make
> > > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > > deprecated naming so not to fail on the legacy DTS-files passed to the
> > > newer kernels.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index c703d552bbcf..49ad8d507d37 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> > >         struct device           *dev = &pdev->dev;
> > >         int                     ret;
> > >
> > > -       dwc3_np = of_get_child_by_name(np, "dwc3");
> > > +       dwc3_np = of_get_child_by_name(np, "usb") ?:
> > > +                 of_get_child_by_name(np, "dwc3");
> >
>
> > Is there some reason using compatible instead wouldn't work here?
>
> I don't know for sure. The fix has been requested in the framework of
> this discussion:
> https://lore.kernel.org/linux-usb/20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru/#t
> by the driver maintainer Bjorn. To get a firm answer it's better to
> have him asked. As I see it having of_get_compatible_child() utilized
> here would also work. At least for the available in kernel dt-files.
> See the affected dts-es in:
> https://lore.kernel.org/linux-usb/20210210172850.20849-11-Sergey.Semin@baikalelectronics.ru/
>
> A problem may happen if some older versions of DTS-es had another
> compatible string in the dwc3 sub-node...

I guess there's some 'synopsys,dwc3' too, but looking at 2 compatibles
is better than looking at 2 node names. We try to not care what node
names are generally.

Rob
