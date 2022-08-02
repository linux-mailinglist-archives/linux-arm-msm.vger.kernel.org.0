Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25E55878EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 10:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiHBIUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 04:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbiHBIUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 04:20:50 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F3423170
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 01:20:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z4so171402ljn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7r3+FeHJ12YYkVDUzu2HgWxyywzizk2MChlhUEakah0=;
        b=d3rGLII+eDX1ijXFdPf3A6V3ANR09mFbdjKvxKc2pKnqMtytznaG8wTuSWwnK9XR0m
         XCjedFrpijG+Ob+sxq2aWHRhXXlqADlaqCUQvXQ++YlFgN0cTG4o9AKd0Xca5UUSx23g
         iqzRrdkqQFf/L3koseC9dpN0AxTY4hp6hWzwJrP7l1dwc12j+QApoTmcBlyc8dTeuSkg
         HmkejB9/WIoCTbW+MSoL8EKDzU9Ri+ROHuQsH0n5dN8KNJdD3dRcfllJuqkDIqyfi527
         sCnTawRYOIafiSGkjxn8QbvRT1uiaicg9iELSFNyM9z6pWkR1/k4YWRr9rLJn6kmLYeB
         DKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7r3+FeHJ12YYkVDUzu2HgWxyywzizk2MChlhUEakah0=;
        b=DN9wEwSRmYGGpI0ekExtWhfYxeN9cU5jpHeFHGy+U2cNwpQE0SCL9hPGRhcFiljRqN
         +IZ7QPMajq8G+ImrCvHQiJY7rY5zO+g7Jf/MOy7DCer4DwJOOcSBqxt+XHiKjI4Me5Ql
         gqRgyeZAi+VTZH2I8eH+xeGJig3MGhEay/Ypv9gMnvxyg6u2XV8txPdGyj0rqAYiq0u9
         sUSgufj6FRmcL8vLwXd2KrJkZRPxXi7dih3ez4Qci/i83OK16mobQhMlwVWsNViluHfa
         YuVToYetVGT28AtBp4xCghnLROakHKC06VmEHWBYhWOfPsc2ra+b6icX3Go3vdXdx098
         h0/w==
X-Gm-Message-State: AJIora9OA807Z0ZaF2SS1Sd42zR8/WAEm+5lppYuPEGOCrP9tBZFHcf2
        HhsdZiov1ZF/PMM3w2IH4eCNLg==
X-Google-Smtp-Source: AGRyM1vwmKb9CEAN/6wdjX4etYJNRobxeH43R02CfS9bPRhuO2l7SBZh/r22jiTPQadWdV831A0hGw==
X-Received: by 2002:a05:651c:10aa:b0:25e:7a1:b126 with SMTP id k10-20020a05651c10aa00b0025e07a1b126mr6424776ljn.432.1659428446817;
        Tue, 02 Aug 2022 01:20:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q1-20020a19f201000000b0048b025397e9sm480647lfh.204.2022.08.02.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:20:46 -0700 (PDT)
Message-ID: <95d86d1f-28dd-b373-ff5e-f8ce6f5bb55c@linaro.org>
Date:   Tue, 2 Aug 2022 11:20:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 06/11] virt: gunyah: Add capabilities bus and devices
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-7-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-7-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Some resources provided by the Gunyah hypervisor are described as
> objects. The objects are identified with a capability ID. For instance,
> Inter-VM communication is performed with doorbells and message queues.
> Each doorbell and message queue endpoint can be described consisely as a
> Linux device.
> 
> These resources are discovered either on the devicetree or reported by
> the Resource Manager. Devices on the Gunyah bus are matched with drivers
> according to the type ID reported by resource manager. Most resources
> will be discovered directly from the resource manager, so matching
> directly on type ID seems like sensible design.
> 
> Each resource may also optionally have an interrupt associated with it
> and a known partner VM (e.g. which VM is the receiver of a message
> queue).
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   drivers/virt/gunyah/Makefile         |   2 +-
>   drivers/virt/gunyah/device.c         | 108 +++++++++++++++++++++++++++
>   drivers/virt/gunyah/gunyah_private.h |  12 +++
>   drivers/virt/gunyah/sysfs.c          |  25 ++++++-
>   include/linux/gunyah.h               |  45 +++++++++++
>   5 files changed, 189 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/virt/gunyah/device.c
>   create mode 100644 drivers/virt/gunyah/gunyah_private.h
> 
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> index 0aa086f9149f..3869fb7371df 100644
> --- a/drivers/virt/gunyah/Makefile
> +++ b/drivers/virt/gunyah/Makefile
> @@ -1,4 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -gunyah-y += sysfs.o
> +gunyah-y += sysfs.o device.o
>   obj-$(CONFIG_GUNYAH) += gunyah.o
> \ No newline at end of file

Even git-format-patch warns you that should be a newline at the end of 
the file.

> diff --git a/drivers/virt/gunyah/device.c b/drivers/virt/gunyah/device.c
> new file mode 100644
> index 000000000000..93595f9a65b9
> --- /dev/null
> +++ b/drivers/virt/gunyah/device.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "ghdev: " fmt
> +
> +#include <linux/interrupt.h>
> +#include <linux/gunyah.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +
> +#include "gunyah_private.h"
> +
> +static int gunyah_match(struct device *dev, struct device_driver *drv)
> +{
> +	struct gunyah_device *ghdev = to_gunyah_device(dev);
> +	struct gunyah_driver *ghdrv = to_gunyah_driver(drv);
> +
> +	return ghdev->type == ghdrv->type;
> +}
> +
> +static int gunyah_probe(struct device *dev)
> +{
> +	struct gunyah_device *ghdev = to_gunyah_device(dev);
> +	struct gunyah_driver *ghdrv = to_gunyah_driver(dev->driver);
> +
> +	return ghdrv->probe ? ghdrv->probe(ghdev) : 0;
> +}
> +
> +static void gunyah_remove(struct device *dev)
> +{
> +	struct gunyah_device *ghdev = to_gunyah_device(dev);
> +	struct gunyah_driver *ghdrv = to_gunyah_driver(dev->driver);
> +
> +	if (ghdrv->remove)
> +		ghdrv->remove(ghdev);
> +}
> +
> +static struct bus_type gunyah_bus = {
> +	.name	= "gunyah",
> +	.match	= gunyah_match,
> +	.probe	= gunyah_probe,
> +	.remove	= gunyah_remove,
> +};
> +
> +int gunyah_register_driver(struct gunyah_driver *ghdrv)
> +{
> +	ghdrv->driver.bus = &gunyah_bus;
> +	return driver_register(&ghdrv->driver);
> +}
> +
> +void gunyah_unregister_driver(struct gunyah_driver *ghdrv)
> +{
> +	driver_unregister(&ghdrv->driver);
> +}
> +
> +static void gunyah_device_release(struct device *dev)
> +{
> +	struct gunyah_device *ghdev = to_gunyah_device(dev);
> +
> +	kfree(ghdev);
> +}
> +
> +struct gunyah_device *gunyah_device_alloc(struct device *parent, gh_capid_t capid, u8 type)
> +{
> +	struct gunyah_device *ghdev;
> +
> +	ghdev = kzalloc(sizeof(*ghdev), GFP_KERNEL);
> +	if (!ghdev)
> +		return NULL;
> +
> +	ghdev->capid = capid;
> +	ghdev->type = type;
> +	ghdev->irq = IRQ_NOTCONNECTED;
> +	ghdev->dev.parent = parent;
> +	ghdev->dev.release = gunyah_device_release;
> +	ghdev->dev.bus = &gunyah_bus;
> +	device_initialize(&ghdev->dev);
> +	return ghdev;
> +}
> +
> +int gunyah_device_add(struct gunyah_device *ghdev)
> +{
> +	int ret;
> +
> +	ret = dev_set_name(&ghdev->dev, "%u.%08llx", ghdev->type, ghdev->capid);
> +	if (ret)
> +		return ret;
> +
> +	return device_add(&ghdev->dev);
> +}

Does your device need any additional setup between _alloc() and _add(). 
  If not, it may be better to squash them together.

> +
> +void gunyah_device_remove(struct gunyah_device *ghdev)
> +{
> +	device_unregister(&ghdev->dev);
> +}
> +
> +int __init gunyah_bus_init(void)
> +{
> +	return bus_register(&gunyah_bus);
> +}
> +
> +void gunyah_bus_exit(void)
> +{
> +	bus_unregister(&gunyah_bus);
> +}
> diff --git a/drivers/virt/gunyah/gunyah_private.h b/drivers/virt/gunyah/gunyah_private.h
> new file mode 100644
> index 000000000000..5f3832608020
> --- /dev/null
> +++ b/drivers/virt/gunyah/gunyah_private.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _GUNYAH_PRIVATE_H
> +#define _GUNYAH_PRIVATE_H
> +
> +int __init gunyah_bus_init(void);
> +void gunyah_bus_exit(void);
> +
> +#endif
> diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
> index 253433a939cf..220560cb3b1c 100644
> --- a/drivers/virt/gunyah/sysfs.c
> +++ b/drivers/virt/gunyah/sysfs.c
> @@ -12,6 +12,8 @@
>   #include <linux/init.h>
>   #include <linux/of.h>
>   
> +#include "gunyah_private.h"
> +
>   #define QC_HYP_UID0 0x19bd54bd
>   #define QC_HYP_UID1 0x0b37571b
>   #define QC_HYP_UID2 0x946f609b
> @@ -67,7 +69,13 @@ static struct kobj_attribute variant_attr = __ATTR_RO(variant);
>   
>   static ssize_t features_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
>   {
> -	return sysfs_emit(buffer, "\n");
> +	int len = 0;
> +
> +	if (GH_IDENTIFY_PARTITION_CSPACE(gunyah_api.flags))
> +		len += sysfs_emit_at(buffer, len, "cspace ");

How is this related to Linux gunyah bus implementation? Please move to 
the sysfs patch.

> +
> +	len += sysfs_emit_at(buffer, len, "\n");
> +	return len;
>   }
>   static struct kobj_attribute features_attr = __ATTR_RO(features);
>   
> @@ -105,6 +113,7 @@ static void gh_sysfs_unregister(void)
>   
>   static int __init gunyah_init(void)
>   {
> +	int ret;
>   	unsigned long uid[4];
>   
>   	arch_gh_hypercall(GH_HYPERCALL_CALL_UID, 0, uid[0], uid[1], uid[2], uid[3]);
> @@ -125,12 +134,24 @@ static int __init gunyah_init(void)
>   		  GH_API_INFO_API_VERSION(gunyah_api.api_info),
>   		  GH_API_INFO_VARIANT(gunyah_api.api_info));
>   
> -	return gh_sysfs_register();
> +	ret = gh_sysfs_register();
> +	if (ret)
> +		return ret;
> +
> +	ret = gunyah_bus_init();
> +	if (ret)
> +		goto err_sysfs;
> +
> +	return ret;
> +err_sysfs:
> +	gh_sysfs_unregister();
> +	return ret;
>   }
>   module_init(gunyah_init);
>   
>   static void __exit gunyah_exit(void)
>   {
> +	gunyah_bus_exit();
>   	gh_sysfs_unregister();
>   }
>   module_exit(gunyah_exit);
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> index 69931a0f5736..ce35f4491773 100644
> --- a/include/linux/gunyah.h
> +++ b/include/linux/gunyah.h
> @@ -6,6 +6,7 @@
>   #ifndef _GUNYAH_H
>   #define _GUNYAH_H
>   
> +#include <linux/device.h>
>   #include <linux/types.h>
>   #include <linux/errno.h>
>   #include <asm/gunyah.h>
> @@ -72,4 +73,48 @@ static inline int gh_remap_error(int gh_error)
>   	}
>   }
>   
> +/* Follows resource manager's resource types for VM_GET_HYP_RESOURCES */
> +#define GUNYAH_DEVICE_TYPE_BELL_TX	0
> +#define GUNYAH_DEVICE_TYPE_BELL_RX	1
> +#define GUNYAH_DEVICE_TYPE_MSGQ_TX	2
> +#define GUNYAH_DEVICE_TYPE_MSGQ_RX	3
> +#define GUNYAH_DEVICE_TYPE_VCPU		4
> +
> +struct gunyah_device {
> +	u8 type;
> +	gh_capid_t capid;
> +	int irq;
> +
> +	struct device dev;
> +};
> +
> +#define to_gunyah_device(dev) container_of(dev, struct gunyah_device, dev)
> +
> +static inline void *ghdev_get_drvdata(const struct gunyah_device *ghdev)
> +{
> +	return dev_get_drvdata(&ghdev->dev);
> +}
> +
> +static inline void ghdev_set_drvdata(struct gunyah_device *ghdev, void *data)
> +{
> +	dev_set_drvdata(&ghdev->dev, data);
> +}
> +
> +struct gunyah_device *gunyah_device_alloc(struct device *parent, gh_capid_t capid, u8 type);
> +
> +int gunyah_device_add(struct gunyah_device *ghdev);
> +void gunyah_device_remove(struct gunyah_device *ghdev);
> +
> +struct gunyah_driver {
> +	struct device_driver driver;
> +	u8 type;
> +	int (*probe)(struct gunyah_device *ghdev);
> +	int (*remove)(struct gunyah_device *ghdev);
> +};
> +
> +#define to_gunyah_driver(drv) container_of(drv, struct gunyah_driver, driver)
> +
> +int gunyah_register_driver(struct gunyah_driver *ghdrv);
> +void gunyah_unregister_driver(struct gunyah_driver *ghdrv);
> +
>   #endif


-- 
With best wishes
Dmitry
