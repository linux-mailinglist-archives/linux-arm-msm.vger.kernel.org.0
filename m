Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26B31D8EE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 06:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgESExo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 00:53:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgESExo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 00:53:44 -0400
Received: from localhost (unknown [122.182.207.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2890C206D4;
        Tue, 19 May 2020 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589864023;
        bh=EFZI8aHD4horrMDegve7hawQWaX8uESqvuhZbCN5SJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uhDTlhwIHpzFn+ofiON9l5HIrcik8GFenOeHk0Gy9BX1R7e3BU4k5jNYiDMAQEMYC
         9iszc4vJAYPY41Rntq0KVO14DwLZ3spyXkoYUKQYBqSyqDaQg8fnbA79I5HKA9Q2Oz
         AxpmsPkdfL8ns6Wnws/NK+fARyhLLNSEhxGvlojw=
Date:   Tue, 19 May 2020 10:23:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200519045336.GH374218@vkoul-mobl.Dlink>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
 <20200518195719.GG374218@vkoul-mobl.Dlink>
 <CADYN=9+VuTwVk32hQXAAeDyErMn7D4Y+Gzdehy_=c8fBeU23jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9+VuTwVk32hQXAAeDyErMn7D4Y+Gzdehy_=c8fBeU23jA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-05-20, 00:37, Anders Roxell wrote:
> On Mon, 18 May 2020 at 21:57, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Hi Anders,
> 
> Hi Vinod,
> 
> >
> > On 18-05-20, 19:53, Anders Roxell wrote:
> > > On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
> > > >
> > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > loaded. Add these devices in pci table and invoke renesas firmware loader
> > > > functions to check and load the firmware into device memory when
> > > > required.
> > > >
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > >
> > > Hi, I got a build error when I built an arm64 allmodconfig kernel.
> >
> > Thanks for this. This is happening as we have default y for USB_XHCI_PCI
> > and then we make USB_XHCI_PCI_RENESAS=m. That should be not allowed as
> > we export as symbol so both can be inbuilt or modules but USB_XHCI_PCI=y
> > and USB_XHCI_PCI_RENESAS=m cant. While it is valid that USB_XHCI_PCI=y|m
> > and USB_XHCI_PCI_RENESAS=n
> >
> > So this seems to get fixed by below for me. I have tested with
> >  - both y and m (easy)
> >  - make USB_XHCI_PCI_RENESAS=n, USB_XHCI_PCI=y|m works
> >  - try making USB_XHCI_PCI=y and USB_XHCI_PCI_RENESAS=m, then
> >    USB_XHCI_PCI=m by kbuild :)
> >  - try making USB_XHCI_PCI=m and USB_XHCI_PCI_RENESAS=y, kbuild gives
> >    error prompt that it will be m due to depends
> >
> > Thanks to all the fixes done by Arnd which pointed me to this. Pls
> > verify
> 
> I was able to build an arm64 allmodconfig kernel with this change.

I will send the formal patch and add your name in reported and
tested. Thanks for the quick verification

> 
> Cheers,
> Anders
> 
> > and I will send the fix with you as reported :)
> >
> > ---- >8 ----
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index b5c542d6a1c5..92783d175b3f 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
> >  config USB_XHCI_PCI
> >         tristate
> >         depends on USB_PCI
> > +       depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
> >         default y
> >
> >  config USB_XHCI_PCI_RENESAS
> >         tristate "Support for additional Renesas xHCI controller with firwmare"
> > -       depends on USB_XHCI_PCI
> >         ---help---
> >           Say 'Y' to enable the support for the Renesas xHCI controller with
> >           firwmare. Make sure you have the firwmare for the device and
> >
> > --
> > ~Vinod

-- 
~Vinod
