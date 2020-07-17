Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1102232FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgGQFec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbgGQFeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:34:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165BCC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:34:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so5999347pje.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HSbDalZPjRkwQt5bjdOklQdrZBrmWYBLr8mKrcmfexY=;
        b=Wsi70SRwet6twWATrmfs2iaD0RuSu+hPMJLQadAODAb2oObDnJCvaG2e4PBQ1ko+8T
         zlE4415wVpECNselFJPzVB88TXV3TS3fBOxLPEJoRa9qWD03REQbRiyiliErWfWnvmaK
         0ekqZAIuOwMt46x0NfJSnq1HsWDxY/4oC7R7S2PsVsV5sWL/X8Sf3yuT9LW+xCHHlrVI
         CaCoBg5NddLD2IoCwtrORn00cRJikJsP4PURy/VRU0/PJIhTcNGOdwC/00XEF8Zofvd3
         jiyKwOTE/nPA/jfgwrKnHW81Xe+ZwgckcJC+Izs1d5yWrypRGzsa2UvYvl32r/iAGk5M
         /KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HSbDalZPjRkwQt5bjdOklQdrZBrmWYBLr8mKrcmfexY=;
        b=jafpj/5aYi6m1g0+yaJb4PTAljoOTtgyW6g0H5cOz9lTcQQ4cRq9bgS/A4J56BQ2ow
         hYve6n3t9uqbhMoltb4EPqFQoPOlyWW1QwGg677RW+suZdkZDGK1Zp7SsVxh8ABKuz8e
         o3bHu0r4aClt1lpfopPlcdhmiLgngHCyV6cVzuH6bEdQLTdTTgX9gfDi3Z4Pze1baIBf
         BpjYIYQLhLwXeigpR6mOLQLdwPLhPfqhGGQNiVRmi9rSpLWv9bQ0PWA7OFYjaKJR4KGc
         haC4PcMPAo45DTu8UhDWKA1kpv250jtx5FNR7fYyQw2iWdEGWbtp6PSegYAtmnkfT3jz
         /mVw==
X-Gm-Message-State: AOAM5339sDHwXopWHnaKP42ecpyjck/A1dsdTxnKC4h/DQ4to0L0Nyy/
        QmczBBwkoE8M4LbpF5EzxgSDrg==
X-Google-Smtp-Source: ABdhPJyWf0T2j4RZw72Fjjk12y1fgf62AurFJCb/HW1FnOf6N3QHTHV5OOGp+N+elL+tqN/ZFLxn+A==
X-Received: by 2002:a17:902:c24a:: with SMTP id 10mr6674911plg.82.1594964070288;
        Thu, 16 Jul 2020 22:34:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r25sm2174951pgv.88.2020.07.16.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:34:29 -0700 (PDT)
Date:   Thu, 16 Jul 2020 22:32:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, corbet@lwn.net,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200717053227.GH2922385@builder.lan>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jul 12:07 PDT 2020, Siddharth Gupta wrote:

> Add the character device interface into remoteproc framework.
> This interface can be used in order to boot/shutdown remote
> subsystems and provides a basic ioctl based interface to implement
> supplementary functionality. An ioctl call is implemented to enable
> the shutdown on release feature which will allow remote processors to
> be shutdown when the controlling userpsace application crashes or hangs.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  drivers/remoteproc/Kconfig                         |   9 ++
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/remoteproc_cdev.c               | 146 +++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h           |  28 ++++
>  include/linux/remoteproc.h                         |   5 +
>  include/uapi/linux/remoteproc_cdev.h               |  37 ++++++
>  7 files changed, 227 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_cdev.c
>  create mode 100644 include/uapi/linux/remoteproc_cdev.h
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 59472cd..2a19883 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -339,6 +339,7 @@ Code  Seq#    Include File                                           Comments
>  0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
>  0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
>  0xB6  all    linux/fpga-dfl.h
> +0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
>  0xC0  00-0F  linux/usb/iowarrior.h
>  0xCA  00-0F  uapi/misc/cxl.h
>  0xCA  10-2F  uapi/misc/ocxl.h
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c4d1731..652060f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -14,6 +14,15 @@ config REMOTEPROC
>  
>  if REMOTEPROC
>  
> +config REMOTEPROC_CDEV
> +	bool "Remoteproc character device interface"
> +	help
> +	  Say y here to have a character device interface for the remoteproc
> +	  framework. Userspace can boot/shutdown remote processors through
> +	  this interface.
> +
> +	  It's safe to say N if you don't want to use this interface.
> +
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
>  	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index e8b886e..311ae3f 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
>  remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> new file mode 100644
> index 0000000..8a0eb47
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Character device interface driver for Remoteproc framework.
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/compat.h>
> +#include <linux/remoteproc.h>
> +#include <linux/uaccess.h>
> +#include <uapi/linux/remoteproc_cdev.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define NUM_RPROC_DEVICES	64
> +static dev_t rproc_major;
> +
> +static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_t len, loff_t *pos)
> +{
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, char_dev);
> +	int ret = 0;
> +	char cmd[10];
> +
> +	if (!len || len > sizeof(cmd))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(cmd, buf, sizeof(cmd));

I believe you should copy "len" bytes here, instead of 10.

> +	if (ret)
> +		return -EFAULT;
> +
> +	if (sysfs_streq(cmd, "start")) {
> +		if (rproc->state == RPROC_RUNNING)
> +			return -EBUSY;
> +
> +		ret = rproc_boot(rproc);
> +		if (ret)
> +			dev_err(&rproc->dev, "Boot failed:%d\n", ret);

rproc_boot() of a child thereof has already told us why the boot failed,
so please omit this print.

> +	} else if (sysfs_streq(cmd, "stop")) {
> +		if (rproc->state != RPROC_RUNNING)
> +			return -EINVAL;
> +
> +		rproc_shutdown(rproc);
> +	} else {
> +		dev_err(&rproc->dev, "Unrecognized option\n");
> +		ret = -EINVAL;
> +	}
> +
> +	return ret ? ret : len;
> +}
> +
> +static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> +{
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, char_dev);
> +	void __user *argp = compat_ptr(arg);
> +	int ret;
> +	int32_t param;
> +
> +	switch (ioctl) {
> +	case RPROC_SET_SHUTDOWN_ON_RELEASE:
> +		ret = copy_from_user(&param, argp, sizeof(int32_t));
> +		if (ret) {
> +			dev_err(&rproc->dev, "Data copy from userspace failed\n");

Please skip the error message and just return EFAULT.

> +			return -EFAULT;
> +		}
> +		mutex_lock(&rproc->lock);

I don't see the reason for protecting this assignment. It can only race
with other assignments and given that it's a native type it will have
the last value written regardless.

> +		rproc->cdev_put_on_release = param ? true : false;

The idiomatic way to "normalize" a bool is foo = !!param;

> +		mutex_unlock(&rproc->lock);
> +		break;
> +	case RPROC_GET_SHUTDOWN_ON_RELEASE:
> +		mutex_lock(&rproc->lock);

As above, I don't see that cdev_put_on_release will have an half-baked
value, so should be fine to omit the locking here.

> +		ret = copy_to_user(argp, &rproc->cdev_put_on_release, sizeof(bool));

The documentation says that this is a signed 32-bit thing. So please do
sizeof(something-obviously-32-bits), e.g. sizeof(int32_t) as above.

> +		mutex_unlock(&rproc->lock);
> +		if (ret) {
> +			dev_err(&rproc->dev, "Data copy to userspace failed\n");

As above, please don't print an error here, just return -EFAULT.

> +			return -EFAULT;
> +		}
> +		break;
> +	default:
> +		dev_err(&rproc->dev, "Unsupported ioctl\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rproc_cdev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> +	bool release;
> +
> +	mutex_lock(&rproc->lock);

It's not possible to race with the ioctl, as this function is called as
the last open file descriptor is closed. So you can omit the lock here
as well and just check cdev_put_on_release in the conditional, without a
local variable.

Regards,
Bjorn

> +	release = rproc->cdev_put_on_release;
> +	mutex_unlock(&rproc->lock);
> +
> +	if (release && rproc->state == RPROC_RUNNING)
> +		rproc_shutdown(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations rproc_fops = {
> +	.write = rproc_cdev_write,
> +	.compat_ioctl = rproc_device_ioctl,
> +	.release = rproc_cdev_release,
> +};
> +
> +int rproc_char_device_add(struct rproc *rproc)
> +{
> +	int ret;
> +	dev_t cdevt;
> +
> +	cdev_init(&rproc->char_dev, &rproc_fops);
> +	rproc->char_dev.owner = THIS_MODULE;
> +
> +	cdevt = MKDEV(rproc_major, rproc->index);
> +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	rproc->dev.devt = cdevt;
> +out:
> +	return ret;
> +}
> +
> +void rproc_char_device_remove(struct rproc *rproc)
> +{
> +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
> +}
> +
> +void __init rproc_init_cdev(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
> +	if (ret < 0)
> +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> +}
> +
> +void __exit rproc_exit_cdev(void)
> +{
> +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
> +}
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 4ba7cb5..f091ddc 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -47,6 +47,34 @@ extern struct class rproc_class;
>  int rproc_init_sysfs(void);
>  void rproc_exit_sysfs(void);
>  
> +#ifdef CONFIG_REMOTEPROC_CDEV
> +void rproc_init_cdev(void);
> +void rproc_exit_cdev(void);
> +int rproc_char_device_add(struct rproc *rproc);
> +void rproc_char_device_remove(struct rproc *rproc);
> +#else
> +static inline void rproc_init_cdev(void)
> +{
> +}
> +
> +static inline void rproc_exit_cdev(void)
> +{
> +}
> +
> +/*
> + * The character device interface is an optional feature, if it is not enabled
> + * the function should not return an error.
> + */
> +static inline int rproc_char_device_add(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +
> +static inline void  rproc_char_device_remove(struct rproc *rproc)
> +{
> +}
> +#endif
> +
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e7b7bab..669cbfb 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -40,6 +40,7 @@
>  #include <linux/virtio.h>
>  #include <linux/completion.h>
>  #include <linux/idr.h>
> +#include <linux/cdev.h>
>  #include <linux/of.h>
>  
>  /**
> @@ -488,6 +489,8 @@ struct rproc_dump_segment {
>   * @auto_boot: flag to indicate if remote processor should be auto-started
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @char_dev: character device of the rproc
> + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -523,6 +526,8 @@ struct rproc {
>  	int nb_vdev;
>  	u8 elf_class;
>  	u16 elf_machine;
> +	struct cdev char_dev;
> +	bool cdev_put_on_release;
>  };
>  
>  /**
> diff --git a/include/uapi/linux/remoteproc_cdev.h b/include/uapi/linux/remoteproc_cdev.h
> new file mode 100644
> index 0000000..c43768e
> --- /dev/null
> +++ b/include/uapi/linux/remoteproc_cdev.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * IOCTLs for Remoteproc's character device interface.
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _UAPI_REMOTEPROC_CDEV_H_
> +#define _UAPI_REMOTEPROC_CDEV_H_
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define RPROC_MAGIC	0xB7
> +
> +/*
> + * The RPROC_SET_SHUTDOWN_ON_RELEASE ioctl allows to enable/disable the shutdown of a remote
> + * processor automatically when the controlling userpsace closes the char device interface.
> + *
> + * input parameter: integer
> + *   0		: disable automatic shutdown
> + *   other	: enable automatic shutdown
> + */
> +#define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, __s32)
> +
> +/*
> + * The RPROC_GET_SHUTDOWN_ON_RELEASE ioctl gets information about whether the automatic shutdown of
> + * a remote processor is enabled or disabled when the controlling userspace closes the char device
> + * interface.
> + *
> + * output parameter: integer
> + *   0		: automatic shutdown disable
> + *   other	: automatic shutdown enable
> + */
> +#define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, __s32)
> +
> +#endif
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
