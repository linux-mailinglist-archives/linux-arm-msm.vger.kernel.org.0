Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4D442E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 19:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfFLR6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 13:58:48 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:37695 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbfFLR6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 13:58:48 -0400
Received: by mail-it1-f196.google.com with SMTP id x22so12040437itl.2;
        Wed, 12 Jun 2019 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJG2vQZhcPeJyWwyoiZlnIBWFYcWNy7uPN6RTvt3o+0=;
        b=XzeKPY4UghingG2IHUZj64o5cUYXhSbgoRNlc2ZYSYp19Xb8MeOj9g4cyCBylvQIJh
         wLdBJkIJKdeeyzOChwsKtMRRjxXx+i7HA90CEf1Zjd+ke64dOY4eZ0vo4X+P8bUVg2x8
         cTnwDbkdqGs29ml8EOlAOsZ/CeH1L2BFZnzI96H2449TrjsRS3mLgYGPhGde3CEOFWTU
         d5rtmjG4RDEjw06GweP8Ae/jfnCaibpeyqnj1mhSIkHNUliG5KoRzga9xg6ZfrcBJTBP
         toh6V70LGrupSKYSDQK32DkuGqg9WZcJzYMNZ1/7Wmtg2LyTXR72r+qsWNzwhviHYpN8
         SWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJG2vQZhcPeJyWwyoiZlnIBWFYcWNy7uPN6RTvt3o+0=;
        b=ET2ERH4b0uXcFJLNxX35mI52yQQrWV42hhDFB52lHQ8XxhUWBskXpKxs9zPeB4b988
         yUmINoFGytjRF2aDvxe90/sGCPzCusbLhp4Xxb//r8bHLBozZ1LFAhCPxku21UKd1+dV
         6xJqwwpAB1ZI6iinRENkwPfXbtCViFDpvCAOZLTLOnlp4hZIuo9mvBhI6gxw5NAmmrtI
         Iu2gRX/171iVuD20FjZzRO2kfAc6800cMpZCwrwG6Az0/Kj3Q2eKiVqABXUQ4Jj/Q7bC
         0TzBI9gVMNl6N2dPOi62JAl7rL5EV/xmxGSsihloOniiJ1+mJthVGn8jVVRI/P1s8uO8
         BlOg==
X-Gm-Message-State: APjAAAUoG6pl669FaAfeN0jOlmQRI5LNgsGRqjuxq3VChMrI7WoJHQoe
        f0B5vBXMEFIDBWUT6iuBsKfqkHu/V1U+irafFR4=
X-Google-Smtp-Source: APXvYqy8FsnT2tXAP9AmLOyZ4r6ik6vu3DdC9qVPGnxzd/WzDMecFvfZ2ITzSGUE4E2Ce+Va6U+5wKKkP5QgrxvaLiI=
X-Received: by 2002:a02:7121:: with SMTP id n33mr52373916jac.19.1560362326654;
 Wed, 12 Jun 2019 10:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190605210856.20677-1-bjorn.andersson@linaro.org> <20190605210856.20677-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190605210856.20677-3-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 12 Jun 2019 11:58:35 -0600
Message-ID: <CAOCk7Nocb7VO5xCcuK1FAPVdPr9U-7z8qOL4yt3ig=05e7brgg@mail.gmail.com>
Subject: Re: [RFC 2/2] iommu: arm-smmu: Don't blindly use first SMR to
 calculate mask
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Patrick Daly <pdaly@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 5, 2019 at 3:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> With the SMRs inherited from the bootloader the first SMR might actually
> be valid and in use. As such probing the SMR mask using the first SMR
> might break a stream in use. Search for an unused stream and use this to
> probe the SMR mask.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

I don't quite like the situation where the is no SMR to compute the mask, but I
think the way you've handled it is the best option/

I'm curious, why is this not included in patch #1?  Seems like patch
#1 introduces
the issue, yet doesn't also fix it.

> ---
>  drivers/iommu/arm-smmu.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index c8629a656b42..0c6f5fe6f382 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1084,23 +1084,35 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
>  {
>         void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
>         u32 smr;
> +       int idx;
>
>         if (!smmu->smrs)
>                 return;
>
> +       for (idx = 0; idx < smmu->num_mapping_groups; idx++) {
> +               smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
> +               if (!(smr & SMR_VALID))
> +                       break;
> +       }
> +
> +       if (idx == smmu->num_mapping_groups) {
> +               dev_err(smmu->dev, "Unable to compute streamid_mask\n");
> +               return;
> +       }
> +
>         /*
>          * SMR.ID bits may not be preserved if the corresponding MASK
>          * bits are set, so check each one separately. We can reject
>          * masters later if they try to claim IDs outside these masks.
>          */
>         smr = smmu->streamid_mask << SMR_ID_SHIFT;
> -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
>         smmu->streamid_mask = smr >> SMR_ID_SHIFT;
>
>         smr = smmu->streamid_mask << SMR_MASK_SHIFT;
> -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
>         smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
>  }
>
> --
> 2.18.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
