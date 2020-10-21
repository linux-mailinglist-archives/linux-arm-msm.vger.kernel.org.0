Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590ED2951B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 19:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503673AbgJURnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 13:43:35 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:52056 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503677AbgJURnf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 13:43:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603302213; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+A4553adrJMcOZusHV+0jr5x/BXTyeJnngFIbqbJnrI=; b=Jmy2/NhKfRzxbsPBJDp4txgJiKqFAYp/fe1hwN64jEK8Uu2DQHNyjWcBbcRcHy90RvJIovyk
 QGynSOs5qpElpef0JcWSBBnhNN79j9ON/T+hRwye4tCibXeUiSS2vZ5NXId2G/NvYeTZ8uga
 4Qy8UuC/dczMWZu07qWba/0zIac=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9073440764f13b004e041e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 17:43:32
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31D35C433F0; Wed, 21 Oct 2020 17:43:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BA57C433CB;
        Wed, 21 Oct 2020 17:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8BA57C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v7 4/4] bus: mhi: Add userspace client interface driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-5-git-send-email-hemantk@codeaurora.org>
 <20201021161156.GE3334@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <324f5662-9c3d-2a6f-676a-809d65c52254@codeaurora.org>
Date:   Wed, 21 Oct 2020 10:43:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021161156.GE3334@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 10/21/20 9:11 AM, Manivannan Sadhasivam wrote:
> On Fri, Oct 16, 2020 at 09:04:17PM -0700, Hemant Kumar wrote:
>> This MHI client driver allows userspace clients to transfer
>> raw data between MHI device and host using standard file operations.
>> Driver instantiates uci device object which is associated to device
>> file node. uci device object instantiates uci channel object when device
>> file node is opened. uci channel object is used to manage MHI channels
>> by calling MHI core APIs for read and write operations. MHI channels
>> are started as part of device open(). MHI channels remain in start
>> state until last release() is called on uci device file node. Device
>> file node is created with format
>>
>> /dev/mhi_<controller_name>_<mhi_device_name>
>>
>> Currently it supports LOOPBACK channel.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> ---
>>   drivers/bus/mhi/Kconfig  |  13 +
>>   drivers/bus/mhi/Makefile |   4 +
>>   drivers/bus/mhi/uci.c    | 656 +++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 673 insertions(+)
>>   create mode 100644 drivers/bus/mhi/uci.c
>>
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index e841c10..3891b31 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -20,3 +20,16 @@ config MHI_BUS_DEBUG
>>   	  Enable debugfs support for use with the MHI transport. Allows
>>   	  reading and/or modifying some values within the MHI controller
>>   	  for debug and test purposes.
>> +
>> +config MHI_UCI
>> +	tristate "MHI UCI"
>> +	depends on MHI_BUS
>> +	help
>> +	  MHI based userspace client interface driver is used for transferring
> 
> Userspace Client Interface (UCI)
Done.
> 
> And please use the caps form UCI in comments throughout the driver.
Done. In commit text : "uci device object",  "uci channel object" and 
"uci device file node" shall we change these as well ?
> 
>> +	  raw data between host and device using standard file operations from
>> +	  userspace. Open, read, write, and close operations are supported
>> +	  by this driver. Please check mhi_uci_match_table for all supported
>> +	  channels that are exposed to userspace.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called mhi_uci.
>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>> index 19e6443..80feefb 100644
>> --- a/drivers/bus/mhi/Makefile
>> +++ b/drivers/bus/mhi/Makefile
>> @@ -1,2 +1,6 @@
>>   # core layer
>>   obj-y += core/
>> +
>> +# MHI client
>> +mhi_uci-y := uci.o
>> +obj-$(CONFIG_MHI_UCI) += mhi_uci.o
>> diff --git a/drivers/bus/mhi/uci.c b/drivers/bus/mhi/uci.c
>> new file mode 100644
>> index 0000000..8334836
>> --- /dev/null
>> +++ b/drivers/bus/mhi/uci.c
>> @@ -0,0 +1,656 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +
>> +#define DEVICE_NAME "mhi"
>> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
>> +#define MAX_UCI_MINORS (128)
> 
> No need of ().
Done.
> 
>> +
>> +static DEFINE_IDR(uci_idr);
>> +static DEFINE_MUTEX(uci_drv_mutex);
>> +static struct class *uci_dev_class;
>> +static int uci_dev_major;
>> +
>> +/**
>> + * struct uci_chan - MHI channel for a uci device
>> + * @udev: associated uci device object
>> + * @ul_wq: wait queue for writer
>> + * @write_lock: mutex write lock for ul channel
>> + * @dl_wq: wait queue for reader
>> + * @read_lock: mutex read lock for dl channel
>> + * @dl_lock: spin lock
>> + * @pending: list of dl buffers userspace is waiting to read
>> + * @cur_buf: current buffer userspace is reading
>> + * @dl_size: size of the current dl buffer userspace is reading
>> + * @ref_count: uci_chan reference count
>> + */
>> +struct uci_chan {
>> +	struct uci_dev *udev;
>> +	wait_queue_head_t ul_wq;
>> +
>> +	/* ul channel lock to synchronize multiple writes */
> 
> Please move these inline comments to Kdoc.
This was added because checkpatch --strict required to add a comment 
when lock is added to struct, after adding inline comment, checkpatch
error was gone.
> 
>> +	struct mutex write_lock;
>> +
>> +	wait_queue_head_t dl_wq;
>> +
>> +	/* dl channel lock to synchronize multiple reads */
>> +	struct mutex read_lock;
>> +
>> +	/*
>> +	 * protects pending and cur_buf members in bh context, channel release,
>> +	 * read and poll
>> +	 */
>> +	spinlock_t dl_lock;
>> +
>> +	struct list_head pending;
>> +	struct uci_buf *cur_buf;
>> +	size_t dl_size;
>> +	struct kref ref_count;
>> +};
>> +
>> +/**
>> + * struct uci_buf - uci buffer
>> + * @data: data buffer
>> + * @len: length of data buffer
>> + * @node: list node of the uci buffer
>> + */
>> +struct uci_buf {
>> +	void *data;
>> +	size_t len;
>> +	struct list_head node;
>> +};
>> +
>> +/**
>> + * struct uci_dev - MHI uci device
>> + * @minor: uci device node minor number
>> + * @mhi_dev: associated mhi device object
>> + * @uchan: uci uplink and downlink channel object
>> + * @mtu: max TRE buffer length
>> + * @enabled: uci device probed
> 
> Use something like, "Flag to track the state of the UCI device".
Done
> 
>> + * @lock: mutex lock to manage uchan object
>> + * @ref_count: uci_dev reference count
>> + */
>> +struct uci_dev {
>> +	unsigned int minor;
>> +	struct mhi_device *mhi_dev;
>> +	struct uci_chan *uchan;
>> +	size_t mtu;
>> +	bool enabled;
>> +
>> +	/* synchronize open, release and driver remove */
>> +	struct mutex lock;
>> +	struct kref ref_count;
>> +};
>> +
> 
> [...]
> 
>> +
>> +static int mhi_uci_dev_start_chan(struct uci_dev *udev)
>> +{
>> +	int ret = 0;
>> +	struct uci_chan *uchan;
>> +
>> +	mutex_lock(&udev->lock);
>> +	if (!udev->uchan || !kref_get_unless_zero(&udev->uchan->ref_count)) {
>> +		uchan = kzalloc(sizeof(*uchan), GFP_KERNEL);
>> +		if (!uchan) {
>> +			ret = -ENOMEM;
>> +			goto error_chan_start;
>> +		}
>> +
>> +		udev->uchan = uchan;
>> +		uchan->udev = udev;
>> +		init_waitqueue_head(&uchan->ul_wq);
>> +		init_waitqueue_head(&uchan->dl_wq);
>> +		mutex_init(&uchan->write_lock);
>> +		mutex_init(&uchan->read_lock);
>> +		spin_lock_init(&uchan->dl_lock);
>> +		INIT_LIST_HEAD(&uchan->pending);
>> +
>> +		ret = mhi_prepare_for_transfer(udev->mhi_dev);
>> +		if (ret) {
>> +			dev_err(&udev->mhi_dev->dev, "Error starting transfer channels\n");
>> +			goto error_chan_cleanup;
>> +		}
>> +
>> +		ret = mhi_queue_inbound(udev);
>> +		if (ret)
>> +			goto error_chan_cleanup;
>> +
>> +		kref_init(&uchan->ref_count);
>> +	}
>> +
>> +	mutex_unlock(&udev->lock);
> 
> Please leave a new line before return.
Done.
> 
>> +	return 0;
>> +
>> +error_chan_cleanup:
>> +	mhi_uci_dev_chan_release(&uchan->ref_count);
>> +error_chan_start:
>> +	mutex_unlock(&udev->lock);
>> +	return ret;
>> +}
>> +
> 
> [...]
> 
>> +
>> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
>> +			 const struct mhi_device_id *id)
>> +{
>> +	struct uci_dev *udev;
>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +	struct device *dev;
>> +	int index;
>> +
>> +	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
>> +	if (!udev)
>> +		return -ENOMEM;
>> +
>> +	kref_init(&udev->ref_count);
>> +	mutex_init(&udev->lock);
>> +	udev->mhi_dev = mhi_dev;
>> +
>> +	mutex_lock(&uci_drv_mutex);
> 
> Do we really need the lock here?
Added this based on the comment from idr_alloc API
  * The caller should provide their own locking to ensure that two
  * concurrent modifications to the IDR are not possible.
> 
>> +	index = idr_alloc(&uci_idr, udev, 0, MAX_UCI_MINORS, GFP_KERNEL);
>> +	mutex_unlock(&uci_drv_mutex);
>> +	if (index < 0) {
>> +		kfree(udev);
>> +		return index;
>> +	}
>> +
>> +	udev->minor = index;
>> +
>> +	udev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
>> +	dev_set_drvdata(&mhi_dev->dev, udev);
>> +	udev->enabled = true;
>> +
>> +	/* create device file node /dev/mhi_<cntrl_dev_name>_<mhi_dev_name> */
>> +	dev = device_create(uci_dev_class, &mhi_dev->dev,
>> +			    MKDEV(uci_dev_major, index), udev,
>> +			    DEVICE_NAME "_%s_%s",
>> +			    dev_name(mhi_cntrl->cntrl_dev), mhi_dev->name);
>> +	if (IS_ERR(dev)) {
>> +		mutex_lock(&uci_drv_mutex);
>> +		idr_remove(&uci_idr, udev->minor);
>> +		mutex_unlock(&uci_drv_mutex);
>> +		dev_set_drvdata(&mhi_dev->dev, NULL);
>> +		kfree(udev);
>> +		return PTR_ERR(dev);
>> +	}
>> +
>> +	dev_dbg(&mhi_dev->dev, "probed uci dev: minor %d\n", index);
>> +
>> +	return 0;
>> +};
>> +
>> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
>> +{
>> +	struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	/* disable the node */
>> +	mutex_lock(&udev->lock);
>> +	udev->enabled = false;
>> +
>> +	/* delete the node to prevent new opens */
>> +	device_destroy(uci_dev_class, MKDEV(uci_dev_major, udev->minor));
>> +
>> +	/* return error for any blocked read or write */
>> +	if (udev->uchan) {
>> +		wake_up(&udev->uchan->ul_wq);
>> +		wake_up(&udev->uchan->dl_wq);
>> +	}
>> +	mutex_unlock(&udev->lock);
>> +
>> +	mutex_lock(&uci_drv_mutex);
>> +	idr_remove(&uci_idr, udev->minor);
>> +	kref_put(&udev->ref_count, mhi_uci_dev_release);
>> +	mutex_unlock(&uci_drv_mutex);
>> +}
>> +
>> +/* .driver_data stores max mtu */
>> +static const struct mhi_device_id mhi_uci_match_table[] = {
>> +	{ .chan = "LOOPBACK", .driver_data = 0x1000},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
>> +
>> +static struct mhi_driver mhi_uci_driver = {
>> +	.id_table = mhi_uci_match_table,
>> +	.remove = mhi_uci_remove,
>> +	.probe = mhi_uci_probe,
>> +	.ul_xfer_cb = mhi_ul_xfer_cb,
>> +	.dl_xfer_cb = mhi_dl_xfer_cb,
>> +	.driver = {
>> +		.name = MHI_UCI_DRIVER_NAME,
>> +	},
>> +};
>> +
>> +static int mhi_uci_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	uci_dev_major = ret;
>> +	uci_dev_class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
>> +	if (IS_ERR(uci_dev_class)) {
>> +		unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
> 
> Use an error path for cleaning this.
Done.
> 
> Thanks,
> Mani
> 
Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
