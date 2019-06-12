Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60ADA42E54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 20:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfFLSHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 14:07:30 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:51946 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfFLSH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 14:07:29 -0400
Received: by mail-it1-f193.google.com with SMTP id m3so12365283itl.1;
        Wed, 12 Jun 2019 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NbsRejr1pAKw9HELtNKmuNY33bDPbioFfFfJUKWmWTM=;
        b=ZcV9onKKpX9J358lHILsd8ku+y1dimhMbeN3mn5PWSU4+xad/bT9c85DdaEECInO8m
         TVgXYZYDOCIahuODLrCimNqX6GBQIt8khnHmfcOpac02H6pQpK2kYXebmHi3ilRt7EGA
         u0R+exR5BffNfyfuC7yOKIbfhThyUgSM6g6zpuX2GDgNQDDWZL1lkC6ooKxQFGvUIT3F
         wjR74RENgnHrffCTIqrSz2Cgnpm+0XbPlEznn6cMygAceZsjYah0c7MEC/AX3uiZW2Sm
         mZTTr/ATAsGqvST1xIOquI911+u/s3WSqp0J0wnr+S3i1lPXl+temISzECP0Tg7+Jkp7
         ZSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NbsRejr1pAKw9HELtNKmuNY33bDPbioFfFfJUKWmWTM=;
        b=LIJyjN2OHv2Shmvg2bjSzZGG0XxWIds2ZHAwbXrvjpVuL4JG18o4LTZlOPceseVoIu
         aER3FpoOYJz/vCSCi6BRB/lI6owvHxVPkdRhl085R0JTQsSzu8sG6i1rIcnjBFUMq/2I
         Dg8vLOfRG3cf2BFrRwyyYz0rKFReFSA8y8NhMgRhkjtyESXL1US8HXwa6I8lRUv+iiq6
         jIvNvrB+yBUnYz2qtayXzSuoZHxKeuPXcF7ZWUxndSyMVv0qlBN80Ryca7jREJ3PCSkk
         xgxCNHmLD7W6GdL+eNrUdL4EN62YBhe9w+yoQRP/e7fXEo8kjydndRWuxurZkzjAGn8H
         zNDw==
X-Gm-Message-State: APjAAAU05yM3FQOmuW51DAF/LsQ0yMjdd8/zC8lVstKOVa0eSywiih5Y
        a20ISm9SNoSQZU3BHkmptjf7MGjKXfU+MEmLz8Q=
X-Google-Smtp-Source: APXvYqzBJMFwDSevkDY12bvv7GT90a1Ar3OwjTacoM1UEvwyGNN2IjFX9GQLUU7mZgRB1FuNapS1x7CtPhMx4hm+OKo=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr343755itb.128.1560362849111;
 Wed, 12 Jun 2019 11:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190605210856.20677-1-bjorn.andersson@linaro.org> <20190605210856.20677-2-bjorn.andersson@linaro.org>
In-Reply-To: <20190605210856.20677-2-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 12 Jun 2019 12:07:17 -0600
Message-ID: <CAOCk7NpuxpGGYwiPSdwkrZrM=u-euAUTX3wa-yaEsKocDUx-UA@mail.gmail.com>
Subject: Re: [RFC 1/2] iommu: arm-smmu: Handoff SMR registers and context banks
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
> Boot splash screen or EFI framebuffer requires the display hardware to
> operate while the Linux iommu driver probes. Therefore, we cannot simply
> wipe out the SMR register settings programmed by the bootloader.
>
> Detect which SMR registers are in use during probe, and which context
> banks they are associated with. Reserve these context banks for the
> first Linux device whose stream-id matches the SMR register.
>
> Any existing page-tables will be discarded.
>
> Heavily based on downstream implementation by Patrick Daly
> <pdaly@codeaurora.org>.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

This is very similar to the hacked up version I did, and I'm glad to see it
cleaned up and posted.

This is important work, and I want to see it move forward, however it doesn't
completely address everything, IMO.  Fixing the remaining issues certainly
can be follow on work, but I don't know if they would end up affecting this
implementation.

So, with this series, we've gone from a crash on msm8998/sdm845, to causing
context faults.  This is because while we are now not nuking the config, we
are preventing the bootloader installed translations from working.  Essentially
the display already has a mapping (technically passthrough) that is likely being
used by EFIFB.  The instant the SMMU inits, that mapping becomes invalid,
and the display is going to generate context faults.  While not fatal,
this provides
a bad user experience as there are nasty messages, and EFIFB stops working.

The situation does get resolved once the display driver inits and takes over the
HW and SMMU mappings, so we are not stuck with it, but it would be nice to
have that addressed as well, ie have EFIFB working up until the Linux display
driver takes over.

The only way I can see that happening is if the SMMU leaves the context bank
alone, with M == 0, and the iommu framework defines a domain attribute or
some other mechanism to allow the driver to flip the M bit in the context bank
after installing the necessary handover translations.

> ---
>  drivers/iommu/arm-smmu-regs.h |  2 +
>  drivers/iommu/arm-smmu.c      | 80 ++++++++++++++++++++++++++++++++---
>  2 files changed, 77 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
> index e9132a926761..8c1fd84032a2 100644
> --- a/drivers/iommu/arm-smmu-regs.h
> +++ b/drivers/iommu/arm-smmu-regs.h
> @@ -105,7 +105,9 @@
>  #define ARM_SMMU_GR0_SMR(n)            (0x800 + ((n) << 2))
>  #define SMR_VALID                      (1 << 31)
>  #define SMR_MASK_SHIFT                 16
> +#define SMR_MASK_MASK                  0x7fff
>  #define SMR_ID_SHIFT                   0
> +#define SMR_ID_MASK                    0xffff
>
>  #define ARM_SMMU_GR0_S2CR(n)           (0xc00 + ((n) << 2))
>  #define S2CR_CBNDX_SHIFT               0
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0a28b3..c8629a656b42 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -135,6 +135,7 @@ struct arm_smmu_s2cr {
>         enum arm_smmu_s2cr_type         type;
>         enum arm_smmu_s2cr_privcfg      privcfg;
>         u8                              cbndx;
> +       bool                            handoff;
>  };
>
>  #define s2cr_init_val (struct arm_smmu_s2cr){                          \
> @@ -399,9 +400,22 @@ static int arm_smmu_register_legacy_master(struct device *dev,
>         return err;
>  }
>
> -static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> +static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
> +                              struct device *dev)
>  {
> +       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +       unsigned long *map = smmu->context_map;
> +       int end = smmu->num_context_banks;
> +       int cbndx;
>         int idx;
> +       int i;
> +
> +       for_each_cfg_sme(fwspec, i, idx) {
> +               if (smmu->s2crs[idx].handoff) {
> +                       cbndx = smmu->s2crs[idx].cbndx;
> +                       goto found_handoff;
> +               }
> +       }
>
>         do {
>                 idx = find_next_zero_bit(map, end, start);
> @@ -410,6 +424,17 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
>         } while (test_and_set_bit(idx, map));
>
>         return idx;
> +
> +found_handoff:
> +       for (i = 0; i < smmu->num_mapping_groups; i++) {
> +               if (smmu->s2crs[i].cbndx == cbndx) {
> +                       smmu->s2crs[i].cbndx = 0;
> +                       smmu->s2crs[i].handoff = false;
> +                       smmu->s2crs[i].count--;
> +               }
> +       }
> +
> +       return cbndx;
>  }
>
>  static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
> @@ -759,7 +784,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  }
>
>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> -                                       struct arm_smmu_device *smmu)
> +                                       struct arm_smmu_device *smmu,
> +                                       struct device *dev)
>  {
>         int irq, start, ret = 0;
>         unsigned long ias, oas;
> @@ -873,8 +899,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>                 ret = -EINVAL;
>                 goto out_unlock;
>         }
> -       ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> -                                     smmu->num_context_banks);
> +       ret = __arm_smmu_alloc_cb(smmu, start, dev);
>         if (ret < 0)
>                 goto out_unlock;
>
> @@ -1264,7 +1289,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>                 return ret;
>
>         /* Ensure that the domain is finalised */
> -       ret = arm_smmu_init_domain_context(domain, smmu);
> +       ret = arm_smmu_init_domain_context(domain, smmu, dev);
>         if (ret < 0)
>                 goto rpm_put;
>
> @@ -1798,6 +1823,49 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>         writel(reg, ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
>  }
>
> +static void arm_smmu_read_smr_state(struct arm_smmu_device *smmu)
> +{
> +       u32 privcfg;
> +       u32 cbndx;
> +       u32 mask;
> +       u32 type;
> +       u32 s2cr;
> +       u32 smr;
> +       u32 id;
> +       int i;
> +
> +       for (i = 0; i < smmu->num_mapping_groups; i++) {
> +               smr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(i));
> +               mask = (smr >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
> +               id = smr & SMR_ID_MASK;
> +               if (!(smr & SMR_VALID))
> +                       continue;
> +
> +               s2cr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(i));
> +               type = (s2cr >> S2CR_TYPE_SHIFT) & S2CR_TYPE_MASK;
> +               cbndx = (s2cr >> S2CR_CBNDX_SHIFT) & S2CR_CBNDX_MASK;
> +               privcfg = (s2cr >> S2CR_PRIVCFG_SHIFT) & S2CR_PRIVCFG_MASK;
> +               if (type != S2CR_TYPE_TRANS)
> +                       continue;
> +
> +               /* Populate the SMR */
> +               smmu->smrs[i].mask = mask;
> +               smmu->smrs[i].id = id;
> +               smmu->smrs[i].valid = true;
> +
> +               /* Populate the S2CR */
> +               smmu->s2crs[i].group = NULL;
> +               smmu->s2crs[i].count = 1;
> +               smmu->s2crs[i].type = type;
> +               smmu->s2crs[i].privcfg = privcfg;
> +               smmu->s2crs[i].cbndx = cbndx;
> +               smmu->s2crs[i].handoff = true;
> +
> +               /* Mark the context bank as busy */
> +               bitmap_set(smmu->context_map, cbndx, 1);
> +       }
> +}
> +
>  static int arm_smmu_id_size_to_bits(int size)
>  {
>         switch (size) {
> @@ -2023,6 +2091,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>                 dev_notice(smmu->dev, "\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
>                            smmu->ipa_size, smmu->pa_size);
>
> +       arm_smmu_read_smr_state(smmu);
> +
>         return 0;
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
