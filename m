Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF491D967D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 14:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgESMmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 08:42:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgESMmW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 08:42:22 -0400
Received: from localhost (unknown [122.182.207.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31BE620657;
        Tue, 19 May 2020 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589892141;
        bh=f5OsPgAe/ppTyyXK8XOFW0ghBuiEYD4TKNC7dZ+SMYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLgW8ezP3WXZsCBJ9YpVI+t2yYJcDhVdasfgkMqharhG8o4/zk+c3tx28FK3UxjpI
         lHuxb+ps3r9VMQW4psb191jw15agyIHojlR7xJrhDxZYc4OIWjkc0RrKxjnY9anQSi
         BEbM/E9wNXMphi3G5bOUK6AkbFJS8lJkAKfYoAn0=
Date:   Tue, 19 May 2020 18:12:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200519124216.GO374218@vkoul-mobl.Dlink>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
 <20200518195719.GG374218@vkoul-mobl.Dlink>
 <CADYN=9+VuTwVk32hQXAAeDyErMn7D4Y+Gzdehy_=c8fBeU23jA@mail.gmail.com>
 <20200519045336.GH374218@vkoul-mobl.Dlink>
 <CAK8P3a2CCwfXz8_p6zscuq21tCRZ_aHRZUa_9ov1b4sSqvL_aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2CCwfXz8_p6zscuq21tCRZ_aHRZUa_9ov1b4sSqvL_aw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Arnd,

On 19-05-20, 09:44, Arnd Bergmann wrote:
> On Tue, May 19, 2020 at 6:53 AM Vinod Koul <vkoul@kernel.org> wrote:
> > On 19-05-20, 00:37, Anders Roxell wrote:
> > > On Mon, 18 May 2020 at 21:57, Vinod Koul <vkoul@kernel.org> wrote:
> > > > On 18-05-20, 19:53, Anders Roxell wrote:
> > > > > On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
> > > > > >
> > > > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > > > loaded. Add these devices in pci table and invoke renesas firmware loader
> > > > > > functions to check and load the firmware into device memory when
> > > > > > required.
> > > > > >
> > > > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > >
> > > > > Hi, I got a build error when I built an arm64 allmodconfig kernel.
> > > >
> > > > Thanks for this. This is happening as we have default y for USB_XHCI_PCI
> > > > and then we make USB_XHCI_PCI_RENESAS=m. That should be not allowed as
> > > > we export as symbol so both can be inbuilt or modules but USB_XHCI_PCI=y
> > > > and USB_XHCI_PCI_RENESAS=m cant. While it is valid that USB_XHCI_PCI=y|m
> > > > and USB_XHCI_PCI_RENESAS=n
> > > >
> > > > So this seems to get fixed by below for me. I have tested with
> > > >  - both y and m (easy)
> > > >  - make USB_XHCI_PCI_RENESAS=n, USB_XHCI_PCI=y|m works
> > > >  - try making USB_XHCI_PCI=y and USB_XHCI_PCI_RENESAS=m, then
> > > >    USB_XHCI_PCI=m by kbuild :)
> > > >  - try making USB_XHCI_PCI=m and USB_XHCI_PCI_RENESAS=y, kbuild gives
> > > >    error prompt that it will be m due to depends
> > > >
> > > > Thanks to all the fixes done by Arnd which pointed me to this. Pls
> > > > verify
> > >
> > > I was able to build an arm64 allmodconfig kernel with this change.
> >
> > I will send the formal patch and add your name in reported and
> > tested. Thanks for the quick verification
> 
> I just checked the patch and I think this will work correctly in all cases,
> but it still seems a bit backwards:
> 
> > > > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > > > index b5c542d6a1c5..92783d175b3f 100644
> > > > --- a/drivers/usb/host/Kconfig
> > > > +++ b/drivers/usb/host/Kconfig
> > > > @@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
> > > >  config USB_XHCI_PCI
> > > >         tristate
> > > >         depends on USB_PCI
> > > > +       depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
> > > >         default y
> > > >
> > > >  config USB_XHCI_PCI_RENESAS
> > > >         tristate "Support for additional Renesas xHCI controller with firwmare"
> > > > -       depends on USB_XHCI_PCI
> > > >         ---help---
> > > >           Say 'Y' to enable the support for the Renesas xHCI controller with
> > > >           firwmare. Make sure you have the firwmare for the device and
> > > >
> 
> I think it would have been better to follow the normal driver abstraction here
> and make the renesas xhci a specialized version of the xhci driver with
> its own platform_driver instance that calls into the generic xhci_pci module,
> rather than having the generic code treat it as a quirk.
> 
> That would be more like how we handle all the ehci and ohci variants, though
> I'm not sure how exactly it would work with two drivers having pci_device_id
> tables with non-exclusive members. Presumably the generic driver would
> still have to know that it needs to fail its probe() function on devices that
> need the firmware.

Yeah one of the earlier versions did try this and it wasn't nice. The
xhci driver claims the devices as it registers for the class. Now only
solution is to ensure we load the renesas first and resort to makefile
hacks..

-- 
~Vinod
