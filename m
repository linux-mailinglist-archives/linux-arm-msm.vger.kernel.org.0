Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911E71D8898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 21:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgERT50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 15:57:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbgERT50 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 15:57:26 -0400
Received: from localhost (unknown [122.178.242.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E35B320657;
        Mon, 18 May 2020 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589831845;
        bh=DRz4DAY0Mnx2npyUdBsc9qwGVxIZLo1A/yWb9iqMvwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qc0a6OQvdCAEnO3CUTnrYxiYhaPyQTi55+IhPmvKayJnYlwQi4oxEdbuCAAoaqMDa
         dFImllZ7cfaCePbe7ebGoK91XABYlDlmrHmwm9ncKc6LY2DAeuS62km5DMrPTVNXnA
         BpsvtV7X7O3awzJsEdsD90yUG11JfNCxNl9brLZE=
Date:   Tue, 19 May 2020 01:27:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
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
Message-ID: <20200518195719.GG374218@vkoul-mobl.Dlink>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Anders,

On 18-05-20, 19:53, Anders Roxell wrote:
> On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > loaded. Add these devices in pci table and invoke renesas firmware loader
> > functions to check and load the firmware into device memory when
> > required.
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> Hi, I got a build error when I built an arm64 allmodconfig kernel.

Thanks for this. This is happening as we have default y for USB_XHCI_PCI
and then we make USB_XHCI_PCI_RENESAS=m. That should be not allowed as
we export as symbol so both can be inbuilt or modules but USB_XHCI_PCI=y
and USB_XHCI_PCI_RENESAS=m cant. While it is valid that USB_XHCI_PCI=y|m
and USB_XHCI_PCI_RENESAS=n

So this seems to get fixed by below for me. I have tested with
 - both y and m (easy)
 - make USB_XHCI_PCI_RENESAS=n, USB_XHCI_PCI=y|m works
 - try making USB_XHCI_PCI=y and USB_XHCI_PCI_RENESAS=m, then
   USB_XHCI_PCI=m by kbuild :)
 - try making USB_XHCI_PCI=m and USB_XHCI_PCI_RENESAS=y, kbuild gives
   error prompt that it will be m due to depends

Thanks to all the fixes done by Arnd which pointed me to this. Pls
verify and I will send the fix with you as reported :)

---- >8 ----

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b5c542d6a1c5..92783d175b3f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
 config USB_XHCI_PCI
        tristate
        depends on USB_PCI
+       depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
        default y
 
 config USB_XHCI_PCI_RENESAS
        tristate "Support for additional Renesas xHCI controller with firwmare"
-       depends on USB_XHCI_PCI
        ---help---
          Say 'Y' to enable the support for the Renesas xHCI controller with
          firwmare. Make sure you have the firwmare for the device and

-- 
~Vinod
