Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01121DAA22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 07:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgETFyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 01:54:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgETFyl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 01:54:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7BCE206BE;
        Wed, 20 May 2020 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589954081;
        bh=O1pxQ7INrnCuQd9hdPVcKnLdagTuvEY7W8FKjx0XYjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VaohILpBk5Xp5pUB5JwSmDjhNqhA1R0IS1WQ46OuiSvgRrJAohcZeNHS3U8w/yGZg
         jvEagtePlwuZDA1FcquzPzAs+PYNS6VAaWdtGAzwkgZ7Qrx/oGoS9a6JVra+mSTWq8
         /OsRI2R3+ULWqk8LhQfItfv4wJx7c2FyhnPB/NYk=
Date:   Wed, 20 May 2020 07:54:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520055438.GA2236242@kroah.com>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
 <20200520045900.GA2105777@kroah.com>
 <20200520051135.GA11847@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520051135.GA11847@yoga>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 10:11:35PM -0700, Bjorn Andersson wrote:
> On Tue 19 May 21:59 PDT 2020, Greg Kroah-Hartman wrote:
> 
> > On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > > > Ok, that's a decision you are going to have to push upward on, as we
> > > > really can't take this without a working, open, userspace.
> > > 
> > > Uh wut.
> > > 
> > > So the merge criteria for drivers/accel (atm still drivers/misc but I
> > > thought that was interim until more drivers showed up) isn't actually
> > > "totally-not-a-gpu accel driver without open source userspace".
> > > 
> > > Instead it's "totally-not-a-gpu accel driver without open source
> > > userspace" _and_ you have to be best buddies with Greg. Or at least
> > > not be on the naughty company list. Since for habanalabs all you
> > > wanted is a few test cases to exercise the ioctls. Not the entire
> > > userspace.
> > 
> > Habanalabs now has their full library opensourced that their tools use
> > directly, so that's not an argument anymore.
> > 
> > My primary point here is the copyright owner of this code, because of
> > that, I'm not going to objet to allowing this to be merged without open
> > userspace code.
> > 
> 
> So because it's copyright Linux Foundation you are going to accept it
> without user space, after all?

Huh, no, the exact opposite, sorry, drop the "not" in that above
sentence.  My bad.

greg k-h
