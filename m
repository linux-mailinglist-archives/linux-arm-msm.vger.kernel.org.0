Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4741D913E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgESHog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 03:44:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59159 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgESHof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 03:44:35 -0400
Received: from mail-qv1-f49.google.com ([209.85.219.49]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MxUfn-1iqQ1I28BV-00xpvI; Tue, 19 May 2020 09:44:33 +0200
Received: by mail-qv1-f49.google.com with SMTP id ee19so6026496qvb.11;
        Tue, 19 May 2020 00:44:33 -0700 (PDT)
X-Gm-Message-State: AOAM5305roy0Im1kbKAcS3unXyHZyJjp2IEZtTDOA+JJId05teJPiZMH
        8FCzBJLnkMeimGWzbpT+fnMiwvFqPzXygRa+QE8=
X-Google-Smtp-Source: ABdhPJyz5mXdtib6QAE28t5pFaGbx82ytbNPSngTpPa/9FO90GbqJW3zKmrtW+AkEiHWKR5n9g/tllAzh+eT59Lestw=
X-Received: by 2002:a05:6214:905:: with SMTP id dj5mr19849870qvb.222.1589874272193;
 Tue, 19 May 2020 00:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200506060025.1535960-1-vkoul@kernel.org> <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
 <20200518195719.GG374218@vkoul-mobl.Dlink> <CADYN=9+VuTwVk32hQXAAeDyErMn7D4Y+Gzdehy_=c8fBeU23jA@mail.gmail.com>
 <20200519045336.GH374218@vkoul-mobl.Dlink>
In-Reply-To: <20200519045336.GH374218@vkoul-mobl.Dlink>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 19 May 2020 09:44:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2CCwfXz8_p6zscuq21tCRZ_aHRZUa_9ov1b4sSqvL_aw@mail.gmail.com>
Message-ID: <CAK8P3a2CCwfXz8_p6zscuq21tCRZ_aHRZUa_9ov1b4sSqvL_aw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zg0WXCVgxaVauGkuk7NHqfGuaMZjVr8VtN21yfQvU6wlcgxAYoU
 IrDb3X/O+40U3VdeTv3sh7aqhR/5eWFkq2zhVJ4NSQubgHOU76OW+J5SV/CNu/YozRYh5/y
 3XFgY019wLB8saSTq91MFpaaFcdUvm6658zHcNkJ9MxNszyv9yQj8EKm2xmUlc5ZOO1Ul33
 f+/FGSLwOZPT1ikA50j3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gGlDoxcaACU=:hlVk4p4DmAe196w/U7j8KH
 yks9CwDyLD9LbQpwylQYN3/whOLiuI5lvXI1DphTcuSFrxYcRVxcdOpnFUCxT/6sgxVazQiI+
 YraDuYxXyc8Dsd0dsp3SBNsOkGM/tjpuvRsNjbRCQZHyfo5snf+P5Jp/6lcJsu5+jQy9/9v9x
 DX4c5UV/YIN1SgoymEid8FT9SZ62ibc9jfeaBh9LguqXhgeUVToxxGH6dXMwnAm7OwtwcS7Wf
 GitnTL9yNlluAlDCUktIUbIyEQfYO2sggqj6YOhtDUpK0/I1F06BO6piSn7IJXm+NCxrSegmE
 oOmebHMlLpJ0anf8vflLehi8zriBTrcpzchxUjItULzZeeRcIVZb/BV/m3VQmpX8CmQ2TfNxN
 Z8GS30iCbwk5c3VjMKZlPSH1nSaHug7Vk+X88ce3UL1A7jKNZJJFWDQJwc6atvxf6W5SUN0Ee
 EiBTriOYGWPhJN1lLCt6qJRR3DXxoANu2r/WUVwjIp887GcKyBHAVLkk2V75CDfofFC/OTUgS
 cUGgRTkpGXdiX6yeN83nu1lRsNGQLyQRihDFjglaes3Fw159feulBWO77+xDTQqmEKlZTvNw+
 5lJ/FA4bhQT/hJ1gS5/sy+W1KCnOTJU/kweEDGvmdsmrWxkT901R7D1+rxLs9KB5yBD3MGY3h
 QTMWjg4+6q/nxD0cbP0N9RL5ZQ80CZ3YXITeuoWDr+IVpQnIw/fVimagkfw93xEpsUL/V3MKV
 5yTt2k/qZwAfVNwVR37u1fiP2Dv49hI7DfHuOLUZUrt/L/3nAsYV7rHnysHTmX8I0/8tVm9zq
 ahxGreNWNEmY13jCSA5V5KSy001DCw4xx23EAQKnF1C6PuZSwU=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 6:53 AM Vinod Koul <vkoul@kernel.org> wrote:
> On 19-05-20, 00:37, Anders Roxell wrote:
> > On Mon, 18 May 2020 at 21:57, Vinod Koul <vkoul@kernel.org> wrote:
> > > On 18-05-20, 19:53, Anders Roxell wrote:
> > > > On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
> > > > >
> > > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > > loaded. Add these devices in pci table and invoke renesas firmware loader
> > > > > functions to check and load the firmware into device memory when
> > > > > required.
> > > > >
> > > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > >
> > > > Hi, I got a build error when I built an arm64 allmodconfig kernel.
> > >
> > > Thanks for this. This is happening as we have default y for USB_XHCI_PCI
> > > and then we make USB_XHCI_PCI_RENESAS=m. That should be not allowed as
> > > we export as symbol so both can be inbuilt or modules but USB_XHCI_PCI=y
> > > and USB_XHCI_PCI_RENESAS=m cant. While it is valid that USB_XHCI_PCI=y|m
> > > and USB_XHCI_PCI_RENESAS=n
> > >
> > > So this seems to get fixed by below for me. I have tested with
> > >  - both y and m (easy)
> > >  - make USB_XHCI_PCI_RENESAS=n, USB_XHCI_PCI=y|m works
> > >  - try making USB_XHCI_PCI=y and USB_XHCI_PCI_RENESAS=m, then
> > >    USB_XHCI_PCI=m by kbuild :)
> > >  - try making USB_XHCI_PCI=m and USB_XHCI_PCI_RENESAS=y, kbuild gives
> > >    error prompt that it will be m due to depends
> > >
> > > Thanks to all the fixes done by Arnd which pointed me to this. Pls
> > > verify
> >
> > I was able to build an arm64 allmodconfig kernel with this change.
>
> I will send the formal patch and add your name in reported and
> tested. Thanks for the quick verification

I just checked the patch and I think this will work correctly in all cases,
but it still seems a bit backwards:

> > > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > > index b5c542d6a1c5..92783d175b3f 100644
> > > --- a/drivers/usb/host/Kconfig
> > > +++ b/drivers/usb/host/Kconfig
> > > @@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
> > >  config USB_XHCI_PCI
> > >         tristate
> > >         depends on USB_PCI
> > > +       depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
> > >         default y
> > >
> > >  config USB_XHCI_PCI_RENESAS
> > >         tristate "Support for additional Renesas xHCI controller with firwmare"
> > > -       depends on USB_XHCI_PCI
> > >         ---help---
> > >           Say 'Y' to enable the support for the Renesas xHCI controller with
> > >           firwmare. Make sure you have the firwmare for the device and
> > >

I think it would have been better to follow the normal driver abstraction here
and make the renesas xhci a specialized version of the xhci driver with
its own platform_driver instance that calls into the generic xhci_pci module,
rather than having the generic code treat it as a quirk.

That would be more like how we handle all the ehci and ohci variants, though
I'm not sure how exactly it would work with two drivers having pci_device_id
tables with non-exclusive members. Presumably the generic driver would
still have to know that it needs to fail its probe() function on devices that
need the firmware.

        Arnd
