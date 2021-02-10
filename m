Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8488E316EFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 19:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhBJSnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 13:43:52 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35068 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbhBJSli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 13:41:38 -0500
Date:   Wed, 10 Feb 2021 21:40:51 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
 <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 12:17:27PM -0600, Rob Herring wrote:
> On Wed, Feb 10, 2021 at 11:29 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > In accordance with the USB HCD/DRD schema all the USB controllers are
> > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > existing DT-nodes will be renamed in a subsequent patch let's first make
> > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > deprecated naming so not to fail on the legacy DTS-files passed to the
> > newer kernels.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index c703d552bbcf..49ad8d507d37 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> >         struct device           *dev = &pdev->dev;
> >         int                     ret;
> >
> > -       dwc3_np = of_get_child_by_name(np, "dwc3");
> > +       dwc3_np = of_get_child_by_name(np, "usb") ?:
> > +                 of_get_child_by_name(np, "dwc3");
> 

> Is there some reason using compatible instead wouldn't work here?

I don't know for sure. The fix has been requested in the framework of
this discussion:
https://lore.kernel.org/linux-usb/20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru/#t
by the driver maintainer Bjorn. To get a firm answer it's better to
have him asked. As I see it having of_get_compatible_child() utilized
here would also work. At least for the available in kernel dt-files.
See the affected dts-es in:
https://lore.kernel.org/linux-usb/20210210172850.20849-11-Sergey.Semin@baikalelectronics.ru/

A problem may happen if some older versions of DTS-es had another
compatible string in the dwc3 sub-node...

-Sergey

> 
> Rob
