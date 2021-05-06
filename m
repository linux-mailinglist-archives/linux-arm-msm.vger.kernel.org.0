Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2419437591A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbhEFRTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:19:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42017 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235881AbhEFRTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:19:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620321528; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+nCwIMPWKByZx58DsVTPusnFKpRmeyq4KgLpfZ2JfkE=; b=fGNogDpUWI6SmsenUtDWeUhHhlUPVKhvcrQ8L20HEtalA4gvs+a5kg5Cdc91T66W27vzWl/g
 E0ePD6RPjhf0vzgn7XyC2LE9F1GVJ41tEfnOYeNdmDQqAbxaa5r9GAllcJHwHAlgHLbaypMx
 u3yTRAYowhWLgf3+aMUAXr2+DBA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 609424f8f34440a9d494350d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 17:18:48
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCD6FC43143; Thu,  6 May 2021 17:18:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.3] (unknown [122.163.131.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1B2AC4338A;
        Thu,  6 May 2021 17:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C1B2AC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V6 1/4] rpmsg: core: Add signal API support
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org,
        mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
References: <1620320818-2206-1-git-send-email-deesin@codeaurora.org>
 <1593182819-30747-2-git-send-email-deesin@codeaurora.org>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <2113e8c5-582e-e0d6-e700-d2cc2020746f@codeaurora.org>
Date:   Thu, 6 May 2021 22:48:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1593182819-30747-2-git-send-email-deesin@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please ignore V6 patch set for rpmsg: core: Add signal API support.

Wrongly pushed.

On 5/6/2021 10:36 PM, Deepak Kumar Singh wrote:
> Some transports like Glink support the state notifications between
> clients using signals similar to serial protocol signals.
> Local glink client drivers can send and receive signals to glink
> clients running on remote processors.
>
> Add apis to support sending and receiving of signals by rpmsg clients.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>   drivers/rpmsg/rpmsg_core.c     | 40 ++++++++++++++++++++++++++++++++++++++++
>   drivers/rpmsg/rpmsg_internal.h |  5 +++++
>   include/linux/rpmsg.h          | 27 +++++++++++++++++++++++++++
>   3 files changed, 72 insertions(+)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 91de940..e6eb5a1 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,42 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>   }
>   EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>   
> +/**
> + * rpmsg_get_signals() - get the signals for this endpoint
> + * @ept:	the rpmsg endpoint
> + *
> + * Returns signal bits on success and an appropriate error value on failure.
> + */
> +int rpmsg_get_signals(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_signals)
> +		return -ENXIO;
> +
> +	return ept->ops->get_signals(ept);
> +}
> +EXPORT_SYMBOL(rpmsg_get_signals);
> +
> +/**
> + * rpmsg_set_signals() - set the remote signals for this endpoint
> + * @ept:	the rpmsg endpoint
> + * @set:	set mask for signals
> + * @clear:	clear mask for signals
> + *
> + * Returns 0 on success and an appropriate error value on failure.
> + */
> +int rpmsg_set_signals(struct rpmsg_endpoint *ept, u32 set, u32 clear)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->set_signals)
> +		return -ENXIO;
> +
> +	return ept->ops->set_signals(ept, set, clear);
> +}
> +EXPORT_SYMBOL(rpmsg_set_signals);
> +
>   /*
>    * match a rpmsg channel with a channel info struct.
>    * this is used to make sure we're not creating rpmsg devices for channels
> @@ -468,6 +504,10 @@ static int rpmsg_dev_probe(struct device *dev)
>   
>   		rpdev->ept = ept;
>   		rpdev->src = ept->addr;
> +
> +		if (rpdrv->signals)
> +			ept->sig_cb = rpdrv->signals;
> +
>   	}
>   
>   	err = rpdrv->probe(rpdev);
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd..8958d6c 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -2,6 +2,7 @@
>   /*
>    * remote processor messaging bus internals
>    *
> + * Copyright (c) 2018, The Linux Foundation.
>    * Copyright (C) 2011 Texas Instruments, Inc.
>    * Copyright (C) 2011 Google, Inc.
>    *
> @@ -47,6 +48,8 @@ struct rpmsg_device_ops {
>    * @trysendto:		see @rpmsg_trysendto(), optional
>    * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>    * @poll:		see @rpmsg_poll(), optional
> + * @get_signals:	see @rpmsg_get_signals(), optional
> + * @set_signals:	see @rpmsg_set_signals(), optional
>    *
>    * Indirection table for the operations that a rpmsg backend should implement.
>    * In addition to @destroy_ept, the backend must at least implement @send and
> @@ -66,6 +69,8 @@ struct rpmsg_endpoint_ops {
>   			     void *data, int len);
>   	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>   			     poll_table *wait);
> +	int (*get_signals)(struct rpmsg_endpoint *ept);
> +	int (*set_signals)(struct rpmsg_endpoint *ept, u32 set, u32 clear);
>   };
>   
>   int rpmsg_register_device(struct rpmsg_device *rpdev);
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 9fe156d..c4dbb47 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -2,6 +2,7 @@
>   /*
>    * Remote processor messaging
>    *
> + * Copyright (c) 2018 The Linux Foundation.
>    * Copyright (C) 2011 Texas Instruments, Inc.
>    * Copyright (C) 2011 Google, Inc.
>    * All rights reserved.
> @@ -60,6 +61,7 @@ struct rpmsg_device {
>   };
>   
>   typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32, u32);
>   
>   /**
>    * struct rpmsg_endpoint - binds a local rpmsg address to its user
> @@ -67,6 +69,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
>    * @refcount: when this drops to zero, the ept is deallocated
>    * @cb: rx callback handler
>    * @cb_lock: must be taken before accessing/changing @cb
> + * @sig_cb: rx serial signal handler
>    * @addr: local rpmsg address
>    * @priv: private data for the driver's use
>    *
> @@ -89,6 +92,7 @@ struct rpmsg_endpoint {
>   	struct kref refcount;
>   	rpmsg_rx_cb_t cb;
>   	struct mutex cb_lock;
> +	rpmsg_rx_sig_t sig_cb;
>   	u32 addr;
>   	void *priv;
>   
> @@ -102,6 +106,7 @@ struct rpmsg_endpoint {
>    * @probe: invoked when a matching rpmsg channel (i.e. device) is found
>    * @remove: invoked when the rpmsg channel is removed
>    * @callback: invoked when an inbound message is received on the channel
> + * @signals: invoked when a serial signal change is received on the channel
>    */
>   struct rpmsg_driver {
>   	struct device_driver drv;
> @@ -109,6 +114,8 @@ struct rpmsg_driver {
>   	int (*probe)(struct rpmsg_device *dev);
>   	void (*remove)(struct rpmsg_device *dev);
>   	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> +	int (*signals)(struct rpmsg_device *rpdev,
> +		       void *priv, u32 old, u32 new);
>   };
>   
>   #if IS_ENABLED(CONFIG_RPMSG)
> @@ -135,6 +142,9 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>   __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>   			poll_table *wait);
>   
> +int rpmsg_get_signals(struct rpmsg_endpoint *ept);
> +int rpmsg_set_signals(struct rpmsg_endpoint *ept, u32 set, u32 clear);
> +
>   #else
>   
>   static inline int register_rpmsg_device(struct rpmsg_device *dev)
> @@ -242,6 +252,23 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>   	return 0;
>   }
>   
> +static inline int rpmsg_get_signals(struct rpmsg_endpoint *ept)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
> +static inline int rpmsg_set_signals(struct rpmsg_endpoint *ept,
> +				    u32 set, u32 clear)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
>   #endif /* IS_ENABLED(CONFIG_RPMSG) */
>   
>   /* use a macro to avoid include chaining to get THIS_MODULE */
>
