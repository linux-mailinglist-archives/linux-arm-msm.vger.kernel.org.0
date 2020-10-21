Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BD0295073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 18:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502856AbgJUQMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 12:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502852AbgJUQMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 12:12:06 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9ADC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:12:05 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w11so1443592pll.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MDZI3EK3idwd//KAW51RS4zI7bvU+JrWVheI3N5Vli8=;
        b=UW+bDTHTXOH6mMqR88Vb/0LZeZAcx0Zr23g+Uzd1QenSq2ZtyU+4NdWSxv/rwTgfyE
         CtMAeDbK0vGNAkz8gVC4sPA8tJoS7CBoubnK1zgjZrgQUj3m9kLQ88eDrzc2sK0k2mmm
         h2fQFMZXii9d6hO4AYbya2tHk1GIznP/dtXJZujjJzipQrxX7ejUzJ3p3cnD84ryD4gn
         udU5odmKZ/bg1CCCbSjwoaOKoYkQ1bwVZdjTR1fFV/rPWJx36K3VVfEu6LARJ8BLqFX7
         Z1dcl+UZ3BsnwuyW+7+mbkkigyFWZzJ0+Gjog+lCdd34qNIwpuD9F1+ZzeRd1M57RXiM
         1DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MDZI3EK3idwd//KAW51RS4zI7bvU+JrWVheI3N5Vli8=;
        b=SBZyjV3je0HyL8KDk7NfjVUR2guhunSInNQWvXJRhBTAEDWY6l4hTuSiNJj9/qpNjF
         UPI1P3fn7pIM8aFjX93RwbbMsb0xbOz2/azilw5UmIwhTThK4Copp2TFEvJp+6yNVVMR
         0tReorijuwQhK2S/rfR8O57e9aR4x3pnEv00PyjE6l+UQYtBU45mZwnCk1i3d8snpjb5
         UEcR3bAwCI+ipKyDz4oMY624wxVoXXte1nFAuFrJU4HDJTisnzjM6608XZHStfTX5F9K
         tYoz8sKvrcfXucqd8ho3W7freSC4hxzdT154vOdgXuL+Oi5bWsdMcbJo2hussG0/Mv6K
         ftUg==
X-Gm-Message-State: AOAM533e+6RMxTWzPMsAdNo0Vl+yjh44yG995l5pIJAPjT+91CYC9Lug
        pqAV3Ob9G9RRCmTEcXS7aDgh
X-Google-Smtp-Source: ABdhPJwoz3DXXi6YFin4kd6ltOyMtuScqTHAArcv92fclbXARZigMypKM4H7MLAg7uEgR70zR8BHOw==
X-Received: by 2002:a17:902:a704:b029:d3:b2d4:a847 with SMTP id w4-20020a170902a704b02900d3b2d4a847mr4215652plq.77.1603296725159;
        Wed, 21 Oct 2020 09:12:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70e:2a27:314a:6d22:ec47:a603])
        by smtp.gmail.com with ESMTPSA id x19sm1494179pjk.25.2020.10.21.09.11.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 09:12:03 -0700 (PDT)
Date:   Wed, 21 Oct 2020 21:41:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
Subject: Re: [PATCH v7 4/4] bus: mhi: Add userspace client interface driver
Message-ID: <20201021161156.GE3334@Mani-XPS-13-9360>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-5-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602907457-13680-5-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16, 2020 at 09:04:17PM -0700, Hemant Kumar wrote:
> This MHI client driver allows userspace clients to transfer
> raw data between MHI device and host using standard file operations.
> Driver instantiates uci device object which is associated to device
> file node. uci device object instantiates uci channel object when device
> file node is opened. uci channel object is used to manage MHI channels
> by calling MHI core APIs for read and write operations. MHI channels
> are started as part of device open(). MHI channels remain in start
> state until last release() is called on uci device file node. Device
> file node is created with format
> 
> /dev/mhi_<controller_name>_<mhi_device_name>
> 
> Currently it supports LOOPBACK channel.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/Kconfig  |  13 +
>  drivers/bus/mhi/Makefile |   4 +
>  drivers/bus/mhi/uci.c    | 656 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 673 insertions(+)
>  create mode 100644 drivers/bus/mhi/uci.c
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index e841c10..3891b31 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,16 @@ config MHI_BUS_DEBUG
>  	  Enable debugfs support for use with the MHI transport. Allows
>  	  reading and/or modifying some values within the MHI controller
>  	  for debug and test purposes.
> +
> +config MHI_UCI
> +	tristate "MHI UCI"
> +	depends on MHI_BUS
> +	help
> +	  MHI based userspace client interface driver is used for transferring

Userspace Client Interface (UCI)

And please use the caps form UCI in comments throughout the driver.

> +	  raw data between host and device using standard file operations from
> +	  userspace. Open, read, write, and close operations are supported
> +	  by this driver. Please check mhi_uci_match_table for all supported
> +	  channels that are exposed to userspace.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called mhi_uci.
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..80feefb 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,6 @@
>  # core layer
>  obj-y += core/
> +
> +# MHI client
> +mhi_uci-y := uci.o
> +obj-$(CONFIG_MHI_UCI) += mhi_uci.o
> diff --git a/drivers/bus/mhi/uci.c b/drivers/bus/mhi/uci.c
> new file mode 100644
> index 0000000..8334836
> --- /dev/null
> +++ b/drivers/bus/mhi/uci.c
> @@ -0,0 +1,656 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
> +
> +#include <linux/kernel.h>
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +
> +#define DEVICE_NAME "mhi"
> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
> +#define MAX_UCI_MINORS (128)

No need of ().

> +
> +static DEFINE_IDR(uci_idr);
> +static DEFINE_MUTEX(uci_drv_mutex);
> +static struct class *uci_dev_class;
> +static int uci_dev_major;
> +
> +/**
> + * struct uci_chan - MHI channel for a uci device
> + * @udev: associated uci device object
> + * @ul_wq: wait queue for writer
> + * @write_lock: mutex write lock for ul channel
> + * @dl_wq: wait queue for reader
> + * @read_lock: mutex read lock for dl channel
> + * @dl_lock: spin lock
> + * @pending: list of dl buffers userspace is waiting to read
> + * @cur_buf: current buffer userspace is reading
> + * @dl_size: size of the current dl buffer userspace is reading
> + * @ref_count: uci_chan reference count
> + */
> +struct uci_chan {
> +	struct uci_dev *udev;
> +	wait_queue_head_t ul_wq;
> +
> +	/* ul channel lock to synchronize multiple writes */

Please move these inline comments to Kdoc.

> +	struct mutex write_lock;
> +
> +	wait_queue_head_t dl_wq;
> +
> +	/* dl channel lock to synchronize multiple reads */
> +	struct mutex read_lock;
> +
> +	/*
> +	 * protects pending and cur_buf members in bh context, channel release,
> +	 * read and poll
> +	 */
> +	spinlock_t dl_lock;
> +
> +	struct list_head pending;
> +	struct uci_buf *cur_buf;
> +	size_t dl_size;
> +	struct kref ref_count;
> +};
> +
> +/**
> + * struct uci_buf - uci buffer
> + * @data: data buffer
> + * @len: length of data buffer
> + * @node: list node of the uci buffer
> + */
> +struct uci_buf {
> +	void *data;
> +	size_t len;
> +	struct list_head node;
> +};
> +
> +/**
> + * struct uci_dev - MHI uci device
> + * @minor: uci device node minor number
> + * @mhi_dev: associated mhi device object
> + * @uchan: uci uplink and downlink channel object
> + * @mtu: max TRE buffer length
> + * @enabled: uci device probed

Use something like, "Flag to track the state of the UCI device".

> + * @lock: mutex lock to manage uchan object
> + * @ref_count: uci_dev reference count
> + */
> +struct uci_dev {
> +	unsigned int minor;
> +	struct mhi_device *mhi_dev;
> +	struct uci_chan *uchan;
> +	size_t mtu;
> +	bool enabled;
> +
> +	/* synchronize open, release and driver remove */
> +	struct mutex lock;
> +	struct kref ref_count;
> +};
> +

[...]

> +
> +static int mhi_uci_dev_start_chan(struct uci_dev *udev)
> +{
> +	int ret = 0;
> +	struct uci_chan *uchan;
> +
> +	mutex_lock(&udev->lock);
> +	if (!udev->uchan || !kref_get_unless_zero(&udev->uchan->ref_count)) {
> +		uchan = kzalloc(sizeof(*uchan), GFP_KERNEL);
> +		if (!uchan) {
> +			ret = -ENOMEM;
> +			goto error_chan_start;
> +		}
> +
> +		udev->uchan = uchan;
> +		uchan->udev = udev;
> +		init_waitqueue_head(&uchan->ul_wq);
> +		init_waitqueue_head(&uchan->dl_wq);
> +		mutex_init(&uchan->write_lock);
> +		mutex_init(&uchan->read_lock);
> +		spin_lock_init(&uchan->dl_lock);
> +		INIT_LIST_HEAD(&uchan->pending);
> +
> +		ret = mhi_prepare_for_transfer(udev->mhi_dev);
> +		if (ret) {
> +			dev_err(&udev->mhi_dev->dev, "Error starting transfer channels\n");
> +			goto error_chan_cleanup;
> +		}
> +
> +		ret = mhi_queue_inbound(udev);
> +		if (ret)
> +			goto error_chan_cleanup;
> +
> +		kref_init(&uchan->ref_count);
> +	}
> +
> +	mutex_unlock(&udev->lock);

Please leave a new line before return.

> +	return 0;
> +
> +error_chan_cleanup:
> +	mhi_uci_dev_chan_release(&uchan->ref_count);
> +error_chan_start:
> +	mutex_unlock(&udev->lock);
> +	return ret;
> +}
> +

[...]

> +
> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
> +			 const struct mhi_device_id *id)
> +{
> +	struct uci_dev *udev;
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct device *dev;
> +	int index;
> +
> +	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
> +	if (!udev)
> +		return -ENOMEM;
> +
> +	kref_init(&udev->ref_count);
> +	mutex_init(&udev->lock);
> +	udev->mhi_dev = mhi_dev;
> +
> +	mutex_lock(&uci_drv_mutex);

Do we really need the lock here?

> +	index = idr_alloc(&uci_idr, udev, 0, MAX_UCI_MINORS, GFP_KERNEL);
> +	mutex_unlock(&uci_drv_mutex);
> +	if (index < 0) {
> +		kfree(udev);
> +		return index;
> +	}
> +
> +	udev->minor = index;
> +
> +	udev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
> +	dev_set_drvdata(&mhi_dev->dev, udev);
> +	udev->enabled = true;
> +
> +	/* create device file node /dev/mhi_<cntrl_dev_name>_<mhi_dev_name> */
> +	dev = device_create(uci_dev_class, &mhi_dev->dev,
> +			    MKDEV(uci_dev_major, index), udev,
> +			    DEVICE_NAME "_%s_%s",
> +			    dev_name(mhi_cntrl->cntrl_dev), mhi_dev->name);
> +	if (IS_ERR(dev)) {
> +		mutex_lock(&uci_drv_mutex);
> +		idr_remove(&uci_idr, udev->minor);
> +		mutex_unlock(&uci_drv_mutex);
> +		dev_set_drvdata(&mhi_dev->dev, NULL);
> +		kfree(udev);
> +		return PTR_ERR(dev);
> +	}
> +
> +	dev_dbg(&mhi_dev->dev, "probed uci dev: minor %d\n", index);
> +
> +	return 0;
> +};
> +
> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
> +{
> +	struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
> +
> +	/* disable the node */
> +	mutex_lock(&udev->lock);
> +	udev->enabled = false;
> +
> +	/* delete the node to prevent new opens */
> +	device_destroy(uci_dev_class, MKDEV(uci_dev_major, udev->minor));
> +
> +	/* return error for any blocked read or write */
> +	if (udev->uchan) {
> +		wake_up(&udev->uchan->ul_wq);
> +		wake_up(&udev->uchan->dl_wq);
> +	}
> +	mutex_unlock(&udev->lock);
> +
> +	mutex_lock(&uci_drv_mutex);
> +	idr_remove(&uci_idr, udev->minor);
> +	kref_put(&udev->ref_count, mhi_uci_dev_release);
> +	mutex_unlock(&uci_drv_mutex);
> +}
> +
> +/* .driver_data stores max mtu */
> +static const struct mhi_device_id mhi_uci_match_table[] = {
> +	{ .chan = "LOOPBACK", .driver_data = 0x1000},
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
> +	uci_dev_major = ret;
> +	uci_dev_class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
> +	if (IS_ERR(uci_dev_class)) {
> +		unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);

Use an error path for cleaning this.

Thanks,
Mani
