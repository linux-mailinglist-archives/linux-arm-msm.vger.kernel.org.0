Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942464296BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 20:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbhJKSYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 14:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbhJKSYJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 14:24:09 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CD4C061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 11:22:08 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g14so15540264pfm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i31zgabbl20JqR4wPw8hpeVNQoFtIqMlPBy58x2LdDE=;
        b=IS3dcojH0DUbsMAep4w+B67ZVD+inzP2Wv9HKH6NpILPa6b0AxFsdb6WtqEiwih2n3
         oe9YRwxtmCq3e6Yyl4ZuppPxOcv4jl6bNnIHh8m0iyMgAoPmjmWorg16v0jr73LnofvZ
         I38RB64tY/pWo5Zbg9I/dy+a4yzoPHfolhCtqKU9B8X0i21kHYXcBmioPazGISR8XvGV
         dL10QKggGMRi4NSG3NIFBDjLFaBejjS57fAhgmFEJ+6tXMNF4utr5yhOGack64vLr8WB
         Sr5+BfcR7y4DIfdb6/0/CSuo7LFFIrsR6nwjXqu9p1ctkYZ7ZmgtH8e3xyysPGj4n+OA
         EFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i31zgabbl20JqR4wPw8hpeVNQoFtIqMlPBy58x2LdDE=;
        b=3qBM7mn1E/t3/CDEwKp4c9dgVzyrwc6EghpGhea9kH7P0cyxtCkHBWyEa0XqZjrr+g
         +7oXep+pj+TpMofDNb36d68SnnMkUjBF7YbclJ7c+m//XbSBx41b2JriF91seMOnOSBb
         UUlDKNYHjb6sIMOkGElONpnEWDWaNNjkxQzShwFOewQP/o0Vd4iFoQxgn/wtyH2gOo9u
         dxTs3bHnMpT+YXKmrS8Jc/y0P6SvU56vqO0fBtF6ESndiCMUBykupUR2bAQ8cwKHqwZY
         k3a2g1K7oLvTk/4pLvL9ZeYEHO9H0e+YhMIgoIckrghzq7v+kx6SnKK6YyMn+x9mAyQl
         hd8A==
X-Gm-Message-State: AOAM5306xJlDkiKSMIbVG5Qa4thMTedCFnESaGcT6B43HMJiD8p5Sh7W
        +K2FEAeP5NlHJMowokN7jrg5/Q==
X-Google-Smtp-Source: ABdhPJzRB/kJ875wp94Qq6Yw+LkB6cCP5s6+FEo09+6K1jimUHFci1oJh5cY0Xhhu/QcTtB9xs3l4g==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr19102498pgf.475.1633976528153;
        Mon, 11 Oct 2021 11:22:08 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h2sm139607pjk.44.2021.10.11.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:22:06 -0700 (PDT)
Date:   Mon, 11 Oct 2021 12:22:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 3/3] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
Message-ID: <20211011182204.GB3817586@p14s>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-5-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633015924-881-5-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 09:02:04PM +0530, Deepak Kumar Singh wrote:
> Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
> to get/set the low level transport signals.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_char.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

I would have expected this patch to be 02 rather than 03.  That way the
framework is sent in place and then used by platform code.

> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b..60a889b 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -19,6 +19,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
> +#include <linux/termios.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> @@ -76,6 +77,9 @@ struct rpmsg_eptdev {
>  	spinlock_t queue_lock;
>  	struct sk_buff_head queue;
>  	wait_queue_head_t readq;
> +
> +	u32 rsigs;
> +	bool sig_pending;
>  };
>  
>  static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> @@ -120,6 +124,18 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  	return 0;
>  }
>  
> +static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv, u32 sigs)
> +{
> +	struct rpmsg_eptdev *eptdev = priv;
> +
> +	eptdev->rsigs = sigs;
> +	eptdev->sig_pending = true;

If two signals are sent in a row without user space having the time to process
the first one, the second message will overwrite the first one.

> +
> +	/* wake up any blocking processes, waiting for signal notification */
> +	wake_up_interruptible(&eptdev->readq);
> +	return 0;
> +}
> +
>  static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> @@ -139,6 +155,7 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  		return -EINVAL;
>  	}
>  
> +	ept->sig_cb = rpmsg_sigs_cb;
>  	eptdev->ept = ept;
>  	filp->private_data = eptdev;
>  
> @@ -157,6 +174,7 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> +	eptdev->sig_pending = false;
>  
>  	/* Discard all SKBs */
>  	skb_queue_purge(&eptdev->queue);
> @@ -267,6 +285,9 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
>  	if (!skb_queue_empty(&eptdev->queue))
>  		mask |= EPOLLIN | EPOLLRDNORM;
>  
> +	if (eptdev->sig_pending)
> +		mask |= EPOLLPRI;
> +
>  	mask |= rpmsg_poll(eptdev->ept, filp, wait);
>  
>  	return mask;
> @@ -276,10 +297,32 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			       unsigned long arg)
>  {
>  	struct rpmsg_eptdev *eptdev = fp->private_data;
> +	bool set;
> +	u32 val;
> +	int ret;
>  
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> +	switch (cmd) {
> +	case TIOCMGET:

The IOCTLs should be generic so that any kind of out-of-band signals.

> +		eptdev->sig_pending = false;
> +		ret = put_user(eptdev->rsigs, (int __user *)arg);
> +		break;
> +	case TIOCMSET:
> +		ret = get_user(val, (int __user *)arg);
> +		if (ret)
> +			break;
> +		set = (val & TIOCM_DTR) ? true : false;
> +		ret = rpmsg_set_flow_control(eptdev->ept, set);
> +		break;

But as said in patch 01, I'm not sure about the path from AP to RP.  Function
rpmsg_set_flow_control() turns into qcom_glink_tx().  In this case it should be
possible for user space to send this information as it does with other kind of
data destined for the remote processor.  At the very least the send interface
should be decoupled from the implementation specific nature of this use case.

Lastly, Arnaud has sent patches that refactor rpmsg_eptdev_ioctl().  I would
like that patchset to be dealth with before we move forward with this one.  That
way we make sure to avoid supporting features that are incompatible with each
other.

Regards,
Mathieu

> +	case RPMSG_DESTROY_EPT_IOCTL:
> +		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
>  	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
