Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDBC22D26A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jul 2020 01:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgGXXrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 19:47:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26703 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726732AbgGXXrx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 19:47:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595634469; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5ELB/gEljUJl5S8R5rJhmUiI5XwkTZiMrPVI5QzGWnU=; b=nzsv77Qz99+MD1G9d9sJ7WzFLZlZYBoDkQMPALZeXnTKWI1mS3QjzMEoKuBKOi6PKxDjTgIT
 a7andamfPGERSh53VOaBcD+qX9IeK+61wgbHwx4+OXvQGMcbmJXq15ZYqluM1lJO7CoHCgX8
 HifLOdiUyJ95KE+Wk+IHlm81AvU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1b7325fcbecb3df1ac9898 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 23:47:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35A1AC433C6; Fri, 24 Jul 2020 23:47:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BBCDC433C9;
        Fri, 24 Jul 2020 23:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5BBCDC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 4/4] bus: mhi: clients: Add user space client interface
 driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-5-git-send-email-hemantk@codeaurora.org>
 <20200619104058.GD3245@Mani-XPS-13-9360>
 <634a16ab-0bbe-e878-45c4-3b51887341e8@codeaurora.org>
 <20200722084516.GA14602@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <6f0ad730-d1c9-3727-c9a6-1862509bb051@codeaurora.org>
Date:   Fri, 24 Jul 2020 16:47:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200722084516.GA14602@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 7/22/20 1:45 AM, Manivannan Sadhasivam wrote:
> On Mon, Jul 20, 2020 at 08:40:24PM -0700, Hemant Kumar wrote:
>> Hi Mani,
>>
>> On 6/19/20 3:40 AM, Manivannan Sadhasivam wrote:
>>> On Thu, Jun 11, 2020 at 11:13:44AM -0700, Hemant Kumar wrote:
>>>> This MHI client driver allows user space clients to transfer
>>>> data between MHI device and host using standard file operations.
>>>
>>> I think we need to explicitly specify 'raw' data here. Because we have different
>>> APIs for queuing different types of data. So saying just data sounds vague
>>> unless this driver can handle multiple types of data which I don't think can
>>> happen.
>>>
>>> And you need to update the same in docs.
>> Done.
>>>
>>>> Device file node is created with format
>>>>
>>>> /dev/mhi_<controller_name>_<mhi_device_name>
>>>>
>>>> Currently it supports loopback client.
>>>>
>>>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>>>> ---
>>>>    drivers/bus/mhi/Kconfig          |   2 +
>>>>    drivers/bus/mhi/Makefile         |   1 +
>>>>    drivers/bus/mhi/clients/Kconfig  |  16 +
>>>>    drivers/bus/mhi/clients/Makefile |   3 +
>>>>    drivers/bus/mhi/clients/uci.c    | 652 +++++++++++++++++++++++++++++++++++++++
>>>>    5 files changed, 674 insertions(+)
>>>>    create mode 100644 drivers/bus/mhi/clients/Kconfig
>>>>    create mode 100644 drivers/bus/mhi/clients/Makefile
>>>>    create mode 100644 drivers/bus/mhi/clients/uci.c
>>>>
>>>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>>>> index 6a217ff..f224be8 100644
>>>> --- a/drivers/bus/mhi/Kconfig
>>>> +++ b/drivers/bus/mhi/Kconfig
>>>> @@ -20,3 +20,5 @@ config MHI_BUS_DEBUG
>>>>    	 Enable debugfs support for use with the MHI transport. Allows
>>>>    	 reading and/or modifying some values within the MHI controller
>>>>    	 for debug and test purposes.
>>>
>>> Hmm, so this patchset depends on debugfs patches? You need to mention this in
>>> cover letter. Or even better, just make it independent
>> Driver does not depend on debugfs. i need to fix that.
>>
>>>
>>>> +
>>>> +source "drivers/bus/mhi/clients/Kconfig"
>>>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>>>> index 19e6443..48f6028 100644
>>>> --- a/drivers/bus/mhi/Makefile
>>>> +++ b/drivers/bus/mhi/Makefile
>>>> @@ -1,2 +1,3 @@
>>>>    # core layer
>>>>    obj-y += core/
>>>> +obj-y += clients/
>>>> diff --git a/drivers/bus/mhi/clients/Kconfig b/drivers/bus/mhi/clients/Kconfig
>>>> new file mode 100644
>>>> index 0000000..cd84419
>>>> --- /dev/null
>>>> +++ b/drivers/bus/mhi/clients/Kconfig
>>>> @@ -0,0 +1,16 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +menu "MHI clients support"
>>>> +       depends on MHI_BUS
>>>
>>> I don't think we need MHI_BUS dependency here.
>> Reason i added was, if MHI BUS is not enabled "MHI clients support" would
>> not show up in the menu.
> 
> We can optimize this as below:
> 
> config MHI_BUS
> 	...
> 
> if MHI_BUS
> 
> source "drivers/bus/mhi/clients/Kconfig"
> 
> endif
> 
> Then we don't need to explicitly specify MHI_BUS dependency in sub-directories.
Done.
> 
>>>
>>>> +
>>>> +config MHI_UCI
>>>> +       tristate "MHI UCI"
>>>> +       depends on MHI_BUS
>>>> +       help
>>>> +	  MHI based userspace client interface driver is for transferring
>>>
>>> s/is for/used for/g. Also provide indent for help text.
>> Done.
>>>
>>>> +	  data between host and device using standard file operations from
>>>> +	  user space. Open, read, write, and close operations are supported
>>>
>>> Please use 'userspace' everywhere.
>> Done.
>>>
>>>> +	  by this driver. Please check mhi_uci_match_table for all supported
>>>> +	  channels that are exposed to userspace.
>>>> +
>>>> +endmenu
>>>> diff --git a/drivers/bus/mhi/clients/Makefile b/drivers/bus/mhi/clients/Makefile
>>>> new file mode 100644
>>>> index 0000000..dd2930c
>>>> --- /dev/null
>>>> +++ b/drivers/bus/mhi/clients/Makefile
>>>> @@ -0,0 +1,3 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +obj-$(CONFIG_MHI_UCI) +=uci.o
>>>
>>> space after '+='
>> Done.
>>>
>>>> diff --git a/drivers/bus/mhi/clients/uci.c b/drivers/bus/mhi/clients/uci.c
>>>> new file mode 100644
>>>> index 0000000..8f36fb0
>>>> --- /dev/null
>>>> +++ b/drivers/bus/mhi/clients/uci.c
>>>> @@ -0,0 +1,652 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mhi.h>
>>>
>>> Please sort includes alphabetically.
>> you mean like this
>> #include <linux/kernel.h>
>> #include <linux/mhi.h>
>> #include <linux/mod_devicetable.h>
>> #include <linux/module.h>
>>
> 
> #include <linux/module.h>
> #include <linux/mod_devicetable.h>
> 
>>>
>>>> +#include <linux/poll.h>
>>>> +
>>>> +#define DEVICE_NAME "mhi"
>>>> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
>>>> +#define MAX_UCI_DEVICES (64)
>>>> +
>>>
>>> How about the kdoc comments for all fields and structures used?
>> Done.
>>>
>>>> +struct uci_chan {
>>>> +	wait_queue_head_t wq;
>>>> +
>>>> +	/* locks ul/dl uci device channel */
>>>> +	spinlock_t lock;
>>>
>>> It seems like you are trying to protect a field (enabled) in parent structure
>>> (uci_dev) using this lock. This sounds weird. Why can't you just use the mutex
>>> present in that?
>> i agree, let me fix locking in the entire driver.
>>>
>>>> +
>>>> +	 /* user space waiting to read */
>>>
>>> The comments should clearly portray what the field is for.
>> list of pending read buffers ?
> 
> okay
> 
>>>
>>>> +	struct list_head pending;
>>>> +
>>>> +	 /* current buffer user space reading */
>>>
>>> This sentence is not correct.
>> current buffer user space is reading ?
> 
> Just say, "Buffer for holding the data from device"
> 
>>>
>>>> +	struct uci_buf *cur_buf;
>>>> +	size_t rx_size;
>>>> +};
>>>> +
>>>> +struct uci_buf {
>>>> +	void *data;
>>>> +	size_t len;
>>>> +	struct list_head node;
>>>> +};
>>>> +
>>>> +struct mhi_uci_drv {
>>>> +	struct list_head head;
>>>> +
>>>> +	/* uci driver lock to sync open, probe and remove */
>>>> +	struct mutex lock;
>>>> +	struct class *class;
>>>> +	int major;
>>>> +	dev_t dev_t;
>>>
>>> devt?
>> will rename it to devt
>>>
>>>> +};
>>>> +
>>>> +struct uci_dev {
>>>> +	struct list_head node;
>>>> +	dev_t devt;
>>>> +	struct device *dev;
>>>> +	struct mhi_device *mhi_dev;
>>>> +	const char *chan;
>>>> +
>>>> +	/* sync open and close */
>>>
>>> Again, please use descriptive comments. Need not be multi lines but something
>>> which could be understood easily.
>> Done.
>>>
>>>> +	struct mutex mutex;
>>>> +	struct uci_chan ul_chan;
>>>> +	struct uci_chan dl_chan;
>>>> +	size_t mtu;
>>>> +
>>>> +	/* maximum size of incoming buffer */
>>>> +	size_t actual_mtu;
>>>> +	int ref_count;
>>>> +	bool enabled;
>>>> +};
>>>> +
>>>> +static DECLARE_BITMAP(uci_minors, MAX_UCI_DEVICES);
>>>> +static struct mhi_uci_drv mhi_uci_drv;
>>>
>>> Please use object names different from datatype names everywhere.
>> Done.
>>>
>>>> +
>>>> +static int mhi_queue_inbound(struct uci_dev *uci_dev)
>>>> +{
>>>> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	int nr_trbs = mhi_get_no_free_descriptors(mhi_dev, DMA_FROM_DEVICE);
>>>
>>> I'd prefer to have this assignment in definition block.
>> Done.
>>>
>>>> +	size_t mtu = uci_dev->mtu;
>>>> +	size_t actual_mtu = uci_dev->actual_mtu;
>>>> +	void *buf;
>>>> +	struct uci_buf *uci_buf;
>>>> +	int ret = -EIO, i;
>>>> +
>>>> +	for (i = 0; i < nr_trbs; i++) {
>>>> +		buf = kmalloc(mtu, GFP_KERNEL);
>>>> +		if (!buf)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		uci_buf = buf + actual_mtu;
>>>
>>> Aren't you segfaulting here?
>> no, in probe we do this
>> uci_dev->actual_mtu = uci_dev->mtu -  sizeof(struct uci_buf);
>> and save meta data uci_buf data ptr and len.  it is done in mhi_dl_xfer_cb()
>> function and used in read().
> 
> Ah.. I misread this. I thought you're adding actual_mtu to buf. Sorry for the
> noise.
> 
>>>
>>>> +		uci_buf->data = buf;
>>>
>>> Where is this uci_buf getting used?
>>>
>>>> +
>>>> +		dev_dbg(dev, "Allocated buf %d of %d size %ld\n", i, nr_trbs,
>>>> +			actual_mtu);
>>>> +
>>>> +		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, actual_mtu,
>>>> +				    MHI_EOT);
>>>> +		if (ret) {
>>>> +			kfree(buf);
>>>> +			dev_err(dev, "Failed to queue buffer %d\n", i);
>>>
>>> Failed to queue buffer: %d
>>>
>>>> +			return ret;
>>>> +		}
>>>
>>> So is this buffer getting freed anywhere?
>> in mhi_uci_release().
>>>
> 
> You're not assigning uci_buf here. Then how it will get freed? Moreover I don't
> see any reason to allocate uci_buf in this function.
It is done above right after kmalloc
uci_buf = buf + actual_mtu;

Later uci_buf->data is saving the buf pointer in this function, which is 
getting freed in mhi_uci_release() like this:-

list_for_each_entry_safe(itr, tmp, &uci_chan->pending, node){		 
list_del(&itr->node);
			kfree(itr->data);
}

> 
>>>> 	+	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int mhi_uci_release(struct inode *inode, struct file *file)
>>>> +{
>>>> +	struct uci_dev *uci_dev = file->private_data;
>>>> +
>>>> +	mutex_lock(&uci_dev->mutex);
>>>> +	uci_dev->ref_count--;
>>>> +	if (!uci_dev->ref_count) {
>>>> +		struct uci_buf *itr, *tmp;
>>>> +		struct uci_chan *uci_chan;
>>>> +
>>>> +		if (uci_dev->enabled)
>>>> +			mhi_unprepare_from_transfer(uci_dev->mhi_dev);
>>>> +
>>>> +		/* clean inbound channel */
>>>> +		uci_chan = &uci_dev->dl_chan;
>>>> +		list_for_each_entry_safe(itr, tmp, &uci_chan->pending, node) {
>>>> +			list_del(&itr->node);
>>>> +			kfree(itr->data);
>>>> +		}
>>>
>>> Add a new line after '}' and before next line of code.
>> Done.
>>>
>>>> +		if (uci_chan->cur_buf)
>>>> +			kfree(uci_chan->cur_buf->data);
>>>> +
>>>> +		uci_chan->cur_buf = NULL;
>>>> +
>>>> +		if (!uci_dev->enabled) {
>>>> +			mutex_unlock(&uci_dev->mutex);
>>>> +			mutex_destroy(&uci_dev->mutex);
>>>> +			clear_bit(MINOR(uci_dev->devt), uci_minors);
>>>> +			kfree(uci_dev);
>>>
>>> Hmm. So you are freeing uci_dev here and also trying to do the same in
>>> mhi_uci_remove.
>> yes that is based on ref count, so no double free. do you see any issue with
>> that ?
> 
> You are decreasing the refcount here and freeing uci_dev if refcount is 0. Then
freeing only if uci_dev->enabled is false - which happens if remove() is 
already called.
> in mhi_uci_remove() you're again checking if the refcount is 0 and then trying
> to release uci_dev. Am I missing something?
if uci_dev->enabled is true then we free it remove.
> 
> Since you're allocating uci_dev in probe(), you should only free it in remove().
> 
>>>
>>>> +			return 0;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static __poll_t mhi_uci_poll(struct file *file, poll_table *wait)
>>>> +{
>>>> +	struct uci_dev *uci_dev = file->private_data;
>>>> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	struct uci_chan *uci_chan;
>>>> +	__poll_t mask = 0;
>>>> +
>>>> +	poll_wait(file, &uci_dev->dl_chan.wq, wait);
>>>> +	poll_wait(file, &uci_dev->ul_chan.wq, wait);
>>>> +
>>>> +	uci_chan = &uci_dev->dl_chan;
>>>> +	spin_lock_bh(&uci_chan->lock);
>>>
>>> This is what looks wrong to me.
>>>
>>>> +	if (!uci_dev->enabled) {
>>>
>>> So you are removing the char dev node even if there are users in the system.
>>> Why do you want to do so?
>> Removing char dev node is done when MHI device is removed. It is possible
>> that user space entity would exist but MHI device is removed
>> due to underlying transport disconnect. i dont see a way to prevent
>> this or i am missing your point. Can you pls elaborate your concern.
> 
> I didn't closely look where the device is getting created. Please ignore my
> comment...
> 
>>>
>>>> +		mask = EPOLLERR;
>>>> +	} else {
>>>> +		if (!list_empty(&uci_chan->pending) || uci_chan->cur_buf) {
>>>> +			dev_dbg(dev, "Client can read from node\n");
>>>> +			mask |= EPOLLIN | EPOLLRDNORM;
>>>> +		}
>>>> +	}
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +
>>>> +	uci_chan = &uci_dev->ul_chan;
>>>> +	spin_lock_bh(&uci_chan->lock);
>>>> +	if (!uci_dev->enabled) {
>>>> +		mask |= EPOLLERR;
>>>> +	} else if (mhi_get_no_free_descriptors(mhi_dev, DMA_TO_DEVICE) > 0) {
>>>> +		dev_dbg(dev, "Client can write to node\n");
>>>> +		mask |= EPOLLOUT | EPOLLWRNORM;
>>>> +	}
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +
>>>> +	dev_dbg(dev, "Client attempted to poll, returning mask 0x%x\n", mask);
>>>> +
>>>> +	return mask;
>>>> +}
>>>> +
>>>> +static ssize_t mhi_uci_write(struct file *file,
>>>> +			     const char __user *buf,
>>>> +			     size_t count,
>>>> +			     loff_t *offp)
>>>> +{
>>>> +	struct uci_dev *uci_dev = file->private_data;
>>>> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	struct uci_chan *uci_chan = &uci_dev->ul_chan;
>>>> +	size_t bytes_xfered = 0;
>>>> +	int ret, nr_avail;
>>>> +
>>>> +	if (!buf || !count)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* confirm channel is active */
>>>> +	spin_lock_bh(&uci_chan->lock);
>>>> +	if (!uci_dev->enabled) {
>>>> +		spin_unlock_bh(&uci_chan->lock);
>>>> +		return -ERESTARTSYS;
>>>
>>> You should return -ENODEV here.
>> Done.
>>>
>>>> +	}
>>>> +
>>>> +	dev_dbg(dev, "Enter: to xfer:%lu bytes\n", count);
>>>> +
>>>
>>> Please avoid "Enter" debug prints.
>> Done, will keep the byte count print?
>>>
>>>> +	while (count) {
>>>> +		size_t xfer_size;
>>>> +		void *kbuf;
>>>> +		enum mhi_flags flags;
>>>> +
>>>> +		spin_unlock_bh(&uci_chan->lock);
>>>
>>> Why do you want to hold the lock till here?
>> Will come up with better locking in next patch set
>>>
>>>> +
>>>> +		/* wait for free descriptors */
>>>> +		ret = wait_event_interruptible(uci_chan->wq,
>>>> +					       (!uci_dev->enabled) ||
>>>> +				(nr_avail = mhi_get_no_free_descriptors(mhi_dev,
>>>> +					       DMA_TO_DEVICE)) > 0);
>>>
>>> Does using "wait_event_interruptible_timeout" makes sense here?
>> No, read needs to be blocked until data comes. user space would call read()
>> and wait for data to arrive. There is no definite time when data would
>> arrive.
> 
> Hmm, I thought we could timeout at some point. But that's fine.
> 
>>>
>>>> +
>>>> +		if (ret == -ERESTARTSYS || !uci_dev->enabled) {
>>>> +			dev_dbg(dev, "Exit signal caught for node or not enabled\n");
>>>> +			return -ERESTARTSYS;
>>>
>>> You need to return -ENODEV for !uci_dev->enabled case.
>> Done.
>>>
>>>> +		}
>>>> +
>>>> +		xfer_size = min_t(size_t, count, uci_dev->mtu);
>>>> +		kbuf = kmalloc(xfer_size, GFP_KERNEL);
>>>> +		if (!kbuf)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		ret = copy_from_user(kbuf, buf, xfer_size);
>>>> +		if (unlikely(ret)) {
>>>> +			kfree(kbuf);
>>>> +			return ret;
>>>> +		}
>>>> +
>>>> +		spin_lock_bh(&uci_chan->lock);
>>>> +
>>>> +		/* if ring is full after this force EOT */
>>>> +		if (nr_avail > 1 && (count - xfer_size))
>>>> +			flags = MHI_CHAIN;
>>>> +		else
>>>> +			flags = MHI_EOT;
>>>> +
>>>> +		if (uci_dev->enabled)
>>>> +			ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
>>>> +					    xfer_size, flags);
>>>> +		else
>>>> +			ret = -ERESTARTSYS;
>>>
>>> Again, please fix this all over the driver.
>> Done.
>>>
>>>> +
>>>> +		if (ret) {
>>>> +			kfree(kbuf);
>>>> +			goto sys_interrupt;
>>>> +		}
>>>> +
>>>> +		bytes_xfered += xfer_size;
>>>> +		count -= xfer_size;
>>>> +		buf += xfer_size;
>>>> +	}
>>>> +
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +	dev_dbg(dev, "Exit: Number of bytes xferred:%lu\n", bytes_xfered);
>>>
>>> Drop the "Exit" too.
>> how about keeping the number of bytes xferred and remove exit from the msg ?
>> helps in debugging user space entity vs kernel space mhi uci driver issues.
>>>
> 
> Yep, just remove 'Exit'.
> 
>>>> +
>>>> +	return bytes_xfered;
>>>> +
>>>> +sys_interrupt:
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static ssize_t mhi_uci_read(struct file *file,
>>>> +			    char __user *buf,
>>>> +			    size_t count,
>>>> +			    loff_t *ppos)
>>>> +{
>>>> +	struct uci_dev *uci_dev = file->private_data;
>>>> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
>>>> +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	struct uci_buf *uci_buf;
>>>> +	char *ptr;
>>>> +	size_t to_copy;
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!buf)
>>>> +		return -EINVAL;
>>>> +
>>>> +	dev_dbg(dev, "Client provided buf len:%lu\n", count);
>>>
>>> Drop this.
>> This would help if client provided buffer is smaller than the received rx
>> data. Even though this function would only copy the mount of buffer
>> provided by user space but we can track that condition.
>>>
> 
> The userspace will know how much buffer allocated, so no need to say it here.
Done.
> 
>>>> +
>>>> +	mutex_lock(&uci_dev->mutex);
>>>> +	/* confirm channel is active */
>>>> +	spin_lock_bh(&uci_chan->lock);
>>>> +	if (!uci_dev->enabled) {
>>>> +		spin_unlock_bh(&uci_chan->lock);
>>>> +		mutex_unlock(&uci_dev->mutex);
>>>> +		return -ERESTARTSYS;
>>>> +	}
>>>> +
>>>> +	/* No data available to read, wait */
>>>> +	if (!uci_chan->cur_buf && list_empty(&uci_chan->pending)) {
>>>> +		dev_dbg(dev, "No data available to read waiting\n");
>>>> +
>>>> +		spin_unlock_bh(&uci_chan->lock);
>>>> +		mutex_unlock(&uci_dev->mutex);
>>>> +		ret = wait_event_interruptible(uci_chan->wq,
>>>> +					       (!uci_dev->enabled ||
>>>> +					      !list_empty(&uci_chan->pending)));
>>>> +		if (ret == -ERESTARTSYS) {
>>>> +			dev_dbg(dev, "Exit signal caught for node\n");
>>>
>>> No need of this.
>> This is same as what we are doing in write(). I can add the uci_dev->enabled
>> check here as well and return -ENODEV as you commented for write(). Helps in
>> debugging.
> 
> Okay
> 
>>>
>>>> +			return -ERESTARTSYS;
>>>> +		}
>>>> +
>>>> +		mutex_lock(&uci_dev->mutex);
>>>> +		spin_lock_bh(&uci_chan->lock);
>>>> +		if (!uci_dev->enabled) {
>>>> +			dev_dbg(dev, "node is disabled\n");
>>>
>>> Okay, this is what I'm concerned about.
>> If your concern is about locking, i am going to come up with the change to
>> fix that. If you concern is about node getting removed while read is issued
>> then i dont see how we can prevent that.
>>>
>>>> +			ret = -ERESTARTSYS;
>>>> +			goto read_error;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/* new read, get the next descriptor from the list */
>>>> +	if (!uci_chan->cur_buf) {
>>>> +		uci_buf = list_first_entry_or_null(&uci_chan->pending,
>>>> +						   struct uci_buf, node);
>>>> +		if (unlikely(!uci_buf)) {
>>>> +			ret = -EIO;
>>>> +			goto read_error;
>>>> +		}
>>>> +
>>>> +		list_del(&uci_buf->node);
>>>> +		uci_chan->cur_buf = uci_buf;
>>>> +		uci_chan->rx_size = uci_buf->len;
>>>> +		dev_dbg(dev, "Got pkt of size:%zu\n", uci_chan->rx_size);
>>>> +	}
>>>> +
>>>> +	uci_buf = uci_chan->cur_buf;
>>>> +
>>>> +	/* Copy the buffer to user space */
>>>> +	to_copy = min_t(size_t, count, uci_chan->rx_size);
>>>> +	ptr = uci_buf->data + (uci_buf->len - uci_chan->rx_size);
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +
>>>> +	ret = copy_to_user(buf, ptr, to_copy);
>>>> +	if (ret)
>>>> +		goto err_unlock_mtx;
>>>> +
>>>> +	spin_lock_bh(&uci_chan->lock);
>>>> +
>>>> +	dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uci_chan->rx_size);
>>>> +	uci_chan->rx_size -= to_copy;
>>>> +
>>>> +	/* we finished with this buffer, queue it back to hardware */
>>>
>>> Oh wait... what is happening here? Why do you want to do tx?
>> we are not doing any TX, we are just queuing the rx buffer back to get more
>> data.
> 
> But why? You are doing this unconditionally!
This is typical way of doing read(), as you dont know when is the next 
packet would arrive so you just keep TREs queued to get the packet from 
MHI Device side in case they have more data to send to Host.
> 
>>>
>>>> +	if (!uci_chan->rx_size) {
>>>> +		uci_chan->cur_buf = NULL;
>>>> +
>>>> +		if (uci_dev->enabled)
>>>> +			ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
>>>> +					    uci_buf->data,
>>>> +					    uci_dev->actual_mtu, MHI_EOT);
>>>> +		else
>>>> +			ret = -ERESTARTSYS;
>>>> +
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Failed to recycle element\n");
>>>> +			kfree(uci_buf->data);
>>>> +			goto read_error;
>>>> +		}
>>>> +	}
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +
>>>> +	dev_dbg(dev, "Returning %lu bytes\n", to_copy);
>>>> +
>>>> +	return to_copy;
>>>> +
>>>> +read_error:
>>>> +	spin_unlock_bh(&uci_chan->lock);
>>>> +err_unlock_mtx:
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int mhi_uci_open(struct inode *inode, struct file *filp)
>>>> +{
>>>> +	struct uci_dev *uci_dev = NULL, *tmp_dev;
>>>> +	int ret = -EIO;
>>>> +	struct uci_buf *buf_itr, *tmp;
>>>> +	struct uci_chan *dl_chan;
>>>> +	struct mhi_device *mhi_dev;
>>>> +	struct device *dev;
>>>> +
>>>> +	mutex_lock(&mhi_uci_drv.lock);
>>>> +	list_for_each_entry(tmp_dev, &mhi_uci_drv.head, node) {
>>>> +		if (tmp_dev->devt == inode->i_rdev) {
>>>> +			uci_dev = tmp_dev;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/* could not find a minor node */
>>>> +	if (!uci_dev)
>>>> +		goto error_exit;
>>>> +
>>>> +	mhi_dev = uci_dev->mhi_dev;
>>>> +	dev = &mhi_dev->dev;
>>>> +
>>>> +	mutex_lock(&uci_dev->mutex);
>>>> +	if (!uci_dev->enabled) {
>>>> +		dev_info(dev, "Node exist, but not in active state!\n");
>>>
>>> Dangling node, right.
>> In case remove() is in progress and enabled is set to false but
>> destroy_device is not called yet. It covers that case and open() is called
>> by user space entity.
> 
> Hmm, okay.
> 
>>>
>>>> +		goto error_open_chan;
>>>> +	}
>>>> +
>>>> +	uci_dev->ref_count++;
>>>> +
>>>> +	dev_dbg(dev, "Node open, ref counts %u\n", uci_dev->ref_count);
>>>> +
>>>> +	if (uci_dev->ref_count == 1) {
>>>> +		dev_dbg(dev, "Starting channel\n");
>>>> +		ret = mhi_prepare_for_transfer(uci_dev->mhi_dev);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Error starting transfer channels\n");
>>>> +			uci_dev->ref_count--;
>>>> +			goto error_open_chan;
>>>> +		}
>>>> +
>>>> +		ret = mhi_queue_inbound(uci_dev);
>>>> +		if (ret)
>>>
>>> Decrease refcount?
>> done in release. For every open increment the ref count and for every
>> release call decrement it, so that when ref count becomes 0 we can free
>> memory.
> 
> Even if open() fails?
Nice catch, will decrement ref count if mhi_queue_inbound() fails.
> 
>>>
>>>> +			goto error_rx_queue;
>>>> +	}
>>>> +
>>>> +	filp->private_data = uci_dev;
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +	mutex_unlock(&mhi_uci_drv.lock);
>>>> +
>>>> +	return 0;
>>>> +
>>>> +error_rx_queue:
>>>> +	dl_chan = &uci_dev->dl_chan;
>>>> +	mhi_unprepare_from_transfer(uci_dev->mhi_dev);
>>>> +	list_for_each_entry_safe(buf_itr, tmp, &dl_chan->pending, node) {
>>>> +		list_del(&buf_itr->node);
>>>> +		kfree(buf_itr->data);
>>>> +	}
>>>> +
>>>> +error_open_chan:
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +
>>>> +error_exit:
>>>> +	mutex_unlock(&mhi_uci_drv.lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static const struct file_operations mhidev_fops = {
>>>> +	.owner = THIS_MODULE,
>>>> +	.open = mhi_uci_open,
>>>> +	.release = mhi_uci_release,
>>>> +	.read = mhi_uci_read,
>>>> +	.write = mhi_uci_write,
>>>> +	.poll = mhi_uci_poll,
>>>> +};
>>>> +
>>>> +static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
>>>> +			   struct mhi_result *mhi_result)
>>>> +{
>>>> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
>>>> +	struct uci_chan *uci_chan = &uci_dev->ul_chan;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +
>>>> +	dev_dbg(dev, "status:%d xfer_len:%zu\n", mhi_result->transaction_status,
>>>
>>> Always leave a space after :
>> Done.
>>>
>>>> +		mhi_result->bytes_xferd);
>>>> +
>>>> +	kfree(mhi_result->buf_addr);
>>>> +	if (!mhi_result->transaction_status)
>>>> +		wake_up(&uci_chan->wq);
>>>> +}
>>>> +
>>>> +static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
>>>> +			   struct mhi_result *mhi_result)
>>>> +{
>>>> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
>>>> +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	unsigned long flags;
>>>> +	struct uci_buf *buf;
>>>> +
>>>> +	dev_dbg(dev, "status:%d receive_len:%zu\n",
>>>> +		mhi_result->transaction_status, mhi_result->bytes_xferd);
>>>> +
>>>> +	if (mhi_result->transaction_status == -ENOTCONN) {
>>>> +		kfree(mhi_result->buf_addr);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	spin_lock_irqsave(&uci_chan->lock, flags);
>>>> +	buf = mhi_result->buf_addr + uci_dev->actual_mtu;
>>>> +	buf->data = mhi_result->buf_addr;
>>>> +	buf->len = mhi_result->bytes_xferd;
>>>> +	list_add_tail(&buf->node, &uci_chan->pending);
>>>> +	spin_unlock_irqrestore(&uci_chan->lock, flags);
>>>> +
>>>> +	wake_up(&uci_chan->wq);
>>>> +}
>>>> +
>>>> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
>>>> +			 const struct mhi_device_id *id)
>>>> +{
>>>> +	struct uci_dev *uci_dev;
>>>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +	int minor;
>>>> +	int dir;
>>>> +
>>>> +	uci_dev = kzalloc(sizeof(*uci_dev), GFP_KERNEL);
>>>> +	if (!uci_dev)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	mutex_init(&uci_dev->mutex);
>>>> +	uci_dev->mhi_dev = mhi_dev;
>>>> +
>>>> +	mutex_lock(&uci_dev->mutex);
>>>> +	mutex_lock(&mhi_uci_drv.lock);
>>>> +
>>>> +	minor = find_first_zero_bit(uci_minors, MAX_UCI_DEVICES);
>>>> +	if (minor >= MAX_UCI_DEVICES) {
>>>> +		mutex_unlock(&mhi_uci_drv.lock);
>>>> +		mutex_unlock(&uci_dev->mutex);
>>>> +		kfree(uci_dev);
>>>> +		return -ENOSPC;
>>>> +	}
>>>> +
>>>
>>> Add a comment regarding what is going on below.
>> Done.
>>>
>>>> +	uci_dev->devt = MKDEV(mhi_uci_drv.major, minor);
>>>> +	uci_dev->dev = device_create(mhi_uci_drv.class, &mhi_dev->dev,
>>>> +				     uci_dev->devt, uci_dev,
>>>> +				     DEVICE_NAME "_%s_%s",
>>>> +				     dev_name(mhi_cntrl->cntrl_dev),
>>>> +				     mhi_dev->name);
>>>> +	set_bit(minor, uci_minors);
>>>> +
>>>> +	for (dir = 0; dir < 2; dir++) {
>>>> +		struct uci_chan *uci_chan = (dir) ?
>>>> +			&uci_dev->ul_chan : &uci_dev->dl_chan;
>>>> +		spin_lock_init(&uci_chan->lock);
>>>> +		init_waitqueue_head(&uci_chan->wq);
>>>> +		INIT_LIST_HEAD(&uci_chan->pending);
>>>> +	}
>>>> +
>>>> +	uci_dev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
>>>> +	uci_dev->actual_mtu = uci_dev->mtu -  sizeof(struct uci_buf);
>>>> +	dev_set_drvdata(&mhi_dev->dev, uci_dev);
>>>> +	uci_dev->enabled = true;
>>>> +
>>>> +	list_add(&uci_dev->node, &mhi_uci_drv.head);
>>>> +	mutex_unlock(&mhi_uci_drv.lock);
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +
>>>> +	dev_info(dev, "channel:%s successfully probed\n", mhi_dev->name);
>>>> +
>>>> +	return 0;
>>>> +};
>>>> +
>>>> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
>>>> +{
>>>> +	struct uci_dev *uci_dev = dev_get_drvdata(&mhi_dev->dev);
>>>> +	struct device *dev = &mhi_dev->dev;
>>>> +
>>>> +	dev_dbg(dev, "%s: enter\n", __func__);
>>>> +
>>>
>>> Drop this.
>> I can remove the enter and exit from the message but it helps to debug race
>> conditions between remove() and open()/release(). i Can say something like
>> removing mhi_dev->name
> 
> Okay.
> 
>>>
>>>> +	mutex_lock(&mhi_uci_drv.lock);
>>>> +	mutex_lock(&uci_dev->mutex);
>>>> +
>>>> +	/* disable the node */
>>>> +	spin_lock_irq(&uci_dev->dl_chan.lock);
>>>> +	spin_lock_irq(&uci_dev->ul_chan.lock);
>>>> +	uci_dev->enabled = false;
>>>> +	spin_unlock_irq(&uci_dev->ul_chan.lock);
>>>> +	spin_unlock_irq(&uci_dev->dl_chan.lock);
>>>
>>> You need to do something better here. This doesn't look good.
>> Will come up with change to fix lock related concerns.
>>>
>>>> +	wake_up(&uci_dev->dl_chan.wq);
>>>> +	wake_up(&uci_dev->ul_chan.wq);
>>>> +
>>>> +	/* delete the node to prevent new opens */
>>>> +	device_destroy(mhi_uci_drv.class, uci_dev->devt);
>>>> +	uci_dev->dev = NULL;
>>>> +	list_del(&uci_dev->node);
>>>> +
>>>> +	/* safe to free memory only if all file nodes are closed */
>>>
>>> And what if it is already freed in .release?
>> It is possible that ref_count becomes 0 in release() then it would be no-op
>> here.
> 
> No-op? You are calling kfree again.
No, the way it works is: In release() we decrement ref count and check 
if uci_dev->enabled is false which means remove was already called. In 
that case we free in release(). In case remove was not called yet, then 
if release() is called we do not free uci_dev and free it on remove().
Both functions are protected with same mutext lock uci_dev->lock.
> 
>>>
>>>> +	if (!uci_dev->ref_count) {
>>>> +		mutex_unlock(&uci_dev->mutex);
>>>> +		mutex_destroy(&uci_dev->mutex);
>>>> +		clear_bit(MINOR(uci_dev->devt), uci_minors);
>>>> +		dev_set_drvdata(&mhi_dev->dev, NULL);
>>>> +		kfree(uci_dev);
>>>> +		mutex_unlock(&mhi_uci_drv.lock);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	mutex_unlock(&uci_dev->mutex);
>>>> +	mutex_unlock(&mhi_uci_drv.lock);
>>>> +
>>>> +	dev_dbg(dev, "%s: exit\n", __func__);
>>>
>>> Drop this.
>> I can change it to mhi_dev->name removed. It helps in debugging race
>> conditions.
> 
> Okay.
> 
>>>
>>> Thanks,
>>> Mani
>>>
>>>> +}
>>>> +
>>>> +/* .driver_data stores max mtu */
>>>> +static const struct mhi_device_id mhi_uci_match_table[] = {
>>>> +	{ .chan = "LOOPBACK", .driver_data = 0x1000 },
>>>> +	{},
>>>> +};
>>>> +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
>>>> +
>>>> +static struct mhi_driver mhi_uci_driver = {
>>>> +	.id_table = mhi_uci_match_table,
>>>> +	.remove = mhi_uci_remove,
>>>> +	.probe = mhi_uci_probe,
>>>> +	.ul_xfer_cb = mhi_ul_xfer_cb,
>>>> +	.dl_xfer_cb = mhi_dl_xfer_cb,
>>>> +	.driver = {
>>>> +		.name = MHI_UCI_DRIVER_NAME,
>>>> +	},
>>>> +};
>>>> +
>>>> +static int mhi_uci_init(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	mhi_uci_drv.major = ret;
>>>> +	mhi_uci_drv.class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
>>>> +	if (IS_ERR(mhi_uci_drv.class)) {
>>>> +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
>>>> +		return -ENODEV;
>>>> +	}
>>>> +
>>>> +	mutex_init(&mhi_uci_drv.lock);
>>>> +	INIT_LIST_HEAD(&mhi_uci_drv.head);
>>>> +
>>>> +	ret = mhi_driver_register(&mhi_uci_driver);
>>>> +	if (ret) {
>>>> +		class_destroy(mhi_uci_drv.class);
>>>> +		unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void __exit mhi_uci_exit(void)
>>>> +{
>>>> +	mhi_driver_unregister(&mhi_uci_driver);
>>>> +	class_destroy(mhi_uci_drv.class);
>>>> +	unregister_chrdev(mhi_uci_drv.major, MHI_UCI_DRIVER_NAME);
>>>> +}
>>>> +
>>>> +module_init(mhi_uci_init);
>>>> +module_exit(mhi_uci_exit);
>>>> +MODULE_LICENSE("GPL v2");
>>>> +MODULE_DESCRIPTION("MHI UCI Driver");
>>>> -- 
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>
>> I have some follow up questions based on your review comments. Please let me
>> know your view on those questions above.
>>
>> Thanks,
>> Hemant
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
