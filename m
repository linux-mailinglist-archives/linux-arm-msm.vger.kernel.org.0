Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8571B265AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 09:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgIKHru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 03:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgIKHrr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 03:47:47 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E1D62076C;
        Fri, 11 Sep 2020 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599810466;
        bh=I4uLoN15SZgdT8c9PzvgWvYDrFak69CCGmHCBzzkfp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bv7hWyU8RZyuN6jfDc5+ORLIBpvhh5aMtRwI2Nh3NJphbVWjwIZrxhoYb+DHeDr8v
         8qk4qCKaaZ1kRmiPZpBF/Bc5F55Q4LGfaQ6tNdLgu8nG9ZmlvdGXOU0dWfT0N+iUsa
         vws3sKPZthzoylmn3VIK9R5h3RGV74Mj8e6O9IJw=
Date:   Fri, 11 Sep 2020 09:47:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v5 4/4] bus: mhi: clients: Add userspace client interface
 driver
Message-ID: <20200911074752.GB3324216@kroah.com>
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
 <1596696063-17802-5-git-send-email-hemantk@codeaurora.org>
 <20200907093725.GC1393659@kroah.com>
 <010101747bd97269-a941d364-78ea-488c-baae-5a1c924d9e43-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101747bd97269-a941d364-78ea-488c-baae-5a1c924d9e43-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 11, 2020 at 06:28:02AM +0000, Hemant Kumar wrote:
> > > +struct uci_dev {
> > > +	unsigned int minor;
> > > +	struct mhi_device *mhi_dev;
> > > +	const char *chan;
> > > +
> > > +	/* protects uci_dev struct members */
> > > +	struct mutex lock;
> > > +
> > > +	struct uci_chan ul_chan;
> > > +	struct uci_chan dl_chan;
> > > +	size_t mtu;
> > > +	size_t actual_mtu;
> > > +	struct kref ref_count;
> > > +	struct kref open_count;
> > 
> > I'm stopping right here.  A structure can only have ONE reference count
> > to control its lifespan.  You have 2 here, which guarantees that either
> > you are using a kref incorrectly, or your code is totally confused and
> > will break easily.
> > 
> > Please fix this as this is not how to do this.
> > 
> > Also, why does anyone need to care about the number of times that open()
> > is called?  The vfs layer should handle all of that for you, right?
> Reason for using open_count was to allow start MHI channel only when first
> open() was called and stop the MHI channel when last release() is called.
> Since uci driver just need to handle one open() from user space
> other calls to open can simply return -EBUSY. i will get rid of open_count
> and does not let multiple threads to open same file node.

You will fail in trying to attempt only one open on your device node,
sorry.  You can properly trigger off of the first/last things, but
having two different reference counts is NOT how to do this, those are
to control the lifetime of a structure/object.

greg k-h
