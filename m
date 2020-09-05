Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F3225E9AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 20:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIESbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 14:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgIESbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 14:31:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2728C061244;
        Sat,  5 Sep 2020 11:31:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g4so10624588wrs.5;
        Sat, 05 Sep 2020 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7rsoN6MaCp+62McHT2xPaACCltEz0sVvL0q+af3xvA=;
        b=k5ekDg/2n2KPHX6zcuDCtrPS5418RvP2WhZtaWC6IDqepiLCm+SNYs1uEo7WvzUGG8
         esLRgyNlR/jvIR8SvBJ+xFFbfvBhHCvQjQsfHGjZb9RVzruSqaN3Hn9D9X3/ATTKo6jd
         8JvgaIPEwHBJQYBDes8vrI5aXODM08MGcZ0Mwz1LuiaeDwcHdQrwnqk9Rr7Urn+eUUDV
         86iNdAmzJkM6GXQdjF4MK8RVc4FsLl9xakfLJpJRUmx4TejKa2fPt9mol7aXZ1u7/0JS
         ORheXiuZecJLd042Vclh4JzlwcRB0x4BChMPvvCwEUp5XmXvGkljG7u1YkYnereC4qFZ
         V16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7rsoN6MaCp+62McHT2xPaACCltEz0sVvL0q+af3xvA=;
        b=iMjBJMXpHb+07HZUtDHXhZ7HcsdbRALO1wssRTaPZmeSS969sMVmzzbVZYnp96XLbX
         A3OS7UWXzoG+VOyjAAjcfxIsn0irNBtVg4QHO8t4cL73i5gOxW2BjULL0giMhdzRNJ67
         NQQ4QQv4xFzy3Uwi+I18NQUb2O3cGJfU/1W6bKOWo5E+LZCQMu6G+GzFzoYnEBPENHUl
         Etakw1SzRTGlv7xRcMc/qNmz4xEsbHCT56lv4sHmpom0aJVEs/IzdK4FrPPQQ+CeAR1y
         8ZgN+GAwtYyCSwGRlPvGAx1RGY3THNmSCXnPvCrLLoztMPCrjR+O/Uzm/m4cNQmpr8j0
         PHqw==
X-Gm-Message-State: AOAM533OhIr3B+nS8jq7jzyicqGpbHauuOSPiDrQN8WoKQDBFon10Wa6
        n52loVtbkCLvV0W7LXT3fEE2hhGrniyhE/evb2I=
X-Google-Smtp-Source: ABdhPJx61KkZ3R+ATAyYdnW/HRL5V/1BNVF8qDCqyQ47aJ4r+2Swa0B1JJL+q5XBwgqg6IDZ/82PaF+zTXmudqRlDes=
X-Received: by 2002:adf:f382:: with SMTP id m2mr12748791wro.327.1599330708634;
 Sat, 05 Sep 2020 11:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200901164707.2645413-1-robdclark@gmail.com> <20200901164707.2645413-15-robdclark@gmail.com>
 <20200904160018.GH3715@yoga>
In-Reply-To: <20200904160018.GH3715@yoga>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 5 Sep 2020 11:32:43 -0700
Message-ID: <CAF6AEGv-JyxD_+fpAasm8Zgx+1iPq+x-=k+YbUj5+1dfQ3L-bw@mail.gmail.com>
Subject: Re: [PATCH v16 14/20] iommu/arm-smmu: Prepare for the adreno-smmu implementation
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Hanna Hawa <hannah@marvell.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 4, 2020 at 9:00 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 01 Sep 11:46 CDT 2020, Rob Clark wrote:
>
> > From: Jordan Crouse <jcrouse@codeaurora.org>
> >
> > Do a bit of prep work to add the upcoming adreno-smmu implementation.
> >
> > Add an hook to allow the implementation to choose which context banks
> > to allocate.
> >
> > Move some of the common structs to arm-smmu.h in anticipation of them
> > being used by the implementations and update some of the existing hooks
> > to pass more information that the implementation will need.
> >
> > These modifications will be used by the upcoming Adreno SMMU
> > implementation to identify the GPU device and properly configure it
> > for pagetable switching.
> >
> > Co-developed-by: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> As I built the handoff support on top of this patch I ended up
> reworking the alloc_context_bank() prototype to something I found a
> little bit cleaner.
>
> So perhaps you would be interested in squashing
> https://lore.kernel.org/linux-arm-msm/20200904155513.282067-2-bjorn.andersson@linaro.org/
> into this patch?

Yeah, I think this looks nicer, thanks

BR,
-R

> Otherwise, feel free to add my:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  2 +-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 69 ++++++----------------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 51 +++++++++++++++-
> >  3 files changed, 68 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> > index a9861dcd0884..88f17cc33023 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> > @@ -69,7 +69,7 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
> >  }
> >
> >  static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
> > -             struct io_pgtable_cfg *pgtbl_cfg)
> > +             struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> >  {
> >       struct cavium_smmu *cs = container_of(smmu_domain->smmu,
> >                                             struct cavium_smmu, smmu);
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 8e884e58f208..68b7b9e6140e 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -65,41 +65,10 @@ module_param(disable_bypass, bool, S_IRUGO);
> >  MODULE_PARM_DESC(disable_bypass,
> >       "Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
> >
> > -struct arm_smmu_s2cr {
> > -     struct iommu_group              *group;
> > -     int                             count;
> > -     enum arm_smmu_s2cr_type         type;
> > -     enum arm_smmu_s2cr_privcfg      privcfg;
> > -     u8                              cbndx;
> > -};
> > -
> >  #define s2cr_init_val (struct arm_smmu_s2cr){                                \
> >       .type = disable_bypass ? S2CR_TYPE_FAULT : S2CR_TYPE_BYPASS,    \
> >  }
> >
> > -struct arm_smmu_smr {
> > -     u16                             mask;
> > -     u16                             id;
> > -     bool                            valid;
> > -};
> > -
> > -struct arm_smmu_cb {
> > -     u64                             ttbr[2];
> > -     u32                             tcr[2];
> > -     u32                             mair[2];
> > -     struct arm_smmu_cfg             *cfg;
> > -};
> > -
> > -struct arm_smmu_master_cfg {
> > -     struct arm_smmu_device          *smmu;
> > -     s16                             smendx[];
> > -};
> > -#define INVALID_SMENDX                       -1
> > -#define cfg_smendx(cfg, fw, i) \
> > -     (i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
> > -#define for_each_cfg_sme(cfg, fw, i, idx) \
> > -     for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
> > -
> >  static bool using_legacy_binding, using_generic_binding;
> >
> >  static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> > @@ -234,19 +203,6 @@ static int arm_smmu_register_legacy_master(struct device *dev,
> >  }
> >  #endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
> >
> > -static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> > -{
> > -     int idx;
> > -
> > -     do {
> > -             idx = find_next_zero_bit(map, end, start);
> > -             if (idx == end)
> > -                     return -ENOSPC;
> > -     } while (test_and_set_bit(idx, map));
> > -
> > -     return idx;
> > -}
> > -
> >  static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
> >  {
> >       clear_bit(idx, map);
> > @@ -578,7 +534,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> >       }
> >  }
> >
> > -static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> > +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  {
> >       u32 reg;
> >       bool stage1;
> > @@ -665,7 +621,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  }
> >
> >  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > -                                     struct arm_smmu_device *smmu)
> > +                                     struct arm_smmu_device *smmu,
> > +                                     struct device *dev)
> >  {
> >       int irq, start, ret = 0;
> >       unsigned long ias, oas;
> > @@ -780,10 +737,20 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >               ret = -EINVAL;
> >               goto out_unlock;
> >       }
> > -     ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> > +
> > +     smmu_domain->smmu = smmu;
> > +
> > +     if (smmu->impl && smmu->impl->alloc_context_bank)
> > +             ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
> > +                             start, smmu->num_context_banks);
> > +     else
> > +             ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> >                                     smmu->num_context_banks);
> > -     if (ret < 0)
> > +
> > +     if (ret < 0) {
> > +             smmu_domain->smmu = NULL;
> >               goto out_unlock;
> > +     }
> >
> >       cfg->cbndx = ret;
> >       if (smmu->version < ARM_SMMU_V2) {
> > @@ -798,8 +765,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >       else
> >               cfg->asid = cfg->cbndx;
> >
> > -     smmu_domain->smmu = smmu;
> > -
> >       pgtbl_cfg = (struct io_pgtable_cfg) {
> >               .pgsize_bitmap  = smmu->pgsize_bitmap,
> >               .ias            = ias,
> > @@ -810,7 +775,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >       };
> >
> >       if (smmu->impl && smmu->impl->init_context) {
> > -             ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
> > +             ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
> >               if (ret)
> >                       goto out_clear_smmu;
> >       }
> > @@ -1194,7 +1159,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >               return ret;
> >
> >       /* Ensure that the domain is finalised */
> > -     ret = arm_smmu_init_domain_context(domain, smmu);
> > +     ret = arm_smmu_init_domain_context(domain, smmu, dev);
> >       if (ret < 0)
> >               goto rpm_put;
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index f3e456893f28..59ff3fc5c6c8 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -256,6 +256,21 @@ enum arm_smmu_implementation {
> >       QCOM_SMMUV2,
> >  };
> >
> > +struct arm_smmu_s2cr {
> > +     struct iommu_group              *group;
> > +     int                             count;
> > +     enum arm_smmu_s2cr_type         type;
> > +     enum arm_smmu_s2cr_privcfg      privcfg;
> > +     u8                              cbndx;
> > +};
> > +
> > +struct arm_smmu_smr {
> > +     u16                             mask;
> > +     u16                             id;
> > +     bool                            valid;
> > +     bool                            pinned;
> > +};
> > +
> >  struct arm_smmu_device {
> >       struct device                   *dev;
> >
> > @@ -331,6 +346,13 @@ struct arm_smmu_cfg {
> >  };
> >  #define ARM_SMMU_INVALID_IRPTNDX     0xff
> >
> > +struct arm_smmu_cb {
> > +     u64                             ttbr[2];
> > +     u32                             tcr[2];
> > +     u32                             mair[2];
> > +     struct arm_smmu_cfg             *cfg;
> > +};
> > +
> >  enum arm_smmu_domain_stage {
> >       ARM_SMMU_DOMAIN_S1 = 0,
> >       ARM_SMMU_DOMAIN_S2,
> > @@ -350,6 +372,11 @@ struct arm_smmu_domain {
> >       struct iommu_domain             domain;
> >  };
> >
> > +struct arm_smmu_master_cfg {
> > +     struct arm_smmu_device          *smmu;
> > +     s16                             smendx[];
> > +};
> > +
> >  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
> >  {
> >       u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> > @@ -400,14 +427,35 @@ struct arm_smmu_impl {
> >       int (*cfg_probe)(struct arm_smmu_device *smmu);
> >       int (*reset)(struct arm_smmu_device *smmu);
> >       int (*init_context)(struct arm_smmu_domain *smmu_domain,
> > -                     struct io_pgtable_cfg *cfg);
> > +                     struct io_pgtable_cfg *cfg, struct device *dev);
> >       void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> >                        int status);
> >       int (*def_domain_type)(struct device *dev);
> >       irqreturn_t (*global_fault)(int irq, void *dev);
> >       irqreturn_t (*context_fault)(int irq, void *dev);
> > +     int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> > +                     struct device *dev, int start, int max);
> >  };
> >
> > +#define INVALID_SMENDX                       -1
> > +#define cfg_smendx(cfg, fw, i) \
> > +     (i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
> > +#define for_each_cfg_sme(cfg, fw, i, idx) \
> > +     for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
> > +
> > +static inline int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> > +{
> > +     int idx;
> > +
> > +     do {
> > +             idx = find_next_zero_bit(map, end, start);
> > +             if (idx == end)
> > +                     return -ENOSPC;
> > +     } while (test_and_set_bit(idx, map));
> > +
> > +     return idx;
> > +}
> > +
> >  static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
> >  {
> >       return smmu->base + (n << smmu->pgshift);
> > @@ -472,6 +520,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
> >  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
> >  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> >
> > +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
> >  int arm_mmu500_reset(struct arm_smmu_device *smmu);
> >
> >  #endif /* _ARM_SMMU_H */
> > --
> > 2.26.2
> >
