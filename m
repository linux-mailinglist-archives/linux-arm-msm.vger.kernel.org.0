Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A325C1D13A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 14:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731862AbgEMM6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 08:58:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729345AbgEMM6E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 08:58:04 -0400
Received: from localhost (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09A2F20753;
        Wed, 13 May 2020 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589374683;
        bh=z8ktgUv0RqO7zvZCUaDL+1/C1Qami3n63M3XsUU5y0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KU0Kz0GUcvuniZJeT5XqGvbln7iZQmRyoVX2qel6IiXd1LwLWp8cHmounYzweHPe6
         DUAiwWPMlCGbDm4yeWath3SACqH1XJ8Cp5gHUsH16g53JIimP/t99xmEQlxo9jAnt/
         eWsol2Lh2cI9pdEgM15dtngtE0ozxI6Kj4Z87HFs=
Date:   Wed, 13 May 2020 18:27:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/5] usb: xhci: Add support for Renesas USB
 controllers
Message-ID: <20200513125759.GI14092@vkoul-mobl>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <edb2df23-6193-fdb1-d9f9-ffc33a40c05e@linux.intel.com>
 <20200513124007.GA1082134@kroah.com>
 <f15262e7-3f46-5574-59cc-d98488f299fc@linux.intel.com>
 <20200513125231.GA1084414@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513125231.GA1084414@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-05-20, 14:52, Greg Kroah-Hartman wrote:
> On Wed, May 13, 2020 at 03:51:28PM +0300, Mathias Nyman wrote:
> > On 13.5.2020 15.40, Greg Kroah-Hartman wrote:
> > > On Wed, May 13, 2020 at 03:19:29PM +0300, Mathias Nyman wrote:
> > >> On 6.5.2020 9.00, Vinod Koul wrote:
> > >>> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > >>> These require firmware to be loaded and in case devices have ROM those can
> > >>> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > >>>
> > >>> This includes patches from Christian which supported these controllers w/o
> > >>> ROM and later my patches for ROM support and debugfs hook for rom erase and
> > >>> export of xhci-pci functions.
> > >>>
> > >>
> > >> First four patches look ok to me, but 5/5 that adds rom erase debugfs support
> > >> still needs some work.
> > >>
> > >> If you prefer I can take the first four, maybe we can get them to 5.8, and then
> > >> later add that debugs rom erase support.
> > >>
> > >> Let me know what you prefer
> > > 
> > > Oops, I just added all of these to my testing tree :)
> > > 
> > > What's wrong with the debugfs patch?  I can drop it, but it seemed
> > > simple enough to me.
> > 
> > Added "usb_renesas" directory under debugfs root when we have easily accessible
> > debugfs/usb/xhci directory to use as parent. 
> 
> I've responded to the patch now, sorry I missed that.

I can send an update on top of this to use xhci root, or respin this
patch, either ways is fine by me.

> > Also not checking if adding directory failed (if debufs not supported)
> 
> That's fine and encouraged to do :)

Yes, I have known you 'encouraging' folks for that, hence coded it :)

Thanks
-- 
~Vinod
