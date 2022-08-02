Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF622587810
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236009AbiHBHnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiHBHm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:42:59 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73F9B86E
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:42:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w15so5639932ljw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XBAfDUt+6GSTWE05zwmvgZgW79wBdpZEEt+Grtn4WRA=;
        b=U+zDeBSXv697g/ZMpAm9g72ZFUF0fTE1HSy099P6fxOM3kj8A08t7pC7gbyWZqGbyH
         Se0Eh2/PeaPZBvaAQeIjIMy1GlxDgbUbNZ9FeZtmyNs9DstgfsF1zAlP8hUzyb7C8Xr7
         SzZU8yNjJTZyf3Tb3UltyJ2t9L1U8ANcEwAad/sSHAozPWB5QLllAUupNOWXxxlZGcxa
         SGaJqX0yoohA6TCfqJvbOuRmXBuNdd38QC1Zs3aIgcompcRsqu9Q+LyKC0fiEOIoH9SO
         fYv1LbcMfBZ5LBCf58YJsCUhCjqQxawdR8YM1uaQh0X2Q/SDQVa95QpdT7QoIvN2PEBa
         jI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XBAfDUt+6GSTWE05zwmvgZgW79wBdpZEEt+Grtn4WRA=;
        b=nkeOVlFOxW3Fvo0NdeCO2AogHmdRFY37BrO7L9rjZ70dFDVvpkvtcLPoaIWbD07TSs
         yOEcO5i0UTmtakU2Y/u0ABrBImrx0MbClMSRuA033enWScsJRmc0rzRYkDa1wwg4YE3B
         Au1F0tcBW0iDWtwBVyZwD1aF0NxUryagMIjfcRtVGdZeRCOq0mLifxQMHnC8pGzpZDG9
         4knFsi1i/a4rapkuAcg7ZZxx5WNEYO5ZSGRSrbBXl1qKeRkUzv9T0Sj+wU8S3cilukEw
         sT5tNRJ0gvFXWigH8lfuYjzkIustXXk8sbKQCCSl33Rk7xLoDA70WwhhIuZgSB+Tie4I
         Czmg==
X-Gm-Message-State: AJIora+FHYxmEk88szW47ZcIPYzyyvmhAy6Uf/5D34ywnFJTncLsbNJK
        4aCiOyibpADiLd2aXIY0/JgRLw==
X-Google-Smtp-Source: AGRyM1vicWCbuN8Jle6SlSApSjYQIPrbPNf0DR9s+uOQ5aUumlP5lmUKV5s9Ske1/vtIobtXm7E36Q==
X-Received: by 2002:a2e:96c1:0:b0:258:e8ec:3889 with SMTP id d1-20020a2e96c1000000b00258e8ec3889mr6236125ljj.6.1659426175998;
        Tue, 02 Aug 2022 00:42:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p17-20020a2ea4d1000000b0025e4c49969fsm760247ljm.98.2022.08.02.00.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:42:55 -0700 (PDT)
Message-ID: <5f22bf9c-3694-0f08-d472-a3c952c081e7@linaro.org>
Date:   Tue, 2 Aug 2022 10:42:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 05/11] virt: gunyah: Add sysfs nodes
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
 <20220801211240.597859-6-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-6-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Add /sys/hypervisor support when detecting that Linux is running in a
> Gunyah environment. Export the version of Gunyah which is reported via
> the hyp_identify hypercall.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   .../ABI/testing/sysfs-hypervisor-gunyah       |  37 +++++
>   MAINTAINERS                                   |   2 +
>   arch/arm64/include/asm/gunyah.h               |   4 +
>   drivers/virt/Kconfig                          |   1 +
>   drivers/virt/Makefile                         |   1 +
>   drivers/virt/gunyah/Kconfig                   |  13 ++
>   drivers/virt/gunyah/Makefile                  |   4 +
>   drivers/virt/gunyah/sysfs.c                   | 139 ++++++++++++++++++
>   8 files changed, 201 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-hypervisor-gunyah
>   create mode 100644 drivers/virt/gunyah/Kconfig
>   create mode 100644 drivers/virt/gunyah/Makefile
>   create mode 100644 drivers/virt/gunyah/sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-hypervisor-gunyah b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
> new file mode 100644
> index 000000000000..41bce1965c91
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
> @@ -0,0 +1,37 @@
> +What:		/sys/hypervisor/type

These whole set of entries doesn't look right. You are defining 
gunyah-specific entries in the generic /sys/hypervisor directory. Other 
hypervisors will have their own set of ABI/sysfs files/etc/.

I would suggest using /sys/hypervisor/gunyah as a base dir. Then you can 
define any gunyah-specific file in it without caring if it applies to 
other hypervisors or not.

> +Date:		August 2022
> +KernelVersion:	5.20
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		Type of hypervisor:
> +		"gunyah": Gunyah hypervisor

And this will be gone if you adopt /sys/hypervisor/gunyah approach

> +
> +What:		/sys/hypervisor/features
> +Date:		August 2022
> +KernelVersion:	5.20
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		Space separated list of features supported by Linux and Gunyah:
> +		"cspace": Gunyah devices
> +		"doorbell": Sending/receiving virtual interrupts via Gunyah doorbells
> +		"message-queue": Sending/receiving messages via Gunyah message queues
> +		"vic": Interrupt lending
> +		"vpm": Virtual platform management
> +		"vcpu": Virtual CPU management
> +		"memextent": Memory lending/management
> +		"trace": Gunyah hypervisor tracing
> +
> +
> +What:		/sys/hypervisor/version/api
> +Date:		August 2022
> +KernelVersion:	5.20
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		The Gunyah API version.
> +
> +What:		/sys/hypervisor/version/variant
> +Date:		August 2022
> +KernelVersion:	5.20
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:	If running under Gunyah:
> +		The Gunyah variant (build) version.

If this is a build version, please call it a build version rather than 
variant.

> \ No newline at end of file
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2e4f1d9ed47b..e63c51ee1a2a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8741,9 +8741,11 @@ M:	Elliot Berman <quic_eberman@quicinc.com>
>   M:	Murali Nalajala <quic_mnalajal@quicinc.com>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-hypervisor-gunyah
>   F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>   F:	Documentation/virt/gunyah/
>   F:	arch/arm64/include/asm/gunyah.h
> +F:	drivers/virt/gunyah/
>   F:	include/linux/gunyah.h
>   
>   HABANALABS PCI DRIVER
> diff --git a/arch/arm64/include/asm/gunyah.h b/arch/arm64/include/asm/gunyah.h
> index 4820e9389f40..3aee35009910 100644
> --- a/arch/arm64/include/asm/gunyah.h
> +++ b/arch/arm64/include/asm/gunyah.h
> @@ -19,11 +19,15 @@
>   						   (GH_CALL_TYPE_SERVICE << GH_CALL_TYPE_SHIFT) \
>   							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
>   
> +#define GH_HYPERCALL_CALL_UID			GH_SERVICE(0x3f01)
> +
>   #define GH_HYPERCALL(fn)	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
>   						   ARM_SMCCC_OWNER_VENDOR_HYP, \
>   						   (GH_CALL_TYPE_HYPERCALL << GH_CALL_TYPE_SHIFT) \
>   							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
>   
> +#define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x0000)
> +
>   #define ___gh_count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
>   
>   #define __gh_count_args(...)						\
> diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
> index 87ef258cec64..259dc2be6cad 100644
> --- a/drivers/virt/Kconfig
> +++ b/drivers/virt/Kconfig
> @@ -52,4 +52,5 @@ source "drivers/virt/coco/efi_secret/Kconfig"
>   
>   source "drivers/virt/coco/sev-guest/Kconfig"
>   
> +source "drivers/virt/gunyah/Kconfig"
>   endif
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index 093674e05c40..ec4fdfa8eef1 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -6,6 +6,7 @@
>   obj-$(CONFIG_FSL_HV_MANAGER)	+= fsl_hypervisor.o
>   obj-$(CONFIG_VMGENID)		+= vmgenid.o
>   obj-y				+= vboxguest/
> +obj-$(CONFIG_GUNYAH)		+= gunyah/
>   
>   obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>   obj-$(CONFIG_ACRN_HSM)		+= acrn/
> diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
> new file mode 100644
> index 000000000000..1e493017885e
> --- /dev/null
> +++ b/drivers/virt/gunyah/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config GUNYAH
> +	tristate "Gunyah Virtualization drivers"
> +	depends on ARM64
> +	select SYS_HYPERVISOR
> +	help
> +	  The Gunyah drivers are the helper interfaces that runs in a guest VM
> +	  such as basic inter-VM IPC and signaling mechanisms and higher level
> +	  services such as memory/device sharing, IRQ sharing, and so on.
> +
> +	  Say Y here to enable the drivers needed to interact in a Gunyah
> +	  virtual environment.
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> new file mode 100644
> index 000000000000..0aa086f9149f
> --- /dev/null
> +++ b/drivers/virt/gunyah/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +gunyah-y += sysfs.o
> +obj-$(CONFIG_GUNYAH) += gunyah.o
> \ No newline at end of file
> diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
> new file mode 100644
> index 000000000000..253433a939cf
> --- /dev/null
> +++ b/drivers/virt/gunyah/sysfs.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "gunyah: " fmt
> +
> +#include <linux/kobject.h>
> +#include <linux/gunyah.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +
> +#define QC_HYP_UID0 0x19bd54bd
> +#define QC_HYP_UID1 0x0b37571b
> +#define QC_HYP_UID2 0x946f609b
> +#define QC_HYP_UID3 0x54539de6
> +
> +#define GUNYAH_UID0 0x673d5f14
> +#define GUNYAH_UID1 0x9265ce36
> +#define GUNYAH_UID2 0xa4535fdb
> +#define GUNYAH_UID3 0xc1d58fcd
> +
> +#define gh_uid_matches(prefix, uid)	\
> +	((uid)[0] == prefix ## _UID0 && (uid)[1] == prefix ## _UID1 && \
> +	 (uid)[2] == prefix ## _UID2 && (uid)[3] == prefix ## _UID3)
> +
> +#define GH_API_INFO_API_VERSION(x)	(((x) >> 0) & 0x3fff)
> +#define GH_API_INFO_BIG_ENDIAN(x)	(((x) >> 14) & 1)
> +#define GH_API_INFO_IS_64BIT(x)		(((x) >> 15) & 1)
> +#define GH_API_INFO_VARIANT(x)		(((x) >> 56) & 0xff)
> +
> +#define GH_IDENTIFY_PARTITION_CSPACE(flags)	(((flags)[0] >> 0) & 1)
> +#define GH_IDENTIFY_DOORBELL(flags)		(((flags)[0] >> 1) & 1)
> +#define GH_IDENTIFY_MSGQUEUE(flags)		(((flags)[0] >> 2) & 1)
> +#define GH_IDENTIFY_VIC(flags)			(((flags)[0] >> 3) & 1)
> +#define GH_IDENTIFY_VPM(flags)			(((flags)[0] >> 4) & 1)
> +#define GH_IDENTIFY_VCPU(flags)			(((flags)[0] >> 5) & 1)
> +#define GH_IDENTIFY_MEMEXTENT(flags)		(((flags)[0] >> 6) & 1)
> +#define GH_IDENTIFY_TRACE_CTRL(flags)		(((flags)[0] >> 7) & 1)
> +
> +struct gh_hypercall_hyp_identify_resp {
> +	u64 api_info;
> +	u64 flags[3];
> +};
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
> +static ssize_t features_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
> +{
> +	return sysfs_emit(buffer, "\n");

empty features? oook. At least it deserves a comment here, if you plan 
to add features later in these series. But strictly speaking it might be 
better to define the features ABI once you start populating it.

> +}
> +static struct kobj_attribute features_attr = __ATTR_RO(features);
> +
> +static struct attribute *version_attrs[] = {
> +	&api_attr.attr,
> +	&variant_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group version_group = {
> +	.name = "version",
> +	.attrs = version_attrs,
> +};
> +
> +static int __init gh_sysfs_register(void)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_file(hypervisor_kobj, &type_attr.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_group(hypervisor_kobj, &version_group);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_create_file(hypervisor_kobj, &features_attr.attr);

error path?


> +}
> +
> +static void gh_sysfs_unregister(void)
> +{
> +	sysfs_remove_file(hypervisor_kobj, &type_attr.attr);
> +	sysfs_remove_group(hypervisor_kobj, &version_group);

Please unwind in a backwards manner. Also one sysfs_remove_ is missing.

> +}
> +
> +static int __init gunyah_init(void)
> +{
> +	unsigned long uid[4];
> +
> +	arch_gh_hypercall(GH_HYPERCALL_CALL_UID, 0, uid[0], uid[1], uid[2], uid[3]);
> +
> +	if (!(gh_uid_matches(GUNYAH, uid) || gh_uid_matches(QC_HYP, uid)))
> +		return 0;

if (!gh_uid_matched(GUNYAH, uid) &&
     !gh_uid_matches(QC_HYP, uid))
     return -ENODEV;


BTW: what is the difference between GUNYAH and QC_HYP here?

> +
> +	arch_gh_hypercall(GH_HYPERCALL_HYP_IDENTIFY, 0, gunyah_api.api_info,
> +		gunyah_api.flags[0], gunyah_api.flags[1], gunyah_api.flags[2]);
> +
> +	if (GH_API_INFO_API_VERSION(gunyah_api.api_info) != 1) {
> +		pr_warn("Unrecognized gunyah version: %llu. Currently supported: 1\n",
> +			GH_API_INFO_API_VERSION(gunyah_api.api_info));
> +		return 0;
> +	}
> +
> +	pr_notice("Running under Gunyah hypervisor v%lld/%llx\n",
> +		  GH_API_INFO_API_VERSION(gunyah_api.api_info),
> +		  GH_API_INFO_VARIANT(gunyah_api.api_info));
> +
> +	return gh_sysfs_register();
> +}
> +module_init(gunyah_init);
> +
> +static void __exit gunyah_exit(void)
> +{
> +	gh_sysfs_unregister();
> +}
> +module_exit(gunyah_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Gunyah Hypervisor Driver");

Sysfs driver?


-- 
With best wishes
Dmitry
