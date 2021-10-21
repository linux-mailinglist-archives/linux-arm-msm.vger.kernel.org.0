Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D914369C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 19:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhJURyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 13:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhJURyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 13:54:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82002C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 10:52:02 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id e10so939037plh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xPG3ciojTSGKhZG5QSq+tGBy+9w6vFPo4ONgveiwOWg=;
        b=uTkigAR+5O90/zUuzNIKivmEf9JqLe+IAKc38/GvfVm76IknUrFBwL638e2iixzdSO
         f83qllG+RPm9jDioBSKvpLAnvm+NOQPTZ52+K4OqJx7kgGyANJsZ06TkrTyyLLwyh2m7
         pgKeyy+/HuLvKCSMNNoU/JsdbI0bRSOO5QgDfWQg6gv7hzDlxbcl4SfNEWF7tZ8o8jeP
         clL62IiH0VBNHB2iNJYmcPTg/+9h/wRDSEPbVhCc8LLLJph2ExntxwgoZppzaRqmgVQA
         nevLC1vcnjF+FS5F/AGkSXPbzyr2k28kYVfXLZ7IoljLNPrxsGzKJVQ8bvuTDH0sRHsZ
         BF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xPG3ciojTSGKhZG5QSq+tGBy+9w6vFPo4ONgveiwOWg=;
        b=56ipeXM/WE6hSfue3YsgpxNkIPTH+jK8LiSMkwRM6UwXd9YSGwk7jSZtAw2ugqYsX4
         cQLdvFJ5sh1a3Mxa/Cyouwi6Or4wHxKQWChRGOeGP5Mvn5jeXqUqkbNhwuBD7Ak2apgS
         okQUII3NKpRzLV/iuPMhF9edA+N2YbEKyNAxk0FuQb2zAWxCzXekykgfwjrxDJF6wcEA
         y6/iXcFrZYRNcSrfdC8ZHrMqn0WTvR++rDrtF0CfuPDHjOtU4mat7XrBv/yAJ2Ppqel2
         NoHZ0C78+WuvMZ7WhxMbupiK2zRH7v0OLZUyRwbVZD13Auq2/G6/69Jhg15ybcj3D/xI
         fsMw==
X-Gm-Message-State: AOAM533dz3BoAydq5akcpTE0CQwnbqlaCrNOJb9Uyx9pEGwsD8i4G8aB
        ESIQvxTC3jq8RTKJ1cAEm9Z92g==
X-Google-Smtp-Source: ABdhPJwAdbRE0Q7ieNiCEUILiefW4EpTHjD0nr2Ym+a8iVxUvD1NdkjtfO3IYb17g3gaQC/NWG9dow==
X-Received: by 2002:a17:902:ec8e:b0:13f:69af:5aef with SMTP id x14-20020a170902ec8e00b0013f69af5aefmr6552170plg.7.1634838721827;
        Thu, 21 Oct 2021 10:52:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id lb5sm6891349pjb.11.2021.10.21.10.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:52:00 -0700 (PDT)
Date:   Thu, 21 Oct 2021 11:51:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
Message-ID: <20211021175158.GA3563730@p14s>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
 <20211011180245.GA3817586@p14s>
 <YWpcq2Uy9wM1voRH@yoga>
 <20211018175225.GF3163131@p14s>
 <YW413AjBmkpNH0Yk@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW413AjBmkpNH0Yk@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 08:05:00PM -0700, Bjorn Andersson wrote:
> On Mon 18 Oct 10:52 PDT 2021, Mathieu Poirier wrote:
> 
> > On Sat, Oct 16, 2021 at 12:01:31AM -0500, Bjorn Andersson wrote:
> > > On Mon 11 Oct 13:02 CDT 2021, Mathieu Poirier wrote:
> > > 
> > > > Good day Deepak,
> > > > 
> > > > On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
> > > > > Some transports like Glink support the state notifications between
> > > > > clients using signals similar to serial protocol signals.
> > > > > Local glink client drivers can send and receive signals to glink
> > > > > clients running on remote processors.
> > > > > 
> > > > > Add apis to support sending and receiving of signals by rpmsg clients.
> > > > > 
> > > > > Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> > > > > ---
> > > > >  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
> > > > >  drivers/rpmsg/rpmsg_internal.h |  2 ++
> > > > >  include/linux/rpmsg.h          | 15 +++++++++++++++
> > > > >  3 files changed, 38 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > > > > index 9151836..5cae50c 100644
> > > > > --- a/drivers/rpmsg/rpmsg_core.c
> > > > > +++ b/drivers/rpmsg/rpmsg_core.c
> > > > > @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > > > >  }
> > > > >  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> > > > >  
> > > > > +/**
> > > > > + * rpmsg_set_flow_control() - sets/clears searial flow control signals
> > > > > + * @ept:	the rpmsg endpoint
> > > > > + * @enable:	enable or disable serial flow control
> > > > > + *
> > > > > + * Returns 0 on success and an appropriate error value on failure.
> > > > > + */
> > > > > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> > > > > +{
> > > > > +	if (WARN_ON(!ept))
> > > > > +		return -EINVAL;
> > > > > +	if (!ept->ops->set_flow_control)
> > > > > +		return -ENXIO;
> > > > > +
> > > > > +	return ept->ops->set_flow_control(ept, enable);
> > > > > +}
> > > > > +EXPORT_SYMBOL(rpmsg_set_flow_control);
> > > > > +
> > > > 
> > > > I'm looking at this patchset as the introduction of an out-of-bound
> > > > control interface.  But looking at the implementation of the GLINK's
> > > > set_flow_control() the data is sent in-band, making me perplexed about
> > > > introducing a new rpmsg_endpoint_ops for something that could be done
> > > > from user space.  Especially when user space is triggering the message
> > > > with an ioctl in patch 3.
> > > > 
> > > 
> > > GLINK is built around one fifo per processor pair, similar to a
> > > virtqueue. So the signal request is muxed in the same pipe as data
> > > requests, but the signal goes alongside data request, not within them.
> > >
> > 
> > I reflected more on this and I can see scenarios where sending control flow
> > messages alongside other data packet could be the only solution.  How the signal
> > is implemented is a platform specific choice.  I believe the same kind of
> > delivery mechanism implemented by kick() functions would be the best way to go
> > but if that isn't possible then in-band, as suggested in this patchset, is
> > better than nothing. 
> > 
> > > > Moreover this interface is case specific and doesn't reflect the
> > > > generic nature found in ept->sig_cb.
> > > > 
> > > 
> > > The previous proposal from Deepak was to essentially expose the normal
> > > tty flags all the way down to the rpmsg driver. But I wasn't sure how
> > > those various flags should be interpreted in the typical rpmsg driver.
> > 
> > That is interesting.  I was hoping to keep the user level signal interfaces
> > generic and let the drivers do as they please with them.  I see your point
> > though and this might be one of those cases where there isn't a right or wrong
> > answer.
> > 
> 
> I'm definitely in favor of something generic, my objection was simply to
> inherit the tty interface as that generic thing.
> 
> If nothing else I myself have a hard time understanding the actual
> meaning of those bits and tend to have to look them up every time.
> 
> > > 
> > > I therefor asked Deepak to change it so the rpmsg api would contain a
> > > single "pause incoming data"/"resume incoming data" - given that this is
> > > a wish that we've seen in a number of discussions.
> > >
> > 
> > This will work for as long as we have a single usecase for it, i.e flow control.
> > I fear things will quickly get out of hands when more messages are needed, hence
> > the idea of keeping things as generic as possible.  
> > 
> 
> Do you have any other types of signals in mind?
>

I currently don't have anything in mind but I know it will happen at one point,
hence hoping to proceed differently than having one ioctl per signal.

> > > 
> > > Unfortunately I don't have any good suggestion for how we could
> > > implement this in the virtio backend at this time, but with the muxing
> > > of all the different channels in the same virtqueue it would be good for
> > > a driver to able to pause the inflow on a specific endpoint, to avoid
> > > stalling other communication when a driver can't receive more messages.
> > 
> > Humm...
> > 
> > For application to remote processor things would work the same as it does for
> > GLINK, whether the communication is done from a rpmsg_driver (as in
> > rpmsg_client_sample.c) or from user space via something like the rpmsg_char.c
> > driver.  
> > 
> > For remote processor to application processor the interruptions would need to
> > carry the destination address of the endpoint, which might not be possible.
> > 
> > All this discussion proves that we really need to think about this before moving
> > forward, especially with Arnaud's ongoing refactoring of the rpmsg_char driver.
> > 
> 
> The concept of flow control comes pretty natural in both GLINK and SMD,
> given that an endpoint is the local representation of an established
> link to an entity on the other side - while in virtio rpmsg endpoints
> doesn't really have a state and a limited sense of there being something
> on the other side.
> 
> So I agree that flow controlling in virtio rpmsg could have unforeseen
> consequences e.g. by a service being blocked forever because it's
> waiting for "flow resume" from an endpoint that never existed.
> 
> But I believe the impact of this is that we need to accept that there
> will be cases where the flow control requests can't be fulfilled; such
> as a loose rpmsg_endpoint without a predefined dst address or when
> communicating with a remote that predates the protocol extensions that
> will be necessary.
> 
> Regards,
> Bjorn
> 
> > Thanks,
> > Mathieu
> > 
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > >  /*
> > > > >   * match a rpmsg channel with a channel info struct.
> > > > >   * this is used to make sure we're not creating rpmsg devices for channels
> > > > > @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
> > > > >  
> > > > >  		rpdev->ept = ept;
> > > > >  		rpdev->src = ept->addr;
> > > > > +
> > > > > +		if (rpdrv->signals)
> > > > > +			ept->sig_cb = rpdrv->signals;
> > > > >  	}
> > > > >  
> > > > >  	err = rpdrv->probe(rpdev);
> > > > > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > > > > index a76c344..dcb2ec1 100644
> > > > > --- a/drivers/rpmsg/rpmsg_internal.h
> > > > > +++ b/drivers/rpmsg/rpmsg_internal.h
> > > > > @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
> > > > >   * @trysendto:		see @rpmsg_trysendto(), optional
> > > > >   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> > > > >   * @poll:		see @rpmsg_poll(), optional
> > > > > + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> > > > >   *
> > > > >   * Indirection table for the operations that a rpmsg backend should implement.
> > > > >   * In addition to @destroy_ept, the backend must at least implement @send and
> > > > > @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
> > > > >  			     void *data, int len);
> > > > >  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> > > > >  			     poll_table *wait);
> > > > > +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
> > > > >  };
> > > > >  
> > > > >  struct device *rpmsg_find_device(struct device *parent,
> > > > > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > > > > index d97dcd0..b805c70 100644
> > > > > --- a/include/linux/rpmsg.h
> > > > > +++ b/include/linux/rpmsg.h
> > > > > @@ -62,12 +62,14 @@ struct rpmsg_device {
> > > > >  };
> > > > >  
> > > > >  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> > > > > +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
> > > > >  
> > > > >  /**
> > > > >   * struct rpmsg_endpoint - binds a local rpmsg address to its user
> > > > >   * @rpdev: rpmsg channel device
> > > > >   * @refcount: when this drops to zero, the ept is deallocated
> > > > >   * @cb: rx callback handler
> > > > > + * @sig_cb: rx serial signal handler
> > > > >   * @cb_lock: must be taken before accessing/changing @cb
> > > > >   * @addr: local rpmsg address
> > > > >   * @priv: private data for the driver's use
> > > > > @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
> > > > >  	struct rpmsg_device *rpdev;
> > > > >  	struct kref refcount;
> > > > >  	rpmsg_rx_cb_t cb;
> > > > > +	rpmsg_rx_sig_t sig_cb;
> > > > >  	struct mutex cb_lock;
> > > > >  	u32 addr;
> > > > >  	void *priv;
> > > > > @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
> > > > >   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
> > > > >   * @remove: invoked when the rpmsg channel is removed
> > > > >   * @callback: invoked when an inbound message is received on the channel
> > > > > + * @signals: invoked when a serial signal change is received on the channel
> > > > >   */
> > > > >  struct rpmsg_driver {
> > > > >  	struct device_driver drv;
> > > > > @@ -111,6 +115,7 @@ struct rpmsg_driver {
> > > > >  	int (*probe)(struct rpmsg_device *dev);
> > > > >  	void (*remove)(struct rpmsg_device *dev);
> > > > >  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> > > > > +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
> > > > >  };
> > > > >  
> > > > >  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> > > > > @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > > > >  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > > >  			poll_table *wait);
> > > > >  
> > > > > +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > > > > +
> > > > >  #else
> > > > >  
> > > > >  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> > > > > @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> > > > > +{
> > > > > +	/* This shouldn't be possible */
> > > > > +	WARN_ON(1);
> > > > > +
> > > > > +	return -ENXIO;
> > > > > +}
> > > > > +
> > > > >  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> > > > >  
> > > > >  /* use a macro to avoid include chaining to get THIS_MODULE */
> > > > > -- 
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > > a Linux Foundation Collaborative Project
> > > > > 
