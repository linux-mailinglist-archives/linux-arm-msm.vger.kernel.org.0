Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F20213BA8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 08:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgAOH4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 02:56:52 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:9290 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726088AbgAOH4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 02:56:52 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00F7s3i2016770;
        Wed, 15 Jan 2020 08:56:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+FyPAJhyAahmD983zlanIo1zEgFOFkL6x75eCA0EJng=;
 b=0Wo1EgMnic89ZQHRLDGCXbtR8D/XkSsw4bkxP9ptbz9xt1DIrf3NVkCCaytJBlBGUWYS
 EkhnjCOQHer4r9EQWJjDrXyF18qmFSkJfRMi9CfrmlSJYQ+6P97Cu7N/e4W8tefGfDe/
 1j70LqQ5wCmDxN/SDraWWF0icMlxpzvXfxVeyiN4+BmLyKJGqu0Q7ZiJ9o2dCySRvwWh
 nKe1rESm4LZoCYrt8kg8Xw5ESfzs9lA6mOOJDKEKV9StykP+fgZIjwyEfzwZZeM8IPEl
 7g2/Qtu8KhgsDWwI5I7T8HFZ2mjbDyoiUt8jQG4CKiPvGAi95JvemqH18Y440E8QMOTl Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf78s9vvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Jan 2020 08:56:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF8AB10002A;
        Wed, 15 Jan 2020 08:56:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 965FB210F85;
        Wed, 15 Jan 2020 08:56:45 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 08:56:44 +0100
Subject: Re: [PATCH v2] rpmsg: core: add API to get MTU
To:     Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     Fabien DESSENNE <fabien.dessenne@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
 <f0419672-f1a5-b909-2dff-c611f852919b@st.com>
 <90bec284-6a99-e75f-1609-de763048a1e2@ti.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <92891482-3d8c-8c4c-9100-bb23d6ac628e@st.com>
Date:   Wed, 15 Jan 2020 08:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <90bec284-6a99-e75f-1609-de763048a1e2@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-14_06:2020-01-14,2020-01-14 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suman,

On 1/15/20 12:40 AM, Suman Anna wrote:
> Hi Arnaud,
> 
> On 1/13/20 7:19 AM, Arnaud POULIQUEN wrote:
>> Hi Bjorn, Suman,
>>
>> Gentleman reminder :)
> 
> Thanks for the revised version, and very sorry about the delay.  Only
> one minor nit that you missed from my comments the v6 rpmsg-tty series
> [1], otherwise I am good with the changes. See below.
> 
> FWIW, I have already been using this patch on our downstream 2020 LTS
> based kernel and eliminate the the need to expose the virtio_rpmsg's
> rpmsg_hdr to rpmsg client drivers :).
Right  without this API the client needs also to know the RPMSG buffer size to
compute the MTU.
> 
>>
>> Thank in advance,
>>
>> Arnaud
>>
>> On 11/13/19 6:22 PM, Arnaud Pouliquen wrote:
>>> Return the rpmsg buffer MTU for sending message, so rpmsg users
>>> can split a long message in several sub rpmsg buffers.
>>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>> ---
>>>  V1 to V2
>>>
>>>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>>>   - Change patch title,
>>>   - as not solution today to support MTU on GLINK make ops optional,
>>>     RPMsg client API returns -ENOTSUPP in this case,
>>>   - suppress smd and glink patches.
>>> ---
>>>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>>  include/linux/rpmsg.h            | 10 ++++++++++
>>>  4 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>> index e330ec4dfc33..a6ef54c4779a 100644
>>> --- a/drivers/rpmsg/rpmsg_core.c
>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  }
>>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>>  
>>> +/**
>>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>>> + * @ept: the rpmsg endpoint
>>> + *
>>> + * This function returns maximum buffer size available for a single message.
>>> + *
>>> + * Return: the maximum transmission size on success and an appropriate error
>>> + * value on failure.
>>> + */
>>> +
>>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>> +{
>>> +	if (WARN_ON(!ept))
>>> +		return -EINVAL;
>>> +	if (!ept->ops->get_mtu)
>>> +		return -ENOTSUPP;
>>> +
>>> +	return ept->ops->get_mtu(ept);
>>> +}
>>> +EXPORT_SYMBOL(rpmsg_get_mtu);
>>> +
>>>  /*
>>>   * match an rpmsg channel with a channel info struct.
>>>   * this is used to make sure we're not creating rpmsg devices for channels
>>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>>> index 3fc83cd50e98..0e56e046f5c6 100644
>>> --- a/drivers/rpmsg/rpmsg_internal.h
>>> +++ b/drivers/rpmsg/rpmsg_internal.h
>>> @@ -47,6 +47,7 @@ struct rpmsg_device_ops {
>>>   * @trysendto:		see @rpmsg_trysendto(), optional
>>>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>>>   * @poll:		see @rpmsg_poll(), optional
>>> + * @get_mtu:		see @get_mpu(), optional
> 
> In the description for the ops, 'mpu' is a typo. My earlier comment was
> essentially,
> %s/see @get_mpu()/see @rpmsg_get_mtu()/
Sorry, completly missed it i sent a v3

Thanks,
Arnaud

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/patch/11130209/
> 
>>>   *
>>>   * Indirection table for the operations that a rpmsg backend should implement.
>>>   * In addition to @destroy_ept, the backend must at least implement @send and
>>> @@ -66,6 +67,7 @@ struct rpmsg_endpoint_ops {
>>>  			     void *data, int len);
>>>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>>  			     poll_table *wait);
>>> +	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
>>>  };
>>>  
>>>  int rpmsg_register_device(struct rpmsg_device *rpdev);
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> index 376ebbf880d6..6e48fdf24555 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -175,6 +175,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>>>  				  int len, u32 dst);
>>>  static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>>  					   u32 dst, void *data, int len);
>>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>>>  
>>>  static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>>  	.destroy_ept = virtio_rpmsg_destroy_ept,
>>> @@ -184,6 +185,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>>  	.trysend = virtio_rpmsg_trysend,
>>>  	.trysendto = virtio_rpmsg_trysendto,
>>>  	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
>>> +	.get_mtu = virtio_rpmsg_get_mtu,
>>>  };
>>>  
>>>  /**
>>> @@ -699,6 +701,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>>>  }
>>>  
>>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>> +{
>>> +	struct rpmsg_device *rpdev = ept->rpdev;
>>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>> +
>>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>> +}
>>> +
>>>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>>  			     struct rpmsg_hdr *msg, unsigned int len)
>>>  {
>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>> index 9fe156d1c018..88d7892ca93d 100644
>>> --- a/include/linux/rpmsg.h
>>> +++ b/include/linux/rpmsg.h
>>> @@ -135,6 +135,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>>  			poll_table *wait);
>>>  
>>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>>> +
>>>  #else
>>>  
>>>  static inline int register_rpmsg_device(struct rpmsg_device *dev)
>>> @@ -242,6 +244,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>>  	return 0;
>>>  }
>>>  
>>> +static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
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
>>>
> 
