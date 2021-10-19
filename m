Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF6B432BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 04:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJSCsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 22:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhJSCsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 22:48:39 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15470C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 19:46:27 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so196695ote.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 19:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n2gibJdl+dd9jJqPZuOZAXdph7at9JLRdd3TStlw3p4=;
        b=E6KeS0M3n5nEYvskNyfv9yvbI0Uy5FMj9xc6Tm0nDVNl0OKvPh2BYDdtv5Mzn9O7na
         roJuwSYhOTw6xT0OnLxNq8HGwqZ3Bpd96Y39vhcjHPRwBdTNsdEMaLCYl3AqF4Edd21I
         cCg0Or57O7UrpYdol5oXEO4kQtxqsgwHiCae2hMWcgs04JSHLCThe2c3QmA4zkABDYrc
         r4TJwYflU+31W+A4Cpajg/GjxJ1JK5HZN4/j+/SgLIEGSxhQF6lqVDhINlHdcP0zZ1Ml
         2Lx7LYMescy1/fQjeqA0I7xkPMSB/RI+HOcmct2Rw7MkCEN/s0kalnaT+dU29Urq0gIJ
         CFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n2gibJdl+dd9jJqPZuOZAXdph7at9JLRdd3TStlw3p4=;
        b=xDqQM5xKpwb0fofLd+egVbh3EVqER7JYgsYQAgRRYOW5e/k6PXCSqlQimfumD62ZS4
         8Wwq83gKzJk/608jjaKPESsMV1tUlz9sVqJPFqsFLpdNhPC+LBb2hv039uKhLXBK6j7O
         isS7zOWNEpG4HPlGjKg2NVLnB7SOm/uCr+aUy0GkGY/uULpSD4DKD2y1LMQbiNJteKgd
         uSHCDRfdhYrLFL9vj5Xz120g9QDD3ore5AlK+xK65FFpQaFtAZmw5azKhnlRGdRtzJ+z
         eafAokvcDtsLiW942POFjnfljir2oSEcEm5AkVX6GWgGIHrHEX8DoLuZK0MksyOcmuj6
         NFrA==
X-Gm-Message-State: AOAM531dnrczqvC5pLW2EyRJ5gmOGFM3xM6OMHo0yLWXgeO6qDDJ814P
        qLxiUC/uKpa7A5Gfhaka1X/xLw==
X-Google-Smtp-Source: ABdhPJwuRLbNwrWQpmvavoG9wYaZfPn1XhNAyZImN9YwSKsy4HQ2aulRA4kOi0mL2DVR47pCeoT9pg==
X-Received: by 2002:a9d:588d:: with SMTP id x13mr390314otg.248.1634611586124;
        Mon, 18 Oct 2021 19:46:26 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r23sm3415353otg.71.2021.10.18.19.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 19:46:25 -0700 (PDT)
Date:   Mon, 18 Oct 2021 19:48:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        swboyd@chromium.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
Message-ID: <YW4x7GTWLE02ZyqR@ripper>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
 <20211011180245.GA3817586@p14s>
 <YWpcq2Uy9wM1voRH@yoga>
 <7df52b45-be2f-62dc-dd4b-db77a42f9a7b@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df52b45-be2f-62dc-dd4b-db77a42f9a7b@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Oct 02:00 PDT 2021, Arnaud POULIQUEN wrote:

> Hello,
> 
> On 10/16/21 7:01 AM, Bjorn Andersson wrote:
> > On Mon 11 Oct 13:02 CDT 2021, Mathieu Poirier wrote:
> > 
> >> Good day Deepak,
> >>
> >> On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
> >>> Some transports like Glink support the state notifications between
> >>> clients using signals similar to serial protocol signals.
> >>> Local glink client drivers can send and receive signals to glink
> >>> clients running on remote processors.
> >>>
> >>> Add apis to support sending and receiving of signals by rpmsg clients.
> >>>
> >>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> >>> ---
> >>>  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
> >>>  drivers/rpmsg/rpmsg_internal.h |  2 ++
> >>>  include/linux/rpmsg.h          | 15 +++++++++++++++
> >>>  3 files changed, 38 insertions(+)
> >>>
> >>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >>> index 9151836..5cae50c 100644
> >>> --- a/drivers/rpmsg/rpmsg_core.c
> >>> +++ b/drivers/rpmsg/rpmsg_core.c
> >>> @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >>>  }
> >>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> >>>  
> >>> +/**
> >>> + * rpmsg_set_flow_control() - sets/clears searial flow control signals
> >>> + * @ept:	the rpmsg endpoint
> >>> + * @enable:	enable or disable serial flow control
> >>> + *
> >>> + * Returns 0 on success and an appropriate error value on failure.
> >>> + */
> >>> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> >>> +{
> >>> +	if (WARN_ON(!ept))
> >>> +		return -EINVAL;
> >>> +	if (!ept->ops->set_flow_control)
> >>> +		return -ENXIO;
> >>> +
> >>> +	return ept->ops->set_flow_control(ept, enable);
> >>> +}
> >>> +EXPORT_SYMBOL(rpmsg_set_flow_control);
> >>> +
> >>
> >> I'm looking at this patchset as the introduction of an out-of-bound
> >> control interface.  But looking at the implementation of the GLINK's
> >> set_flow_control() the data is sent in-band, making me perplexed about
> >> introducing a new rpmsg_endpoint_ops for something that could be done
> >> from user space.  Especially when user space is triggering the message
> >> with an ioctl in patch 3.
> >>
> > 
> > GLINK is built around one fifo per processor pair, similar to a
> > virtqueue. So the signal request is muxed in the same pipe as data
> > requests, but the signal goes alongside data request, not within them.
> 
> That would be the equivalent of 2 additional virtqueues in virtio RPmsg backend
> - two virtqueues for the stream,
> - two virtqueues for the control
> Right?
> 

Imagine rather the equivalent of struct rpmsg_hdr carrying a "type"
field to specify if the payload is data, channel open, close, open_ack,
close_ack and flow control commands.

I.e. only "data" will be passed up to the client, the other types of
messages are interpreted internally.

> > 
> >> Moreover this interface is case specific and doesn't reflect the
> >> generic nature found in ept->sig_cb.
> >>
> > 
> > The previous proposal from Deepak was to essentially expose the normal
> > tty flags all the way down to the rpmsg driver. But I wasn't sure how
> > those various flags should be interpreted in the typical rpmsg driver.
> > 
> > I therefor asked Deepak to change it so the rpmsg api would contain a
> > single "pause incoming data"/"resume incoming data" - given that this is
> > a wish that we've seen in a number of discussions.
> > 
> > 
> > Unfortunately I don't have any good suggestion for how we could
> > implement this in the virtio backend at this time, but with the muxing
> > of all the different channels in the same virtqueue it would be good for
> > a driver to able to pause the inflow on a specific endpoint, to avoid
> > stalling other communication when a driver can't receive more messages.
> 
> yes this feature is something that would improve the rpmsg protocol.this could
> also be interesting to pause some services on suspend.
> If I well remember we also spoke about QOS, with possibility to define allocated
> bandwidth per service.
> 
> In proposed implementation the signaling is managed in RPMsg backend. This means
> that the backend has to be aware about the signaling defined in a service. In
> some other term the signaling is fixed by the backend, and this patchset would
> fix the signaling for all the backend, right?

Correct, it's the responsibility of the backend to exchange the flow
control signals.

> In this case shouldn't it be part of the rpmsg core?
> 

In the case of GLINK flow control is inband control messages, for SMD
it's status bits in a fixed located "per-channel information struct".
And when we have talked about introducing this for virtio we have toyed
with the idea of creating a single control channel to exchange them.

So I don't think we have the ability to push the implementation itself
into the core, but I think if we define a small set of well defined
operations (such as flow on/off), it should be fairly straight forward
to implement these in the backend.

> Then to be able to transfer signaling to the remote processor based on RPMsg
> protocol
> I suppose that the signaling has to be encapsulated in a RPMsg sent by an
> endpoint to a remote endpoint.
> 
> How to do you keep compatibility with the legacy (no flow control)?
> 

In the case of the two Qualcomm protocols we simply have been ignoring
them upstream and Qualcomm have carried downstream patches adding this
functionality.

This has worked out okay, because in addition to the explicit flow
control there's above described data packets are also governed by a
sliding window-like flow control. So no single channel is able to
completely saturate the link.

But for certain applications explicit flow control is necessary.

> What about associating a control endpoint with a channel?
> A channel could contain:
> - a default data ept (the exiting one)
> - a default control endpoint (the new one).

As both GLINK and SMD has these operations defined in the protocol
itself and the firmware is already written, I don't think we can come up
with something completely generic.

> 
> We could extend the ns announcement mechanism to notify the control endpoint to
> a remote processor...
> 

But I think these are good suggestions for how this functionality could
be implemented in the virtio backend.

Or one could borrow the design from GLINK and make use of the "reserved"
filed in struct rpmsg_hdr?

Regards,
Bjorn

> Regards,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >>>  /*
> >>>   * match a rpmsg channel with a channel info struct.
> >>>   * this is used to make sure we're not creating rpmsg devices for channels
> >>> @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
> >>>  
> >>>  		rpdev->ept = ept;
> >>>  		rpdev->src = ept->addr;
> >>> +
> >>> +		if (rpdrv->signals)
> >>> +			ept->sig_cb = rpdrv->signals;
> >>>  	}
> >>>  
> >>>  	err = rpdrv->probe(rpdev);
> >>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> >>> index a76c344..dcb2ec1 100644
> >>> --- a/drivers/rpmsg/rpmsg_internal.h
> >>> +++ b/drivers/rpmsg/rpmsg_internal.h
> >>> @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
> >>>   * @trysendto:		see @rpmsg_trysendto(), optional
> >>>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> >>>   * @poll:		see @rpmsg_poll(), optional
> >>> + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> >>>   *
> >>>   * Indirection table for the operations that a rpmsg backend should implement.
> >>>   * In addition to @destroy_ept, the backend must at least implement @send and
> >>> @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
> >>>  			     void *data, int len);
> >>>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> >>>  			     poll_table *wait);
> >>> +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
> >>>  };
> >>>  
> >>>  struct device *rpmsg_find_device(struct device *parent,
> >>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> >>> index d97dcd0..b805c70 100644
> >>> --- a/include/linux/rpmsg.h
> >>> +++ b/include/linux/rpmsg.h
> >>> @@ -62,12 +62,14 @@ struct rpmsg_device {
> >>>  };
> >>>  
> >>>  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> >>> +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
> >>>  
> >>>  /**
> >>>   * struct rpmsg_endpoint - binds a local rpmsg address to its user
> >>>   * @rpdev: rpmsg channel device
> >>>   * @refcount: when this drops to zero, the ept is deallocated
> >>>   * @cb: rx callback handler
> >>> + * @sig_cb: rx serial signal handler
> >>>   * @cb_lock: must be taken before accessing/changing @cb
> >>>   * @addr: local rpmsg address
> >>>   * @priv: private data for the driver's use
> >>> @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
> >>>  	struct rpmsg_device *rpdev;
> >>>  	struct kref refcount;
> >>>  	rpmsg_rx_cb_t cb;
> >>> +	rpmsg_rx_sig_t sig_cb;
> >>>  	struct mutex cb_lock;
> >>>  	u32 addr;
> >>>  	void *priv;
> >>> @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
> >>>   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
> >>>   * @remove: invoked when the rpmsg channel is removed
> >>>   * @callback: invoked when an inbound message is received on the channel
> >>> + * @signals: invoked when a serial signal change is received on the channel
> >>>   */
> >>>  struct rpmsg_driver {
> >>>  	struct device_driver drv;
> >>> @@ -111,6 +115,7 @@ struct rpmsg_driver {
> >>>  	int (*probe)(struct rpmsg_device *dev);
> >>>  	void (*remove)(struct rpmsg_device *dev);
> >>>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> >>> +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
> >>>  };
> >>>  
> >>>  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> >>> @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>>  			poll_table *wait);
> >>>  
> >>> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> >>> +
> >>>  #else
> >>>  
> >>>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> >>> @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> >>>  	return 0;
> >>>  }
> >>>  
> >>> +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
> >>> +{
> >>> +	/* This shouldn't be possible */
> >>> +	WARN_ON(1);
> >>> +
> >>> +	return -ENXIO;
> >>> +}
> >>> +
> >>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> >>>  
> >>>  /* use a macro to avoid include chaining to get THIS_MODULE */
> >>> -- 
> >>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >>> a Linux Foundation Collaborative Project
> >>>
