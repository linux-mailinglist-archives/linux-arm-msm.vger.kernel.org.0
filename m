Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C87A5B7016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 02:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730302AbfISAZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 20:25:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45625 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbfISAZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 20:25:06 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so1030593pfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eWVBUc0G0r03bjlIZxcu0N6j8gLGXLsTTsd/6fU4IxE=;
        b=DcL9bVL7BUCwpbnXvuhZd4coXdVdROYTsuhZdRR9jG3zTxOQDYapRhEJ3hyNZaeBXj
         kzEoWTQfRiIeWcx8Z/b/afSfWWT0ThQF1bkharhZ9xp5MC2k2XpvC9KwkvypDKjcFy0h
         G5t9Uu/k/PZ9SAsw3aZ+eXtGNkBthvKFb54k7YWf/xwzjDAugHMOlm4E2SMx4HW2nWzn
         6sAiMyQMjRJ64//+i3ocjsPNDGm5B9FXG+IkGlqMx5TcnOMLbbrhKM5PPtfdNaMrzNKh
         3/t0XmrvUNwaStbZYUUJaPQoqyw0tg8zaE8tHyxeEg8v147jAGuGxCohhsAeZbUhqeaH
         FLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eWVBUc0G0r03bjlIZxcu0N6j8gLGXLsTTsd/6fU4IxE=;
        b=VBD7KrAOql9uZJCy61bKk0Oyd79k80UetD7Nr2d/jHo1J8HnKCJe2u9iZ9l3r5jr/R
         4nLlUd4y4V+QIq+93mGNb8MznXdopOJXQ0WFmPU3Yu7pKHqd+C89r7EXgtwBtGlOY/ri
         Wn8DgY4naccDdZc+V7kAKceDaLRaKaoXs/rv3FGihCNTPaOf2eR6dhrUS7VOsGYtGsFD
         X4BJO50oBFA2tv0IV67TP6hJLptyZyECYzpV/+4EONWjXofkbovJ9Mx3iOnAgNOP5CAq
         Y+iFxn/v6rHSoZL/qH43fdrup7/pfGltiACky8cpUn5PIRxdgAIHwN0RF2TXSYgIKQ0V
         vGAA==
X-Gm-Message-State: APjAAAXit2xrgSpXU3oLOjkIXu3k0W4tyULwusQnLEaaqd/Ir1Zx6dZ7
        9UrXUJ9EUIOCd2orFRjYmOJwYA==
X-Google-Smtp-Source: APXvYqyFdcK6ZGJrZDMo8+0D7OJ7woRAwYmA8HvkKj5hrDIcjAtTEYMTrBmnFLn5GR0BxTHmvN++kA==
X-Received: by 2002:a17:90a:2525:: with SMTP id j34mr674675pje.11.1568852705250;
        Wed, 18 Sep 2019 17:25:05 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h2sm7269090pfq.108.2019.09.18.17.25.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 17:25:04 -0700 (PDT)
Date:   Wed, 18 Sep 2019 17:25:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation
 hook
Message-ID: <20190919002501.GA20859@builder>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
 <1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Sep 02:45 PDT 2019, Sai Prakash Ranjan wrote:

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
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/Makefile        |  2 +-
>  drivers/iommu/arm-smmu-impl.c |  6 +++--
>  drivers/iommu/arm-smmu-qcom.c | 51 +++++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.h      |  3 +++
>  4 files changed, 59 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/arm-smmu-qcom.c
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index a2729aadd300..2816e49a8c46 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -13,7 +13,7 @@ obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
>  obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o
>  obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
>  obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
> -obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o
> +obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
>  obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
>  obj-$(CONFIG_DMAR_TABLE) += dmar.o
>  obj-$(CONFIG_INTEL_IOMMU) += intel-iommu.o intel-pasid.o
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 3f88cd078dd5..d62da270f430 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -9,7 +9,6 @@
>  
>  #include "arm-smmu.h"
>  
> -
>  static int arm_smmu_gr0_ns(int offset)
>  {
>  	switch(offset) {
> @@ -109,7 +108,7 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
>  #define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
>  #define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
>  
> -static int arm_mmu500_reset(struct arm_smmu_device *smmu)
> +int arm_mmu500_reset(struct arm_smmu_device *smmu)
>  {
>  	u32 reg, major;
>  	int i;
> @@ -170,5 +169,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  				  "calxeda,smmu-secure-config-access"))
>  		smmu->impl = &calxeda_impl;
>  
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
> +		return qcom_smmu_impl_init(smmu);
> +
>  	return smmu;
>  }
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> new file mode 100644
> index 000000000000..24c071c1d8b0
> --- /dev/null
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/qcom_scm.h>
> +
> +#include "arm-smmu.h"
> +
> +struct qcom_smmu {
> +	struct arm_smmu_device smmu;
> +};
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

In the transition to this new design we lost the ability to
enable/disable the safe toggle per board, which according to Vivek
would result in some issue with Cheza.

Can you confirm that this is okay? (Or introduce the DT property for
enabling the safe_toggle logic?)

Regards,
Bjorn

> +	if (ret)
> +		dev_warn(smmu->dev, "Failed to turn off SAFE logic\n");
> +
> +	return ret;
> +}
> +
> +static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.reset = qcom_sdm845_smmu500_reset,
> +};
> +
> +struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu;
> +
> +	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
> +	if (!qsmmu)
> +		return ERR_PTR(-ENOMEM);
> +
> +	qsmmu->smmu = *smmu;
> +
> +	qsmmu->smmu.impl = &qcom_smmu_impl;
> +	devm_kfree(smmu->dev, smmu);
> +
> +	return &qsmmu->smmu;
> +}
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index ac9eac966cf5..4bc9e853c95d 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -391,5 +391,8 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>  	arm_smmu_writeq((s), ARM_SMMU_CB((s), (n)), (o), (v))
>  
>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
> +struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> +
> +int arm_mmu500_reset(struct arm_smmu_device *smmu);
>  
>  #endif /* _ARM_SMMU_H */
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
