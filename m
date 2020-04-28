Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3131BBE60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 14:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgD1M5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 08:57:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgD1M5T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 08:57:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73DA6206D6;
        Tue, 28 Apr 2020 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588078637;
        bh=BAeQTU0OgzmvlFIr927RAcq1shGoyB+kb7Hl2BhC50M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dur1TI9/mOUwXvaRoeEqnEJaG6GJNDfvIg6qZ7tsxQAm8mECDKfW1ys9AakN/vt5c
         wXEc3FNNoa2nbDqGNC9mjvUZRJLgnrPQQ236qAUlftMUYTLSn3glS9uvJffMeAf3wu
         EF5exq/FJLzpqeHWExcuKmUIV1vNHrE8JOIlCa2o=
Date:   Tue, 28 Apr 2020 14:57:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wang Wenhu <wenhu.wang@vivo.com>
Cc:     linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        kernel@vivo.com, agross@kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3,1/3] driver: rpmon: new driver Remote Processor Monitor
Message-ID: <20200428125715.GA1302692@kroah.com>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
 <20200414035949.107225-1-wenhu.wang@vivo.com>
 <20200414035949.107225-2-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414035949.107225-2-wenhu.wang@vivo.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 13, 2020 at 08:59:47PM -0700, Wang Wenhu wrote:
> RPMON is a driver framework. It supports remote processor monitor
> from user level. The basic components are a character device
> with sysfs interfaces for user space communication and different
> kinds of message drivers introduced modularly, which are used to
> communicate with remote processors.
> 
> As for user space, one can get notifications of different events
> of remote processors, like their registrations, through standard
> file read operation of the file descriptors related to the exported
> character devices. Actions can also be taken into account via
> standard write operations to the devices. Besides, the sysfs class
> attributes could be accessed conveniently.
> 
> Message drivers act as engines to communicate with remote processors.
> Currently RPMON_QMI is available which uses QMI infrastructures
> on Qualcomm SoC Platforms.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
> Changes since v1:
>  - Addressed review comments from Randy
> Changes since v2:
>  - Log message typo
>  - Added Cc list
> ---
>  drivers/Kconfig        |   2 +
>  drivers/Makefile       |   1 +
>  drivers/rpmon/Kconfig  |  26 +++
>  drivers/rpmon/Makefile |   1 +
>  drivers/rpmon/rpmon.c  | 506 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmon.h  |  68 ++++++
>  6 files changed, 604 insertions(+)
>  create mode 100644 drivers/rpmon/Kconfig
>  create mode 100644 drivers/rpmon/Makefile
>  create mode 100644 drivers/rpmon/rpmon.c
>  create mode 100644 include/linux/rpmon.h

You create a bunch of sysfs files, but you do not have any
Documentation/ABI/ updates showing what those files are for?  Please fix
that up.

> +config RPMON
> +	tristate "Remote Processor Monitor Core Framework"
> +	help
> +	  RPMON is a driver framework. It supports remote processor monitor
> +	  from user level. The basic components are a character device
> +	  with sysfs interfaces for user space communication and different
> +	  kinds of message drivers introduced modularly, which are used to
> +	  communicate with remote processors.
> +
> +	  As for user space, one can get notifications of different events
> +	  of remote processors, like their registrations, through standard
> +	  file read operation of the file descriptors related to the exported
> +	  character devices. Actions can also be taken into account via
> +	  standard write operations to the devices. Besides, the sysfs class
> +	  attributes could be accessed conveniently.

So you don't need the char dev node?  The sysfs files are sufficient?
Or do they both do different things?

How does the user/kernel api work for the char node?

> +#define RPMON_MAX_DEVICES	(1U << MINORBITS)

Why do you have a limit?

Why not just make it dynamic?

> +#define RPMON_NAME			"rpmon"
> +
> +static int rpmon_major;

Why do you need a whole major for this?  Why not use a misc device?

> +static struct cdev *rpmon_cdev;
> +static DEFINE_IDR(rpmon_idr);
> +static const struct file_operations rpmon_fops;
> +
> +/* Protect idr accesses */
> +static DEFINE_MUTEX(minor_lock);

Are you sure you need this?



> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct rpmon_device *rpmondev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	mutex_lock(&rpmondev->info_lock);
> +	if (!rpmondev->info) {
> +		ret = -EINVAL;
> +		dev_err(dev, "the device has been unregistered\n");

How can that happen in your sysfs file?  Shouldn't the name be part of
the structure itself?  And what's wrong with the default name in struct
device?

> +static ssize_t rpmon_read(struct file *filep, char __user *buf,
> +			  size_t count, loff_t *ppos)
> +{
> +	struct rpmon_device *rpmondev = filep->private_data;
> +	DECLARE_WAITQUEUE(wait, current);
> +	ssize_t ret = 0;
> +	u32 event;
> +
> +	if (count != sizeof(u32))
> +		return -EINVAL;
> +
> +	add_wait_queue(&rpmondev->wait, &wait);
> +
> +	do {
> +		mutex_lock(&rpmondev->info_lock);
> +		if (!rpmondev->info) {
> +			ret = -EIO;
> +			mutex_unlock(&rpmondev->info_lock);
> +			break;
> +		}
> +		mutex_unlock(&rpmondev->info_lock);
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +
> +		event = atomic_read(&rpmondev->event);
> +		if (event) {
> +			__set_current_state(TASK_RUNNING);
> +			if (copy_to_user(buf, &event, count))
> +				ret = -EFAULT;
> +			else {
> +				atomic_set(&rpmondev->event, 0);
> +				ret = count;
> +			}
> +			break;
> +		}
> +
> +		if (filep->f_flags & O_NONBLOCK) {
> +			ret = -EAGAIN;
> +			break;
> +		}
> +
> +		if (signal_pending(current)) {
> +			ret = -ERESTARTSYS;
> +			break;
> +		}
> +		schedule();
> +	} while (1);
> +
> +	__set_current_state(TASK_RUNNING);

Are you _sure_ that is the right way to do this???

> +	remove_wait_queue(&rpmondev->wait, &wait);
> +
> +	return ret;
> +}
> +
> +static ssize_t rpmon_write(struct file *filep, const char __user *buf,
> +			   size_t count, loff_t *ppos)
> +{
> +	struct rpmon_device *rpmondev = filep->private_data;
> +	ssize_t ret;
> +	u32 action;
> +
> +	if (count != sizeof(u32))
> +		return -EINVAL;

That's rude, how can you enforce userspace doing this?  What about short
writes?

> +
> +	if (copy_from_user(&action, buf, count))
> +		return -EFAULT;
> +
> +	mutex_lock(&rpmondev->info_lock);
> +	if (!rpmondev->info) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!rpmondev->info->monitor) {
> +		ret = -ENOTSUPP;
> +		goto out;
> +	}
> +
> +	if (rpmondev->info->monitor)
> +		ret = rpmondev->info->monitor(rpmondev->info, action);
> +out:
> +	mutex_unlock(&rpmondev->info_lock);
> +	return ret ? ret : sizeof(u32);
> +}
> +
> +static const struct file_operations rpmon_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= rpmon_open,
> +	.read		= rpmon_read,
> +	.write		= rpmon_write,
> +	.poll		= rpmon_poll,
> +	.release	= rpmon_release,
> +};
> +
> +static int rpmon_major_init(void)
> +{
> +	static const char name[] = RPMON_NAME;
> +	struct cdev *cdev = NULL;
> +	dev_t rpmon_dev = 0;
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rpmon_dev, 0, RPMON_MAX_DEVICES, name);
> +	if (ret)
> +		goto out;
> +
> +	ret = -ENOMEM;
> +	cdev = cdev_alloc();
> +	if (!cdev)
> +		goto out_unregister;
> +
> +	cdev->owner = THIS_MODULE;
> +	cdev->ops = &rpmon_fops;
> +	kobject_set_name(&cdev->kobj, "%s", name);

That doesn't do what you think it does :)

Just use a misc device please.

thanks,

greg k-h
