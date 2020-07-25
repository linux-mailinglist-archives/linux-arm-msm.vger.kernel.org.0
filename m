Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB9322D8C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jul 2020 18:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgGYQtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jul 2020 12:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgGYQtU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jul 2020 12:49:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFD7C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2020 09:49:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q17so6068320pls.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2020 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2XUA+7jxJ9njB80JwiHFP/A5UtNo0uOCFaYJ9GFXBI8=;
        b=ooL/UD2UBcxlVYdoONlE5T+JFl+H+8nQ2qpC+tuBwfJjb748mtfG5Pwh3ZGF2qBXEG
         ntY4X1ag4/0BKLAhVashoQfBrKZR9OZsgy96+twcU+aKk7VQnVq2rgXtiMR8JTcjPV+I
         K2U00rDFttjwGOdm5ZCxBtjQeWno1hrb+d4XIUE+2yZNtvCkG/XQSvgbpye2tVUXOxV8
         XbTPDUKPDRBLyXJMlkWUWxZ3ccFFdpJLbfwQBAPjcisLBmT84SeVY8nakyXjBRpemegb
         AHYSptR02pPmwSr8MivjmXXV6ZC++zyql9ciPdJ8CfR7kwH/KRXA90BI/PVAbvY6+obH
         bXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2XUA+7jxJ9njB80JwiHFP/A5UtNo0uOCFaYJ9GFXBI8=;
        b=GsrybolmC3nRSesCYnkTX57T3WfBs2Bv/9LFr0G24PcyCrsViTnxA5h1Gz3f7KT/Xb
         X4yg566ho6IzDOaVwxlrzw0EeznngkDQELTl2OUk2BgtU+9adpx5qSbd+hg3soAx9ADw
         QzAxE/cSeKolWhuu0PtswbFjT2RZAf6jqBi24QwikDHHdUaXS37SrHJowUrHA7hntN3F
         Tj8guQ5YNITy9KmjHNjrdOvFKOKTRpNyFjulVPMxo0iUfN9O42RvFOghzrPY/NI+UmLV
         ENFAnY1/X0H8cu5hJrUUrQC7rcbKw7Vh95GyikrfhaUeWtH4q7NzZiVRuze/xGL3wIuA
         i1kA==
X-Gm-Message-State: AOAM530u8ZSprmRcv9GtSsgpsHcWjKvio9d70qLZ+fNlLznnSfCTmITV
        pbKeUOgSuc0rWZpnIVEyW2mkZijN0kCO
X-Google-Smtp-Source: ABdhPJxcnko8GBm8tEdPSR4jABYz6XI6tTNLr7HfcVvMlpCS1/7v/zQ/stLa/apb+/Eol/Lxk3qb9g==
X-Received: by 2002:a17:90a:110:: with SMTP id b16mr10557686pjb.235.1595695758400;
        Sat, 25 Jul 2020 09:49:18 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d93:b324:a5b1:5f52:26a2:a851])
        by smtp.gmail.com with ESMTPSA id 15sm9459837pjs.8.2020.07.25.09.49.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jul 2020 09:49:17 -0700 (PDT)
Date:   Sat, 25 Jul 2020 22:19:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v3 4/4] bus: mhi: clients: Add user space client
 interface driver
Message-ID: <20200725164912.GA7350@Mani-XPS-13-9360>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-5-git-send-email-hemantk@codeaurora.org>
 <20200619104058.GD3245@Mani-XPS-13-9360>
 <634a16ab-0bbe-e878-45c4-3b51887341e8@codeaurora.org>
 <20200722084516.GA14602@Mani-XPS-13-9360>
 <6f0ad730-d1c9-3727-c9a6-1862509bb051@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0ad730-d1c9-3727-c9a6-1862509bb051@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 04:47:44PM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 7/22/20 1:45 AM, Manivannan Sadhasivam wrote:
> > On Mon, Jul 20, 2020 at 08:40:24PM -0700, Hemant Kumar wrote:
> > > Hi Mani,
> > > 
> > > On 6/19/20 3:40 AM, Manivannan Sadhasivam wrote:
> > > > On Thu, Jun 11, 2020 at 11:13:44AM -0700, Hemant Kumar wrote:
> > > > > This MHI client driver allows user space clients to transfer
> > > > > data between MHI device and host using standard file operations.
> > > > 
> > > > I think we need to explicitly specify 'raw' data here. Because we have different
> > > > APIs for queuing different types of data. So saying just data sounds vague
> > > > unless this driver can handle multiple types of data which I don't think can
> > > > happen.
> > > > 
> > > > And you need to update the same in docs.
> > > Done.
> > > > 
> > > > > Device file node is created with format
> > > > > 
> > > > > /dev/mhi_<controller_name>_<mhi_device_name>
> > > > > 
> > > > > Currently it supports loopback client.
> > > > > 
> > > > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > > ---
> > > > >    drivers/bus/mhi/Kconfig          |   2 +
> > > > >    drivers/bus/mhi/Makefile         |   1 +
> > > > >    drivers/bus/mhi/clients/Kconfig  |  16 +
> > > > >    drivers/bus/mhi/clients/Makefile |   3 +
> > > > >    drivers/bus/mhi/clients/uci.c    | 652 +++++++++++++++++++++++++++++++++++++++
> > > > >    5 files changed, 674 insertions(+)
> > > > >    create mode 100644 drivers/bus/mhi/clients/Kconfig
> > > > >    create mode 100644 drivers/bus/mhi/clients/Makefile
> > > > >    create mode 100644 drivers/bus/mhi/clients/uci.c
> > > > > 
> > > > > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > > > > index 6a217ff..f224be8 100644
> > > > > --- a/drivers/bus/mhi/Kconfig
> > > > > +++ b/drivers/bus/mhi/Kconfig
> > > > > @@ -20,3 +20,5 @@ config MHI_BUS_DEBUG
> > > > >    	 Enable debugfs support for use with the MHI transport. Allows
> > > > >    	 reading and/or modifying some values within the MHI controller
> > > > >    	 for debug and test purposes.
> > > > 
> > > > Hmm, so this patchset depends on debugfs patches? You need to mention this in
> > > > cover letter. Or even better, just make it independent
> > > Driver does not depend on debugfs. i need to fix that.
> > > 
[...]
> > > > 
> > > > > +		uci_buf->data = buf;
> > > > 
> > > > Where is this uci_buf getting used?
> > > > 
> > > > > +
> > > > > +		dev_dbg(dev, "Allocated buf %d of %d size %ld\n", i, nr_trbs,
> > > > > +			actual_mtu);
> > > > > +
> > > > > +		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, actual_mtu,
> > > > > +				    MHI_EOT);
> > > > > +		if (ret) {
> > > > > +			kfree(buf);
> > > > > +			dev_err(dev, "Failed to queue buffer %d\n", i);
> > > > 
> > > > Failed to queue buffer: %d
> > > > 
> > > > > +			return ret;
> > > > > +		}
> > > > 
> > > > So is this buffer getting freed anywhere?
> > > in mhi_uci_release().
> > > > 
> > 
> > You're not assigning uci_buf here. Then how it will get freed? Moreover I don't
> > see any reason to allocate uci_buf in this function.
> It is done above right after kmalloc
> uci_buf = buf + actual_mtu;
> 
> Later uci_buf->data is saving the buf pointer in this function, which is
> getting freed in mhi_uci_release() like this:-
> 

Ah, right. I was a bit confused with the tricy use of pointers ;)

> list_for_each_entry_safe(itr, tmp, &uci_chan->pending, node){		
> list_del(&itr->node);
> 			kfree(itr->data);
> }
> 
> > 
> > > > > 	+	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int mhi_uci_release(struct inode *inode, struct file *file)
> > > > > +{
> > > > > +	struct uci_dev *uci_dev = file->private_data;
> > > > > +
> > > > > +	mutex_lock(&uci_dev->mutex);
> > > > > +	uci_dev->ref_count--;
> > > > > +	if (!uci_dev->ref_count) {
> > > > > +		struct uci_buf *itr, *tmp;
> > > > > +		struct uci_chan *uci_chan;
> > > > > +
> > > > > +		if (uci_dev->enabled)
> > > > > +			mhi_unprepare_from_transfer(uci_dev->mhi_dev);
> > > > > +
> > > > > +		/* clean inbound channel */
> > > > > +		uci_chan = &uci_dev->dl_chan;
> > > > > +		list_for_each_entry_safe(itr, tmp, &uci_chan->pending, node) {
> > > > > +			list_del(&itr->node);
> > > > > +			kfree(itr->data);
> > > > > +		}
> > > > 
> > > > Add a new line after '}' and before next line of code.
> > > Done.
> > > > 
> > > > > +		if (uci_chan->cur_buf)
> > > > > +			kfree(uci_chan->cur_buf->data);
> > > > > +
> > > > > +		uci_chan->cur_buf = NULL;
> > > > > +
> > > > > +		if (!uci_dev->enabled) {
> > > > > +			mutex_unlock(&uci_dev->mutex);
> > > > > +			mutex_destroy(&uci_dev->mutex);
> > > > > +			clear_bit(MINOR(uci_dev->devt), uci_minors);
> > > > > +			kfree(uci_dev);
> > > > 
> > > > Hmm. So you are freeing uci_dev here and also trying to do the same in
> > > > mhi_uci_remove.
> > > yes that is based on ref count, so no double free. do you see any issue with
> > > that ?
> > 
> > You are decreasing the refcount here and freeing uci_dev if refcount is 0. Then
> freeing only if uci_dev->enabled is false - which happens if remove() is
> already called.
> > in mhi_uci_remove() you're again checking if the refcount is 0 and then trying
> > to release uci_dev. Am I missing something?
> if uci_dev->enabled is true then we free it remove.
> > 
> > Since you're allocating uci_dev in probe(), you should only free it in remove().
> > 
> > > > 
> > > > > +			return 0;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	mutex_unlock(&uci_dev->mutex);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static __poll_t mhi_uci_poll(struct file *file, poll_table *wait)
> > > > > +{
> > > > > +	struct uci_dev *uci_dev = file->private_data;
> > > > > +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> > > > > +	struct device *dev = &mhi_dev->dev;
> > > > > +	struct uci_chan *uci_chan;
> > > > > +	__poll_t mask = 0;
> > > > > +
> > > > > +	poll_wait(file, &uci_dev->dl_chan.wq, wait);
> > > > > +	poll_wait(file, &uci_dev->ul_chan.wq, wait);
> > > > > +
> > > > > +	uci_chan = &uci_dev->dl_chan;
> > > > > +	spin_lock_bh(&uci_chan->lock);
> > > > 
> > > > This is what looks wrong to me.
> > > > 
> > > > > +	if (!uci_dev->enabled) {
> > > > 
> > > > So you are removing the char dev node even if there are users in the system.
> > > > Why do you want to do so?
> > > Removing char dev node is done when MHI device is removed. It is possible
> > > that user space entity would exist but MHI device is removed
> > > due to underlying transport disconnect. i dont see a way to prevent
> > > this or i am missing your point. Can you pls elaborate your concern.
> > 
> > I didn't closely look where the device is getting created. Please ignore my
> > comment...
> > 
> > > > 
> > > > > +		mask = EPOLLERR;
> > > > > +	} else {
> > > > > +		if (!list_empty(&uci_chan->pending) || uci_chan->cur_buf) {
> > > > > +			dev_dbg(dev, "Client can read from node\n");
> > > > > +			mask |= EPOLLIN | EPOLLRDNORM;
> > > > > +		}
> > > > > +	}
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +
> > > > > +	uci_chan = &uci_dev->ul_chan;
> > > > > +	spin_lock_bh(&uci_chan->lock);
> > > > > +	if (!uci_dev->enabled) {
> > > > > +		mask |= EPOLLERR;
> > > > > +	} else if (mhi_get_no_free_descriptors(mhi_dev, DMA_TO_DEVICE) > 0) {
> > > > > +		dev_dbg(dev, "Client can write to node\n");
> > > > > +		mask |= EPOLLOUT | EPOLLWRNORM;
> > > > > +	}
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +
> > > > > +	dev_dbg(dev, "Client attempted to poll, returning mask 0x%x\n", mask);
> > > > > +
> > > > > +	return mask;
> > > > > +}
> > > > > +
> > > > > +static ssize_t mhi_uci_write(struct file *file,
> > > > > +			     const char __user *buf,
> > > > > +			     size_t count,
> > > > > +			     loff_t *offp)
> > > > > +{
> > > > > +	struct uci_dev *uci_dev = file->private_data;
> > > > > +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> > > > > +	struct device *dev = &mhi_dev->dev;
> > > > > +	struct uci_chan *uci_chan = &uci_dev->ul_chan;
> > > > > +	size_t bytes_xfered = 0;
> > > > > +	int ret, nr_avail;
> > > > > +
> > > > > +	if (!buf || !count)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* confirm channel is active */
> > > > > +	spin_lock_bh(&uci_chan->lock);
> > > > > +	if (!uci_dev->enabled) {
> > > > > +		spin_unlock_bh(&uci_chan->lock);
> > > > > +		return -ERESTARTSYS;
> > > > 
> > > > You should return -ENODEV here.
> > > Done.
> > > > 
> > > > > +	}
> > > > > +
> > > > > +	dev_dbg(dev, "Enter: to xfer:%lu bytes\n", count);
> > > > > +
> > > > 
> > > > Please avoid "Enter" debug prints.
> > > Done, will keep the byte count print?
> > > > 
> > > > > +	while (count) {
> > > > > +		size_t xfer_size;
> > > > > +		void *kbuf;
> > > > > +		enum mhi_flags flags;
> > > > > +
> > > > > +		spin_unlock_bh(&uci_chan->lock);
> > > > 
> > > > Why do you want to hold the lock till here?
> > > Will come up with better locking in next patch set
> > > > 
> > > > > +
> > > > > +		/* wait for free descriptors */
> > > > > +		ret = wait_event_interruptible(uci_chan->wq,
> > > > > +					       (!uci_dev->enabled) ||
> > > > > +				(nr_avail = mhi_get_no_free_descriptors(mhi_dev,
> > > > > +					       DMA_TO_DEVICE)) > 0);
> > > > 
> > > > Does using "wait_event_interruptible_timeout" makes sense here?
> > > No, read needs to be blocked until data comes. user space would call read()
> > > and wait for data to arrive. There is no definite time when data would
> > > arrive.
> > 
> > Hmm, I thought we could timeout at some point. But that's fine.
> > 
> > > > 
> > > > > +
> > > > > +		if (ret == -ERESTARTSYS || !uci_dev->enabled) {
> > > > > +			dev_dbg(dev, "Exit signal caught for node or not enabled\n");
> > > > > +			return -ERESTARTSYS;
> > > > 
> > > > You need to return -ENODEV for !uci_dev->enabled case.
> > > Done.
> > > > 
> > > > > +		}
> > > > > +
> > > > > +		xfer_size = min_t(size_t, count, uci_dev->mtu);
> > > > > +		kbuf = kmalloc(xfer_size, GFP_KERNEL);
> > > > > +		if (!kbuf)
> > > > > +			return -ENOMEM;
> > > > > +
> > > > > +		ret = copy_from_user(kbuf, buf, xfer_size);
> > > > > +		if (unlikely(ret)) {
> > > > > +			kfree(kbuf);
> > > > > +			return ret;
> > > > > +		}
> > > > > +
> > > > > +		spin_lock_bh(&uci_chan->lock);
> > > > > +
> > > > > +		/* if ring is full after this force EOT */
> > > > > +		if (nr_avail > 1 && (count - xfer_size))
> > > > > +			flags = MHI_CHAIN;
> > > > > +		else
> > > > > +			flags = MHI_EOT;
> > > > > +
> > > > > +		if (uci_dev->enabled)
> > > > > +			ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
> > > > > +					    xfer_size, flags);
> > > > > +		else
> > > > > +			ret = -ERESTARTSYS;
> > > > 
> > > > Again, please fix this all over the driver.
> > > Done.
> > > > 
> > > > > +
> > > > > +		if (ret) {
> > > > > +			kfree(kbuf);
> > > > > +			goto sys_interrupt;
> > > > > +		}
> > > > > +
> > > > > +		bytes_xfered += xfer_size;
> > > > > +		count -= xfer_size;
> > > > > +		buf += xfer_size;
> > > > > +	}
> > > > > +
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +	dev_dbg(dev, "Exit: Number of bytes xferred:%lu\n", bytes_xfered);
> > > > 
> > > > Drop the "Exit" too.
> > > how about keeping the number of bytes xferred and remove exit from the msg ?
> > > helps in debugging user space entity vs kernel space mhi uci driver issues.
> > > > 
> > 
> > Yep, just remove 'Exit'.
> > 
> > > > > +
> > > > > +	return bytes_xfered;
> > > > > +
> > > > > +sys_interrupt:
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static ssize_t mhi_uci_read(struct file *file,
> > > > > +			    char __user *buf,
> > > > > +			    size_t count,
> > > > > +			    loff_t *ppos)
> > > > > +{
> > > > > +	struct uci_dev *uci_dev = file->private_data;
> > > > > +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> > > > > +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
> > > > > +	struct device *dev = &mhi_dev->dev;
> > > > > +	struct uci_buf *uci_buf;
> > > > > +	char *ptr;
> > > > > +	size_t to_copy;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	if (!buf)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	dev_dbg(dev, "Client provided buf len:%lu\n", count);
> > > > 
> > > > Drop this.
> > > This would help if client provided buffer is smaller than the received rx
> > > data. Even though this function would only copy the mount of buffer
> > > provided by user space but we can track that condition.
> > > > 
> > 
> > The userspace will know how much buffer allocated, so no need to say it here.
> Done.
> > 
> > > > > +
> > > > > +	mutex_lock(&uci_dev->mutex);
> > > > > +	/* confirm channel is active */
> > > > > +	spin_lock_bh(&uci_chan->lock);
> > > > > +	if (!uci_dev->enabled) {
> > > > > +		spin_unlock_bh(&uci_chan->lock);
> > > > > +		mutex_unlock(&uci_dev->mutex);
> > > > > +		return -ERESTARTSYS;
> > > > > +	}
> > > > > +
> > > > > +	/* No data available to read, wait */
> > > > > +	if (!uci_chan->cur_buf && list_empty(&uci_chan->pending)) {
> > > > > +		dev_dbg(dev, "No data available to read waiting\n");
> > > > > +
> > > > > +		spin_unlock_bh(&uci_chan->lock);
> > > > > +		mutex_unlock(&uci_dev->mutex);
> > > > > +		ret = wait_event_interruptible(uci_chan->wq,
> > > > > +					       (!uci_dev->enabled ||
> > > > > +					      !list_empty(&uci_chan->pending)));
> > > > > +		if (ret == -ERESTARTSYS) {
> > > > > +			dev_dbg(dev, "Exit signal caught for node\n");
> > > > 
> > > > No need of this.
> > > This is same as what we are doing in write(). I can add the uci_dev->enabled
> > > check here as well and return -ENODEV as you commented for write(). Helps in
> > > debugging.
> > 
> > Okay
> > 
> > > > 
> > > > > +			return -ERESTARTSYS;
> > > > > +		}
> > > > > +
> > > > > +		mutex_lock(&uci_dev->mutex);
> > > > > +		spin_lock_bh(&uci_chan->lock);
> > > > > +		if (!uci_dev->enabled) {
> > > > > +			dev_dbg(dev, "node is disabled\n");
> > > > 
> > > > Okay, this is what I'm concerned about.
> > > If your concern is about locking, i am going to come up with the change to
> > > fix that. If you concern is about node getting removed while read is issued
> > > then i dont see how we can prevent that.
> > > > 
> > > > > +			ret = -ERESTARTSYS;
> > > > > +			goto read_error;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	/* new read, get the next descriptor from the list */
> > > > > +	if (!uci_chan->cur_buf) {
> > > > > +		uci_buf = list_first_entry_or_null(&uci_chan->pending,
> > > > > +						   struct uci_buf, node);
> > > > > +		if (unlikely(!uci_buf)) {
> > > > > +			ret = -EIO;
> > > > > +			goto read_error;
> > > > > +		}
> > > > > +
> > > > > +		list_del(&uci_buf->node);
> > > > > +		uci_chan->cur_buf = uci_buf;
> > > > > +		uci_chan->rx_size = uci_buf->len;
> > > > > +		dev_dbg(dev, "Got pkt of size:%zu\n", uci_chan->rx_size);
> > > > > +	}
> > > > > +
> > > > > +	uci_buf = uci_chan->cur_buf;
> > > > > +
> > > > > +	/* Copy the buffer to user space */
> > > > > +	to_copy = min_t(size_t, count, uci_chan->rx_size);
> > > > > +	ptr = uci_buf->data + (uci_buf->len - uci_chan->rx_size);
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +
> > > > > +	ret = copy_to_user(buf, ptr, to_copy);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_mtx;
> > > > > +
> > > > > +	spin_lock_bh(&uci_chan->lock);
> > > > > +
> > > > > +	dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uci_chan->rx_size);
> > > > > +	uci_chan->rx_size -= to_copy;
> > > > > +
> > > > > +	/* we finished with this buffer, queue it back to hardware */
> > > > 
> > > > Oh wait... what is happening here? Why do you want to do tx?
> > > we are not doing any TX, we are just queuing the rx buffer back to get more
> > > data.
> > 
> > But why? You are doing this unconditionally!
> This is typical way of doing read(), as you dont know when is the next
> packet would arrive so you just keep TREs queued to get the packet from MHI
> Device side in case they have more data to send to Host.

That's a typical way of doing MHI read ;) Anyway, it is fine.

> > 
> > > > 
> > > > > +	if (!uci_chan->rx_size) {
> > > > > +		uci_chan->cur_buf = NULL;
> > > > > +
> > > > > +		if (uci_dev->enabled)
> > > > > +			ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
> > > > > +					    uci_buf->data,
> > > > > +					    uci_dev->actual_mtu, MHI_EOT);
> > > > > +		else
> > > > > +			ret = -ERESTARTSYS;
> > > > > +
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "Failed to recycle element\n");
> > > > > +			kfree(uci_buf->data);
> > > > > +			goto read_error;
> > > > > +		}
> > > > > +	}
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +	mutex_unlock(&uci_dev->mutex);
> > > > > +
> > > > > +	dev_dbg(dev, "Returning %lu bytes\n", to_copy);
> > > > > +
> > > > > +	return to_copy;
> > > > > +
> > > > > +read_error:
> > > > > +	spin_unlock_bh(&uci_chan->lock);
> > > > > +err_unlock_mtx:
> > > > > +	mutex_unlock(&uci_dev->mutex);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int mhi_uci_open(struct inode *inode, struct file *filp)
> > > > > +{
> > > > > +	struct uci_dev *uci_dev = NULL, *tmp_dev;
> > > > > +	int ret = -EIO;
> > > > > +	struct uci_buf *buf_itr, *tmp;
> > > > > +	struct uci_chan *dl_chan;
> > > > > +	struct mhi_device *mhi_dev;
> > > > > +	struct device *dev;
> > > > > +
> > > > > +	mutex_lock(&mhi_uci_drv.lock);
> > > > > +	list_for_each_entry(tmp_dev, &mhi_uci_drv.head, node) {
> > > > > +		if (tmp_dev->devt == inode->i_rdev) {
> > > > > +			uci_dev = tmp_dev;
> > > > > +			break;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	/* could not find a minor node */
> > > > > +	if (!uci_dev)
> > > > > +		goto error_exit;
> > > > > +
> > > > > +	mhi_dev = uci_dev->mhi_dev;
> > > > > +	dev = &mhi_dev->dev;
> > > > > +
> > > > > +	mutex_lock(&uci_dev->mutex);
> > > > > +	if (!uci_dev->enabled) {
> > > > > +		dev_info(dev, "Node exist, but not in active state!\n");
> > > > 
> > > > Dangling node, right.
> > > In case remove() is in progress and enabled is set to false but
> > > destroy_device is not called yet. It covers that case and open() is called
> > > by user space entity.
> > 
> > Hmm, okay.
> > 
> > > > 
> > > > > +		goto error_open_chan;
> > > > > +	}
> > > > > +
> > > > > +	uci_dev->ref_count++;
> > > > > +
> > > > > +	dev_dbg(dev, "Node open, ref counts %u\n", uci_dev->ref_count);
> > > > > +
> > > > > +	if (uci_dev->ref_count == 1) {
> > > > > +		dev_dbg(dev, "Starting channel\n");
> > > > > +		ret = mhi_prepare_for_transfer(uci_dev->mhi_dev);
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "Error starting transfer channels\n");
> > > > > +			uci_dev->ref_count--;
> > > > > +			goto error_open_chan;
> > > > > +		}
> > > > > +
> > > > > +		ret = mhi_queue_inbound(uci_dev);
> > > > > +		if (ret)
> > > > 
> > > > Decrease refcount?
> > > done in release. For every open increment the ref count and for every
> > > release call decrement it, so that when ref count becomes 0 we can free
> > > memory.
> > 
> > Even if open() fails?
> Nice catch, will decrement ref count if mhi_queue_inbound() fails.
> > 

[...]

> > 
> > > > 
> > > > > +	mutex_lock(&mhi_uci_drv.lock);
> > > > > +	mutex_lock(&uci_dev->mutex);
> > > > > +
> > > > > +	/* disable the node */
> > > > > +	spin_lock_irq(&uci_dev->dl_chan.lock);
> > > > > +	spin_lock_irq(&uci_dev->ul_chan.lock);
> > > > > +	uci_dev->enabled = false;
> > > > > +	spin_unlock_irq(&uci_dev->ul_chan.lock);
> > > > > +	spin_unlock_irq(&uci_dev->dl_chan.lock);
> > > > 
> > > > You need to do something better here. This doesn't look good.
> > > Will come up with change to fix lock related concerns.
> > > > 
> > > > > +	wake_up(&uci_dev->dl_chan.wq);
> > > > > +	wake_up(&uci_dev->ul_chan.wq);
> > > > > +
> > > > > +	/* delete the node to prevent new opens */
> > > > > +	device_destroy(mhi_uci_drv.class, uci_dev->devt);
> > > > > +	uci_dev->dev = NULL;
> > > > > +	list_del(&uci_dev->node);
> > > > > +
> > > > > +	/* safe to free memory only if all file nodes are closed */
> > > > 
> > > > And what if it is already freed in .release?
> > > It is possible that ref_count becomes 0 in release() then it would be no-op
> > > here.
> > 
> > No-op? You are calling kfree again.
> No, the way it works is: In release() we decrement ref count and check if
> uci_dev->enabled is false which means remove was already called. In that
> case we free in release(). In case remove was not called yet, then if
> release() is called we do not free uci_dev and free it on remove().
> Both functions are protected with same mutext lock uci_dev->lock.

I see... Again I overlooked it.

Thanks,
Mani

> > 
> > > > 
> > > > > +	if (!uci_dev->ref_count) {
> > > > > +		mutex_unlock(&uci_dev->mutex);
> > > > > +		mutex_destroy(&uci_dev->mutex);
> > > > > +		clear_bit(MINOR(uci_dev->devt), uci_minors);
> > > > > +		dev_set_drvdata(&mhi_dev->dev, NULL);
> > > > > +		kfree(uci_dev);
> > > > > +		mutex_unlock(&mhi_uci_drv.lock);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	mutex_unlock(&uci_dev->mutex);
> > > > > +	mutex_unlock(&mhi_uci_drv.lock);
> > > > > +
> > > > > +	dev_dbg(dev, "%s: exit\n", __func__);
> > > > 
> > > > Drop this.
> > > I can change it to mhi_dev->name removed. It helps in debugging race
> > > conditions.
> > 
> > Okay.
> > 
> > > > 
> > > > Thanks,
> > > > Mani
> > > > 
> > > > > +}
> > > > > +
> > > > > +/* .driver_data stores max mtu */
> > > > > +static const struct mhi_device_id mhi_uci_match_table[] = {
> > > > > +	{ .chan = "LOOPBACK", .driver_data = 0x1000 },
> > > > > +	{},
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
> > > > > +
> > > > > +static struct mhi_driver mhi_uci_driver = {
> > > > > +	.id_table = mhi_uci_match_table,
> > > > > +	.remove = mhi_uci_remove,
> > > > > +	.probe = mhi_uci_probe,
> > > > > +	.ul_xfer_cb = mhi_ul_xfer_cb,
> > > > > +	.dl_xfer_cb = mhi_dl_xfer_cb,
> > > > > +	.driver = {
> > > > > +		.name = MHI_UCI_DRIVER_NAME,
> > > > > +	},
> > > > > +};
> > > > > +
> > > > > +static int mhi_uci_init(void)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	mhi_uci_drv.major = ret;
> > > > > +	mhi_uci_drv.class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
> > > > > +	if (IS_ERR(mhi_uci_drv.class)) {
> > > > > +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> > > > > +		return -ENODEV;
> > > > > +	}
> > > > > +
> > > > > +	mutex_init(&mhi_uci_drv.lock);
> > > > > +	INIT_LIST_HEAD(&mhi_uci_drv.head);
> > > > > +
> > > > > +	ret = mhi_driver_register(&mhi_uci_driver);
> > > > > +	if (ret) {
> > > > > +		class_destroy(mhi_uci_drv.class);
> > > > > +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static void __exit mhi_uci_exit(void)
> > > > > +{
> > > > > +	mhi_driver_unregister(&mhi_uci_driver);
> > > > > +	class_destroy(mhi_uci_drv.class);
> > > > > +	unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
> > > > > +}
> > > > > +
> > > > > +module_init(mhi_uci_init);
> > > > > +module_exit(mhi_uci_exit);
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_DESCRIPTION("MHI UCI Driver");
> > > > > -- 
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > > a Linux Foundation Collaborative Project
> > > > > 
> > > 
> > > I have some follow up questions based on your review comments. Please let me
> > > know your view on those questions above.
> > > 
> > > Thanks,
> > > Hemant
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> 
> Thanks,
> Hemant
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
