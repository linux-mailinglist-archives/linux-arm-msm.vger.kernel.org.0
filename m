Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF433270B09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 08:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgISGDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 02:03:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgISGDd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 02:03:33 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4707820DD4;
        Sat, 19 Sep 2020 06:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600495413;
        bh=BjlADGlYj36HiizsrLcIy5xSLzS1x/lA9GoI2whYhZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gGU6RqOo0c+wf7esLi8DAN3i/Zs80j0KkjJVz5ecuzweYn7wSJ1zsIfXfQGGaAdiW
         HS/O8MRIKXiMzYpbt/3K2I0s97Pgc+gIn9AdTUkeboMqyDxGFXqFFb6MZj3ssnmtMa
         R54pI5gGCLhg9ZwofjGOX2L1IuZ1zGhgHvkUR5KM=
Date:   Sat, 19 Sep 2020 08:03:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
Message-ID: <20200919060328.GA435759@kroah.com>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
 <20200917164419.GC721081@kroah.com>
 <4e60cac3-d680-93ea-922e-bd4f22cf3f0a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e60cac3-d680-93ea-922e-bd4f22cf3f0a@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 11:14:08AM -0700, Hemant Kumar wrote:
> Hi Greg,
> 
> On 9/17/20 9:44 AM, Greg KH wrote:
> > On Wed, Sep 16, 2020 at 12:56:07PM -0700, Hemant Kumar wrote:
> ...
> ...
> > > +
> > > +static int mhi_uci_open(struct inode *inode, struct file *filp)
> > > +{
> > > +	struct uci_dev *udev = NULL;
> > > +	unsigned int minor = iminor(inode);
> > > +	int ret = -EIO;
> > > +	struct uci_buf *buf_itr, *tmp;
> > > +	struct uci_chan *dl_chan;
> > > +	struct mhi_device *mhi_dev;
> > > +	struct device *dev;
> > > +
> > > +	mutex_lock(&uci_idr_mutex);
> > > +	udev = idr_find(&uci_idr, minor);
> > > +	mutex_unlock(&uci_idr_mutex);
> > > +	if (!udev) {
> > > +		pr_err("uci dev: minor %d not found\n", minor);
> > 
> > Don't spam the kernel log for things that users can do :(
> i will change it to a pr_debug, as it helps to debug why open() is failing.
> > 
> > > +		ret = -ENODEV;
> > > +		goto error_no_dev;
> > > +	}
> > > +
> > > +	kref_get(&udev->ref_count);
> > 
> > Why grab a reference?  What does that help with?
> In case open() and driver remove() are racing, it helps to prevent use after
> free of udev in open().

Are you sure it prevents that?  Where is the lock that handles dropping
a reference count and incrementing it at the same time?

krefs are not "lock free" entirely, they need to have some type of other
control somewhere to prevent foolish things from happening :)

> > > +
> > > +	mhi_dev = udev->mhi_dev;
> > > +	dev = &mhi_dev->dev;
> > > +
> > > +	mutex_lock(&udev->lock);
> > > +	if (kref_read(&udev->ref_count) > 2) {
> > > +		dev_dbg(dev, "Node already opened\n");
> > 
> > Nope, this is NOT doing what you think it is doing.
> > 
> > I told you before, do not try to keep a device node from being opened
> > multiple times, as it will always fail (think about passing file handles
> > around between programs...)
> > 
> > If userspace wants to do this, it will do it.  If your driver can't
> > handle that, that's fine, userspace will learn not to do that.  But the
> > kernel can not prevent this from happening.
> This check is not returning error, instead just setting filp->private_data =
> udev; and return 0; It is skipping channel prepare
> and queuing of inbound buffers which was done by first open().

But don't do that by checking a kref value.  You should never care about
the value of it, that is not how you use it at all, and one reason I
hate that function is even present in the kernel...

thanks,

greg k-h
