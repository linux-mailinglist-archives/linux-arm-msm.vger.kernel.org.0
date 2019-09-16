Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832C5B442F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 00:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfIPWoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 18:44:46 -0400
Received: from foss.arm.com ([217.140.110.172]:49214 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbfIPWoq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 18:44:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63BDC337;
        Mon, 16 Sep 2019 15:44:45 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 908EF3F67D;
        Mon, 16 Sep 2019 15:44:43 -0700 (PDT)
Subject: Re: [PATCHv5 3/3] iommu: arm-smmu-impl: Add sdm845 implementation
 hook
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1568549745.git.saiprakash.ranjan@codeaurora.org>
 <4ccbaf1f81c2bb2e7846da591fd542ab33f45586.1568549746.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e9918121-71bb-703f-a696-b0e357e5eeff@arm.com>
Date:   Mon, 16 Sep 2019 23:44:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4ccbaf1f81c2bb2e7846da591fd542ab33f45586.1568549746.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-15 1:35 pm, Sai Prakash Ranjan wrote:
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> 
> Add reset hook for sdm845 based platforms to turn off
> the wait-for-safe sequence.
> 
> Understanding how wait-for-safe logic affects USB and UFS performance
> on MTP845 and DB845 boards:
> 
> Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
> to address under-performance issues in real-time clients, such as
> Display, and Camera.
> On receiving an invalidation requests, the SMMU forwards SAFE request
> to these clients and waits for SAFE ack signal from real-time clients.
> The SAFE signal from such clients is used to qualify the start of
> invalidation.
> This logic is controlled by chicken bits, one for each - MDP (display),
> IFE0, and IFE1 (camera), that can be accessed only from secure software
> on sdm845.
> 
> This configuration, however, degrades the performance of non-real time
> clients, such as USB, and UFS etc. This happens because, with wait-for-safe
> logic enabled the hardware tries to throttle non-real time clients while
> waiting for SAFE ack signals from real-time clients.
> 
> On mtp845 and db845 devices, with wait-for-safe logic enabled by the
> bootloaders we see degraded performance of USB and UFS when kernel
> enables the smmu stage-1 translations for these clients.
> Turn off this wait-for-safe logic from the kernel gets us back the perf
> of USB and UFS devices until we re-visit this when we start seeing perf
> issues on display/camera on upstream supported SDM845 platforms.
> The bootloaders on these boards implement secure monitor callbacks to
> handle a specific command - QCOM_SCM_SVC_SMMU_PROGRAM with which the
> logic can be toggled.
> 
> There are other boards such as cheza whose bootloaders don't enable this
> logic. Such boards don't implement callbacks to handle the specific SCM
> call so disabling this logic for such boards will be a no-op.
> 
> This change is inspired by the downstream change from Patrick Daly
> to address performance issues with display and camera by handling
> this wait-for-safe within separte io-pagetable ops to do TLB
> maintenance. So a big thanks to him for the change and for all the
> offline discussions.
> 
> Without this change the UFS reads are pretty slow:
> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
> 10+0 records in
> 10+0 records out
> 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
> real    0m 22.39s
> user    0m 0.00s
> sys     0m 0.01s
> 
> With this change they are back to rock!
> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
> 300+0 records in
> 300+0 records out
> 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
> real    0m 1.03s
> user    0m 0.00s
> sys     0m 0.54s
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/Makefile        |  2 +-
>   drivers/iommu/arm-smmu-impl.c |  7 +++++--
>   drivers/iommu/arm-smmu-qcom.c | 32 ++++++++++++++++++++++++++++++++
>   drivers/iommu/arm-smmu-qcom.h | 11 +++++++++++
>   drivers/iommu/arm-smmu.h      |  2 ++
>   5 files changed, 51 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/iommu/arm-smmu-qcom.c
>   create mode 100644 drivers/iommu/arm-smmu-qcom.h
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 7caad48b4bc2..7d66e00a6924 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -13,7 +13,7 @@ obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
>   obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o amd_iommu_quirks.o
>   obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
>   obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
> -obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o
> +obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
>   obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
>   obj-$(CONFIG_DMAR_TABLE) += dmar.o
>   obj-$(CONFIG_INTEL_IOMMU) += intel-iommu.o intel-pasid.o
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 5c87a38620c4..ad835018f0e2 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -8,7 +8,7 @@
>   #include <linux/of.h>
>   
>   #include "arm-smmu.h"
> -
> +#include "arm-smmu-qcom.h"
>   
>   static int arm_smmu_gr0_ns(int offset)
>   {
> @@ -109,7 +109,7 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
>   #define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
>   #define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
>   
> -static int arm_mmu500_reset(struct arm_smmu_device *smmu)
> +int arm_mmu500_reset(struct arm_smmu_device *smmu)
>   {
>   	u32 reg, major;
>   	int i;
> @@ -170,5 +170,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   				  "calxeda,smmu-secure-config-access"))
>   		smmu->impl = &calxeda_impl;
>   
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
> +		smmu->impl = &qcom_sdm845_smmu500_impl;
> +
>   	return smmu;
>   }
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> new file mode 100644
> index 000000000000..10e9a5bbae06
> --- /dev/null
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/qcom_scm.h>
> +
> +#include "arm-smmu.h"
> +#include "arm-smmu-qcom.h"
> +
> +static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +
> +	arm_mmu500_reset(smmu);
> +
> +	/*
> +	 * To address performance degradation in non-real time clients,
> +	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> +	 * such as MTP and db845, whose firmwares implement secure monitor
> +	 * call handlers to turn on/off the wait-for-safe logic.
> +	 */
> +	ret = qcom_scm_qsmmu500_wait_safe_toggle(0);
> +	if (ret)
> +		dev_warn(smmu->dev, "Failed to turn off SAFE logic\n");
> +
> +	return ret;
> +}
> +
> +const struct arm_smmu_impl qcom_sdm845_smmu500_impl = {
> +	.reset = qcom_sdm845_smmu500_reset,
> +};
> diff --git a/drivers/iommu/arm-smmu-qcom.h b/drivers/iommu/arm-smmu-qcom.h
> new file mode 100644
> index 000000000000..915f8ea2b616
> --- /dev/null
> +++ b/drivers/iommu/arm-smmu-qcom.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _ARM_SMMU_QCOM_H
> +#define _ARM_SMMU_QCOM_H
> +
> +extern const struct arm_smmu_impl qcom_sdm845_smmu500_impl;

I don't foresee this header being particularly beneficial - I'd rather 
just have a single qcom_smmu_impl_init() entrypoint declared in 
arm-smmu.h as per the Nvidia implementation[1], so you can then keep all 
the other details private. With that change,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/1567481528-31163-3-git-send-email-vdumpa@nvidia.com/

> +
> +#endif /* _ARM_SMMU_QCOM_H */
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index b19b6cae9b5e..f74fa3bb149d 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -399,4 +399,6 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>   
>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
>   
> +int arm_mmu500_reset(struct arm_smmu_device *smmu);
> +
>   #endif /* _ARM_SMMU_H */
> 
