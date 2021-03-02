Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7287332B2F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242628AbhCCBQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350246AbhCBSgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 13:36:33 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB20C061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 10:35:19 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id d2so2596517pjs.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8iPZ/dSfoidvfpnBR6UAgg2GsKL+POGkuFVKx/qY9I0=;
        b=Xsxrtnzd6r0EROdj8WDFJPmEb/2Ck+w75m/wbCnGzLzWnz8z3uesMIh9BmUa/i84Km
         VGV6fU+BPaxcZNn3vpY7+CKM6BM1bZqtpGoBiI3nEGN2DKHFxMB4bKtDFaR1kRwL6Nb5
         YyUfV+/XZufskugeFdktryVkWGQLGFq8V00CaKVxjHFZP57MC93KZpCQzVsW0XOu3Msm
         7M37z6JMgOPRm/dBCYfxlEcE5hwFnvv59QuEo+iFNCBD5Lp8jkHanfaC16uoAOK7jOgD
         AGA1U9/IJguJHCHka5gdxlrifMJMN51t/rAo+rg+uY8JSdn0eh09O6WJkYT3f+iNk0Sc
         i6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8iPZ/dSfoidvfpnBR6UAgg2GsKL+POGkuFVKx/qY9I0=;
        b=XZImuRS85EG4V6S6E7OpAnVdYN48PaRC6MnMv0NmlD3oDcsrBSeMOnSX6EGl69dA5B
         28P+vG3kPonv7qR/+d0ffrmgFjTMlfxNhp8B4AIPDRQSXYRCTNj6A5LlmVlSdbNOhEnZ
         Y1RVvPwFwxPHmFhFHO01X8gzJxgeJcJeS8tpl3tLpdNqxmDoA21ybEGTlRqXBNDrYeBs
         eXy7IoJOH1Y+CNaPJJRnAGIc3CU9L01WLV4ouNtIHcMgmwWNPA5g6GfJYHNMO+mxRPAN
         I6B6p7SjTmzHz5+UGFnhbDePiAPfEyq3oa/OPyGPkW4EnmgDB2U9kcrJmCwaWrtblBC3
         yAgg==
X-Gm-Message-State: AOAM533rEqaufk4zgo7ID8byCsDGhs/fmw+9qcqdVAK4jSjx1NvZjLda
        KPGY/0tXX3rZtSmWQHWG9WuC+A==
X-Google-Smtp-Source: ABdhPJxXy8hpCWlY0s6CdYN2Bfqfpvho8d2mqiMcF26YqBOAg7Yv8NCZZwQ62N87jzQ/NODuACbNug==
X-Received: by 2002:a17:902:9a49:b029:df:fab8:384 with SMTP id x9-20020a1709029a49b02900dffab80384mr4729247plv.37.1614710118795;
        Tue, 02 Mar 2021 10:35:18 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s62sm22596629pfb.148.2021.03.02.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:35:18 -0800 (PST)
Date:   Tue, 2 Mar 2021 11:35:16 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 06/16] rpmsg: move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <20210302183516.GC3791957@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-7-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-7-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:51PM +0100, Arnaud Pouliquen wrote:
> Move the code related to the rpmsg_ctrl char device to the new
> rpmsg_ctrl.c module.
> Manage the dependency in the kconfig.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 163 ----------------------------
>  drivers/rpmsg/rpmsg_ctrl.c | 216 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 226 insertions(+), 163 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..2d0cd7fdd710 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -10,11 +10,20 @@ config RPMSG_CHAR
>  	tristate "RPMSG device interface"
>  	depends on RPMSG
>  	depends on NET
> +	select RPMSG_CTRL
>  	help
>  	  Say Y here to export rpmsg endpoints as device files, usually found
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctlX API. This API

s/rpmsg_ctlX/rpmsg_ctrlX

> +	  allows user-space programs to create endpoints with specific service name,
> +	  source and destination addresses.
> +
>  config RPMSG_NS
>  	tristate "RPMSG name service announcement"
>  	depends on RPMSG
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..58e3b382e316 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> +obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
>  obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 23e369a00531..83c10b39b139 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -31,28 +31,12 @@
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
>  
> -static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
>  #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
>  #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
>  
> -#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
> -#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
> -
> -/**
> - * struct rpmsg_ctrldev - control device for instantiating endpoint devices
> - * @rpdev:	underlaying rpmsg device
> - * @cdev:	cdev for the ctrl device
> - * @dev:	device for the ctrl device
> - */
> -struct rpmsg_ctrldev {
> -	struct rpmsg_device *rpdev;
> -	struct cdev cdev;
> -	struct device dev;
> -};

This showed up in rpmsg_ctrl.c as rpmsg_ctrl.  The same goes for many functions
names - they are removed here and re-introduced under a different name, which
makes it very hard to follow.  What ends up in the new file should be a carbon
copy of what was moved.

I'm out of time for today, more comments tomorrow.

Thanks,
Mathieu

> -
>  /**
>   * struct rpmsg_eptdev - endpoint device context
>   * @dev:	endpoint device
> @@ -411,145 +395,6 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	get_device(&ctrldev->dev);
> -	filp->private_data = ctrldev;
> -
> -	return 0;
> -}
> -
> -static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	put_device(&ctrldev->dev);
> -
> -	return 0;
> -}
> -
> -static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> -				unsigned long arg)
> -{
> -	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> -	void __user *argp = (void __user *)arg;
> -	struct rpmsg_endpoint_info eptinfo;
> -	struct rpmsg_channel_info chinfo;
> -
> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> -		return -EINVAL;
> -
> -	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> -		return -EFAULT;
> -
> -	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> -	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
> -	chinfo.src = eptinfo.src;
> -	chinfo.dst = eptinfo.dst;
> -
> -	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
> -};
> -
> -static const struct file_operations rpmsg_ctrldev_fops = {
> -	.owner = THIS_MODULE,
> -	.open = rpmsg_ctrldev_open,
> -	.release = rpmsg_ctrldev_release,
> -	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
> -	.compat_ioctl = compat_ptr_ioctl,
> -};
> -
> -static void rpmsg_ctrldev_release_device(struct device *dev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> -
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> -	kfree(ctrldev);
> -}
> -
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev;
> -	struct device *dev;
> -	int ret;
> -
> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> -	if (!ctrldev)
> -		return -ENOMEM;
> -
> -	ctrldev->rpdev = rpdev;
> -
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -
> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> -	ctrldev->cdev.owner = THIS_MODULE;
> -
> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_ctrldev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -
> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_minor_ida;
> -	dev->id = ret;
> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> -
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> -	if (ret)
> -		goto free_ctrl_ida;
> -
> -	/* We can now rely on the release function for cleanup */
> -	dev->release = rpmsg_ctrldev_release_device;
> -
> -	ret = device_add(dev);
> -	if (ret) {
> -		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> -		put_device(dev);
> -	}
> -
> -	dev_set_drvdata(&rpdev->dev, ctrldev);
> -
> -	return ret;
> -
> -free_ctrl_ida:
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -free_minor_ida:
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_ctrldev:
> -	put_device(dev);
> -	kfree(ctrldev);
> -
> -	return ret;
> -}
> -
> -static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
> -	int ret;
> -
> -	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> -	if (ret)
> -		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> -
> -	device_del(&ctrldev->dev);
> -	put_device(&ctrldev->dev);
> -}
> -
> -static struct rpmsg_driver rpmsg_chrdev_driver = {
> -	.probe = rpmsg_chrdev_probe,
> -	.remove = rpmsg_chrdev_remove,
> -	.drv = {
> -		.name = "rpmsg_chrdev",
> -	},
> -};
> -
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -567,20 +412,12 @@ static int rpmsg_chrdev_init(void)
>  		return PTR_ERR(rpmsg_class);
>  	}
>  
> -	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> -	if (ret < 0) {
> -		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> -		class_destroy(rpmsg_class);
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -	}
> -
>  	return ret;
>  }
>  postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> -	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>  	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> new file mode 100644
> index 000000000000..fa05b67d24da
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, STMicroelectronics
> + * Copyright (c) 2016, Linaro Ltd.
> + * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> + * Copyright (c) 2012, PetaLogix
> + * Copyright (c) 2011, Texas Instruments, Inc.
> + * Copyright (c) 2011, Google, Inc.
> + *
> + * Based on rpmsg performance statistics driver by Michal Simek, which in turn
> + * was based on TI & Google OMX rpmsg driver.
> + */
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/rpmsg.h>
> +
> +#include "rpmsg_char.h"
> +#include "rpmsg_internal.h"
> +
> +#define RPMSG_DEV_MAX	(MINORMASK + 1)
> +
> +static dev_t rpmsg_major;
> +
> +static DEFINE_IDA(rpmsg_ctrl_ida);
> +static DEFINE_IDA(rpmsg_minor_ida);
> +
> +#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrl, dev)
> +#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrl, cdev)
> +
> +/**
> + * struct rpmsg_ctrl - control device for instantiating endpoint devices
> + * @rpdev:	underlaying rpmsg device
> + * @cdev:	cdev for the ctrl device
> + * @dev:	device for the ctrl device
> + */
> +struct rpmsg_ctrl {
> +	struct rpmsg_device *rpdev;
> +	struct cdev cdev;
> +	struct device dev;
> +};
> +
> +static int rpmsg_ctrl_open(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrl *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	get_device(&ctrldev->dev);
> +	filp->private_data = ctrldev;
> +
> +	return 0;
> +}
> +
> +static int rpmsg_ctrl_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrl *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	put_device(&ctrldev->dev);
> +
> +	return 0;
> +}
> +
> +static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +	struct rpmsg_ctrl *ctrldev = fp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct rpmsg_endpoint_info eptinfo;
> +	struct rpmsg_channel_info chinfo;
> +
> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +		return -EFAULT;
> +
> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +	chinfo.src = eptinfo.src;
> +	chinfo.dst = eptinfo.dst;
> +
> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +};
> +
> +static const struct file_operations rpmsg_ctrl_fops = {
> +	.owner = THIS_MODULE,
> +	.open = rpmsg_ctrl_open,
> +	.release = rpmsg_ctrl_release,
> +	.unlocked_ioctl = rpmsg_ctrl_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +};
> +
> +static void rpmsg_ctrl_release_device(struct device *dev)
> +{
> +	struct rpmsg_ctrl *ctrldev = dev_to_ctrldev(dev);
> +
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +	cdev_del(&ctrldev->cdev);
> +	kfree(ctrldev);
> +}
> +
> +static int rpmsg_ctrl_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrl *ctrldev;
> +	struct device *dev;
> +	int ret;
> +
> +	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> +	if (!ctrldev)
> +		return -ENOMEM;
> +
> +	ctrldev->rpdev = rpdev;
> +
> +	dev = &ctrldev->dev;
> +	device_initialize(dev);
> +	dev->parent = &rpdev->dev;
> +
> +	cdev_init(&ctrldev->cdev, &rpmsg_ctrl_fops);
> +	ctrldev->cdev.owner = THIS_MODULE;
> +
> +	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_ctrldev;
> +	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
> +	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_minor_ida;
> +	dev->id = ret;
> +	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> +
> +	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> +	if (ret)
> +		goto free_ctrl_ida;
> +
> +	/* We can now rely on the release function for cleanup */
> +	dev->release = rpmsg_ctrl_release_device;
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> +		put_device(dev);
> +	}
> +
> +	dev_set_drvdata(&rpdev->dev, ctrldev);
> +
> +	return ret;
> +
> +free_ctrl_ida:
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +free_minor_ida:
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +free_ctrldev:
> +	put_device(dev);
> +	kfree(ctrldev);
> +
> +	return ret;
> +}
> +
> +static void rpmsg_ctrl_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrl *ctrldev = dev_get_drvdata(&rpdev->dev);
> +	int ret;
> +
> +	/* Destroy all endpoints */
> +	ret = device_for_each_child(&ctrldev->dev, NULL,
> +				    rpmsg_chrdev_eptdev_destroy);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> +
> +	device_del(&ctrldev->dev);
> +	put_device(&ctrldev->dev);
> +}
> +
> +static struct rpmsg_driver rpmsg_ctrl_driver = {
> +	.probe = rpmsg_ctrl_probe,
> +	.remove = rpmsg_ctrl_remove,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
> +static int rpmsg_ctrl_init(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_ctrl_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +	}
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ctrl_init);
> +
> +static void rpmsg_ctrl_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ctrl_driver);
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +}
> +module_exit(rpmsg_ctrl_exit);
> +
> +MODULE_DESCRIPTION("rpmsg control interface");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
