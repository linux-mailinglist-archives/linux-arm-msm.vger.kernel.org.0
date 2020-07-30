Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A02233756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 19:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbgG3RGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 13:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbgG3RGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 13:06:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11B2C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 10:06:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id r4so4086302pls.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NRP/i8E9iVttma2V99oDfwGdycz8JLnBq+XIiaxP304=;
        b=gHpJtYbMstELobOebm6WEYKPBlbjz0m5EBPYy6OxXNyWw8938kEPc2MFnOHI/il9yp
         U9PmI77GeeBcEoNddh/Dw4nXDsimdRtDbM/hFQjX/IxQrGmel/yiavkqkHRe6DHs+DI/
         solHrfJoNk6fn1U+DnCzlmpVYg+gwzbjyQQjJOyKOBmnwOxEbB6g3iomkTGLEnR0GkeK
         HGjkxPc+LJz5+dayFzh6OhPSjNNx/Tj9wdNj0b7CjUOcjKzUX2V8AEYCijO2Ue8p8qK3
         xcNbpLjiIH8tc3f1LbS0dkqLQqlt+pl7HuE98+rnkiUyCCSy7p+OcRkhMLvImjyQjXvl
         dGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRP/i8E9iVttma2V99oDfwGdycz8JLnBq+XIiaxP304=;
        b=FdGA3HQ+upaLTV9XBGt3MC1ycN9cKJdV0pk5eS7CtMu81tDzgemsDantfsFUwX2fWY
         NFBSC+eDe0yl1EXq3qw5WBb7whxykqbN3ZCfNzMATiQardOyETHIimrtGK4Sjjdx6i3F
         ybpOzsPxfox0UqgWYz0oYA3+ih44Gcr6097xXMWgWmu/pJ3LGtdaApb0zxfY/wxGBYeW
         rxBGlRYhecki9DshRhseiRVGeJZE3Vl+ew/B/WX/tj509ePURN1DCdf2/oi/YgirAQVG
         70GmsHHfI5QoVbCccBgyPJWuM7I0w6pMYfCnH1WhsQyM7hLwDR+lAXEGsM5QpntlkOje
         7x7w==
X-Gm-Message-State: AOAM530PRaRDqoSVRLbEZ4KSh/BRmbKGYORxf+PcYJ72k2rMdQx95VdN
        H9vmREAZS4EHhI+DAkv8jxnvgw==
X-Google-Smtp-Source: ABdhPJznxRTTWWHTwuFGNnV8U/O+ShvfB4PcjVcLsQ2a1oFVrIfCmPgrY06x9/vND9Lx3qcHXWbYrg==
X-Received: by 2002:a63:7e55:: with SMTP id o21mr8131125pgn.5.1596128791943;
        Thu, 30 Jul 2020 10:06:31 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c27sm6508647pfj.163.2020.07.30.10.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:06:31 -0700 (PDT)
Date:   Thu, 30 Jul 2020 11:06:28 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200730170628.GA3155400@xps15>
References: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
 <1596044401-22083-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596044401-22083-2-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 10:40:00AM -0700, Siddharth Gupta wrote:
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  drivers/remoteproc/Kconfig                         |   9 ++
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/remoteproc_cdev.c               | 124 +++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h           |  28 +++++
>  include/linux/remoteproc.h                         |   5 +
>  include/uapi/linux/remoteproc_cdev.h               |  37 ++++++
>  7 files changed, 205 insertions(+)
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
> index 48315dc..c6659dfe 100644
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
> index 4d4307d..3dfa28e 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -10,6 +10,7 @@ remoteproc-y				+= remoteproc_debugfs.o
>  remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> new file mode 100644
> index 0000000..a7ac11c
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Character device interface driver for Remoteproc framework.
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/compat.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
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
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, cdev);
> +	int ret = 0;
> +	char cmd[10];
> +
> +	if (!len || len > sizeof(cmd))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(cmd, buf, len);
> +	if (ret)
> +		return -EFAULT;
> +
> +	if (!strncmp(cmd, "start", len)) {
> +		if (rproc->state == RPROC_RUNNING)
> +			return -EBUSY;
> +
> +		ret = rproc_boot(rproc);
> +	} else if (!strncmp(cmd, "stop", len)) {
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
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, cdev);
> +	void __user *argp = (void __user *)arg;
> +	int32_t param;
> +
> +	switch (ioctl) {
> +	case RPROC_SET_SHUTDOWN_ON_RELEASE:
> +		if (copy_from_user(&param, argp, sizeof(int32_t)))
> +			return -EFAULT;
> +
> +		rproc->cdev_put_on_release = !!param;
> +		break;
> +	case RPROC_GET_SHUTDOWN_ON_RELEASE:
> +		param = (int32_t)rproc->cdev_put_on_release;
> +		if (copy_to_user(argp, &param, sizeof(int32_t)))
> +			return -EFAULT;
> +
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
> +	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
> +
> +	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> +		rproc_shutdown(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations rproc_fops = {
> +	.write = rproc_cdev_write,
> +	.unlocked_ioctl = rproc_device_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +	.release = rproc_cdev_release,
> +};
> +
> +int rproc_char_device_add(struct rproc *rproc)
> +{
> +	int ret;
> +
> +	cdev_init(&rproc->cdev, &rproc_fops);
> +	rproc->cdev.owner = THIS_MODULE;
> +
> +	rproc->dev.devt = MKDEV(MAJOR(rproc_major), rproc->index);
> +	cdev_set_parent(&rproc->cdev, &rproc->dev.kobj);
> +	ret = cdev_add(&rproc->cdev, rproc->dev.devt, 1);
> +	if (ret < 0)
> +		dev_err(&rproc->dev, "Failed to add char dev for %s\n", rproc->name);
> +
> +	return ret;
> +}
> +
> +void rproc_char_device_remove(struct rproc *rproc)
> +{
> +	__unregister_chrdev(MAJOR(rproc->dev.devt), rproc->index, 1, "remoteproc");
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
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index cd4176b..c340028 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -53,6 +53,34 @@ void rproc_exit_sysfs(void);
>  void rproc_coredump_cleanup(struct rproc *rproc);
>  void rproc_coredump(struct rproc *rproc);
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
> index 0e8d2ff..2fa68bf 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -38,6 +38,7 @@
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  #include <linux/virtio.h>
> +#include <linux/cdev.h>
>  #include <linux/completion.h>
>  #include <linux/idr.h>
>  #include <linux/of.h>
> @@ -509,6 +510,8 @@ struct rproc_dump_segment {
>   * @autonomous: true if an external entity has booted the remote processor
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @char_dev: character device of the rproc
> + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -546,6 +549,8 @@ struct rproc {
>  	int nb_vdev;
>  	u8 elf_class;
>  	u16 elf_machine;
> +	struct cdev cdev;
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
