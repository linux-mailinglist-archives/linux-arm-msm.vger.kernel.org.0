Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932CD42964A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 20:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhJKSEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 14:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbhJKSEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 14:04:49 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1C4C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 11:02:49 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q10-20020a17090a1b0a00b001a076a59640so406450pjq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y6R21h8pX+Bz854LkA70H/M6hXh6XvR/iiMhd64ZE3o=;
        b=VwmuCZRSiIj7rRfK3NYfLwmHVarWN/WaoMm6tiqJEarC7+j5L2cmVu1ZiAd8Z4XsGw
         nHoJUzCwZJI31UrVZMtLJRaM1cw8JDyEfGXm64KcIGjMMBgXnWlfnQUp8e2DriUtkq1R
         bAlL5Dz8dY05K5Y7lmjgDZcLRPBFKx2XcOiVrtNtYiNNTf9ub50p0K1s+YpthYuV0LqR
         imZOlW0o1yGJnfHRIEA5fSFCHdY2Jn0yjCZE90WKLXN6KCg2AmkpQXc10fgxnntx6UMR
         gqTl5mzv+68d3HtXw7bA0EjdPm2V+2oB86JoHWgcDzqeJN9a6N47PJe5KdyaE2teb2sc
         SUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y6R21h8pX+Bz854LkA70H/M6hXh6XvR/iiMhd64ZE3o=;
        b=7SWlTJ0ocJeI+61EZOgwNxFF5c/7/XRu8+c8+/sGRjBNHuEMOjbJIk6L8wIUXd/K/U
         xb/qchmU9HEXLi3N7sVAAkM0QSCjUS8YoHM9to6avYnVRyi4HgbP4wRBUZt73ASioFUI
         +oy2b5tQlY6GtZw3UsrByy7epRgFMz6IjpuOz+YNIh75usQMa8qnnmxZFa+maeZ9tmtw
         +YYwj29rBfHF6ZscLX+1TxzJ4yA23/6hgNGq1w/x/geVKwBtrAnNiky072R4JdUFKkpj
         PfXxxX5SqEjj93CuqVeVOK4X4LoktHIDKyVeQ8BvAd7mYH2tNxsoPLPYi9m+q7/94B4g
         vKdg==
X-Gm-Message-State: AOAM533aAjJDQmczLwqVAQTKWtcOUBLAjp28k9bvMSIRaFrPvSv5Jm80
        QPYsh4SXxBUDA4MvMF3Jziyk2w==
X-Google-Smtp-Source: ABdhPJzEEsUFb4efS/DaiHNS6Qh7qBdHYW3vrals7htloZOSo4B1G43rNyL55vdrB6UsHuYx29rgPA==
X-Received: by 2002:a17:90a:f415:: with SMTP id ch21mr449783pjb.235.1633975368546;
        Mon, 11 Oct 2021 11:02:48 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y24sm8393715pfo.69.2021.10.11.11.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:02:47 -0700 (PDT)
Date:   Mon, 11 Oct 2021 12:02:45 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
Message-ID: <20211011180245.GA3817586@p14s>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633015924-881-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Good day Deepak,

On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
> Some transports like Glink support the state notifications between
> clients using signals similar to serial protocol signals.
> Local glink client drivers can send and receive signals to glink
> clients running on remote processors.
> 
> Add apis to support sending and receiving of signals by rpmsg clients.
> 
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h |  2 ++
>  include/linux/rpmsg.h          | 15 +++++++++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836..5cae50c 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_set_flow_control() - sets/clears searial flow control signals
> + * @ept:	the rpmsg endpoint
> + * @enable:	enable or disable serial flow control
> + *
> + * Returns 0 on success and an appropriate error value on failure.
> + */
> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->set_flow_control)
> +		return -ENXIO;
> +
> +	return ept->ops->set_flow_control(ept, enable);
> +}
> +EXPORT_SYMBOL(rpmsg_set_flow_control);
> +

I'm looking at this patchset as the introduction of an out-of-bound control interface.  But looking at the implementation of the GLINK's set_flow_control() the data is sent in-band, making me perplexed about introducing a new rpmsg_endpoint_ops for something that could be done from user space.  Especially when user space is triggering the message with an ioctl in patch 3.

Moreover this interface is case specific and doesn't reflect the generic nature
found in ept->sig_cb.

>  /*
>   * match a rpmsg channel with a channel info struct.
>   * this is used to make sure we're not creating rpmsg devices for channels
> @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
>  
>  		rpdev->ept = ept;
>  		rpdev->src = ept->addr;
> +
> +		if (rpdrv->signals)
> +			ept->sig_cb = rpdrv->signals;
>  	}
>  
>  	err = rpdrv->probe(rpdev);
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344..dcb2ec1 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
>   * @trysendto:		see @rpmsg_trysendto(), optional
>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
> + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
>   *
>   * Indirection table for the operations that a rpmsg backend should implement.
>   * In addition to @destroy_ept, the backend must at least implement @send and
> @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
>  			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
> +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
>  };
>  
>  struct device *rpmsg_find_device(struct device *parent,
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd0..b805c70 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -62,12 +62,14 @@ struct rpmsg_device {
>  };
>  
>  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
>  
>  /**
>   * struct rpmsg_endpoint - binds a local rpmsg address to its user
>   * @rpdev: rpmsg channel device
>   * @refcount: when this drops to zero, the ept is deallocated
>   * @cb: rx callback handler
> + * @sig_cb: rx serial signal handler
>   * @cb_lock: must be taken before accessing/changing @cb
>   * @addr: local rpmsg address
>   * @priv: private data for the driver's use
> @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
>  	struct rpmsg_device *rpdev;
>  	struct kref refcount;
>  	rpmsg_rx_cb_t cb;
> +	rpmsg_rx_sig_t sig_cb;
>  	struct mutex cb_lock;
>  	u32 addr;
>  	void *priv;
> @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
>   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
>   * @remove: invoked when the rpmsg channel is removed
>   * @callback: invoked when an inbound message is received on the channel
> + * @signals: invoked when a serial signal change is received on the channel
>   */
>  struct rpmsg_driver {
>  	struct device_driver drv;
> @@ -111,6 +115,7 @@ struct rpmsg_driver {
>  	int (*probe)(struct rpmsg_device *dev);
>  	void (*remove)(struct rpmsg_device *dev);
>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
>  };
>  
>  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
>  
> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> +
>  #else
>  
>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	return 0;
>  }
>  
> +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>  
>  /* use a macro to avoid include chaining to get THIS_MODULE */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
