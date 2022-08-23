Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B63359D338
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241040AbiHWIL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 04:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241974AbiHWIKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 04:10:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E2E67C8D
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 01:06:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q7so14923784lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IrN2O0F09wpaKsQU5Sw22ZwxnMPs2BdFDbis2fNQW1w=;
        b=u5vLv6mdAr27Q4MJkcoQtIyp8eLF/BcvfOwr3yKZ6XniFst3SdMsRZlJTt/ePBo3Zf
         Veh/z5etGN6Q3hqbHMs6vpSFufhXLeQiyzBT6tSJ7evRHIhxw3m4EdQ65IEJ5Ugnzui5
         sutDFPdCKEvfpY/quD1ZVWaDuFnFLfpcVL2CJe1PcK0qDx22rJ8/SGZHYsHp0qtC8Fzl
         71/dhe78rwwIgs2xg53fqtEgWYiNkDohHDviZIL3PWRESAiRN64NrWFXBZ3PS/BJFogR
         wvEH5G1yRIld+zhT9oxYM1FMI/uAxDu44zkeTQFrqYq8R2ewMpt6WfSm3m906eZtnwJf
         GSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IrN2O0F09wpaKsQU5Sw22ZwxnMPs2BdFDbis2fNQW1w=;
        b=H8SFDdKoAJzNcLinq4pBrWf2/gMyKjoDUUX9YXT7MiRjSlzV5bbWy7GCRMEUoNaKgn
         CwX1ZPdyPTOMOlXkGgBpUmVqWGbBrx7D8dPcpKKwByd3bngalPMId0NFtRIpaXrUYPrJ
         hckXRlcYiej7/YT2KH8NT30EKc5sOLkbycyleslqhCXIawvIzyN30L0uMXoAWKcuPaBX
         yXvjmbkZg+ZK9yDjvHR1CrzNzlKcvMacwQtWE4gg3MU8oMktZgw3kAEhFAgdp/fmyCv2
         EjPtJU+v8LZBNGXuYKbpl/js1koFKywqTVJO0A3lIiUiG1u674qIM1LddDV40tBVJuky
         pXSQ==
X-Gm-Message-State: ACgBeo2AAM1Nr1CfCjLgmJTtTkCgoRnygzDPxqbBJhSP9f3Q8VQ5VTcn
        8QeP1Sz55uWxaQzdJYcV9t3k1Q==
X-Google-Smtp-Source: AA6agR4qDwT8FFXck8mCt0tj/NGXEsi4Uxa/50WRbBu3xqi8DdCX+KVJwwxakS8M8WKjVsaAjaitMg==
X-Received: by 2002:ac2:4e0f:0:b0:48b:7a5f:91c8 with SMTP id e15-20020ac24e0f000000b0048b7a5f91c8mr8748241lfr.430.1661242006895;
        Tue, 23 Aug 2022 01:06:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f10-20020a05651c02ca00b0025e6a3556ffsm595967ljo.22.2022.08.23.01.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:06:46 -0700 (PDT)
Message-ID: <9f802d58-e4d8-ddb7-d5a3-dd9408336379@linaro.org>
Date:   Tue, 23 Aug 2022 11:06:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 06/12] virt: gunyah: Add sysfs nodes
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
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
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
 <20220811214107.1074343-7-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220811214107.1074343-7-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2022 00:41, Elliot Berman wrote:
> Add /sys/hypervisor support when detecting that Linux is running in a
> Gunyah environment. Export the version of Gunyah which is reported via
> the hyp_identify hypercall.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   .../ABI/testing/sysfs-hypervisor-gunyah       | 23 +++++
>   MAINTAINERS                                   |  1 +
>   drivers/virt/Makefile                         |  1 +
>   drivers/virt/gunyah/Makefile                  |  2 +
>   drivers/virt/gunyah/sysfs.c                   | 87 +++++++++++++++++++
>   5 files changed, 114 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-hypervisor-gunyah
>   create mode 100644 drivers/virt/gunyah/Makefile
>   create mode 100644 drivers/virt/gunyah/sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-hypervisor-gunyah b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
> new file mode 100644
> index 000000000000..219465783a9e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
> @@ -0,0 +1,23 @@
> +What:		/sys/hypervisor/type
> +Date:		August 2022
> +KernelVersion:	6.0
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		Type of hypervisor:
> +		"gunyah": Gunyah hypervisor

Note, you do not need the 'type'. You already have it in form of 
/sys/hypervisor/gunyah dir. If the VM is running under another type of 
hypervisor, there will be a different directory for hypervisor files.

> +
> +What:		/sys/hypervisor/gunyah/api
> +Date:		August 2022
> +KernelVersion:	6.0
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		The Gunyah API version.

Please provide examples here.

> +
> +What:		/sys/hypervisor/gunyah/variant
> +Date:		August 2022
> +KernelVersion:	6.0
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		The Gunyah variant (build) version.
> +		The open source build of Gunyah will report "81".
> +		The Qualcomm build of Gunyah will report "72".

Are these numbers fixed in stone? What if some other random company adds 
another variant of the Gunyah? What if the open source build is updated 
at some point?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5d5ebb62701..c774bbcdb348 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8739,6 +8739,7 @@ M:	Elliot Berman <quic_eberman@quicinc.com>
>   M:	Murali Nalajala <quic_mnalajal@quicinc.com>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Supported
> +F:	Documentation/ABI/testing/sysfs-hypervisor-gunyah
>   F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>   F:	Documentation/virt/gunyah/
>   F:	arch/arm64/gunyah/
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index 093674e05c40..5cd759f60122 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -9,5 +9,6 @@ obj-y				+= vboxguest/
>   
>   obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>   obj-$(CONFIG_ACRN_HSM)		+= acrn/
> +obj-$(CONFIG_GUNYAH)		+= gunyah/
>   obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
>   obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> new file mode 100644
> index 000000000000..e15f16c17142
> --- /dev/null
> +++ b/drivers/virt/gunyah/Makefile
> @@ -0,0 +1,2 @@
> +gunyah-y += sysfs.o
> +obj-$(CONFIG_GUNYAH) += gunyah.o
> diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
> new file mode 100644
> index 000000000000..9de700fdbfcb
> --- /dev/null
> +++ b/drivers/virt/gunyah/sysfs.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "gunyah: " fmt
> +
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <asm-generic/gunyah.h>
> +
> +static struct gh_hypercall_hyp_identify_resp gunyah_api;
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
> +{
> +	return sysfs_emit(buffer, "gunyah\n");
> +}
> +static struct kobj_attribute type_attr = __ATTR_RO(type);
> +
> +static ssize_t api_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
> +{
> +	return sysfs_emit(buffer, "%d\n", (int)GH_API_INFO_API_VERSION(gunyah_api.api_info));
> +}
> +static struct kobj_attribute api_attr = __ATTR_RO(api);
> +
> +static ssize_t variant_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
> +{
> +	return sysfs_emit(buffer, "%d\n", (int)GH_API_INFO_VARIANT(gunyah_api.api_info));
> +}
> +static struct kobj_attribute variant_attr = __ATTR_RO(variant);
> +
> +static struct attribute *gunyah_attrs[] = {
> +	&api_attr.attr,
> +	&variant_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group gunyah_group = {
> +	.name = "gunyah",
> +	.attrs = gunyah_attrs,
> +};
> +
> +static int __init gunyah_init(void)
> +{
> +	int ret;
> +	u32 uid[4];
> +
> +	gh_hypercall_get_uid(uid);
> +
> +	if (!(gh_uid_matches(GUNYAH, uid) || gh_uid_matches(QC_HYP, uid)))
> +		return 0;
> +
> +	gh_hypercall_hyp_identify(&gunyah_api);
> +
> +	if (GH_API_INFO_API_VERSION(gunyah_api.api_info) != 1) {
> +		pr_warn("Unrecognized gunyah version: %llu. Currently supported: 1\n",
> +			GH_API_INFO_API_VERSION(gunyah_api.api_info));
> +		return 0;
> +	}
> +
> +	pr_notice("Running under Gunyah hypervisor %llx/v%lld\n",
> +		  GH_API_INFO_VARIANT(gunyah_api.api_info),
> +		  GH_API_INFO_API_VERSION(gunyah_api.api_info));
> +
> +	ret = sysfs_create_file(hypervisor_kobj, &type_attr.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_group(hypervisor_kobj, &gunyah_group);
> +	if (ret)
> +		sysfs_remove_file(hypervisor_kobj, &type_attr.attr);
> +
> +	return ret;
> +}
> +module_init(gunyah_init);
> +
> +static void __exit gunyah_exit(void)
> +{
> +	sysfs_remove_group(hypervisor_kobj, &gunyah_group);
> +	sysfs_remove_file(hypervisor_kobj, &type_attr.attr);
> +}
> +module_exit(gunyah_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Gunyah Hypervisor Driver");

-- 
With best wishes
Dmitry

