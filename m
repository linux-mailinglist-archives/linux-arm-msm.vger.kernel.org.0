Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3436843258F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 19:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhJRRyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 13:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhJRRyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 13:54:41 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB49EC061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 10:52:29 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d9so8114978pfl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3f87BNFWvM1pfhva02mnChXWbxmDyc7utICiS9qk7qE=;
        b=B8DUAZpSUHucHYlrOFumei2CRRhDlfoAfKzKMZUmHzIJKOECoyCRa4ugHByNbyAbkK
         F0czHsr3RqHVLWz5ul2sJmivSVOZow0R0iFbK/l1/b6102fl94i1gQGo5+SwNqJmQrJX
         4Zr4xQYadUVYUa09+X4jkayjipcs5Bf8GnBPM1SH8vifyUgq9Z9Dkulg2omgyaSzg3Z/
         N6m2lSiLshaiGFacuybUnEQgl9j1Se30nQWWUHuQqKi5ZT59aFIMUm6a63xb9HkZ7L8B
         WjU0fZnhPIcWSHlACPAB0fjcg6HQBpkqSvFIEnQRBcDzqqp/Ard9XS7+b1V6a8qa1wtT
         jeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3f87BNFWvM1pfhva02mnChXWbxmDyc7utICiS9qk7qE=;
        b=L2ah288wNJFQD/lwA8LrQ5hgc0oZmmGVghRXOeVSjGHrcAJ2+WWcoWXHW8qb9dOq3R
         MkIrPakZLfFq2h2/rVss6RxptgpMgRT5thdvVzalDafSIAvtaIFCJSVkmuxxnko9Q7A/
         7vXfWKaeItdiIHA1mYfcJJ48IPQvpT8hxWyirMuouGeVHz+Uc54Ogd3DTXhJa6v+yK6c
         GQvHoBsE8EibTCrrutfynhyVOvUXz0DoRgKI8SRk/pW3d6jViBvhANZGDDLXh1mnro1H
         5jZsbG4jgXoxGKL/GFpnfs+HuwupVfEBvCrRYwhOwd16MuAiGLztqJvcvN6Hf299paph
         928Q==
X-Gm-Message-State: AOAM532i94Zr0uHZre5fPet/1DWj2L1z9uZwOVInkmKd3lOkN3bgZhIg
        6YbtMlXeuHn/hz4yr9W7Mzsw7w==
X-Google-Smtp-Source: ABdhPJyLkgIR8wb4rOSy7OTHOWTnGTav1oyfVvtiV5jSTPQ/PL4j5hLmVhk/AHcchk5IYRsPtc3G+g==
X-Received: by 2002:a63:b00e:: with SMTP id h14mr24826468pgf.135.1634579549233;
        Mon, 18 Oct 2021 10:52:29 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r8sm13872346pgp.30.2021.10.18.10.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 10:52:28 -0700 (PDT)
Date:   Mon, 18 Oct 2021 11:52:25 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
Message-ID: <20211018175225.GF3163131@p14s>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
 <20211011180245.GA3817586@p14s>
 <YWpcq2Uy9wM1voRH@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWpcq2Uy9wM1voRH@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 12:01:31AM -0500, Bjorn Andersson wrote:
> On Mon 11 Oct 13:02 CDT 2021, Mathieu Poirier wrote:
> 
> > Good day Deepak,
> > 
> > On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
> > > Some transports like Glink support the state notifications between
> > > clients using signals similar to serial protocol signals.
> > > Local glink client drivers can send and receive signals to glink
> > > clients running on remote processors.
> > > 
> > > Add apis to support sending and receiving of signals by rpmsg clients.
> > > 
> > > Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> > > ---
> > >  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
> > >  drivers/rpmsg/rpmsg_internal.h |  2 ++
> > >  include/linux/rpmsg.h          | 15 +++++++++++++++
> > >  3 files changed, 38 insertions(+)
> > > 
> > > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > > index 9151836..5cae50c 100644
> > > --- a/drivers/rpmsg/rpmsg_core.c
> > > +++ b/drivers/rpmsg/rpmsg_core.c
> > > @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > >  }
> > >  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> > >  
> > > +/**
> > > + * rpmsg_set_flow_control() - sets/clears searial flow control signals
> > > + * @ept:	the rpmsg endpoint
> > > + * @enable:	enable or disable serial flow control
> > > + *
> > > + * Returns 0 on success and an appropriate error value on failure.
> > > + */
> > > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> > > +{
> > > +	if (WARN_ON(!ept))
> > > +		return -EINVAL;
> > > +	if (!ept->ops->set_flow_control)
> > > +		return -ENXIO;
> > > +
> > > +	return ept->ops->set_flow_control(ept, enable);
> > > +}
> > > +EXPORT_SYMBOL(rpmsg_set_flow_control);
> > > +
> > 
> > I'm looking at this patchset as the introduction of an out-of-bound
> > control interface.  But looking at the implementation of the GLINK's
> > set_flow_control() the data is sent in-band, making me perplexed about
> > introducing a new rpmsg_endpoint_ops for something that could be done
> > from user space.  Especially when user space is triggering the message
> > with an ioctl in patch 3.
> > 
> 
> GLINK is built around one fifo per processor pair, similar to a
> virtqueue. So the signal request is muxed in the same pipe as data
> requests, but the signal goes alongside data request, not within them.
>

I reflected more on this and I can see scenarios where sending control flow
messages alongside other data packet could be the only solution.  How the signal
is implemented is a platform specific choice.  I believe the same kind of
delivery mechanism implemented by kick() functions would be the best way to go
but if that isn't possible then in-band, as suggested in this patchset, is
better than nothing. 

> > Moreover this interface is case specific and doesn't reflect the
> > generic nature found in ept->sig_cb.
> > 
> 
> The previous proposal from Deepak was to essentially expose the normal
> tty flags all the way down to the rpmsg driver. But I wasn't sure how
> those various flags should be interpreted in the typical rpmsg driver.

That is interesting.  I was hoping to keep the user level signal interfaces
generic and let the drivers do as they please with them.  I see your point
though and this might be one of those cases where there isn't a right or wrong
answer.

> 
> I therefor asked Deepak to change it so the rpmsg api would contain a
> single "pause incoming data"/"resume incoming data" - given that this is
> a wish that we've seen in a number of discussions.
>

This will work for as long as we have a single usecase for it, i.e flow control.
I fear things will quickly get out of hands when more messages are needed, hence
the idea of keeping things as generic as possible.  

> 
> Unfortunately I don't have any good suggestion for how we could
> implement this in the virtio backend at this time, but with the muxing
> of all the different channels in the same virtqueue it would be good for
> a driver to able to pause the inflow on a specific endpoint, to avoid
> stalling other communication when a driver can't receive more messages.

Humm...

For application to remote processor things would work the same as it does for
GLINK, whether the communication is done from a rpmsg_driver (as in
rpmsg_client_sample.c) or from user space via something like the rpmsg_char.c
driver.  

For remote processor to application processor the interruptions would need to
carry the destination address of the endpoint, which might not be possible.

All this discussion proves that we really need to think about this before moving
forward, especially with Arnaud's ongoing refactoring of the rpmsg_char driver.

Thanks,
Mathieu

> 
> Regards,
> Bjorn
> 
> > >  /*
> > >   * match a rpmsg channel with a channel info struct.
> > >   * this is used to make sure we're not creating rpmsg devices for channels
> > > @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
> > >  
> > >  		rpdev->ept = ept;
> > >  		rpdev->src = ept->addr;
> > > +
> > > +		if (rpdrv->signals)
> > > +			ept->sig_cb = rpdrv->signals;
> > >  	}
> > >  
> > >  	err = rpdrv->probe(rpdev);
> > > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > > index a76c344..dcb2ec1 100644
> > > --- a/drivers/rpmsg/rpmsg_internal.h
> > > +++ b/drivers/rpmsg/rpmsg_internal.h
> > > @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
> > >   * @trysendto:		see @rpmsg_trysendto(), optional
> > >   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> > >   * @poll:		see @rpmsg_poll(), optional
> > > + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> > >   *
> > >   * Indirection table for the operations that a rpmsg backend should implement.
> > >   * In addition to @destroy_ept, the backend must at least implement @send and
> > > @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
> > >  			     void *data, int len);
> > >  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> > >  			     poll_table *wait);
> > > +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
> > >  };
> > >  
> > >  struct device *rpmsg_find_device(struct device *parent,
> > > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > > index d97dcd0..b805c70 100644
> > > --- a/include/linux/rpmsg.h
> > > +++ b/include/linux/rpmsg.h
> > > @@ -62,12 +62,14 @@ struct rpmsg_device {
> > >  };
> > >  
> > >  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> > > +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
> > >  
> > >  /**
> > >   * struct rpmsg_endpoint - binds a local rpmsg address to its user
> > >   * @rpdev: rpmsg channel device
> > >   * @refcount: when this drops to zero, the ept is deallocated
> > >   * @cb: rx callback handler
> > > + * @sig_cb: rx serial signal handler
> > >   * @cb_lock: must be taken before accessing/changing @cb
> > >   * @addr: local rpmsg address
> > >   * @priv: private data for the driver's use
> > > @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
> > >  	struct rpmsg_device *rpdev;
> > >  	struct kref refcount;
> > >  	rpmsg_rx_cb_t cb;
> > > +	rpmsg_rx_sig_t sig_cb;
> > >  	struct mutex cb_lock;
> > >  	u32 addr;
> > >  	void *priv;
> > > @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
> > >   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
> > >   * @remove: invoked when the rpmsg channel is removed
> > >   * @callback: invoked when an inbound message is received on the channel
> > > + * @signals: invoked when a serial signal change is received on the channel
> > >   */
> > >  struct rpmsg_driver {
> > >  	struct device_driver drv;
> > > @@ -111,6 +115,7 @@ struct rpmsg_driver {
> > >  	int (*probe)(struct rpmsg_device *dev);
> > >  	void (*remove)(struct rpmsg_device *dev);
> > >  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> > > +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
> > >  };
> > >  
> > >  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> > > @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > >  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > >  			poll_table *wait);
> > >  
> > > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > > +
> > >  #else
> > >  
> > >  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> > > @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> > >  	return 0;
> > >  }
> > >  
> > > +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > > +{
> > > +	/* This shouldn't be possible */
> > > +	WARN_ON(1);
> > > +
> > > +	return -ENXIO;
> > > +}
> > > +
> > >  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> > >  
> > >  /* use a macro to avoid include chaining to get THIS_MODULE */
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
