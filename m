Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6469E223310
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgGQFsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQFsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:48:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74879C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:48:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ls15so6008900pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n8Xxg3dsBjdk6b1G5xwKGporxaXgIKuThyNu+dzYqvA=;
        b=HWEQNFzZSPersptebttLx0EGPVx+fielGMAC76sA1CwOuad9O0VYClSB9pP4fu8YMQ
         Tfp+pni8/kMZeqUtNOCIjujP63xhCdaM43h5Emz14JTn8a/RrxtYN1OAssNxvapNiXtB
         D1vjcErOCv5H6h23/aDHFBsItvO43AMD649eY8f3FqtPOoR2kBzEOlhL3i6uoX0LCNqv
         ebo/lSwIWxbhtYp7smocDPjgeghy33rYWHlriX5hf8SwPhtqetcT2theb5kjE5/5pZiy
         WQkmKSxsVE1laTzOxWohDfbdXxbx7QQBmFHuu9JLrc3fc2fO5CsFeup5cFI9DsmnFDPd
         qO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n8Xxg3dsBjdk6b1G5xwKGporxaXgIKuThyNu+dzYqvA=;
        b=bpL366P2jOnb5PpedqItA1eJzTsRgOBC1CMK/L76CIupmLanUAMXBkP2emDYMMpo0Y
         Sta3sJFCsgDbbvYn0LADwLQoHlqj4r32EWuF84ROFLhkmbCjCceShfQZ4cfzuUn8cOaE
         fSlUplbi4Evq7dZg3ppRh4CYUXrKuqXw3Nk4pfRxppZ7VQqwBtkKN6PdIgGp4K8fvJcA
         MWpJGwaqpWl22vdUSrtnz9zg26i//WNtzzzG/bF2q2fcw/dvwKxEp95C+DnoEhXvuGeq
         DDfNsRCVw0IP/l8DheOy44wQhJ2hPqzJahdQxbverKoYmBGrce5Gi8rbVZzXpqIefkiQ
         MuWg==
X-Gm-Message-State: AOAM5325/wwFIU4r4cbXkeQTm9R2gjKJSs1jtWPkYnzAjEKo4fP0T7c8
        h2tKQjW2o5C65G1Q8YwhJJNz2Q==
X-Google-Smtp-Source: ABdhPJyFftyepTbLpsBB5ZebX4+oV8yv+cbJ0J6VkB8QjdS6T5mEGGyc2NzC0eHKOFJ5wzoWzS7cBw==
X-Received: by 2002:a17:902:a609:: with SMTP id u9mr6573981plq.5.1594964898411;
        Thu, 16 Jul 2020 22:48:18 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m16sm6585616pfd.101.2020.07.16.22.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:48:17 -0700 (PDT)
Date:   Thu, 16 Jul 2020 22:46:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, agross@kernel.org,
        ohad@wizery.com, corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200717054615.GI2922385@builder.lan>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
 <20200715201839.GA3204081@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715201839.GA3204081@xps15>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Jul 13:18 PDT 2020, Mathieu Poirier wrote:

> On Tue, Jul 07, 2020 at 12:07:49PM -0700, Siddharth Gupta wrote:
> > Add the character device interface into remoteproc framework.
> > This interface can be used in order to boot/shutdown remote
> > subsystems and provides a basic ioctl based interface to implement
> > supplementary functionality. An ioctl call is implemented to enable
> > the shutdown on release feature which will allow remote processors to
> > be shutdown when the controlling userpsace application crashes or hangs.
> > 
> > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > ---
> >  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >  drivers/remoteproc/Kconfig                         |   9 ++
> >  drivers/remoteproc/Makefile                        |   1 +
> >  drivers/remoteproc/remoteproc_cdev.c               | 146 +++++++++++++++++++++
> >  drivers/remoteproc/remoteproc_internal.h           |  28 ++++
> >  include/linux/remoteproc.h                         |   5 +
> >  include/uapi/linux/remoteproc_cdev.h               |  37 ++++++
> >  7 files changed, 227 insertions(+)
> >  create mode 100644 drivers/remoteproc/remoteproc_cdev.c
> >  create mode 100644 include/uapi/linux/remoteproc_cdev.h
> > 
> > diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > index 59472cd..2a19883 100644
> > --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> > +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > @@ -339,6 +339,7 @@ Code  Seq#    Include File                                           Comments
> >  0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
> >  0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
> >  0xB6  all    linux/fpga-dfl.h
> > +0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
> >  0xC0  00-0F  linux/usb/iowarrior.h
> >  0xCA  00-0F  uapi/misc/cxl.h
> >  0xCA  10-2F  uapi/misc/ocxl.h
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c4d1731..652060f 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -14,6 +14,15 @@ config REMOTEPROC
> >  
> >  if REMOTEPROC
> >  
> > +config REMOTEPROC_CDEV
> > +	bool "Remoteproc character device interface"
> > +	help
> > +	  Say y here to have a character device interface for the remoteproc
> > +	  framework. Userspace can boot/shutdown remote processors through
> > +	  this interface.
> > +
> > +	  It's safe to say N if you don't want to use this interface.
> > +
> >  config IMX_REMOTEPROC
> >  	tristate "IMX6/7 remoteproc support"
> >  	depends on ARCH_MXC
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index e8b886e..311ae3f 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
> >  remoteproc-y				+= remoteproc_sysfs.o
> >  remoteproc-y				+= remoteproc_virtio.o
> >  remoteproc-y				+= remoteproc_elf_loader.o
> > +obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> >  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
> >  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> >  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> > new file mode 100644
> > index 0000000..8a0eb47
> > --- /dev/null
> > +++ b/drivers/remoteproc/remoteproc_cdev.c
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Character device interface driver for Remoteproc framework.
> > + *
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/cdev.h>
> > +#include <linux/fs.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/compat.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/uaccess.h>
> > +#include <uapi/linux/remoteproc_cdev.h>
> 
> Alphabetical order please.
> 
> > +
> > +#include "remoteproc_internal.h"
> > +
> > +#define NUM_RPROC_DEVICES	64
> > +static dev_t rproc_major;
> > +
> > +static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_t len, loff_t *pos)
> > +{
> > +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, char_dev);
> > +	int ret = 0;
> > +	char cmd[10];
> > +
> > +	if (!len || len > sizeof(cmd))
> > +		return -EINVAL;
> > +
> > +	ret = copy_from_user(cmd, buf, sizeof(cmd));
> > +	if (ret)
> > +		return -EFAULT;
> > +
> > +	if (sysfs_streq(cmd, "start")) {
> > +		if (rproc->state == RPROC_RUNNING)
> > +			return -EBUSY;
> > +
> > +		ret = rproc_boot(rproc);
> > +		if (ret)
> > +			dev_err(&rproc->dev, "Boot failed:%d\n", ret);
> > +	} else if (sysfs_streq(cmd, "stop")) {
> > +		if (rproc->state != RPROC_RUNNING)
> > +			return -EINVAL;
> > +
> > +		rproc_shutdown(rproc);
> > +	} else {
> > +		dev_err(&rproc->dev, "Unrecognized option\n");
> > +		ret = -EINVAL;
> > +	}
> > +
> > +	return ret ? ret : len;
> > +}
> > +
> > +static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> > +{
> > +	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, char_dev);
> > +	void __user *argp = compat_ptr(arg);
> > +	int ret;
> > +	int32_t param;
> > +
> > +	switch (ioctl) {
> > +	case RPROC_SET_SHUTDOWN_ON_RELEASE:
> > +		ret = copy_from_user(&param, argp, sizeof(int32_t));
> > +		if (ret) {
> > +			dev_err(&rproc->dev, "Data copy from userspace failed\n");
> > +			return -EFAULT;
> > +		}
> > +		mutex_lock(&rproc->lock);
> > +		rproc->cdev_put_on_release = param ? true : false;
> > +		mutex_unlock(&rproc->lock);
> > +		break;
> > +	case RPROC_GET_SHUTDOWN_ON_RELEASE:
> > +		mutex_lock(&rproc->lock);
> > +		ret = copy_to_user(argp, &rproc->cdev_put_on_release, sizeof(bool));
> > +		mutex_unlock(&rproc->lock);
> > +		if (ret) {
> > +			dev_err(&rproc->dev, "Data copy to userspace failed\n");
> > +			return -EFAULT;
> > +		}
> > +		break;
> > +	default:
> > +		dev_err(&rproc->dev, "Unsupported ioctl\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rproc_cdev_release(struct inode *inode, struct file *filp)
> > +{
> > +	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> > +	bool release;
> > +
> > +	mutex_lock(&rproc->lock);
> > +	release = rproc->cdev_put_on_release;
> > +	mutex_unlock(&rproc->lock);
> > +
> > +	if (release && rproc->state == RPROC_RUNNING)
> 
> I think the state of the processor should also be acquired when the lock is
> held.  There is still a chance ->state can change between the time the lock is
> released and rproc_shutdown() is called but that's a known problem for which
> patches have been sent out.
> 

There where patches for a similar bug in the debugfs interface, but I'm
not able to find anything for rproc_shutdown().


As I suggested in the previous version of this series I think it's ok
that we move forward with replicating the same faulty logic that we have
in the sysfs interface and then fix rproc_shutdown() so that it
internally checks the current state and return appropriately.

Regards,
Bjorn

> > +		rproc_shutdown(rproc);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct file_operations rproc_fops = {
> > +	.write = rproc_cdev_write,
> > +	.compat_ioctl = rproc_device_ioctl,
> > +	.release = rproc_cdev_release,
> > +};
> > +
> > +int rproc_char_device_add(struct rproc *rproc)
> > +{
> > +	int ret;
> > +	dev_t cdevt;
> > +
> > +	cdev_init(&rproc->char_dev, &rproc_fops);
> > +	rproc->char_dev.owner = THIS_MODULE;
> > +
> > +	cdevt = MKDEV(rproc_major, rproc->index);
> > +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	rproc->dev.devt = cdevt;
> > +out:
> > +	return ret;
> > +}
> > +
> > +void rproc_char_device_remove(struct rproc *rproc)
> > +{
> > +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
> > +}
> > +
> > +void __init rproc_init_cdev(void)
> > +{
> > +	int ret;
> > +
> > +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
> > +	if (ret < 0)
> > +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> > +}
> > +
> > +void __exit rproc_exit_cdev(void)
> > +{
> > +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
> 
> Please go back to the comment I made on this during my last review and respin.
> 
> > +}
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 4ba7cb5..f091ddc 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -47,6 +47,34 @@ extern struct class rproc_class;
> >  int rproc_init_sysfs(void);
> >  void rproc_exit_sysfs(void);
> >  
> > +#ifdef CONFIG_REMOTEPROC_CDEV
> > +void rproc_init_cdev(void);
> > +void rproc_exit_cdev(void);
> > +int rproc_char_device_add(struct rproc *rproc);
> > +void rproc_char_device_remove(struct rproc *rproc);
> > +#else
> > +static inline void rproc_init_cdev(void)
> > +{
> > +}
> > +
> > +static inline void rproc_exit_cdev(void)
> > +{
> > +}
> > +
> > +/*
> > + * The character device interface is an optional feature, if it is not enabled
> > + * the function should not return an error.
> > + */
> > +static inline int rproc_char_device_add(struct rproc *rproc)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline void  rproc_char_device_remove(struct rproc *rproc)
> > +{
> > +}
> > +#endif
> > +
> >  void rproc_free_vring(struct rproc_vring *rvring);
> >  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> >  
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index e7b7bab..669cbfb 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -40,6 +40,7 @@
> >  #include <linux/virtio.h>
> >  #include <linux/completion.h>
> >  #include <linux/idr.h>
> > +#include <linux/cdev.h>
> 
> Move this above completion.h
> 
> With all of the above modifications:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> >  #include <linux/of.h>
> >  
> >  /**
> > @@ -488,6 +489,8 @@ struct rproc_dump_segment {
> >   * @auto_boot: flag to indicate if remote processor should be auto-started
> >   * @dump_segments: list of segments in the firmware
> >   * @nb_vdev: number of vdev currently handled by rproc
> > + * @char_dev: character device of the rproc
> > + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> >   */
> >  struct rproc {
> >  	struct list_head node;
> > @@ -523,6 +526,8 @@ struct rproc {
> >  	int nb_vdev;
> >  	u8 elf_class;
> >  	u16 elf_machine;
> > +	struct cdev char_dev;
> > +	bool cdev_put_on_release;
> >  };
> >  
> >  /**
> > diff --git a/include/uapi/linux/remoteproc_cdev.h b/include/uapi/linux/remoteproc_cdev.h
> > new file mode 100644
> > index 0000000..c43768e
> > --- /dev/null
> > +++ b/include/uapi/linux/remoteproc_cdev.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * IOCTLs for Remoteproc's character device interface.
> > + *
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#ifndef _UAPI_REMOTEPROC_CDEV_H_
> > +#define _UAPI_REMOTEPROC_CDEV_H_
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/types.h>
> > +
> > +#define RPROC_MAGIC	0xB7
> > +
> > +/*
> > + * The RPROC_SET_SHUTDOWN_ON_RELEASE ioctl allows to enable/disable the shutdown of a remote
> > + * processor automatically when the controlling userpsace closes the char device interface.
> > + *
> > + * input parameter: integer
> > + *   0		: disable automatic shutdown
> > + *   other	: enable automatic shutdown
> > + */
> > +#define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, __s32)
> > +
> > +/*
> > + * The RPROC_GET_SHUTDOWN_ON_RELEASE ioctl gets information about whether the automatic shutdown of
> > + * a remote processor is enabled or disabled when the controlling userspace closes the char device
> > + * interface.
> > + *
> > + * output parameter: integer
> > + *   0		: automatic shutdown disable
> > + *   other	: automatic shutdown enable
> > + */
> > +#define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, __s32)
> > +
> > +#endif
> > -- 
> > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
