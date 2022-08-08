Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE6058D017
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 00:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbiHHWWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 18:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiHHWWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 18:22:53 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF6C17AA3;
        Mon,  8 Aug 2022 15:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659997371; x=1691533371;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IIRyQBwLJ+FDloh+ZPXw+V+/QseV+xoy6Ys7Vnv2d+U=;
  b=DOgkYitsfJzjMWGXMuEKEtRsUABt/FvFN0zVTkV+sXJQfNsVFfA6o3qO
   M1S6GxKcpgUFpDssijGoOzu62tRkH9ZmU0mf6zQuWNn5F+gF1CG91Ph/X
   ktZmtVIRKCYsBbMQ6E002dKW6/MBF8Nt5Cz87HS1dHeOQU85H+RsvTv3w
   k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Aug 2022 15:22:50 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 15:22:50 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 8 Aug 2022
 15:22:49 -0700
Message-ID: <6fa6c86d-5b4c-4048-2df8-49a36c86e7d6@quicinc.com>
Date:   Mon, 8 Aug 2022 15:22:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 07/11] gunyah: msgq: Add Gunyah message queues
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-8-quic_eberman@quicinc.com>
 <250945d2-3940-9830-63e5-beec5f44010b@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <250945d2-3940-9830-63e5-beec5f44010b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/2022 1:14 AM, Dmitry Baryshkov wrote:
> On 02/08/2022 00:12, Elliot Berman wrote:
>> Gunyah message queues are unidirectional pipelines to communicate
>> between 2 virtual machines, but are typically paired to allow
>> bidirectional communication. The intended use case is for small control
>> messages between 2 VMs, as they support a maximum of 240 bytes.
>>
>> Message queues can be discovered either by resource manager or on the
>> devicetree. To support discovery on the devicetree, client drivers can
> 
> devicetree and discovery do not quite match to me. The device is delared 
> in the DT, not discovered.
>  >> use gh_msgq_platform_host_attach to allocate the tx and rx message
>> queues according to
>> Documentation/devicetree/bindings/gunyah/qcom,hypervisor.yml.
> 
> -ENOSUCHFILE
> 

Should be Documentaton/devicetree/bindings/firmware/gunyah-hypervisor.yaml

>>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> ---
>>   arch/arm64/include/asm/gunyah.h      |   4 +
>>   drivers/virt/gunyah/Makefile         |   2 +-
>>   drivers/virt/gunyah/gunyah_private.h |   3 +
>>   drivers/virt/gunyah/msgq.c           | 223 +++++++++++++++++++++++++++
>>   drivers/virt/gunyah/sysfs.c          |   9 ++
>>   include/linux/gunyah.h               |  13 ++
>>   6 files changed, 253 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/virt/gunyah/msgq.c
>>
>> diff --git a/arch/arm64/include/asm/gunyah.h 
>> b/arch/arm64/include/asm/gunyah.h
>> index 3aee35009910..ba7398bd851b 100644
>> --- a/arch/arm64/include/asm/gunyah.h
>> +++ b/arch/arm64/include/asm/gunyah.h
>> @@ -27,6 +27,10 @@
>>                               | ((fn) & GH_CALL_FUNCTION_NUM_MASK))
>>   #define GH_HYPERCALL_HYP_IDENTIFY        GH_HYPERCALL(0x0000)
>> +#define GH_HYPERCALL_MSGQ_SEND            GH_HYPERCALL(0x001B)
>> +#define GH_HYPERCALL_MSGQ_RECV            GH_HYPERCALL(0x001C)
>> +
>> +#define GH_HYPERCALL_MSGQ_SEND_FLAGS_PUSH    BIT(0)
>>   #define ___gh_count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
>> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
>> index 3869fb7371df..94dc8e738911 100644
>> --- a/drivers/virt/gunyah/Makefile
>> +++ b/drivers/virt/gunyah/Makefile
>> @@ -1,4 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> -gunyah-y += sysfs.o device.o
>> +gunyah-y += sysfs.o device.o msgq.o
>>   obj-$(CONFIG_GUNYAH) += gunyah.o
>> \ No newline at end of file
> 
> Newline
> 
>> diff --git a/drivers/virt/gunyah/gunyah_private.h 
>> b/drivers/virt/gunyah/gunyah_private.h
>> index 5f3832608020..2ade32bd9bdf 100644
>> --- a/drivers/virt/gunyah/gunyah_private.h
>> +++ b/drivers/virt/gunyah/gunyah_private.h
>> @@ -9,4 +9,7 @@
>>   int __init gunyah_bus_init(void);
>>   void gunyah_bus_exit(void);
>> +int __init gh_msgq_init(void);
>> +void gh_msgq_exit(void);
>> +
>>   #endif
>> diff --git a/drivers/virt/gunyah/msgq.c b/drivers/virt/gunyah/msgq.c
>> new file mode 100644
>> index 000000000000..afc2572d3e7d
>> --- /dev/null
>> +++ b/drivers/virt/gunyah/msgq.c
>> @@ -0,0 +1,223 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/gunyah.h>
>> +#include <linux/module.h>
>> +#include <linux/printk.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/wait.h>
>> +
>> +#include "gunyah_private.h"
>> +
>> +struct gh_msgq {
>> +    bool ready;
>> +    wait_queue_head_t wq;
>> +    spinlock_t lock;
>> +};
>> +
>> +static irqreturn_t gh_msgq_irq_handler(int irq, void *dev)
>> +{
>> +    struct gh_msgq *msgq = dev;
>> +
>> +    spin_lock(&msgq->lock);
>> +    msgq->ready = true;
>> +    spin_unlock(&msgq->lock);
>> +    wake_up_interruptible_all(&msgq->wq);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int __gh_msgq_send(struct gunyah_device *ghdev, void *buff, 
>> size_t size, u64 tx_flags)
>> +{
>> +    unsigned long flags, gh_error;
>> +    struct gh_msgq *msgq = ghdev_get_drvdata(ghdev);
>> +    ssize_t ret;
>> +    bool ready;
>> +
>> +    spin_lock_irqsave(&msgq->lock, flags);
>> +    arch_gh_hypercall(GH_HYPERCALL_MSGQ_SEND, 5,
>> +              ghdev->capid, size, (uintptr_t)buff, tx_flags, 0,
>> +              gh_error, ready);
>> +    switch (gh_error) {
>> +    case GH_ERROR_OK:
>> +        ret = 0;
>> +        msgq->ready = ready;
>> +        break;
>> +    case GH_ERROR_MSGQUEUE_FULL:
>> +        ret = -EAGAIN;
>> +        msgq->ready = false;
>> +        break;
>> +    default:
>> +        ret = gh_remap_error(gh_error);
>> +        break;
>> +    }
>> +    spin_unlock_irqrestore(&msgq->lock, flags);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * gh_msgq_send() - Send a message to the client running on a 
>> different VM
>> + * @client: The client descriptor that was obtained via 
>> gh_msgq_register()
>> + * @buff: Pointer to the buffer where the received data must be placed
>> + * @buff_size: The size of the buffer space available
>> + * @flags: Optional flags to pass to receive the data. For the list 
>> of flags,
>> + *         see linux/gunyah/gh_msgq.h
>> + *
>> + * Returns: The number of bytes copied to buff. <0 if there was an 
>> error.
>> + *
>> + * Note: this function may sleep and should not be called from 
>> interrupt context
>> + */
>> +ssize_t gh_msgq_send(struct gunyah_device *ghdev, void *buff, size_t 
>> size,
>> +             const unsigned long flags)
>> +{
>> +    struct gh_msgq *msgq = ghdev_get_drvdata(ghdev);
>> +    ssize_t ret;
>> +    u64 tx_flags = 0;
>> +
>> +    if (flags & GH_MSGQ_TX_PUSH)
>> +        tx_flags |= GH_HYPERCALL_MSGQ_SEND_FLAGS_PUSH;
>> +
>> +    do {
>> +        ret = __gh_msgq_send(ghdev, buff, size, tx_flags);
>> +
>> +        if (ret == -EAGAIN) {
>> +            if (flags & GH_MSGQ_NONBLOCK)
>> +                goto out;
>> +            if (wait_event_interruptible(msgq->wq, msgq->ready))
>> +                ret = -ERESTARTSYS;
>> +        }
>> +    } while (ret == -EAGAIN);
> 
> Any limit on the amount of retries? Can the driver wait forever here?
> 
>> +
>> +out:
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(gh_msgq_send);
> 
> Both _send and _recv functions are not well designed. Can you call 
> gh_msgq_send() on any gunyah_device? Yes. Will it work? No.
> 

My intention here is to rely on hypervisor to properly complain about 
it. I thought it better to not have redundant checks, but I can add it 
in the Linux layer as well.

> Could you please check if mailbox API work for you? It seems that it is 
> what you are trying to implement on your own.
> 

My understanding is that mailbox API was designed for queuing single 
register accesses. The mailbox APIs aren't intended to queue up 
arbitrary length messages like needed here. rpmsg is similar in the 
sense that it had variable length messages and doesn't use the mailbox 
framework for this reason.

>> +
>> +static ssize_t __gh_msgq_recv(struct gunyah_device *ghdev, void 
>> *buff, size_t size)
>> +{
>> +    unsigned long flags, gh_error;
>> +    size_t recv_size;
>> +    struct gh_msgq *msgq = ghdev_get_drvdata(ghdev);
>> +    ssize_t ret;
>> +    bool ready;
>> +
>> +    spin_lock_irqsave(&msgq->lock, flags);
>> +
>> +    arch_gh_hypercall(GH_HYPERCALL_MSGQ_RECV, 4,
>> +              ghdev->capid, (uintptr_t)buff, size, 0,
>> +              gh_error, recv_size, ready);
>> +    switch (gh_error) {
>> +    case GH_ERROR_OK:
>> +        ret = recv_size;
>> +        msgq->ready = ready;
>> +        break;
>> +    case GH_ERROR_MSGQUEUE_EMPTY:
>> +        ret = -EAGAIN;
>> +        msgq->ready = false;
>> +        break;
>> +    default:
>> +        ret = gh_remap_error(gh_error);
>> +        break;
>> +    }
>> +    spin_unlock_irqrestore(&msgq->lock, flags);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * gh_msgq_recv() - Receive a message from the client running on a 
>> different VM
>> + * @client: The client descriptor that was obtained via 
>> gh_msgq_register()
>> + * @buff: Pointer to the buffer where the received data must be placed
>> + * @buff_size: The size of the buffer space available
>> + * @flags: Optional flags to pass to receive the data. For the list 
>> of flags,
>> + *         see linux/gunyah/gh_msgq.h
>> + *
>> + * Returns: The number of bytes copied to buff. <0 if there was an 
>> error.
>> + *
>> + * Note: this function may sleep and should not be called from 
>> interrupt context
>> + */
>> +ssize_t gh_msgq_recv(struct gunyah_device *ghdev, void *buff, size_t 
>> size,
>> +             const unsigned long flags)
>> +{
>> +    struct gh_msgq *msgq = ghdev_get_drvdata(ghdev);
>> +    ssize_t ret;
>> +
>> +    do {
>> +        ret = __gh_msgq_recv(ghdev, buff, size);
>> +
>> +        if (ret == -EAGAIN) {
>> +            if (flags & GH_MSGQ_NONBLOCK)
>> +                goto out;
>> +            if (wait_event_interruptible(msgq->wq, msgq->ready))
>> +                ret = -ERESTARTSYS;
>> +        }
>> +    } while (ret == -EAGAIN);
>> +
>> +out:
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(gh_msgq_recv);
>> +
>> +static int gh_msgq_probe(struct gunyah_device *ghdev)
>> +{
>> +    struct gh_msgq *msgq;
>> +
>> +    msgq = devm_kzalloc(&ghdev->dev, sizeof(*msgq), GFP_KERNEL);
>> +    if (!msgq)
>> +        return -ENOMEM;
>> +    ghdev_set_drvdata(ghdev, msgq);
>> +
>> +    msgq->ready = true; /* Assume we can use the message queue right 
>> away */
>> +    init_waitqueue_head(&msgq->wq);
>> +    spin_lock_init(&msgq->lock);
>> +
>> +    return devm_request_irq(&ghdev->dev, ghdev->irq, 
>> gh_msgq_irq_handler, 0,
>> +                dev_name(&ghdev->dev), msgq);
>> +}
>> +
>> +static struct gunyah_driver gh_msgq_tx_driver = {
>> +    .driver = {
>> +        .name = "gh_msgq_tx",
>> +        .owner = THIS_MODULE,
>> +    },
>> +    .type = GUNYAH_DEVICE_TYPE_MSGQ_TX,
>> +    .probe = gh_msgq_probe,
>> +};
>> +
>> +static struct gunyah_driver gh_msgq_rx_driver = {
>> +    .driver = {
>> +        .name = "gh_msgq_rx",
>> +        .owner = THIS_MODULE,
>> +    },
>> +    .type = GUNYAH_DEVICE_TYPE_MSGQ_RX,
>> +    .probe = gh_msgq_probe,
> 
> If you have to duplicate the whole device structure just to bind to two 
> difference devices, it looks like a bad abstraction. Please check how 
> other busses have solved this issue. They did, believe me.
> 
>> +};
> 
> MODULE_DEVICE_TABLE() ?
> 
>> +
>> +int __init gh_msgq_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = gunyah_register_driver(&gh_msgq_tx_driver);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = gunyah_register_driver(&gh_msgq_rx_driver);
>> +    if (ret)
>> +        goto err_rx;
>> +
>> +    return ret;
>> +err_rx:
>> +    gunyah_unregister_driver(&gh_msgq_tx_driver);
>> +    return ret;
>> +}
>> +
>> +void gh_msgq_exit(void)
>> +{
>> +    gunyah_unregister_driver(&gh_msgq_rx_driver);
>> +    gunyah_unregister_driver(&gh_msgq_tx_driver);
>> +}
>> diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
>> index 220560cb3b1c..7589689e5e92 100644
>> --- a/drivers/virt/gunyah/sysfs.c
>> +++ b/drivers/virt/gunyah/sysfs.c
>> @@ -73,6 +73,8 @@ static ssize_t features_show(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       if (GH_IDENTIFY_PARTITION_CSPACE(gunyah_api.flags))
>>           len += sysfs_emit_at(buffer, len, "cspace ");
>> +    if (GH_IDENTIFY_MSGQUEUE(gunyah_api.flags))
>> +        len += sysfs_emit_at(buffer, len, "message-queue ");
> 
> Again, this should go to the sysfs patch.
> 
>>       len += sysfs_emit_at(buffer, len, "\n");
>>       return len;
>> @@ -142,7 +144,13 @@ static int __init gunyah_init(void)
>>       if (ret)
>>           goto err_sysfs;
>> +    ret = gh_msgq_init();
>> +    if (ret)
>> +        goto err_bus;
>> +
> 
> Please stop beating everything in a single module. Having a provider 
> (bus) and a consumer (drivers for this bus) in a single module sounds 
> like an overkill. Or, a wrong abstraction.
> 
> Please remind me, why do you need gunyah bus in the first place? I could 
> not find any other calls to gunyah_device_add in this series. Which 
> devices do you expect to be added in future? Would they require separate 
> drivers?
> 

In a future series, I'll add the support to load other virtual machines. 
When running other virtual machines, additional gunyah devices are 
needed for doorbells (e.g. to emulate interrupts for paravirtualized 
devices) and to represent the vCPUs of that other VM. Other gunyah 
devices are also possible, but those are the immediate devices coming 
over the horizon.

I had an offline discussion with Bjorn and he was recommending dropping 
the bus/device/driver design entirely.

>>       return ret;
>> +err_bus:
>> +    gunyah_bus_exit();
>>   err_sysfs:
>>       gh_sysfs_unregister();
>>       return ret;
>> @@ -151,6 +159,7 @@ module_init(gunyah_init);
>>   static void __exit gunyah_exit(void)
>>   {
>> +    gh_msgq_exit();
>>       gunyah_bus_exit();
>>       gh_sysfs_unregister();
>>   }
>> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
>> index ce35f4491773..099224f9d6d1 100644
>> --- a/include/linux/gunyah.h
>> +++ b/include/linux/gunyah.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _GUNYAH_H
>>   #define _GUNYAH_H
>> +#include <linux/platform_device.h>
>>   #include <linux/device.h>
>>   #include <linux/types.h>
>>   #include <linux/errno.h>
>> @@ -117,4 +118,16 @@ struct gunyah_driver {
>>   int gunyah_register_driver(struct gunyah_driver *ghdrv);
>>   void gunyah_unregister_driver(struct gunyah_driver *ghdrv);
>> +#define GH_MSGQ_MAX_MSG_SIZE    1024
>> +
>> +/* Possible flags to pass for Tx or Rx */
>> +#define GH_MSGQ_TX_PUSH        BIT(0)
>> +#define GH_MSGQ_NONBLOCK    BIT(32)
>> +
>> +ssize_t gh_msgq_send(struct gunyah_device *ghdev, void *buff, size_t 
>> size,
>> +             const unsigned long flags);
>> +ssize_t gh_msgq_recv(struct gunyah_device *ghdev, void *buff, size_t 
>> size,
>> +             const unsigned long flags);
>> +
>> +
>>   #endif
> 
> 
