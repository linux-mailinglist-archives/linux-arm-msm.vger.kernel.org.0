Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE3114E9A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 09:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgAaIm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 03:42:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728099AbgAaIkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 03:40:47 -0500
Received: from localhost (unknown [223.226.100.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 961D320705;
        Fri, 31 Jan 2020 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580460046;
        bh=119KLhF3P03xMSeOpDVQsbZVVDzEf0xaJjHj3Tue+eo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IzmjjCc3DOBerXMB9+bKejVuCOMgbEpqINlqBDAlsyrMwqisPuc8t8xiz0oSRWRlQ
         pQAIlOtA1jQNHo74kPQCY3WTok+mgbFQh6ALkslHsUT0Qud+g1fMap3SvjFsG3+VbO
         MwZx661+bP73+af1A4Zex/9rY+cPF9QPMfqJKjNQ=
Date:   Fri, 31 Jan 2020 14:10:41 +0530
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
Message-ID: <20200131084041.GI2841@vkoul-mobl>
References: <20200113084005.849071-1-vkoul@kernel.org>
 <20200121064608.GA2841@vkoul-mobl>
 <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
 <5878067.luYmtVZgP3@debian64>
 <20200125053237.GG2841@vkoul-mobl>
 <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathias,

On 30-01-20, 19:07, Mathias Nyman wrote:
> On 25.1.2020 7.32, Vinod Koul wrote:
> > > > > > > 
> > > > > > > On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > > > > > > 
> > > > > > > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > > > > > > These require firmware to be loaded and in case devices have ROM those can
> > > > > > > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > > > > > > 
> > > > > > > > This includes two patches from Christian which supported these controllers
> > > > > > > > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > > > > > > > debugfs hook for rom erase and export of xhci-pci functions.
> > > > > > > > 
> ...
> > 
> > Mathias, any comments on this series..?
> > 
> 
> Hi Vinod
> 
> Sorry about the delay.
> 
> Maybe a firmware loading driver like this that wraps the xhci pci driver could
> work.
> 
> One benefit is that we could skip searching for the right firmware name based
> on PCI ID. Each of these Renesas controllers now have their own pci_device_id
> entry in the pci_ids[] table, and could have the supported firmware name(s)
> in .driver_data. This way we wouldn't need to add the renesas_fw_table[] or
> maybe even the renesas_needs_fw_dl() function in this series.
> 
> I realize this can't be easily changed because usb_hcd_pci_probe() takes the
> pci_device_id pointer as an argument, and expects id.driver_data to be a
> HC driver pointer.
> 
> So this turns out to be a question for Greg and Alan:
> 
> Would it make sense to change usb_hcd_pci_probe() to take a HC driver pointer
> as an argument instead of a pointer to pci_device_id?
> pci_device_id pointer is only used to extract the HC driver handle.
> This way the driver_data could be used for, well, driver data.
> 
> Heikki actually suggested this some time ago to me, back then the idea was to
> improve xhci quirks code by using driver_data for quirk flags instead of
> finding and setting them later.
> 
> There are a few other opens regarding this series. Mostly because I'm not (yet)
> familiar with all the details, so I'll just just list them here.
> 
> - Is it really enough to add the Renesas driver to Makefile before xhci-pci
>   driver to make sure it gets matched and probed based on vendor/device id
>   before xhci-pci driver is matched and probed based on pci class?
>   What if the Renesas driver is a module and xhci-pci compiled in?

The driver loading rules are based on level and makefile order. So
renesas will always be loaded before xhci driver. This is required since
xhci claims all devices, so we need to make sure it loads before.

I think we should make it inbuilt driver rather than a module. xhci
driver is only inbuilt.

If there is a better way to handle this, am all for it.

> - Previously probe didn't return before hcd's were added and everything set up.
>   Now with request_firmware_nowait() probe returns early successfully, and the
>   old xhci_pci_probe() which sets up everything is called later by the request
>   firmware callback. So there could be whole new set of races possible.
>   For example pci remove can be called mid firmware loading, or when the old
>   xhci_pci_probe is still setting up things.

I think this is a valid concern. Let me think about how to solve this..
maybe add a flag in remove which ensure remove doesnt run untill the
probe/firmware callback is completed.

>   I understood that a synchronous request_firmware() in probe has its own
>   issues, not sure if there is a good solution for this.

Yeah with userspace not available, that can be tricky!

> - Before the firmware is written to the controller the firmware version is
>   compared against a hardcoded number in the drivers renesas_fw_table[].
>   This means new firmware versions can't be supported without patching the driver.
>   Is this intentional?

Yes, we have only bunch of validated versions. There maybe more in the
wild but we dont know. The vendor is not very helpful here :(

Across all folks using this, there seems to be only few versions and
vendor is not supporting it anymore, so chances of new versions seems
remote


Thanks
-- 
~Vinod
