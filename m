Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620C13AFCDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 08:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFVGIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 02:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhFVGIv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 02:08:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4852260E08;
        Tue, 22 Jun 2021 06:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624341996;
        bh=P/sR0ZcHpYZJo71sQ8g4ZAMLgWLeAEm1CfciXo95WnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=imQvMMyE3IAu1todJsO4uYD3N1HdqWAp703ViHpmv7Bs95qZX/mGws8HmrM8tFwS5
         i0qL2R2VUDebsbvv9H3GbJL2MDGShEbeI3jHokMc6EcHw+ER/jbuZRTxbIG7OCP/HR
         LoK/cS5WEIGvcp4bNjxK+tgU9aepOWlrADDoUDGM=
Date:   Tue, 22 Jun 2021 08:06:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YNF96IxZre5iQus/@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-4-git-send-email-wcheng@codeaurora.org>
 <YMstrL1aQYGe7NB0@kroah.com>
 <1a979c61-e996-b94a-c986-a9721d3b3297@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a979c61-e996-b94a-c986-a9721d3b3297@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 10:27:13PM -0700, Wesley Cheng wrote:
> 
> 
> On 6/17/2021 4:10 AM, Greg KH wrote:
> > On Thu, Jun 17, 2021 at 02:58:16AM -0700, Wesley Cheng wrote:
> >> +static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
> >> +{
> >> +	struct dwc3 *dwc = gadget_to_dwc(g);
> >> +	unsigned long in_ep_map;
> >> +	int fifo_size = 0;
> >> +	int ram1_depth;
> >> +	int ep_num;
> >> +
> >> +	if (!dwc->do_fifo_resize)
> >> +		return 0;
> >> +
> >> +	/* Only interested in the IN endpoints */
> >> +	in_ep_map = ep_map >> 16;
> 
> Hi Greg,
> 
> > 
> > Wait, this "map" is split up into 16/16 somehow?  So it's only 32bits
> > big?
> >
> 
> Yes, correct. Upper 16 carries IN eps, lower 16 carries OUT eps.  Will
> fix that based off your other comment.
> 
> > Where did you document this map structure?  Why is it needed at all, you
> > have the gadget, don't you have access to the full list of endpoints
> > here as well?
> > 
> > confused,
> > 
> 
> Unfortunately, we do not have the entire list of endpoints for each
> function until the composite driver receives the SET_CONFIG packet from
> the host.  By this time, if we incorrectly allowed the configuration to
> start enumeration w/ the host, and there were some EPs which have no
> FIFO memory allocated, that would lead to those interfaces/functions
> being broken.

So how would this magic bitmap be any different here?

I'm not understanding why you need to create something new here to
represent data we already have.

thanks,

greg k-h
