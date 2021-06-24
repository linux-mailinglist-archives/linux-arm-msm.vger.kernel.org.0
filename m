Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8CA3B3429
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 18:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhFXQuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 12:50:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhFXQuh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 12:50:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51F66613F9;
        Thu, 24 Jun 2021 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624553297;
        bh=GrP1fgouFxOKm/VlGOFI6pOTMfhEfIvrEUVvbotYtUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W19jJtm3tk98f7a41VuwovLnLP8SQMIRSqCLQGGYVyq74rhHruL+e+whkz7KwihCR
         KhDsaPNrbcOQ9QMNnFiXhLfwAua28ZqtXW7cjgQgoiyM72VIcF4p3ad76FEAo2TR5A
         hkD1j1M4DxtrN/onHGv5LuG3kSxgijLvFafGiHR4=
Date:   Thu, 24 Jun 2021 18:48:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 4/8] bus: mhi: Add inbound buffers allocation flag
Message-ID: <YNS3T6Tp4oc66zFh@kroah.com>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-5-manivannan.sadhasivam@linaro.org>
 <YNSN6Yjk/P05ql8G@kroah.com>
 <CAMZdPi9=F0agD=5eSmVngmDRXNhb7TstQzgMSXFoJzkuRVFtjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9=F0agD=5eSmVngmDRXNhb7TstQzgMSXFoJzkuRVFtjQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 05:39:58PM +0200, Loic Poulain wrote:
> Hi Greg,
> 
> On Thu, 24 Jun 2021 at 15:51, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jun 21, 2021 at 09:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > From: Loic Poulain <loic.poulain@linaro.org>
> > >
> > > Currently, the MHI controller driver defines which channels should
> > > have their inbound buffers allocated and queued. But ideally, this is
> > > something that should be decided by the MHI device driver instead,
> > > which actually deals with that buffers.
> > >
> > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > if buffers have to be allocated and queued by the MHI stack.
> > >
> > > Keep auto_queue flag for now, but should be removed at some point.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Acked-by: Jakub Kicinski <kuba@kernel.org>
> > > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> [...]
> > > +/**
> > > + * enum mhi_chan_flags - MHI channel flags
> > > + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
> > > + */
> > > +enum mhi_chan_flags {
> > > +     MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> >
> > Why is an enumerated type a bitfield?
> >
> > Please just use integers for enumerated types.
> 
> This 'trick' for listing flags is used in other places like drm,
> mac80211, etc...: grep -r "BIT(0)," ./include/

An enum is a list of values that are unique.  Not values you can mush
together into a single variable and look at the bit masks of.

> I don't understand why it would not be right? should we simply use
> a list of defines for this?

What are you using this for?  If you are going to combine them, then
yes, use #defines.

thanks,

greg k-h
