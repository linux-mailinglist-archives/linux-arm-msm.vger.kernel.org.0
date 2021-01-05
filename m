Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FC32EA19C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 01:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbhAEAsk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 19:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbhAEAsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 19:48:39 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C51C061798
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 16:47:41 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a109so27847905otc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 16:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xG9WgPgtXl4muZ5pfGY83Ze5M/V/IXRnJ0myAHjR2Y=;
        b=IuJPd0dAkxTO1lWK4TF9V8AFKVnyUB+ihER0PjRAMXfARI3aPpAQzWGfgOBEY6io6u
         YxbCKcdrQ2g+xWRsWu9n40uE88TCcL92VESuO352htZsGo9AZTAaDIu5yV29L45OMCj+
         sxRMvPXbsHPAYB3xQAZ3SBn+M77rLneFAkhwNjEj3f8i/eWstOK7oAZfeEQ3xH9fGe/P
         aZ1fFxTckvQnCbtJ9FHM7MuN+F8QPX0tVbalX7GPYgIwDulOFYiP2myazVy9h/2fchkx
         SIzwU+Bedf+8RTMon6xn1shsT02RCMPficHoHcW1JGeuZM/joj4wOmF1b3P2YIX7c1TX
         jn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xG9WgPgtXl4muZ5pfGY83Ze5M/V/IXRnJ0myAHjR2Y=;
        b=S0W7Re0zFxKqYoIQIQ4efKqmA7ixad2Pj/nauK8VTrejZE7OArcVpe9BIBTeORSI8v
         ZIRlw7gAbk06dogiGXC1WpViWx0bDBHlmrCYBHaR+rvJKwsOXYOefJNI39EEPFtNmm7G
         Sy612kHh5ar3YDciVSf1Fwc05UyAzlQAYjbwLmA+gtAxKnEqxN+daQKrbtedS9awbZrQ
         /dQh4HKpl0QoHveG5Rdt5U261yzg1NwgJikxgS1qw73+7BVYZID+yG+zfjuRZ/NyotEG
         ukjWHCw9XrUDdEM+LHnyLmC15LuZ8plwHdqX8ip+LbU5dy6jdYqYA2TYhYIm3kSc6uh+
         Dkrw==
X-Gm-Message-State: AOAM532ylXf/QPu3xUGuSUMZZ95kCY0BRsUrBIAwoxDHGLsrGekVU916
        WCUhMU40/CGUUpEmWTUvw6/xpQ==
X-Google-Smtp-Source: ABdhPJzZu/6BfSE7VStHvZoEEidbg4VsNLX7l6fOQVUhzjQ/dXnioZdc1qnbY3WMFmzEx2CEKDZ7qQ==
X-Received: by 2002:a05:6830:20d5:: with SMTP id z21mr53373201otq.310.1609807660949;
        Mon, 04 Jan 2021 16:47:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u141sm13619181oie.46.2021.01.04.16.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 16:47:40 -0800 (PST)
Date:   Mon, 4 Jan 2021 18:47:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 07/16] rpmsg: char: clean up rpmsg class
Message-ID: <X/O3KkJrmVfGvFEF@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

This patch doesn't "clean up" the class, as described in $subject. It
just removes it.

> Suppress the management of the rpmsg class as attribute. It is already
> handled in /sys/bus rpmsg as specified in
> documentation/ABI/testing/sysfs-bus-rpmsg.

Afaict it doesn't relate to /sys/bus/rpmsg, but rather what attributes
should be associated with the rpmsg_device (and thereby present in its
sysfs directory). But if these attributes are also added by the bus,
then why do we have this code? If that's the case this seems like a nice
cleanup that we should do outside/before merging the other patches.

> This patch prepares the migration of the control device in rpmsg_ctrl.
> 

It would be useful if the commit message described how it prepares for
the migration and why.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 48 --------------------------------------
>  1 file changed, 48 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4bbbacdbf3bb..732f5caf068a 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -27,7 +27,6 @@
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
>  static dev_t rpmsg_major;
> -static struct class *rpmsg_class;
>  
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -291,41 +290,6 @@ static const struct file_operations rpmsg_eptdev_fops = {
>  	.compat_ioctl = compat_ptr_ioctl,
>  };
>  
> -static ssize_t name_show(struct device *dev, struct device_attribute *attr,
> -			 char *buf)
> -{
> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%s\n", eptdev->chinfo.name);
> -}
> -static DEVICE_ATTR_RO(name);
> -
> -static ssize_t src_show(struct device *dev, struct device_attribute *attr,
> -			 char *buf)
> -{
> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%d\n", eptdev->chinfo.src);
> -}
> -static DEVICE_ATTR_RO(src);
> -
> -static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
> -			 char *buf)
> -{
> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
> -}
> -static DEVICE_ATTR_RO(dst);
> -
> -static struct attribute *rpmsg_eptdev_attrs[] = {
> -	&dev_attr_name.attr,
> -	&dev_attr_src.attr,
> -	&dev_attr_dst.attr,
> -	NULL
> -};
> -ATTRIBUTE_GROUPS(rpmsg_eptdev);
> -
>  static void rpmsg_eptdev_release_device(struct device *dev)
>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> @@ -358,9 +322,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	init_waitqueue_head(&eptdev->readq);
>  
>  	device_initialize(dev);
> -	dev->class = rpmsg_class;
>  	dev->parent = &ctrldev->dev;
> -	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
>  	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> @@ -477,7 +439,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev = &ctrldev->dev;
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
>  
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
> @@ -553,17 +514,9 @@ static int rpmsg_char_init(void)
>  		return ret;
>  	}
>  
> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> -	if (IS_ERR(rpmsg_class)) {
> -		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> -	}
> -
>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>  	if (ret < 0) {
>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> -		class_destroy(rpmsg_class);
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
>  
> @@ -574,7 +527,6 @@ postcore_initcall(rpmsg_char_init);
>  static void rpmsg_chrdev_exit(void)
>  {
>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> -	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> -- 
> 2.17.1
> 
