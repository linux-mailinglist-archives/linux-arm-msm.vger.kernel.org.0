Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E621BF3EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgD3JQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgD3JQO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:16:14 -0400
Received: from localhost (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8840C2192A;
        Thu, 30 Apr 2020 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588238174;
        bh=L5Q8z/MfdZV/BIOHB8+x5so0fcPMgVSrXXukCH9SihI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=syuc5/9EBndoMzn1BoGaN+9hZNc/F7fyIr4MjRJ8qIkl9Bp22UN3J3CoHVfHA8ouH
         9MpwcnZFCT5tClKZkLeFNDgfJTWdj4cBbmv68CjjfvVXs5zY43Q2yRPrxS0jMxjufq
         S31AlNUkB/55xmsf1J4lICGHGzeGfDiXN0LtaFpU=
Date:   Thu, 30 Apr 2020 14:46:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200430091610.GG948789@vkoul-mobl.Dlink>
References: <20200424101410.2364219-1-vkoul@kernel.org>
 <20200424101410.2364219-4-vkoul@kernel.org>
 <79023293-8ad8-751c-b4ca-8393cdbbf4a2@linux.intel.com>
 <20200429142850.GM56386@vkoul-mobl.Dlink>
 <20200430062055.GE948789@vkoul-mobl.Dlink>
 <2cf10102-7529-6543-476a-e99730772c64@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf10102-7529-6543-476a-e99730772c64@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-20, 11:16, Mathias Nyman wrote:
> On 30.4.2020 9.20, Vinod Koul wrote:
> > On 29-04-20, 19:58, Vinod Koul wrote:
> >> On 29-04-20, 16:53, Mathias Nyman wrote:
> >>> On 24.4.2020 13.14, Vinod Koul wrote:
> > 
> >>>>  	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
> >>>>  	pm_runtime_get_noresume(&dev->dev);
> >>>> @@ -388,6 +401,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
> >>>>  {
> >>>>  	struct xhci_hcd *xhci;
> >>>>  
> >>>> +	if (renesas_device)
> >>>> +		renesas_xhci_pci_exit(dev);
> >>>> +
> >>>
> >>> Ah, I see, what we really should do is make sure the quirks in the driver data get
> >>> added to xhci->quirks, and then just check for the correct quirk in xhci_pci_remove.
> >>
> >> Ah sure that does sound better, I will update this as well and send an
> >> update with these changes
> > 
> > This works for me.. But I have kept the code as in the xhci_pci_probe(),
> > ofcourse removed bool renesas_device.
> 
> That's fine, xhci is just hcd->hcd_priv, and it doesn't exists before
> usb_hcd_pci_probe() is called
> 
> usb_hcd_pci_probe()
>   usb_create_hcd()
>     hcd = kzalloc(sizeof(*hcd) + driver->hcd_priv_size, GFP_KERNEL);

Right, thanks for confirming

-- 
~Vinod
