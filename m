Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D65430056
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 07:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240656AbhJPFDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 01:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239431AbhJPFDm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 01:03:42 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F0FC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 22:01:34 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y207so16095931oia.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 22:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OdcCM/Em1aeeSM7r6bkCUN5vs+RH78Cpx4QO2uCS/2E=;
        b=pHSJIajdjgwWNI6fhsZatcKz7IWLrS/C9RgHioIiUUs68hCbMwY1ugUDU4JPEDfp6O
         PWXAoLubTIkU2Qgnia5OmO4FkFL/FCI9V11xtG8V9V2SqWIQLRrUcZIV5rnwkfDwE0Gg
         u6G/xfz8CcZjcShv9brjP/3l1a5ROMCo7OVIQMNKmaug1788YMsxZERb7Vq7qMvXADp3
         YdV5QoXO6uZ8fu+lwPqqCZdHPj8k/vHmuvw7JE2rcEBLodDw1TIo0pb8FY51ZGmINyDw
         80Vfdx609ayvXYpmJ5x+yG5qOMALaU6ChaLTrHVYSIbqKiwe0K6pdZKhcO0S12hTaQFw
         RhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OdcCM/Em1aeeSM7r6bkCUN5vs+RH78Cpx4QO2uCS/2E=;
        b=4WQSyLjsOmkPp1vz3KoegOI4pmEgT/gsgBeiPDpmqpqG7MLirexV/GdHWYgzDB85Sy
         I39nR6dybBGv0hhXB+DDgtS/Q+vvXSdhgZjiD4dd8SV2dl9L5+8xXRZ00k4+hbuCuPIh
         y7aO+ZYoeNry5P/nC1gTwKdLaLT0eiYxB2f0tHr8n88neMLEq/R1uIRJtlWZ0UI8GD+A
         PIfqgHVi7ecXkdQI6PztLALYtgDX5tdczhjfVxFoLKX0EULAQHQwoMgDgd/Kym6yGr8K
         bftskm9kt2IvCazgKhPMlTvqf5fep3jwnc74RO4SEjcko3FRGY/C091Vw7+skNc9C1Qy
         Awbw==
X-Gm-Message-State: AOAM533NruKXoBRarTpvixA7C5ygz0ei7wV2d8Uje7StpIxrbgDBwVGx
        jD033CpjmpskbRFvt9z+qsT2cg==
X-Google-Smtp-Source: ABdhPJw6J1BJZP/X14X70ps9O85MMl4x5lHRH6GTcC07s4iLXQIGtpn5UIVAN3BDM5SONre8uSUjmg==
X-Received: by 2002:aca:ef02:: with SMTP id n2mr19214762oih.156.1634360494036;
        Fri, 15 Oct 2021 22:01:34 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:74c9:deff:fe1a:d52c])
        by smtp.gmail.com with ESMTPSA id j12sm1664203ota.47.2021.10.15.22.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:01:33 -0700 (PDT)
Date:   Sat, 16 Oct 2021 00:01:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
Message-ID: <YWpcq2Uy9wM1voRH@yoga>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
 <20211011180245.GA3817586@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011180245.GA3817586@p14s>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Oct 13:02 CDT 2021, Mathieu Poirier wrote:

> Good day Deepak,
> 
> On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
> > Some transports like Glink support the state notifications between
> > clients using signals similar to serial protocol signals.
> > Local glink client drivers can send and receive signals to glink
> > clients running on remote processors.
> > 
> > Add apis to support sending and receiving of signals by rpmsg clients.
> > 
> > Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> > ---
> >  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h |  2 ++
> >  include/linux/rpmsg.h          | 15 +++++++++++++++
> >  3 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > index 9151836..5cae50c 100644
> > --- a/drivers/rpmsg/rpmsg_core.c
> > +++ b/drivers/rpmsg/rpmsg_core.c
> > @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >  }
> >  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> >  
> > +/**
> > + * rpmsg_set_flow_control() - sets/clears searial flow control signals
> > + * @ept:	the rpmsg endpoint
> > + * @enable:	enable or disable serial flow control
> > + *
> > + * Returns 0 on success and an appropriate error value on failure.
> > + */
> > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> > +{
> > +	if (WARN_ON(!ept))
> > +		return -EINVAL;
> > +	if (!ept->ops->set_flow_control)
> > +		return -ENXIO;
> > +
> > +	return ept->ops->set_flow_control(ept, enable);
> > +}
> > +EXPORT_SYMBOL(rpmsg_set_flow_control);
> > +
> 
> I'm looking at this patchset as the introduction of an out-of-bound
> control interface.  But looking at the implementation of the GLINK's
> set_flow_control() the data is sent in-band, making me perplexed about
> introducing a new rpmsg_endpoint_ops for something that could be done
> from user space.  Especially when user space is triggering the message
> with an ioctl in patch 3.
> 

GLINK is built around one fifo per processor pair, similar to a
virtqueue. So the signal request is muxed in the same pipe as data
requests, but the signal goes alongside data request, not within them.

> Moreover this interface is case specific and doesn't reflect the
> generic nature found in ept->sig_cb.
> 

The previous proposal from Deepak was to essentially expose the normal
tty flags all the way down to the rpmsg driver. But I wasn't sure how
those various flags should be interpreted in the typical rpmsg driver.

I therefor asked Deepak to change it so the rpmsg api would contain a
single "pause incoming data"/"resume incoming data" - given that this is
a wish that we've seen in a number of discussions.


Unfortunately I don't have any good suggestion for how we could
implement this in the virtio backend at this time, but with the muxing
of all the different channels in the same virtqueue it would be good for
a driver to able to pause the inflow on a specific endpoint, to avoid
stalling other communication when a driver can't receive more messages.

Regards,
Bjorn

> >  /*
> >   * match a rpmsg channel with a channel info struct.
> >   * this is used to make sure we're not creating rpmsg devices for channels
> > @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
> >  
> >  		rpdev->ept = ept;
> >  		rpdev->src = ept->addr;
> > +
> > +		if (rpdrv->signals)
> > +			ept->sig_cb = rpdrv->signals;
> >  	}
> >  
> >  	err = rpdrv->probe(rpdev);
> > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > index a76c344..dcb2ec1 100644
> > --- a/drivers/rpmsg/rpmsg_internal.h
> > +++ b/drivers/rpmsg/rpmsg_internal.h
> > @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
> >   * @trysendto:		see @rpmsg_trysendto(), optional
> >   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> >   * @poll:		see @rpmsg_poll(), optional
> > + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> >   *
> >   * Indirection table for the operations that a rpmsg backend should implement.
> >   * In addition to @destroy_ept, the backend must at least implement @send and
> > @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
> >  			     void *data, int len);
> >  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> >  			     poll_table *wait);
> > +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
> >  };
> >  
> >  struct device *rpmsg_find_device(struct device *parent,
> > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > index d97dcd0..b805c70 100644
> > --- a/include/linux/rpmsg.h
> > +++ b/include/linux/rpmsg.h
> > @@ -62,12 +62,14 @@ struct rpmsg_device {
> >  };
> >  
> >  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> > +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
> >  
> >  /**
> >   * struct rpmsg_endpoint - binds a local rpmsg address to its user
> >   * @rpdev: rpmsg channel device
> >   * @refcount: when this drops to zero, the ept is deallocated
> >   * @cb: rx callback handler
> > + * @sig_cb: rx serial signal handler
> >   * @cb_lock: must be taken before accessing/changing @cb
> >   * @addr: local rpmsg address
> >   * @priv: private data for the driver's use
> > @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
> >  	struct rpmsg_device *rpdev;
> >  	struct kref refcount;
> >  	rpmsg_rx_cb_t cb;
> > +	rpmsg_rx_sig_t sig_cb;
> >  	struct mutex cb_lock;
> >  	u32 addr;
> >  	void *priv;
> > @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
> >   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
> >   * @remove: invoked when the rpmsg channel is removed
> >   * @callback: invoked when an inbound message is received on the channel
> > + * @signals: invoked when a serial signal change is received on the channel
> >   */
> >  struct rpmsg_driver {
> >  	struct device_driver drv;
> > @@ -111,6 +115,7 @@ struct rpmsg_driver {
> >  	int (*probe)(struct rpmsg_device *dev);
> >  	void (*remove)(struct rpmsg_device *dev);
> >  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> > +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
> >  };
> >  
> >  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> > @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >  			poll_table *wait);
> >  
> > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > +
> >  #else
> >  
> >  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> > @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> >  	return 0;
> >  }
> >  
> > +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > +{
> > +	/* This shouldn't be possible */
> > +	WARN_ON(1);
> > +
> > +	return -ENXIO;
> > +}
> > +
> >  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> >  
> >  /* use a macro to avoid include chaining to get THIS_MODULE */
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
