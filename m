Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD412006E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 12:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732613AbgFSKlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 06:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732362AbgFSKlG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 06:41:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFDEC06174E
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 03:41:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id v11so4331919pgb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OF7R+EnCgvLF+NyPh3EdHbj5+H3MGSs3mcD/KInX8r0=;
        b=BSgT+j9LeVx/g7rWk7Upj/oo0FKxnYm/i8sSngLTsWfye/KS57r7tLCfssUbxJ2Ftd
         ARhrkr9W5dCnX1GKohq1sAjvyMyj3Uq9dWN6RkxehVdJ/62SvoAVHebK0tKWF3THLOip
         km+uyPsVVJ3JLdGXcctkLX26IpILSA16cFGB4+HrfLCV3Xd9S5Sdk5AZfJTDRGXuglsN
         qPDGu/dEYtAHhuIICpU4sfIQgH5tya2juys3OZdAHYfiQy1bh1/JvYlIxEwxKJju/H92
         vFsdnK9hG7N87PzhuE8O8WyPhagEuNGSKpEfYEjrltsKxJ4AAxeTX4SYtfuxRf/vWiWY
         pYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OF7R+EnCgvLF+NyPh3EdHbj5+H3MGSs3mcD/KInX8r0=;
        b=YshjUM50NOQHaFY3hNZGeYTpJBWOR/Po+lQBKUKgjI2Zf+W0AINfFUMFybv9VBtl/n
         eKN2quCL9COOE1s0JS4j3Yw22Z13RrFEoiFaCsYLFbIEO8Wr9uCCAlvV6Zcot49rsHz8
         sehESnK/2q4jk3qrdHYC6hciC4LeDDXEIUuk8YoskL8WgW4TBvO2XgghZ6PrWZcVdbxR
         YUvevwO4EeWC7vB4j3RNMlEl9Vdw5ZoYjlEox/uGny0tlKbXqSr3TnkRPj2IaXuUsXVR
         8bSwc6uXDBBXgd+onK/zEzi0wdLVawZcBbu8UcIrAzfqeV0lQ8lHqW7w+K8+uB+/x/BH
         Lkrw==
X-Gm-Message-State: AOAM533WV2XwO04sTzG6NF7LlLbsxaU6o+Mar66utqbI+gZZtLui6kiT
        Fxb8MTuPhFo7TQVL8O3snfdB
X-Google-Smtp-Source: ABdhPJyY4h7mn/6ypQAdlj4wzaTiUXp+SC4GBgmPmBTLLYedCV9uGJMDcOQou7t5PlknGbY2drbapw==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr2537770pgq.272.1592563264546;
        Fri, 19 Jun 2020 03:41:04 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:59f:c065:651a:bc24:a9bb:ff41])
        by smtp.gmail.com with ESMTPSA id l63sm5702057pfd.122.2020.06.19.03.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 03:41:03 -0700 (PDT)
Date:   Fri, 19 Jun 2020 16:10:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v3 4/4] bus: mhi: clients: Add user space client
 interface driver
Message-ID: <20200619104058.GD3245@Mani-XPS-13-9360>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-5-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591899224-3403-5-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 11:13:44AM -0700, Hemant Kumar wrote:
> This MHI client driver allows user space clients to transfer
> data between MHI device and host using standard file operations.

I think we need to explicitly specify 'raw' data here. Because we have different
APIs for queuing different types of data. So saying just data sounds vague
unless this driver can handle multiple types of data which I don't think can
happen.

And you need to update the same in docs.

> Device file node is created with format
> 
> /dev/mhi_<controller_name>_<mhi_device_name>
> 
> Currently it supports loopback client.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/Kconfig          |   2 +
>  drivers/bus/mhi/Makefile         |   1 +
>  drivers/bus/mhi/clients/Kconfig  |  16 +
>  drivers/bus/mhi/clients/Makefile |   3 +
>  drivers/bus/mhi/clients/uci.c    | 652 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 674 insertions(+)
>  create mode 100644 drivers/bus/mhi/clients/Kconfig
>  create mode 100644 drivers/bus/mhi/clients/Makefile
>  create mode 100644 drivers/bus/mhi/clients/uci.c
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index 6a217ff..f224be8 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,5 @@ config MHI_BUS_DEBUG
>  	 Enable debugfs support for use with the MHI transport. Allows
>  	 reading and/or modifying some values within the MHI controller
>  	 for debug and test purposes.

Hmm, so this patchset depends on debugfs patches? You need to mention this in
cover letter. Or even better, just make it independent.

> +
> +source "drivers/bus/mhi/clients/Kconfig"
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..48f6028 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,3 @@
>  # core layer
>  obj-y += core/
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/clients/Kconfig b/drivers/bus/mhi/clients/Kconfig
> new file mode 100644
> index 0000000..cd84419
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "MHI clients support"
> +       depends on MHI_BUS

I don't think we need MHI_BUS dependency here.

> +
> +config MHI_UCI
> +       tristate "MHI UCI"
> +       depends on MHI_BUS
> +       help
> +	  MHI based userspace client interface driver is for transferring

s/is for/used for/g. Also provide indent for help text.

> +	  data between host and device using standard file operations from
> +	  user space. Open, read, write, and close operations are supported

Please use 'userspace' everywhere.

> +	  by this driver. Please check mhi_uci_match_table for all supported
> +	  channels that are exposed to userspace.
> +
> +endmenu
> diff --git a/drivers/bus/mhi/clients/Makefile b/drivers/bus/mhi/clients/Makefile
> new file mode 100644
> index 0000000..dd2930c
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_MHI_UCI) +=uci.o

space after '+='

> diff --git a/drivers/bus/mhi/clients/uci.c b/drivers/bus/mhi/clients/uci.c
> new file mode 100644
> index 0000000..8f36fb0
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/uci.c
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
> +
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mhi.h>

Please sort includes alphabetically.

> +#include <linux/poll.h>
> +
> +#define DEVICE_NAME "mhi"
> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
> +#define MAX_UCI_DEVICES (64)
> +

How about the kdoc comments for all fields and structures used?

> +struct uci_chan {
> +	wait_queue_head_t wq;
> +
> +	/* locks ul/dl uci device channel */
> +	spinlock_t lock;

It seems like you are trying to protect a field (enabled) in parent structure
(uci_dev) using this lock. This sounds weird. Why can't you just use the mutex
present in that?

> +
> +	 /* user space waiting to read */

The comments should clearly portray what the field is for.

> +	struct list_head pending;
> +
> +	 /* current buffer user space reading */

This sentence is not correct.

> +	struct uci_buf *cur_buf;
> +	size_t rx_size;
> +};
> +
> +struct uci_buf {
> +	void *data;
> +	size_t len;
> +	struct list_head node;
> +};
> +
> +struct mhi_uci_drv {
> +	struct list_head head;
> +
> +	/* uci driver lock to sync open, probe and remove */
> +	struct mutex lock;
> +	struct class *class;
> +	int major;
> +	dev_t dev_t;

devt?

> +};
> +
> +struct uci_dev {
> +	struct list_head node;
> +	dev_t devt;
> +	struct device *dev;
> +	struct mhi_device *mhi_dev;
> +	const char *chan;
> +
> +	/* sync open and close */

Again, please use descriptive comments. Need not be multi lines but something
which could be understood easily.

> +	struct mutex mutex;
> +	struct uci_chan ul_chan;
> +	struct uci_chan dl_chan;
> +	size_t mtu;
> +
> +	/* maximum size of incoming buffer */
> +	size_t actual_mtu;
> +	int ref_count;
> +	bool enabled;
> +};
> +
> +static DECLARE_BITMAP(uci_minors, MAX_UCI_DEVICES);
> +static struct mhi_uci_drv mhi_uci_drv;

Please use object names different from datatype names everywhere.

> +
> +static int mhi_queue_inbound(struct uci_dev *uci_dev)
> +{
> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> +	struct device *dev = &mhi_dev->dev;
> +	int nr_trbs = mhi_get_no_free_descriptors(mhi_dev, DMA_FROM_DEVICE);

I'd prefer to have this assignment in definition block.

> +	size_t mtu = uci_dev->mtu;
> +	size_t actual_mtu = uci_dev->actual_mtu;
> +	void *buf;
> +	struct uci_buf *uci_buf;
> +	int ret = -EIO, i;
> +
> +	for (i = 0; i < nr_trbs; i++) {
> +		buf = kmalloc(mtu, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +
> +		uci_buf = buf + actual_mtu;

Aren't you segfaulting here?

> +		uci_buf->data = buf;

Where is this uci_buf getting used?

> +
> +		dev_dbg(dev, "Allocated buf %d of %d size %ld\n", i, nr_trbs,
> +			actual_mtu);
> +
> +		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, actual_mtu,
> +				    MHI_EOT);
> +		if (ret) {
> +			kfree(buf);
> +			dev_err(dev, "Failed to queue buffer %d\n", i);

Failed to queue buffer: %d

> +			return ret;
> +		}

So is this buffer getting freed anywhere?

> +	}
> +
> +	return ret;
> +}
> +
> +static int mhi_uci_release(struct inode *inode, struct file *file)
> +{
> +	struct uci_dev *uci_dev = file->private_data;
> +
> +	mutex_lock(&uci_dev->mutex);
> +	uci_dev->ref_count--;
> +	if (!uci_dev->ref_count) {
> +		struct uci_buf *itr, *tmp;
> +		struct uci_chan *uci_chan;
> +
> +		if (uci_dev->enabled)
> +			mhi_unprepare_from_transfer(uci_dev->mhi_dev);
> +
> +		/* clean inbound channel */
> +		uci_chan = &uci_dev->dl_chan;
> +		list_for_each_entry_safe(itr, tmp, &uci_chan->pending, node) {
> +			list_del(&itr->node);
> +			kfree(itr->data);
> +		}

Add a new line after '}' and before next line of code.

> +		if (uci_chan->cur_buf)
> +			kfree(uci_chan->cur_buf->data);
> +
> +		uci_chan->cur_buf = NULL;
> +
> +		if (!uci_dev->enabled) {
> +			mutex_unlock(&uci_dev->mutex);
> +			mutex_destroy(&uci_dev->mutex);
> +			clear_bit(MINOR(uci_dev->devt), uci_minors);
> +			kfree(uci_dev);

Hmm. So you are freeing uci_dev here and also trying to do the same in
mhi_uci_remove.

> +			return 0;
> +		}
> +	}
> +
> +	mutex_unlock(&uci_dev->mutex);
> +
> +	return 0;
> +}
> +
> +static __poll_t mhi_uci_poll(struct file *file, poll_table *wait)
> +{
> +	struct uci_dev *uci_dev = file->private_data;
> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> +	struct device *dev = &mhi_dev->dev;
> +	struct uci_chan *uci_chan;
> +	__poll_t mask = 0;
> +
> +	poll_wait(file, &uci_dev->dl_chan.wq, wait);
> +	poll_wait(file, &uci_dev->ul_chan.wq, wait);
> +
> +	uci_chan = &uci_dev->dl_chan;
> +	spin_lock_bh(&uci_chan->lock);

This is what looks wrong to me.

> +	if (!uci_dev->enabled) {

So you are removing the char dev node even if there are users in the system.
Why do you want to do so?

> +		mask = EPOLLERR;
> +	} else {
> +		if (!list_empty(&uci_chan->pending) || uci_chan->cur_buf) {
> +			dev_dbg(dev, "Client can read from node\n");
> +			mask |= EPOLLIN | EPOLLRDNORM;
> +		}
> +	}
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	uci_chan = &uci_dev->ul_chan;
> +	spin_lock_bh(&uci_chan->lock);
> +	if (!uci_dev->enabled) {
> +		mask |= EPOLLERR;
> +	} else if (mhi_get_no_free_descriptors(mhi_dev, DMA_TO_DEVICE) > 0) {
> +		dev_dbg(dev, "Client can write to node\n");
> +		mask |= EPOLLOUT | EPOLLWRNORM;
> +	}
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	dev_dbg(dev, "Client attempted to poll, returning mask 0x%x\n", mask);
> +
> +	return mask;
> +}
> +
> +static ssize_t mhi_uci_write(struct file *file,
> +			     const char __user *buf,
> +			     size_t count,
> +			     loff_t *offp)
> +{
> +	struct uci_dev *uci_dev = file->private_data;
> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> +	struct device *dev = &mhi_dev->dev;
> +	struct uci_chan *uci_chan = &uci_dev->ul_chan;
> +	size_t bytes_xfered = 0;
> +	int ret, nr_avail;
> +
> +	if (!buf || !count)
> +		return -EINVAL;
> +
> +	/* confirm channel is active */
> +	spin_lock_bh(&uci_chan->lock);
> +	if (!uci_dev->enabled) {
> +		spin_unlock_bh(&uci_chan->lock);
> +		return -ERESTARTSYS;

You should return -ENODEV here.

> +	}
> +
> +	dev_dbg(dev, "Enter: to xfer:%lu bytes\n", count);
> +

Please avoid "Enter" debug prints.

> +	while (count) {
> +		size_t xfer_size;
> +		void *kbuf;
> +		enum mhi_flags flags;
> +
> +		spin_unlock_bh(&uci_chan->lock);

Why do you want to hold the lock till here?

> +
> +		/* wait for free descriptors */
> +		ret = wait_event_interruptible(uci_chan->wq,
> +					       (!uci_dev->enabled) ||
> +				(nr_avail = mhi_get_no_free_descriptors(mhi_dev,
> +					       DMA_TO_DEVICE)) > 0);

Does using "wait_event_interruptible_timeout" makes sense here?

> +
> +		if (ret == -ERESTARTSYS || !uci_dev->enabled) {
> +			dev_dbg(dev, "Exit signal caught for node or not enabled\n");
> +			return -ERESTARTSYS;

You need to return -ENODEV for !uci_dev->enabled case.

> +		}
> +
> +		xfer_size = min_t(size_t, count, uci_dev->mtu);
> +		kbuf = kmalloc(xfer_size, GFP_KERNEL);
> +		if (!kbuf)
> +			return -ENOMEM;
> +
> +		ret = copy_from_user(kbuf, buf, xfer_size);
> +		if (unlikely(ret)) {
> +			kfree(kbuf);
> +			return ret;
> +		}
> +
> +		spin_lock_bh(&uci_chan->lock);
> +
> +		/* if ring is full after this force EOT */
> +		if (nr_avail > 1 && (count - xfer_size))
> +			flags = MHI_CHAIN;
> +		else
> +			flags = MHI_EOT;
> +
> +		if (uci_dev->enabled)
> +			ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
> +					    xfer_size, flags);
> +		else
> +			ret = -ERESTARTSYS;

Again, please fix this all over the driver.

> +
> +		if (ret) {
> +			kfree(kbuf);
> +			goto sys_interrupt;
> +		}
> +
> +		bytes_xfered += xfer_size;
> +		count -= xfer_size;
> +		buf += xfer_size;
> +	}
> +
> +	spin_unlock_bh(&uci_chan->lock);
> +	dev_dbg(dev, "Exit: Number of bytes xferred:%lu\n", bytes_xfered);

Drop the "Exit" too.

> +
> +	return bytes_xfered;
> +
> +sys_interrupt:
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t mhi_uci_read(struct file *file,
> +			    char __user *buf,
> +			    size_t count,
> +			    loff_t *ppos)
> +{
> +	struct uci_dev *uci_dev = file->private_data;
> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
> +	struct device *dev = &mhi_dev->dev;
> +	struct uci_buf *uci_buf;
> +	char *ptr;
> +	size_t to_copy;
> +	int ret = 0;
> +
> +	if (!buf)
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "Client provided buf len:%lu\n", count);

Drop this.

> +
> +	mutex_lock(&uci_dev->mutex);
> +	/* confirm channel is active */
> +	spin_lock_bh(&uci_chan->lock);
> +	if (!uci_dev->enabled) {
> +		spin_unlock_bh(&uci_chan->lock);
> +		mutex_unlock(&uci_dev->mutex);
> +		return -ERESTARTSYS;
> +	}
> +
> +	/* No data available to read, wait */
> +	if (!uci_chan->cur_buf && list_empty(&uci_chan->pending)) {
> +		dev_dbg(dev, "No data available to read waiting\n");
> +
> +		spin_unlock_bh(&uci_chan->lock);
> +		mutex_unlock(&uci_dev->mutex);
> +		ret = wait_event_interruptible(uci_chan->wq,
> +					       (!uci_dev->enabled ||
> +					      !list_empty(&uci_chan->pending)));
> +		if (ret == -ERESTARTSYS) {
> +			dev_dbg(dev, "Exit signal caught for node\n");

No need of this.

> +			return -ERESTARTSYS;
> +		}
> +
> +		mutex_lock(&uci_dev->mutex);
> +		spin_lock_bh(&uci_chan->lock);
> +		if (!uci_dev->enabled) {
> +			dev_dbg(dev, "node is disabled\n");

Okay, this is what I'm concerned about.

> +			ret = -ERESTARTSYS;
> +			goto read_error;
> +		}
> +	}
> +
> +	/* new read, get the next descriptor from the list */
> +	if (!uci_chan->cur_buf) {
> +		uci_buf = list_first_entry_or_null(&uci_chan->pending,
> +						   struct uci_buf, node);
> +		if (unlikely(!uci_buf)) {
> +			ret = -EIO;
> +			goto read_error;
> +		}
> +
> +		list_del(&uci_buf->node);
> +		uci_chan->cur_buf = uci_buf;
> +		uci_chan->rx_size = uci_buf->len;
> +		dev_dbg(dev, "Got pkt of size:%zu\n", uci_chan->rx_size);
> +	}
> +
> +	uci_buf = uci_chan->cur_buf;
> +
> +	/* Copy the buffer to user space */
> +	to_copy = min_t(size_t, count, uci_chan->rx_size);
> +	ptr = uci_buf->data + (uci_buf->len - uci_chan->rx_size);
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	ret = copy_to_user(buf, ptr, to_copy);
> +	if (ret)
> +		goto err_unlock_mtx;
> +
> +	spin_lock_bh(&uci_chan->lock);
> +
> +	dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uci_chan->rx_size);
> +	uci_chan->rx_size -= to_copy;
> +
> +	/* we finished with this buffer, queue it back to hardware */

Oh wait... what is happening here? Why do you want to do tx?

> +	if (!uci_chan->rx_size) {
> +		uci_chan->cur_buf = NULL;
> +
> +		if (uci_dev->enabled)
> +			ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
> +					    uci_buf->data,
> +					    uci_dev->actual_mtu, MHI_EOT);
> +		else
> +			ret = -ERESTARTSYS;
> +
> +		if (ret) {
> +			dev_err(dev, "Failed to recycle element\n");
> +			kfree(uci_buf->data);
> +			goto read_error;
> +		}
> +	}
> +	spin_unlock_bh(&uci_chan->lock);
> +	mutex_unlock(&uci_dev->mutex);
> +
> +	dev_dbg(dev, "Returning %lu bytes\n", to_copy);
> +
> +	return to_copy;
> +
> +read_error:
> +	spin_unlock_bh(&uci_chan->lock);
> +err_unlock_mtx:
> +	mutex_unlock(&uci_dev->mutex);
> +	return ret;
> +}
> +
> +static int mhi_uci_open(struct inode *inode, struct file *filp)
> +{
> +	struct uci_dev *uci_dev = NULL, *tmp_dev;
> +	int ret = -EIO;
> +	struct uci_buf *buf_itr, *tmp;
> +	struct uci_chan *dl_chan;
> +	struct mhi_device *mhi_dev;
> +	struct device *dev;
> +
> +	mutex_lock(&mhi_uci_drv.lock);
> +	list_for_each_entry(tmp_dev, &mhi_uci_drv.head, node) {
> +		if (tmp_dev->devt == inode->i_rdev) {
> +			uci_dev = tmp_dev;
> +			break;
> +		}
> +	}
> +
> +	/* could not find a minor node */
> +	if (!uci_dev)
> +		goto error_exit;
> +
> +	mhi_dev = uci_dev->mhi_dev;
> +	dev = &mhi_dev->dev;
> +
> +	mutex_lock(&uci_dev->mutex);
> +	if (!uci_dev->enabled) {
> +		dev_info(dev, "Node exist, but not in active state!\n");

Dangling node, right.

> +		goto error_open_chan;
> +	}
> +
> +	uci_dev->ref_count++;
> +
> +	dev_dbg(dev, "Node open, ref counts %u\n", uci_dev->ref_count);
> +
> +	if (uci_dev->ref_count == 1) {
> +		dev_dbg(dev, "Starting channel\n");
> +		ret = mhi_prepare_for_transfer(uci_dev->mhi_dev);
> +		if (ret) {
> +			dev_err(dev, "Error starting transfer channels\n");
> +			uci_dev->ref_count--;
> +			goto error_open_chan;
> +		}
> +
> +		ret = mhi_queue_inbound(uci_dev);
> +		if (ret)

Decrease refcount?

> +			goto error_rx_queue;
> +	}
> +
> +	filp->private_data = uci_dev;
> +	mutex_unlock(&uci_dev->mutex);
> +	mutex_unlock(&mhi_uci_drv.lock);
> +
> +	return 0;
> +
> +error_rx_queue:
> +	dl_chan = &uci_dev->dl_chan;
> +	mhi_unprepare_from_transfer(uci_dev->mhi_dev);
> +	list_for_each_entry_safe(buf_itr, tmp, &dl_chan->pending, node) {
> +		list_del(&buf_itr->node);
> +		kfree(buf_itr->data);
> +	}
> +
> +error_open_chan:
> +	mutex_unlock(&uci_dev->mutex);
> +
> +error_exit:
> +	mutex_unlock(&mhi_uci_drv.lock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations mhidev_fops = {
> +	.owner = THIS_MODULE,
> +	.open = mhi_uci_open,
> +	.release = mhi_uci_release,
> +	.read = mhi_uci_read,
> +	.write = mhi_uci_write,
> +	.poll = mhi_uci_poll,
> +};
> +
> +static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
> +			   struct mhi_result *mhi_result)
> +{
> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
> +	struct uci_chan *uci_chan = &uci_dev->ul_chan;
> +	struct device *dev = &mhi_dev->dev;
> +
> +	dev_dbg(dev, "status:%d xfer_len:%zu\n", mhi_result->transaction_status,

Always leave a space after :

> +		mhi_result->bytes_xferd);
> +
> +	kfree(mhi_result->buf_addr);
> +	if (!mhi_result->transaction_status)
> +		wake_up(&uci_chan->wq);
> +}
> +
> +static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
> +			   struct mhi_result *mhi_result)
> +{
> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
> +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
> +	struct device *dev = &mhi_dev->dev;
> +	unsigned long flags;
> +	struct uci_buf *buf;
> +
> +	dev_dbg(dev, "status:%d receive_len:%zu\n",
> +		mhi_result->transaction_status, mhi_result->bytes_xferd);
> +
> +	if (mhi_result->transaction_status == -ENOTCONN) {
> +		kfree(mhi_result->buf_addr);
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&uci_chan->lock, flags);
> +	buf = mhi_result->buf_addr + uci_dev->actual_mtu;
> +	buf->data = mhi_result->buf_addr;
> +	buf->len = mhi_result->bytes_xferd;
> +	list_add_tail(&buf->node, &uci_chan->pending);
> +	spin_unlock_irqrestore(&uci_chan->lock, flags);
> +
> +	wake_up(&uci_chan->wq);
> +}
> +
> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
> +			 const struct mhi_device_id *id)
> +{
> +	struct uci_dev *uci_dev;
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct device *dev = &mhi_dev->dev;
> +	int minor;
> +	int dir;
> +
> +	uci_dev = kzalloc(sizeof(*uci_dev), GFP_KERNEL);
> +	if (!uci_dev)
> +		return -ENOMEM;
> +
> +	mutex_init(&uci_dev->mutex);
> +	uci_dev->mhi_dev = mhi_dev;
> +
> +	mutex_lock(&uci_dev->mutex);
> +	mutex_lock(&mhi_uci_drv.lock);
> +
> +	minor = find_first_zero_bit(uci_minors, MAX_UCI_DEVICES);
> +	if (minor >= MAX_UCI_DEVICES) {
> +		mutex_unlock(&mhi_uci_drv.lock);
> +		mutex_unlock(&uci_dev->mutex);
> +		kfree(uci_dev);
> +		return -ENOSPC;
> +	}
> +

Add a comment regarding what is going on below.

> +	uci_dev->devt = MKDEV(mhi_uci_drv.major, minor);
> +	uci_dev->dev = device_create(mhi_uci_drv.class, &mhi_dev->dev,
> +				     uci_dev->devt, uci_dev,
> +				     DEVICE_NAME "_%s_%s",
> +				     dev_name(mhi_cntrl->cntrl_dev),
> +				     mhi_dev->name);
> +	set_bit(minor, uci_minors);
> +
> +	for (dir = 0; dir < 2; dir++) {
> +		struct uci_chan *uci_chan = (dir) ?
> +			&uci_dev->ul_chan : &uci_dev->dl_chan;
> +		spin_lock_init(&uci_chan->lock);
> +		init_waitqueue_head(&uci_chan->wq);
> +		INIT_LIST_HEAD(&uci_chan->pending);
> +	}
> +
> +	uci_dev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
> +	uci_dev->actual_mtu = uci_dev->mtu -  sizeof(struct uci_buf);
> +	dev_set_drvdata(&mhi_dev->dev, uci_dev);
> +	uci_dev->enabled = true;
> +
> +	list_add(&uci_dev->node, &mhi_uci_drv.head);
> +	mutex_unlock(&mhi_uci_drv.lock);
> +	mutex_unlock(&uci_dev->mutex);
> +
> +	dev_info(dev, "channel:%s successfully probed\n", mhi_dev->name);
> +
> +	return 0;
> +};
> +
> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
> +{
> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
> +	struct device *dev = &mhi_dev->dev;
> +
> +	dev_dbg(dev, "%s: enter\n", __func__);
> +

Drop this.

> +	mutex_lock(&mhi_uci_drv.lock);
> +	mutex_lock(&uci_dev->mutex);
> +
> +	/* disable the node */
> +	spin_lock_irq(&uci_dev->dl_chan.lock);
> +	spin_lock_irq(&uci_dev->ul_chan.lock);
> +	uci_dev->enabled = false;
> +	spin_unlock_irq(&uci_dev->ul_chan.lock);
> +	spin_unlock_irq(&uci_dev->dl_chan.lock);

You need to do something better here. This doesn't look good.

> +	wake_up(&uci_dev->dl_chan.wq);
> +	wake_up(&uci_dev->ul_chan.wq);
> +
> +	/* delete the node to prevent new opens */
> +	device_destroy(mhi_uci_drv.class, uci_dev->devt);
> +	uci_dev->dev = NULL;
> +	list_del(&uci_dev->node);
> +
> +	/* safe to free memory only if all file nodes are closed */

And what if it is already freed in .release?

> +	if (!uci_dev->ref_count) {
> +		mutex_unlock(&uci_dev->mutex);
> +		mutex_destroy(&uci_dev->mutex);
> +		clear_bit(MINOR(uci_dev->devt), uci_minors);
> +		dev_set_drvdata(&mhi_dev->dev, NULL);
> +		kfree(uci_dev);
> +		mutex_unlock(&mhi_uci_drv.lock);
> +		return;
> +	}
> +
> +	mutex_unlock(&uci_dev->mutex);
> +	mutex_unlock(&mhi_uci_drv.lock);
> +
> +	dev_dbg(dev, "%s: exit\n", __func__);

Drop this.

Thanks,
Mani

> +}
> +
> +/* .driver_data stores max mtu */
> +static const struct mhi_device_id mhi_uci_match_table[] = {
> +	{ .chan = "LOOPBACK", .driver_data = 0x1000 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
> +
> +static struct mhi_driver mhi_uci_driver = {
> +	.id_table = mhi_uci_match_table,
> +	.remove = mhi_uci_remove,
> +	.probe = mhi_uci_probe,
> +	.ul_xfer_cb = mhi_ul_xfer_cb,
> +	.dl_xfer_cb = mhi_dl_xfer_cb,
> +	.driver = {
> +		.name = MHI_UCI_DRIVER_NAME,
> +	},
> +};
> +
> +static int mhi_uci_init(void)
> +{
> +	int ret;
> +
> +	ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
> +	if (ret < 0)
> +		return ret;
> +
> +	mhi_uci_drv.major = ret;
> +	mhi_uci_drv.class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
> +	if (IS_ERR(mhi_uci_drv.class)) {
> +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> +		return -ENODEV;
> +	}
> +
> +	mutex_init(&mhi_uci_drv.lock);
> +	INIT_LIST_HEAD(&mhi_uci_drv.head);
> +
> +	ret = mhi_driver_register(&mhi_uci_driver);
> +	if (ret) {
> +		class_destroy(mhi_uci_drv.class);
> +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit mhi_uci_exit(void)
> +{
> +	mhi_driver_unregister(&mhi_uci_driver);
> +	class_destroy(mhi_uci_drv.class);
> +	unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> +}
> +
> +module_init(mhi_uci_init);
> +module_exit(mhi_uci_exit);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MHI UCI Driver");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
