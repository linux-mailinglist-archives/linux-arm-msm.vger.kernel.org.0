Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3809430702
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 09:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245021AbhJQHJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 03:09:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233513AbhJQHJg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 03:09:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55AEC60F23;
        Sun, 17 Oct 2021 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634454446;
        bh=uYrWYaNw+y04uyy1r1WLDgEiohtXcV0xRVaH9SH36H8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pd+b7WPWC6Eiej0nXxGyYVBEice/PLIcKYMLjtynosoywSbXMLRsWbl6HWNHiNwi2
         NpLiqzPolVambyF+cY9V9DMKZKtDfwhS/s8ySxAOkou1wEQv8z/LbvqkZ/O5oYYVD7
         255x+RRnHJIf84i4E9yRr6vOOoCN0tVbHaRbbQ+0=
Date:   Sun, 17 Oct 2021 09:07:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <YWvLptVv4+sAWA6H@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-3-manivannan.sadhasivam@linaro.org>
 <YWqByX6rdfuA1h1F@kroah.com>
 <20211016163128.GC4048@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016163128.GC4048@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 10:01:28PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Oct 16, 2021 at 09:39:53AM +0200, Greg KH wrote:
> > On Sat, Oct 16, 2021 at 12:27:33PM +0530, Manivannan Sadhasivam wrote:
> > > From: Loic Poulain <loic.poulain@linaro.org>
> > > 
> > > Currently, the MHI controller driver defines which channels should
> > > have their inbound buffers allocated and queued. But ideally, this is
> > > something that should be decided by the MHI device driver instead,
> > > which actually deals with that buffers.
> > > 
> > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > if buffers have to be allocated and queued by the MHI stack.
> > 
> > This is a horrible api.  Now one has to go and look up why "0" was added
> > to a function as a parameter.
> > 
> > If you don't want to allocate the buffer, then make a function of that
> > name and call that.  As you only have one "flag", don't try to make
> > something generic here that is obviously not generic at all.
> > 
> 
> This is the only API that can be used by the client drivers to pass the
> configurations to the MHI stack. So we wanted to have a flags parameter that
> could be extended in the future also.

Worry about future issues then, in the future :)

> Regarding "0", the default behaviour is to not pre allocate the buffer at all.
> So it made less sense to add a separate flag or an API for that.

But again, this is now hard to understand and if you run across a '0' in
the call, you have to go and look it up, breaking your reading flow.

Please just create a new function for this new option, and then have
both of them call the common function with a boolean for this "allocate
or not" type of thing.  We do this all the time in the kernel to make it
easier to read and understand over time.

thanks,

greg k-h
