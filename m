Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0125132B2F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242587AbhCCBQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347486AbhCBSHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 13:07:05 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73095C061221
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 09:57:05 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k22so12466288pll.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 09:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XZv1luet9j7TnZYm7Gox6kRSD9fWpPc1LUY0U6nOa5s=;
        b=Y+h9s4snrD/QHKXvqv+wG3eyoISyFrn0nHCU03dBFCu4kWrSxrqR+GKZ5JfysTORMG
         MH8rvIDadTd/v5GVH1qTkG4L6F+NL6UXnSe0HkQhGGIlf+OzX9FUUKpZ4u583YvETHZi
         DhYOTLffSolLB90COxzoR36lseOVvxRRXC7Y5X07q7tOrIorLcxOK9lmGNfsU4cvpgi8
         gSd+/C9V1atQernhfZgMrtKUAEJY5IUnFbolqEoyo6Yuh4BC77TEdptTze/jyLB4oqbe
         Tj+J7zuo1PHekHvyxyUD9SVE6bOyVjrEGqCt/XbbSMbHqDCyrex4VFcZ2wQJ+MWlXWNQ
         meLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XZv1luet9j7TnZYm7Gox6kRSD9fWpPc1LUY0U6nOa5s=;
        b=sYmcIEyntiYc2kBmrpH87k1nri1oSehjxf6MYfG/c09jlt7P+5pKUx9OJkQgt/BDbe
         btxLKKfM+l+HZE1SkUAGjbYgiPAlN/GOSZBx361Oo043Kth+JVtrap3LQINvgH1XLkhb
         NollUbdhQS01MzczcAfvUocLgpKe/jcL4ugHsp26GjDxwsRTMLfbcVbD9lsuu7+8iAvH
         gwLXEVv8srjDc9L/xpPOK/ecBRdVuMsx+nKpCdPOgZHL1F4joqmneiYEOeGr27+0k0cL
         C9HmzhljnYhfgU6l1FwNVZ7HhIyuOdZMIA0JUNsLL5iuHMb03ScH2cm7X0sXh1CKpoKT
         2UEw==
X-Gm-Message-State: AOAM532uEA4I96udK7+eb3TeDx6hIF8os5ga90jTGy72LyuBl4o3a70a
        grOcujL0DyOMX5nzaj0D8JxFdg==
X-Google-Smtp-Source: ABdhPJzhE3kmzqmnRAdBHhvi8PKjBDxeIyYMxd8MW1Xbh5UIAuhxNlntYswLfIUB9Ai5UTENrKKy6Q==
X-Received: by 2002:a17:902:ff0d:b029:e4:a497:fdad with SMTP id f13-20020a170902ff0db02900e4a497fdadmr12476777plj.33.1614707824846;
        Tue, 02 Mar 2021 09:57:04 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u2sm3277561pjy.14.2021.03.02.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:57:04 -0800 (PST)
Date:   Tue, 2 Mar 2021 10:57:02 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 04/16] rpmsg: char: export eptdev create an destroy
 functions
Message-ID: <20210302175702.GA3791957@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Good morning,

I have started to review this set - comments will be staggered over several
days.

On Fri, Feb 19, 2021 at 12:14:49PM +0100, Arnaud Pouliquen wrote:
> To prepare the split code related to the control and the endpoint
> devices in separate files:
> - suppress the dependency with the rpmsg_ctrldev struct,
> - rename and export the functions in rpmsg_char.h.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 22 ++++++++++------
>  drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 9e33b53bbf56..78a6d19fdf82 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (C) 2021, STMicroelectronics
>   * Copyright (c) 2016, Linaro Ltd.
>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>   * Copyright (c) 2012, PetaLogix
> @@ -22,6 +23,7 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> +#include "rpmsg_char.h"
>  #include "rpmsg_internal.h"
>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
>  	wait_queue_head_t readq;
>  };
>  
> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> +static int rpmsg_eptdev_destroy(struct device *dev)
>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
> @@ -277,7 +279,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return rpmsg_eptdev_destroy(&eptdev->dev);
>  }
>  
>  static const struct file_operations rpmsg_eptdev_fops = {
> @@ -336,10 +338,15 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> +{
> +	return rpmsg_eptdev_destroy(dev);
> +}
> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);

Below we have rpmsg_chrdev_create_eptdev() so it would make sense to have
rpmsg_chrdev_destroy_ept().

I would also rename rpmsg_eptdev_destroy() to rpmsg_chrdev_destroy_ept() and
export that symbol rather than introducing a function that only calls another
one.  You did exactly that for rpmsg_chrdev_create_eptdev().

> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo)
>  {
> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
>  	int ret;
> @@ -359,7 +366,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	device_initialize(dev);
>  	dev->class = rpmsg_class;
> -	dev->parent = &ctrldev->dev;
> +	dev->parent = parent;
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
> @@ -402,6 +409,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>  {
> @@ -441,7 +449,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);

Not sure why we have to change the signature of rpmsg_eptdev_create() but I may
find an answer to that question later on in the patchset.

>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -527,7 +535,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  	int ret;
>  
>  	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>  	if (ret)
>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>  
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> new file mode 100644
> index 000000000000..0feb3ea9445c
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +#if IS_ENABLED(CONFIG_RPMSG_CHAR)
> +/**
> + * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: assiated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo);
> +
> +/**
> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device
> + * @data: parent device
> + * @chinfo: assiated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> +
> +#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +					     struct device *parent,
> +					     struct rpmsg_channel_info chinfo)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> +
> +#endif /*__RPMSG_CHRDEV_H__ */
> -- 
> 2.17.1
> 
