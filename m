Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1D2212DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 22:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgGBUWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 16:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBUWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 16:22:07 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493D1C08C5C1;
        Thu,  2 Jul 2020 13:22:07 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d18so19660839edv.6;
        Thu, 02 Jul 2020 13:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJqRalz8nhd1uucT/hW2AoacNEdXpfTo9tORErtQ+CY=;
        b=A7yLVEUdkzu0U9R4Gydu8ALB+orKv8jxKoFtu9XmVALASxtFPW+Va6LJ5qJhI72YNO
         9Xv4iYY5bNsUh4qm4m+LioK2uUta+u/jnJbYpH5humUCWvYsMBgJboDYhKhHZZUx+Y2t
         CDichgejEQLfWBWPDxoXBh4pejxijkeFbK9MuXnJAFs5KNJlHJCDWrK9c/h1hkSFn1Q4
         i5mh2FvofLz5G0TU14GFgd8kGAENZrFOlC0+nycGxTpVBcCABFThDjY47tWqwP7ogWZm
         0gGGJU4NXyM42SPgXXtcGIsWvfmWkLee6PiI8Na2c1rFNSlo/xXzsM8i1cmZ6bAwIOqg
         4fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJqRalz8nhd1uucT/hW2AoacNEdXpfTo9tORErtQ+CY=;
        b=C9Xr9tTivuCaC8wgLRz7/pN/3lqlyjiCVKqZpfvQOPaCFWYQpk6yxpUnNjRnbQLjgs
         H4/+LrFHaWCAMlwcuEo/4UOi4f61NYnpkMhVS5aA3p98e7qKIujs5yoPIpzROdLmTYwk
         1zlynbe+QqyGiV8OjdSTj/Kc01G8ve9EycZh+4tmZD2sDitqQGy1MXX0FpnnO1k7j/NX
         +JhXuNf9sy/TqwZlfemCUh8ueonhLx0q9XH1BjsJBVWlbLlkbeerp3nvqMysHuoV4ngu
         Z679KZQqqOHHo3cCrIdts6CMivTe9xV0PMuE5BUan634E8JzU03tsVyQZhIqIFlJsajC
         NqaQ==
X-Gm-Message-State: AOAM5332Eau2wUtf/ecfcgSwl/uZPFBWWTY/VySu6rwbjUe3VlM8Hwri
        GzjJ53J/CZJv9tcxpLwNQVPQfjlwJZttbOFMLCYOx8s+
X-Google-Smtp-Source: ABdhPJzZ45bUaTYoAMc4+7tytjU6jg5rAHFG6yHcGC5gt16WN/ceKbzpc4PdmYV+WosMNX1otFsQabXOGlQkVzfbrmw=
X-Received: by 2002:a50:f392:: with SMTP id g18mr14487895edm.151.1593721325980;
 Thu, 02 Jul 2020 13:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200042.13713-1-jcrouse@codeaurora.org> <20200626200042.13713-3-jcrouse@codeaurora.org>
In-Reply-To: <20200626200042.13713-3-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 2 Jul 2020 13:22:36 -0700
Message-ID: <CAF6AEGuN6b5a0=Ava53vyv8E57=XCPBTZAjYrRNxtNv41VOp4Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] iommu/arm-smmu: Add support for split pagetables
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 1:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
> by the io-pgtable configuration.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/iommu/arm-smmu.c | 21 ++++++++++++++++-----
>  drivers/iommu/arm-smmu.h | 25 +++++++++++++++++++------
>  2 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 8a3a6c8c887a..048de2681670 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -555,11 +555,15 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>                         cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
>                         cb->ttbr[1] = 0;
>                 } else {
> -                       cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> -                       cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -                                                 cfg->asid);
> +                       cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +                               cfg->asid);
>                         cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -                                                cfg->asid);
> +                               cfg->asid);

above looks like stray whitespace changes?

> +
> +                       if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +                               cb->ttbr[1] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +                       else
> +                               cb->ttbr[0] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
>                 }
>         } else {
>                 cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> @@ -824,7 +828,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>
>         /* Update the domain's page sizes to reflect the page table format */
>         domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -       domain->geometry.aperture_end = (1UL << ias) - 1;
> +
> +       if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +               domain->geometry.aperture_start = ~0UL << ias;
> +               domain->geometry.aperture_end = ~0UL;
> +       } else {
> +               domain->geometry.aperture_end = (1UL << ias) - 1;
> +       }
> +
>         domain->geometry.force_aperture = true;
>
>         /* Initialise the context bank with our page table cfg */
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 38b041530a4f..5f2de20e883b 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -168,10 +168,12 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_TCR                        0x30
>  #define ARM_SMMU_TCR_EAE               BIT(31)
>  #define ARM_SMMU_TCR_EPD1              BIT(23)
> +#define ARM_SMMU_TCR_A1                        BIT(22)
>  #define ARM_SMMU_TCR_TG0               GENMASK(15, 14)
>  #define ARM_SMMU_TCR_SH0               GENMASK(13, 12)
>  #define ARM_SMMU_TCR_ORGN0             GENMASK(11, 10)
>  #define ARM_SMMU_TCR_IRGN0             GENMASK(9, 8)
> +#define ARM_SMMU_TCR_EPD0              BIT(7)
>  #define ARM_SMMU_TCR_T0SZ              GENMASK(5, 0)
>
>  #define ARM_SMMU_VTCR_RES1             BIT(31)
> @@ -347,12 +349,23 @@ struct arm_smmu_domain {
>
>  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  {
> -       return ARM_SMMU_TCR_EPD1 |
> -              FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> -              FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> -              FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> -              FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> -              FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +       u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> +               FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> +               FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> +               FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> +               FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +
> +       /*
> +       * When TTBR1 is selected shift the TCR fields by 16 bits and disable
> +       * translation in TTBR0
> +       */
> +       if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +               tcr = (tcr << 16) & ~ARM_SMMU_TCR_A1;
> +               tcr |= ARM_SMMU_TCR_EPD0;
> +       } else
> +               tcr |= ARM_SMMU_TCR_EPD1;

I'm not personally a fan of if/else ladders that mix {}'s, but
Will/Robin may have a different opinion

BR,
-R

> +
> +       return tcr;
>  }
>
>  static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> --
> 2.17.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
