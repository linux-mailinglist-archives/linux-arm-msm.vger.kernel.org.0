Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1959D437481
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 11:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhJVJQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 05:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232624AbhJVJQB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 05:16:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABC0D610CB;
        Fri, 22 Oct 2021 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634894024;
        bh=H/IecAZU9Vka+FxLgVpI5lpGtmOBDxUU4pOnlzjcF/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f8AHFMPsk4W9sPlhRKDCcNhSpVkeiKGyHCcsNY3/Z9n5MFHf2qz+b9rcJvEWaDUD0
         PzlKRSBADuM0aL272QgHN+QoRpPmGUOY35l0cCHu/0qBtyzP3WyFBCY5PIQgW3GhRx
         K2/c+sABfdfjyFj3/OSX06UX3ciy9+GP5ad94yLg=
Date:   Fri, 22 Oct 2021 11:13:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Message-ID: <YXKAxYZ+ikGaDvv/@kroah.com>
References: <20211019004123.15987-1-jackp@codeaurora.org>
 <YXFGWPMmmdyaSOPg@kroah.com>
 <20211021174316.GA2357@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174316.GA2357@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 21, 2021 at 10:43:17AM -0700, Jack Pham wrote:
> On Thu, Oct 21, 2021 at 12:52:08PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 18, 2021 at 05:41:23PM -0700, Jack Pham wrote:
> > > Some functions may dynamically enable and disable their endpoints
> > > regularly throughout their operation, particularly when Set Interface
> > > is employed to switch between Alternate Settings.  For instance the
> > > UAC2 function has its respective endpoints for playback & capture
> > > associated with AltSetting 1, in which case those endpoints would not
> > > get enabled until the host activates the AltSetting.  And they
> > > conversely become disabled when the interfaces' AltSetting 0 is
> > > chosen.
> > > 
> > > With the DWC3 FIFO resizing algorithm recently added, every
> > > usb_ep_enable() call results in a call to resize that EP's TXFIFO,
> > > but if the same endpoint is enabled again and again, this incorrectly
> > > leads to FIFO RAM allocation exhaustion as the mechanism did not
> > > account for the possibility that endpoints can be re-enabled many
> > > times.
> > > 
> > > Example log splat:
> > > 
> > > 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
> > > 	configfs-gadget gadget: u_audio_start_capture:521 Error!
> > > 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
> > > 
> > > Add another bit DWC3_EP_TXFIFO_RESIZED to dep->flags to keep track of
> > > whether an EP had already been resized in the current configuration.
> > > If so, bail out of dwc3_gadget_resize_tx_fifos() to avoid the
> > > calculation error resulting from accumulating the EP's FIFO depth
> > > repeatedly.  This flag is retained across multiple ep_disable() and
> > > ep_enable() calls and is cleared when GTXFIFOSIZn is reset in
> > > dwc3_gadget_clear_tx_fifos() upon receiving the next Set Config.
> > > 
> > > Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> > > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > > ---
> > > v2: Added explicit flag to dep->flags and check that instead of directly
> > >     reading the GTXFIFOSIZn register.
> > > 
> > >  drivers/usb/dwc3/core.h   | 1 +
> > >  drivers/usb/dwc3/gadget.c | 8 +++++++-
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > > index 5612bfdf37da..f033063f6948 100644
> > > --- a/drivers/usb/dwc3/core.h
> > > +++ b/drivers/usb/dwc3/core.h
> > > @@ -723,6 +723,7 @@ struct dwc3_ep {
> > >  #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
> > >  #define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
> > >  #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
> > > +#define DWC3_EP_TXFIFO_RESIZED	BIT(12)
> > 
> > Any specific reason this isn't lined up properly?
> 
> The preceding macros admittedly aren't consistent either :-P.  Here's
> the whole section with my change:
> 
> 	unsigned int            flags;
> #define DWC3_EP_ENABLED		BIT(0)
> #define DWC3_EP_STALL		BIT(1)
> #define DWC3_EP_WEDGE		BIT(2)
> #define DWC3_EP_TRANSFER_STARTED BIT(3)
> #define DWC3_EP_END_TRANSFER_PENDING BIT(4)
> #define DWC3_EP_PENDING_REQUEST	BIT(5)
> #define DWC3_EP_DELAY_START	BIT(6)
> #define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
> #define DWC3_EP_IGNORE_NEXT_NOSTREAM	BIT(8)
> #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
> #define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
> #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
> #define DWC3_EP_TXFIFO_RESIZED	BIT(12)

Ah, didn't notice that, I only could see the context here.  Nevermind
then :)

> The macros for the earlier bits 0-2, 5 and 6 have shorter names and
> therefore use one or two tabs to line up at an earlier tab stop.  But
> the ones with the longer names for bits 7-11 use a single tab which bump
> out the definition to the next tab column.  Since the macro I'm adding
> in my patch has a shorter name I thought I'd follow the precedent of the
> earlier bits and use a single tab which aligns with the earlier bits but
> I agree it does look strange overall.  Especially with bits 3 & 4 which
> aren't lined up at all.
> 
> I guess a patch to fix the rest of the earlier macros wouldn't hurt but
> I'd also like this to go to stable too.  Should I send this as a 2-part
> series: 1/2 being my change (with correct alignment and cc:stable) and
> 2/2 as a cleanup for bits 0-6?

Looks like you already did that, thanks.

greg k-h
