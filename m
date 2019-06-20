Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40EDC4D495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 19:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfFTRLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 13:11:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbfFTRLI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 13:11:08 -0400
Received: from localhost (unknown [106.51.107.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14F3B2082C;
        Thu, 20 Jun 2019 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561050667;
        bh=n6B7VqKGVawxjMyw2yq5bPlq66NxeaTyVE4Kp1Ja2ZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LWlLGHKfRvVKXAbg+FOMx8R3T3+6/zBofP35Xv3UB02sJZ8RbG6xzepsaHKuAw3Oe
         Hx7hWFcZxUud2TKy0YCCXiKtFtQNuDIWamTPThRtWwkE5jZI1nfEV56+G2oecmcCI2
         +43jxUUZG35+r9g0ikqflgR1BuWRO1SRThpYLZjQ=
Date:   Thu, 20 Jun 2019 22:37:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 5/5] usb: xhci: allow multiple firmware versions
Message-ID: <20190620170756.GP2962@vkoul-mobl>
References: <20190620102154.20805-1-vkoul@kernel.org>
 <20190620102154.20805-6-vkoul@kernel.org>
 <20190620122013.GE19295@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620122013.GE19295@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-06-19, 14:20, Greg Kroah-Hartman wrote:
> On Thu, Jun 20, 2019 at 03:51:54PM +0530, Vinod Koul wrote:
> > Allow multiple firmware file versions in table and load them in
> > increasing order as we find them in the file system.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> >  drivers/usb/host/xhci-pci.c | 39 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index 3574afac44c5..2ee9e6bbabcb 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -333,9 +333,12 @@ static const struct renesas_fw_entry {
> >  	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > +	 *
> > +	 *  Entry expected_version should be kept in increasing order
> 
> Why?

I should have explained more :)
This is required only for the devices which have multiple versions
available, so it will pick one try it out and if not found go to
subsequent one. So I thought it would be make sense to keep the version
values for a specific device (not whole table) ordered so that we can
pick the next entry. Of course if you have better idea to manage two
versions, am all ears :)

> 
> >  	 */
> >  	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
> >  	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> > +	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
> >  	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
> 
> Just put a { } entry here at the end and then you don't care about the
> order at all.  Much simpler and easier to maintain over time.
> 

-- 
~Vinod
