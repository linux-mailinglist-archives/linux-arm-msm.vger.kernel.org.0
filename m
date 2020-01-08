Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED6C134A77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 19:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgAHS3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 13:29:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727169AbgAHS3K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 13:29:10 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C321820692;
        Wed,  8 Jan 2020 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578508149;
        bh=6zjORTcadsJG3lFVKDoJP+hFIkS8FvrSkmNU0jxtPCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueYpDdxRfD3k2XWZcytTO0CgtCwh87hNnBlLDtjVzQXfFuf6yAPXiGv7hfYyhQkKY
         YIz+nGrpqqoZDev5qkDrpp0QDRHLeoLmjJuHNMHXj0VFkcRvCsDOFLC53uVkyHNa4W
         EzP3RimgDB/VO/QLWGydZ3gnxtlCFi4LCMAVCFFA=
Date:   Wed, 8 Jan 2020 19:29:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200108182907.GB2549996@kroah.com>
References: <20191106083843.1718437-1-vkoul@kernel.org>
 <CANcMJZDqX6-+naGEbBiyM+1cZS6jfMoP9bm5Uk4ZuP_mw5aNWw@mail.gmail.com>
 <20200108040707.GU2818@vkoul-mobl>
 <20200108062436.GA2276347@kroah.com>
 <b0dc038b-cc25-1d37-9339-689bb5b61ff7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0dc038b-cc25-1d37-9339-689bb5b61ff7@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 08, 2020 at 06:00:48PM +0200, Mathias Nyman wrote:
> On 8.1.2020 8.24, Greg Kroah-Hartman wrote:
> > On Wed, Jan 08, 2020 at 09:37:07AM +0530, Vinod Koul wrote:
> > > Hi John,
> > > 
> > > On 07-01-20, 11:51, John Stultz wrote:
> > > > On Wed, Nov 6, 2019 at 12:40 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > > > 
> > > > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > > > These require firmware to be loaded and in case devices have ROM those can
> > > > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > > > 
> > > > > This includes two patches from Christian which supported these controllers
> > > > > w/o ROM and later my patches for ROM support and multiple firmware versions.
> > > > > 
> > > > 
> > > > Hey Vinod!
> > > >     In pushing this series to one of the Android trees for the db845c,
> > > > there was some concern raised that this series is adding a lot of
> > > > renesas specific logic to the more generic xhci-pci driver. There was
> > > > some question if instead that logic should be added to its own
> > > > file/module? Do you have any thoughts on this?
> > > 
> > > TBH I have not thought about that and in previous post neither Greg or
> > > Mathias gave a feedback that this was not acceptable...
> > > 
> > > We can think about splitting but apart from firmware load there is not
> > > much extra functionality that we need to add, the controller behaviour
> > > as a standard xhci-pci. So i am not sure if we gain much by splitting.
> > > 
> > > > Also, It seems there hasn't been much feedback on this for a few
> > > > months now. Is there a newer version of the patchset I should sync
> > > > with? Do you have plans to resubmit soon?
> > > 
> > > Well am still waiting for feedback :( I dont have any update on top of
> > > this, I can repost but I dont think that really serves a purpose.
> > > 
> > > I would really like to hear from Greg if this series is acceptable and
> > > if not what would he like to see changed.
> > 
> > Greg is not the xhci maintainer :)
> > 
> 
> Reviewing this always got bumped down on my todo list as other urgent issues
> came up.
> 
> I think the concern about adding this amount of renesas specific code to
> xhci-pci.c is valid. This series adds over 900 lines of Renesas FW loading
> code to a 600 line xhci-pci.c

Yeah, that's not good, should be simple to split it into a separate file
that's only build if that hardware is selected.

thanks,

greg k-h
