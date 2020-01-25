Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F9414998A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2020 08:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgAZHnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jan 2020 02:43:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:48320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgAZHnC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jan 2020 02:43:02 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91B7E2083E;
        Sun, 26 Jan 2020 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580024582;
        bh=5EL2+31aM2DXNdXTnQvBx6rGRxurmW8mKfYO+eTZI48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VZHsB8jH6YZ6hbrCa7Chx7t1+GD0eCNo0pWpW3dgMnLswtZg5NvwMXMNRTA6HCb1w
         9DN5vAQLz17Y8sPTXNvk9IPxdvnhvH9ha+VOpH/lcioyHzn/AZlC8F0hh1Gaeldlnu
         n5rIYpu6fa+8gxWfl07Ps2ba7+Mh84wsVNzro0Sg=
Date:   Sat, 25 Jan 2020 14:46:31 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
Message-ID: <20200125134631.GA3518689@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
 <beadf428-82db-c89f-22bc-983d7b907bb3@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beadf428-82db-c89f-22bc-983d7b907bb3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 03:51:12PM -0700, Jeffrey Hugo wrote:
> > +struct mhi_event_ctxt {
> > +	u32 reserved : 8;
> > +	u32 intmodc : 8;
> > +	u32 intmodt : 16;
> > +	u32 ertype;
> > +	u32 msivec;
> > +
> > +	u64 rbase __packed __aligned(4);
> > +	u64 rlen __packed __aligned(4);
> > +	u64 rp __packed __aligned(4);
> > +	u64 wp __packed __aligned(4);
> > +};
> 
> This is the struct that is shared with the device, correct?  Surely it needs
> to be packed then?  Seems like you'd expect some padding between msivec and
> rbase on a 64-bit system otherwise, which is probably not intended.
> 
> Also I strongly dislike bitfields in structures which are shared with
> another system since the C specification doesn't define how they are
> implemented, therefore you can run into issues where different compilers
> decide to implement the actual backing memory differently.  I know its less
> convinent, but I would prefer the use of bitmasks for these fields.

You have to use bitmasks in order for all endian cpus to work properly
here, so that needs to be fixed.

Oh, and if these values are in hardware, then the correct types also
need to be used (i.e. __u32 and __u64).

good catch!

greg k-h
