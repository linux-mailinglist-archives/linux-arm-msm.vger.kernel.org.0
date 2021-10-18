Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB924312A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 11:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhJRJCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 05:02:37 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51484 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231213AbhJRJCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 05:02:37 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I8F84Z025984;
        Mon, 18 Oct 2021 11:00:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dwaz2Mrk7ql+sMLF/c6xyXxsZ3Ss2e61GxZ8zsfU+rY=;
 b=fLL3yd35gXYzVlXNJJEqyMinmga+RIZy4aFAAi+WxTqCgzd+ukDXYuhnuy+B/C2eQJHr
 Wy+mRj0HWFYhaag7/6oCKmDNknlKj73sv4ilBt+NtreW0vPDVrCqHVpuKHJeDEhHTGhp
 1fQZUZkYjtr/aboDu++jZyA8UwYVSEB9HGAQ2ExObFlJ3+Cmti5/aPpEu6A1lIzcTzSp
 GQ/FoF42C4QrXIp1VBNu5u99G9XXMFDteI+aUsFJ2VjqoSERCVbTZYtUfmobUo4gRTLe
 yJYzmPRhKZzmgVDJTZlN88npTCdODn8V3M4SY8UFy+DrGkugCobYwjnXNbw52Po05AyT UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3brxk9aesm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Oct 2021 11:00:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8E4D10002A;
        Mon, 18 Oct 2021 11:00:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE528215147;
        Mon, 18 Oct 2021 11:00:12 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 11:00:12 +0200
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Deepak Kumar Singh <deesin@codeaurora.org>, <swboyd@chromium.org>,
        <clew@codeaurora.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-2-git-send-email-deesin@codeaurora.org>
 <20211011180245.GA3817586@p14s> <YWpcq2Uy9wM1voRH@yoga>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <7df52b45-be2f-62dc-dd4b-db77a42f9a7b@foss.st.com>
Date:   Mon, 18 Oct 2021 11:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWpcq2Uy9wM1voRH@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On 10/16/21 7:01 AM, Bjorn Andersson wrote:
> On Mon 11 Oct 13:02 CDT 2021, Mathieu Poirier wrote:
> 
>> Good day Deepak,
>>
>> On Thu, Sep 30, 2021 at 09:02:01PM +0530, Deepak Kumar Singh wrote:
>>> Some transports like Glink support the state notifications between
>>> clients using signals similar to serial protocol signals.
>>> Local glink client drivers can send and receive signals to glink
>>> clients running on remote processors.
>>>
>>> Add apis to support sending and receiving of signals by rpmsg clients.
>>>
>>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>>> ---
>>>  drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
>>>  drivers/rpmsg/rpmsg_internal.h |  2 ++
>>>  include/linux/rpmsg.h          | 15 +++++++++++++++
>>>  3 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>> index 9151836..5cae50c 100644
>>> --- a/drivers/rpmsg/rpmsg_core.c
>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>> @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  }
>>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>>  
>>> +/**
>>> + * rpmsg_set_flow_control() - sets/clears searial flow control signals
>>> + * @ept:	the rpmsg endpoint
>>> + * @enable:	enable or disable serial flow control
>>> + *
>>> + * Returns 0 on success and an appropriate error value on failure.
>>> + */
>>> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
>>> +{
>>> +	if (WARN_ON(!ept))
>>> +		return -EINVAL;
>>> +	if (!ept->ops->set_flow_control)
>>> +		return -ENXIO;
>>> +
>>> +	return ept->ops->set_flow_control(ept, enable);
>>> +}
>>> +EXPORT_SYMBOL(rpmsg_set_flow_control);
>>> +
>>
>> I'm looking at this patchset as the introduction of an out-of-bound
>> control interface.  But looking at the implementation of the GLINK's
>> set_flow_control() the data is sent in-band, making me perplexed about
>> introducing a new rpmsg_endpoint_ops for something that could be done
>> from user space.  Especially when user space is triggering the message
>> with an ioctl in patch 3.
>>
> 
> GLINK is built around one fifo per processor pair, similar to a
> virtqueue. So the signal request is muxed in the same pipe as data
> requests, but the signal goes alongside data request, not within them.

That would be the equivalent of 2 additional virtqueues in virtio RPmsg backend
- two virtqueues for the stream,
- two virtqueues for the control
Right?

> 
>> Moreover this interface is case specific and doesn't reflect the
>> generic nature found in ept->sig_cb.
>>
> 
> The previous proposal from Deepak was to essentially expose the normal
> tty flags all the way down to the rpmsg driver. But I wasn't sure how
> those various flags should be interpreted in the typical rpmsg driver.
> 
> I therefor asked Deepak to change it so the rpmsg api would contain a
> single "pause incoming data"/"resume incoming data" - given that this is
> a wish that we've seen in a number of discussions.
> 
> 
> Unfortunately I don't have any good suggestion for how we could
> implement this in the virtio backend at this time, but with the muxing
> of all the different channels in the same virtqueue it would be good for
> a driver to able to pause the inflow on a specific endpoint, to avoid
> stalling other communication when a driver can't receive more messages.

yes this feature is something that would improve the rpmsg protocol.this could
also be interesting to pause some services on suspend.
If I well remember we also spoke about QOS, with possibility to define allocated
bandwidth per service.

In proposed implementation the signaling is managed in RPMsg backend. This means
that the backend has to be aware about the signaling defined in a service. In
some other term the signaling is fixed by the backend, and this patchset would
fix the signaling for all the backend, right?
In this case shouldn't it be part of the rpmsg core?

Then to be able to transfer signaling to the remote processor based on RPMsg
protocol
I suppose that the signaling has to be encapsulated in a RPMsg sent by an
endpoint to a remote endpoint.

How to do you keep compatibility with the legacy (no flow control)?

What about associating a control endpoint with a channel?
A channel could contain:
- a default data ept (the exiting one)
- a default control endpoint (the new one).

We could extend the ns announcement mechanism to notify the control endpoint to
a remote processor...

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>>>  /*
>>>   * match a rpmsg channel with a channel info struct.
>>>   * this is used to make sure we're not creating rpmsg devices for channels
>>> @@ -514,6 +532,9 @@ static int rpmsg_dev_probe(struct device *dev)
>>>  
>>>  		rpdev->ept = ept;
>>>  		rpdev->src = ept->addr;
>>> +
>>> +		if (rpdrv->signals)
>>> +			ept->sig_cb = rpdrv->signals;
>>>  	}
>>>  
>>>  	err = rpdrv->probe(rpdev);
>>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>>> index a76c344..dcb2ec1 100644
>>> --- a/drivers/rpmsg/rpmsg_internal.h
>>> +++ b/drivers/rpmsg/rpmsg_internal.h
>>> @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
>>>   * @trysendto:		see @rpmsg_trysendto(), optional
>>>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>>>   * @poll:		see @rpmsg_poll(), optional
>>> + * @set_flow_control:	see @rpmsg_set_flow_control(), optional
>>>   *
>>>   * Indirection table for the operations that a rpmsg backend should implement.
>>>   * In addition to @destroy_ept, the backend must at least implement @send and
>>> @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
>>>  			     void *data, int len);
>>>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>>  			     poll_table *wait);
>>> +	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
>>>  };
>>>  
>>>  struct device *rpmsg_find_device(struct device *parent,
>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>> index d97dcd0..b805c70 100644
>>> --- a/include/linux/rpmsg.h
>>> +++ b/include/linux/rpmsg.h
>>> @@ -62,12 +62,14 @@ struct rpmsg_device {
>>>  };
>>>  
>>>  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
>>> +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
>>>  
>>>  /**
>>>   * struct rpmsg_endpoint - binds a local rpmsg address to its user
>>>   * @rpdev: rpmsg channel device
>>>   * @refcount: when this drops to zero, the ept is deallocated
>>>   * @cb: rx callback handler
>>> + * @sig_cb: rx serial signal handler
>>>   * @cb_lock: must be taken before accessing/changing @cb
>>>   * @addr: local rpmsg address
>>>   * @priv: private data for the driver's use
>>> @@ -90,6 +92,7 @@ struct rpmsg_endpoint {
>>>  	struct rpmsg_device *rpdev;
>>>  	struct kref refcount;
>>>  	rpmsg_rx_cb_t cb;
>>> +	rpmsg_rx_sig_t sig_cb;
>>>  	struct mutex cb_lock;
>>>  	u32 addr;
>>>  	void *priv;
>>> @@ -104,6 +107,7 @@ struct rpmsg_endpoint {
>>>   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
>>>   * @remove: invoked when the rpmsg channel is removed
>>>   * @callback: invoked when an inbound message is received on the channel
>>> + * @signals: invoked when a serial signal change is received on the channel
>>>   */
>>>  struct rpmsg_driver {
>>>  	struct device_driver drv;
>>> @@ -111,6 +115,7 @@ struct rpmsg_driver {
>>>  	int (*probe)(struct rpmsg_device *dev);
>>>  	void (*remove)(struct rpmsg_device *dev);
>>>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
>>> +	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32);
>>>  };
>>>  
>>>  static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
>>> @@ -186,6 +191,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>>  			poll_table *wait);
>>>  
>>> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
>>> +
>>>  #else
>>>  
>>>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
>>> @@ -296,6 +303,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>>  	return 0;
>>>  }
>>>  
>>> +static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
>>> +{
>>> +	/* This shouldn't be possible */
>>> +	WARN_ON(1);
>>> +
>>> +	return -ENXIO;
>>> +}
>>> +
>>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>>  
>>>  /* use a macro to avoid include chaining to get THIS_MODULE */
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>> a Linux Foundation Collaborative Project
>>>
