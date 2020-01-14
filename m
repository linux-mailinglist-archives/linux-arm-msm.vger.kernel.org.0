Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FB413B605
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 00:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgANXlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 18:41:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39572 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgANXlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 18:41:02 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00ENesdv035350;
        Tue, 14 Jan 2020 17:40:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579045254;
        bh=ie2Vxrz7QQ+MlmI4XvpTQIVsHcPUy091HFySdvO8gsA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AjVoG7d3GEoCkbikZNxzCww23Uy9X8v5LtkswhXd9EL4VAoIQKSQT3hk4f6gws5ew
         JQhKrUU/42asMICpggu1G09crkaZMtjnPQkWOX8aka/6znPEGFFn2qH5e1PH/AjfWz
         6WvPAvlpUHnZJLjF+TOCpK04bSgjpy3O88t1MXoc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00ENesmW051846
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jan 2020 17:40:54 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Jan 2020 17:40:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Jan 2020 17:40:54 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00ENerel111270;
        Tue, 14 Jan 2020 17:40:54 -0600
Subject: Re: [PATCH v2] rpmsg: core: add API to get MTU
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     Fabien DESSENNE <fabien.dessenne@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
 <f0419672-f1a5-b909-2dff-c611f852919b@st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <90bec284-6a99-e75f-1609-de763048a1e2@ti.com>
Date:   Tue, 14 Jan 2020 17:40:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f0419672-f1a5-b909-2dff-c611f852919b@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnaud,

On 1/13/20 7:19 AM, Arnaud POULIQUEN wrote:
> Hi Bjorn, Suman,
> 
> Gentleman reminder :)

Thanks for the revised version, and very sorry about the delay.  Only
one minor nit that you missed from my comments the v6 rpmsg-tty series
[1], otherwise I am good with the changes. See below.

FWIW, I have already been using this patch on our downstream 2020 LTS
based kernel and eliminate the the need to expose the virtio_rpmsg's
rpmsg_hdr to rpmsg client drivers :).

> 
> Thank in advance,
> 
> Arnaud
> 
> On 11/13/19 6:22 PM, Arnaud Pouliquen wrote:
>> Return the rpmsg buffer MTU for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  V1 to V2
>>
>>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>>   - Change patch title,
>>   - as not solution today to support MTU on GLINK make ops optional,
>>     RPMsg client API returns -ENOTSUPP in this case,
>>   - suppress smd and glink patches.
>> ---
>>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>  include/linux/rpmsg.h            | 10 ++++++++++
>>  4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index e330ec4dfc33..a6ef54c4779a 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  }
>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>  
>> +/**
>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>> + * @ept: the rpmsg endpoint
>> + *
>> + * This function returns maximum buffer size available for a single message.
>> + *
>> + * Return: the maximum transmission size on success and an appropriate error
>> + * value on failure.
>> + */
>> +
>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	if (WARN_ON(!ept))
>> +		return -EINVAL;
>> +	if (!ept->ops->get_mtu)
>> +		return -ENOTSUPP;
>> +
>> +	return ept->ops->get_mtu(ept);
>> +}
>> +EXPORT_SYMBOL(rpmsg_get_mtu);
>> +
>>  /*
>>   * match an rpmsg channel with a channel info struct.
>>   * this is used to make sure we're not creating rpmsg devices for channels
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 3fc83cd50e98..0e56e046f5c6 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -47,6 +47,7 @@ struct rpmsg_device_ops {
>>   * @trysendto:		see @rpmsg_trysendto(), optional
>>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>>   * @poll:		see @rpmsg_poll(), optional
>> + * @get_mtu:		see @get_mpu(), optional

In the description for the ops, 'mpu' is a typo. My earlier comment was
essentially,
%s/see @get_mpu()/see @rpmsg_get_mtu()/

regards
Suman

[1] https://patchwork.kernel.org/patch/11130209/

>>   *
>>   * Indirection table for the operations that a rpmsg backend should implement.
>>   * In addition to @destroy_ept, the backend must at least implement @send and
>> @@ -66,6 +67,7 @@ struct rpmsg_endpoint_ops {
>>  			     void *data, int len);
>>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>  			     poll_table *wait);
>> +	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
>>  };
>>  
>>  int rpmsg_register_device(struct rpmsg_device *rpdev);
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 376ebbf880d6..6e48fdf24555 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -175,6 +175,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>>  				  int len, u32 dst);
>>  static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>  					   u32 dst, void *data, int len);
>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>>  
>>  static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>  	.destroy_ept = virtio_rpmsg_destroy_ept,
>> @@ -184,6 +185,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>  	.trysend = virtio_rpmsg_trysend,
>>  	.trysendto = virtio_rpmsg_trysendto,
>>  	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
>> +	.get_mtu = virtio_rpmsg_get_mtu,
>>  };
>>  
>>  /**
>> @@ -699,6 +701,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>>  }
>>  
>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	struct rpmsg_device *rpdev = ept->rpdev;
>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> +
>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +}
>> +
>>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>  			     struct rpmsg_hdr *msg, unsigned int len)
>>  {
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 9fe156d1c018..88d7892ca93d 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -135,6 +135,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  			poll_table *wait);
>>  
>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>> +
>>  #else
>>  
>>  static inline int register_rpmsg_device(struct rpmsg_device *dev)
>> @@ -242,6 +244,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>  	return 0;
>>  }
>>  
>> +static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return -ENXIO;
>> +}
>> +
>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>  
>>  /* use a macro to avoid include chaining to get THIS_MODULE */
>>

