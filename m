Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE3318295F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 07:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387845AbgCLG4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 02:56:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387831AbgCLG4l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 02:56:41 -0400
Received: from localhost (unknown [122.167.115.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B6B9206FA;
        Thu, 12 Mar 2020 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583996201;
        bh=R4dR6LiyS8F96lk8sKdXqYr8PH/GVFePMCViEn36wzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zbFCWKmd1Yhvc6uLbNXFl+MlQ0raM/B+n5i5qqfNjZTr/t7zkyeksoG1eMFlkNp8v
         Vw93YZwKOumS+uOEaWUtHxvCWuNv9syeD9mYRGQXA9GhUrBoiq6RKIydwzsFwz8z+C
         z1f+2MBCrF6IZFx5Ih9oRVZLjgvvunMeHjarGa/4=
Date:   Thu, 12 Mar 2020 12:26:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200312065636.GX4885@vkoul-mobl>
References: <20200113084005.849071-1-vkoul@kernel.org>
 <20200121064608.GA2841@vkoul-mobl>
 <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
 <5878067.luYmtVZgP3@debian64>
 <20200125053237.GG2841@vkoul-mobl>
 <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
 <20200131084041.GI2841@vkoul-mobl>
 <1ce257f5-df10-73ac-53ea-1c771abe70f2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ce257f5-df10-73ac-53ea-1c771abe70f2@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-02-20, 18:33, Mathias Nyman wrote:

> > > 
> > > There are a few other opens regarding this series. Mostly because I'm not (yet)
> > > familiar with all the details, so I'll just just list them here.
> > > 
> > > - Is it really enough to add the Renesas driver to Makefile before xhci-pci
> > >    driver to make sure it gets matched and probed based on vendor/device id
> > >    before xhci-pci driver is matched and probed based on pci class?
> > >    What if the Renesas driver is a module and xhci-pci compiled in?
> > 
> > The driver loading rules are based on level and makefile order. So
> > renesas will always be loaded before xhci driver. This is required since
> > xhci claims all devices, so we need to make sure it loads before.
> > 
> > I think we should make it inbuilt driver rather than a module. xhci
> > driver is only inbuilt.
> > 
> > If there is a better way to handle this, am all for it.
> > 
> > > - Previously probe didn't return before hcd's were added and everything set up.
> > >    Now with request_firmware_nowait() probe returns early successfully, and the
> > >    old xhci_pci_probe() which sets up everything is called later by the request
> > >    firmware callback. So there could be whole new set of races possible.
> > >    For example pci remove can be called mid firmware loading, or when the old
> > >    xhci_pci_probe is still setting up things.
> > 
> > I think this is a valid concern. Let me think about how to solve this..
> > maybe add a flag in remove which ensure remove doesnt run untill the
> > probe/firmware callback is completed.
> 
> How about initiating async firmware loading before probe is called by using
> DECLARE_PCI_FIXUP_*() hooks?

Well somehow that does not work :(

I tried using DECLARE_PCI_FIXUP_FINAL hook to request the firmware.
Doing so from probe works but from fixup fails always!

So expect this one, I have done the rest of the changes requested, will
send them over soon

Thanks
-- 
~Vinod
