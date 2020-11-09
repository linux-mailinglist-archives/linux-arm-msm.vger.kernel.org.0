Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB8B2AC921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 00:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgKIXNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 18:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729452AbgKIXNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 18:13:15 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E9DC0613CF;
        Mon,  9 Nov 2020 15:13:15 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so6235496wrb.9;
        Mon, 09 Nov 2020 15:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SzyzIFUHACGGtEjbEi3vs8mJQQfV5+rYDswxbA8M/m4=;
        b=Zjl3lSMlwvvESHqMfFzS+5eQN59OuHO9r0r30lNuvJpzf7i83Mm6Ss9krJTnqvrZgf
         5Yh9988oL1MM0Vtur483IGqsb1mkCuD2645+EA1T9BCcrn08BWP9hsQCHsQu1cvw1Nbx
         FoF6RKP2xksNAxT3yctHue3woWJ1pdsZlZgZPnAYYLLVkIS3HimuI2vNkEzxPMeHJZM0
         lxfwM/l98Kky/qzRs2FLGkBIM3AowfWiXV8SPDJb5pRP3rTBHrblC/hdc4mkQdAyn7HY
         GQVmWFdbtfwbprbHg/LL9IOJiKRmB/M7RR44cLsn0UwD9gGQg4xFQt/dpONb5RLt8Ngq
         D1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SzyzIFUHACGGtEjbEi3vs8mJQQfV5+rYDswxbA8M/m4=;
        b=LoAicK2YwKcimsid5M7yzOZfK+4uEh/aq95s/8WHiRwgKuxqyTSgGOPn1QoN72l1xw
         w0U/ze5O8kaRXgpmqUnHBOCFL1Wpef1o9wTLJL6477X/g0GOhkFliuQ0cWWWAxMC6Set
         EJyB7QCJ6i9WcisCZJJ1vkTPuKudR+gP3p6ChVDSLQ/QXdHO1iAUBZlpr4upc5Wudp7D
         FigcNwyQ2D/DaYAWa+geBfJL602xjOsXQHIdmXVZmMRcZCQkwEhQ3ubZAny6OclkE4vH
         F49rUXqsvUusNSwCvsM31GIC88igYBpGk8Zjmw70x9T2R6CBQtYd5IfexaVkqe3PVala
         B1MA==
X-Gm-Message-State: AOAM533XgUEAXmqyI1hI7SD5PWj7+/nwK4HnAsxAGTSCobeZe4/Qzefd
        qtMvFwkS0gEnmQobhdIO+ylVs9DBmRYMSex3Ah4bXc4c
X-Google-Smtp-Source: ABdhPJyT6A9cKehZWb10KrnBie1nNYFDIpBin6H4BfNw8lMRDh4wdHe62j3D8Lt/Wi97awQK5IviqbABQnlhm14zshQ=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr17227610wrb.132.1604963593350;
 Mon, 09 Nov 2020 15:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20201109222319.2630557-1-jcrouse@codeaurora.org> <20201109222319.2630557-3-jcrouse@codeaurora.org>
In-Reply-To: <20201109222319.2630557-3-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Nov 2020 15:13:01 -0800
Message-ID: <CAF6AEGv19=+3gc1KnYrzmLBs--7P7BFhjmV1Qg_9N10299Qg2g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/3] drm/msm: Add an adreno-smmu-priv callback to
 get pagefault info
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 9, 2020 at 2:23 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add a callback in adreno-smmu-priv to read interesting SMMU
> registers to provide an opportunity for a richer debug experience
> in the GPU driver.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 31 +++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index d0636c803a36..367a267324a2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -32,6 +32,24 @@ static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>
> +static void qcom_adreno_smmu_get_fault_info(const void *cookie,
> +               struct adreno_smmu_fault_info *info)
> +{
> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +       info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
> +       /* FIXME: return error here if we aren't really in a fault? */
> +
> +       info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
> +       info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
> +       info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
> +       info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
> +       info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
> +       info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -156,6 +174,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>         priv->cookie = smmu_domain;
>         priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>         priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
> +       priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>
>         return 0;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 04288b6fc619..fe511540a6bf 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -224,6 +224,8 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_FSYNR0             0x68
>  #define ARM_SMMU_FSYNR0_WNR            BIT(4)
>
> +#define ARM_SMMU_CB_FSYNR1             0x6c
> +
>  #define ARM_SMMU_CB_S1_TLBIVA          0x600
>  #define ARM_SMMU_CB_S1_TLBIASID                0x610
>  #define ARM_SMMU_CB_S1_TLBIVAL         0x620
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index a889f28afb42..fc2592ebb9ba 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -8,6 +8,32 @@
>
>  #include <linux/io-pgtable.h>
>
> +/**
> + * struct adreno_smmu_fault_info - container for key fault information
> + *
> + * @far: The faulting IOVA from ARM_SMMU_CB_FAR
> + * @ttbr0: The current TTBR0 pagetable from ARM_SMMU_CB_TTBR0
> + * @contextidr: The value of ARM_SMMU_CB_CONTEXTIDR
> + * @fsr: The fault status from ARM_SMMU_CB_FSR
> + * @fsynr0: The value of FSYNR0 from ARM_SMMU_CB_FSYNR0
> + * @fsynr1: The value of FSYNR1 from ARM_SMMU_CB_FSYNR0
> + * @cbfrsynra: The value of CBFRSYNRA from ARM_SMMU_GR1_CBFRSYNRA(idx)
> + *
> + * This struct passes back key page fault information to the GPU driver
> + * through the get_fault_info function pointer.
> + * The GPU driver can use this information to print informative
> + * log messages and provide deeper GPU specific insight into the fault.
> + */
> +struct adreno_smmu_fault_info {
> +       u64 far;
> +       u64 ttbr0;
> +       u32 contextidr;
> +       u32 fsr;
> +       u32 fsynr0;
> +       u32 fsynr1;
> +       u32 cbfrsynra;
> +};
> +
>  /**
>   * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
>   *
> @@ -17,6 +43,8 @@
>   * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
>   *                 NULL config disables TTBR0 translation, otherwise
>   *                 TTBR0 translation is enabled with the specified cfg
> + * @get_fault_info: Call a helper function in the GPU driver to process a
> + *                 pagefault

This description isn't quite right, since it is call*ed* by the GPU
driver.  (And the helper aspect is irrelivant to the adreno/smmu
private interface).  Maybe something like:

"Called by the GPU driver fault handler to retrieve information about
a pagefault"

?

BR,
-R

>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -31,6 +59,7 @@ struct adreno_smmu_priv {
>      const void *cookie;
>      const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
>      int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>  };
>
> -#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> +#endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.25.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
