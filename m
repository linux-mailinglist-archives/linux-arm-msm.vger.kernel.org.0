Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0305B149F31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 08:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgA0HVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 02:21:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:33544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgA0HVa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 02:21:30 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96DDD20702;
        Mon, 27 Jan 2020 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580109690;
        bh=zyx7MlovBaHqREoEGe7StehB9D36LjrQuxtgzD7rRPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xydVaDx8hefBeGTESOELkVmsgxqE3J6pdwmidoET0PXJShUFdUdhUXy4hnNC0Bxqm
         Fhu1FGEZN3GRB2RgPR+i/5jgWtkoYefIMC12NXonw+2dxmKbx2FIXT2c7L4MwERvKf
         vg3FF4WUxF1angQsK56VwR8a94/crfRbynhPvLnY=
Date:   Mon, 27 Jan 2020 08:21:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, arnd@arndb.de,
        smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
Message-ID: <20200127072127.GA281402@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
 <beadf428-82db-c89f-22bc-983d7b907bb3@codeaurora.org>
 <20200125134631.GA3518689@kroah.com>
 <20200127071052.GB4768@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127071052.GB4768@mani>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 27, 2020 at 12:40:52PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Jan 25, 2020 at 02:46:31PM +0100, Greg KH wrote:
> > On Fri, Jan 24, 2020 at 03:51:12PM -0700, Jeffrey Hugo wrote:
> > > > +struct mhi_event_ctxt {
> > > > +	u32 reserved : 8;
> > > > +	u32 intmodc : 8;
> > > > +	u32 intmodt : 16;
> > > > +	u32 ertype;
> > > > +	u32 msivec;
> > > > +
> > > > +	u64 rbase __packed __aligned(4);
> > > > +	u64 rlen __packed __aligned(4);
> > > > +	u64 rp __packed __aligned(4);
> > > > +	u64 wp __packed __aligned(4);
> > > > +};
> > > 
> > > This is the struct that is shared with the device, correct?  Surely it needs
> > > to be packed then?  Seems like you'd expect some padding between msivec and
> > > rbase on a 64-bit system otherwise, which is probably not intended.
> > > 
> > > Also I strongly dislike bitfields in structures which are shared with
> > > another system since the C specification doesn't define how they are
> > > implemented, therefore you can run into issues where different compilers
> > > decide to implement the actual backing memory differently.  I know its less
> > > convinent, but I would prefer the use of bitmasks for these fields.
> > 
> > You have to use bitmasks in order for all endian cpus to work properly
> > here, so that needs to be fixed.
> > 
> 
> Okay.
> 
> > Oh, and if these values are in hardware, then the correct types also
> > need to be used (i.e. __u32 and __u64).
> > 
> 
> I thought the __* prefix types are only for sharing with userspace...
> Could you please clarify why it is needed here?

It crosses the kernel boundry, so it needs to use those types.  This is
not a new requirement, has been there for decades.

greg k-h
