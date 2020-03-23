Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A16B618F8C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 16:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgCWPhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 11:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:40124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbgCWPhu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 11:37:50 -0400
Received: from localhost (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EC1620409;
        Mon, 23 Mar 2020 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584977870;
        bh=Z1yjbVFwxDTH5lTh08p7g0JLlUyFhwayQGE31XdVD7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NRwSWuNaEXXHgbpIv+3/grL4Qx5XL6lo+vRXPdldT2ZAyJcWVj0TnV1+XBrK+2ROC
         PTehIk29EUxTlA5bMGp3Hg7briNH+d5f0g+dNEFcGYy6LiDfpfdEcBnL00ujEXY+Qw
         RA3gpSR1/PzAFn6uyamfQ9CeEWXNNJHhLMZbfDgg=
Date:   Mon, 23 Mar 2020 21:07:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v7 1/5] usb: hci: add hc_driver as argument for
 usb_hcd_pci_probe
Message-ID: <20200323153745.GS72691@vkoul-mobl>
References: <20200323101121.243906-2-vkoul@kernel.org>
 <Pine.LNX.4.44L0.2003231124190.24254-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2003231124190.24254-100000@netrider.rowland.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-03-20, 11:25, Alan Stern wrote:
> On Mon, 23 Mar 2020, Vinod Koul wrote:
> 
> > usb_hcd_pci_probe expects users to call this with driver_data set as
> > hc_driver, that limits the possibility of using the driver_data for
> > driver data.
> > 
> > Add hc_driver as argument to usb_hcd_pci_probe and modify the callers
> > ehci/ohci/xhci/uhci to pass hc_driver as argument and freeup the
> > driver_data used
> > 
> > Tested xhci driver on Dragon-board RB3, compile tested ehci and ohci.
> > Couldn't compile uhci
> > 
> > Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/usb/core/hcd-pci.c  |  7 ++++---
> >  drivers/usb/host/ehci-pci.c |  6 ++----
> >  drivers/usb/host/ohci-pci.c |  9 ++++++---
> >  drivers/usb/host/uhci-pci.c |  8 ++++++--
> >  drivers/usb/host/xhci-pci.c | 14 +++++---------
> >  include/linux/usb/hcd.h     |  3 ++-
> >  6 files changed, 25 insertions(+), 22 deletions(-)
> 
> For all but the xHCI parts:
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan, Thanks for the quick ack. I will send v8 with your ack on first
patch (that touches *hci )

Thanks
-- 
~Vinod
