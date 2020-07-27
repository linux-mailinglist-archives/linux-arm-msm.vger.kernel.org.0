Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475D122F35B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 17:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729850AbgG0PD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 11:03:57 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:22115 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729220AbgG0PD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 11:03:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595862235; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=LolzyKXcEplORVr2wLOkC8klu+9uXZS44xDXWhpCYKk=; b=iaRVRqXzh192FN56m5VQa80DlzfVLOHVm45+E2wT3XTk17Ouq+AubCBRP8ufduCUrzY6Zzs+
 akc0r6AVMo0HLWycCpWdcub5JJ3rC3j0MT22AoF3Y62+THYgCNGSHANe99VvQqNgvZg2U7sM
 yYGyCn53+3Yl8ggFYlW+V+6S0w8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f1eecb2fcbecb3df181ed8a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 15:03:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AAE1EC4339C; Mon, 27 Jul 2020 15:03:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2300BC433CA;
        Mon, 27 Jul 2020 15:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2300BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 27 Jul 2020 09:03:07 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Freedreno] [PATCH v10 06/13] iommu/arm-smmu-qcom: Get and set
 the pagetable config for split pagetables
Message-ID: <20200727150306.GB32521@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-7-jcrouse@codeaurora.org>
 <CAF6AEGuF_fC4=vBKr24HogE-d3KkXUQivOpVde9iqf+RvRzNtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuF_fC4=vBKr24HogE-d3KkXUQivOpVde9iqf+RvRzNtA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 26, 2020 at 10:03:07AM -0700, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 8:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > The Adreno GPU has the capability to manage its own pagetables and switch
> > them dynamically from the hardware. To do this the GPU uses TTBR1 for
> > "global" GPU memory and creates local pagetables for each context and
> > switches them dynamically with the GPU.
> >
> > Use DOMAIN_ATTR_PGTABLE_CFG to get the current configuration for the
> > TTBR1 pagetable from the smmu driver so the leaf driver can create
> > compatible pagetables for use with TTBR0.
> >
> > Because TTBR0 is disabled by default when TTBR1 is enabled the GPU
> > driver can pass the configuration of one of the newly created pagetables
> > back through DOMAIN_ATTR_PGTABLE_CFG as a trigger to enable translation on
> > TTBR0.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/iommu/arm-smmu-qcom.c | 47 +++++++++++++++++++++++++++++++++++
> >  drivers/iommu/arm-smmu.c      | 32 ++++++++++++++++++------
> >  drivers/iommu/arm-smmu.h      | 10 ++++++++
> >  3 files changed, 81 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> > index b9a5c5369e86..9a0c64ca9cb6 100644
> > --- a/drivers/iommu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm-smmu-qcom.c
> > @@ -34,6 +34,52 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >         return false;
> >  }
> >
> > +/*
> > + * Local implementation to configure TTBR0 wil the specified pagetable config.
> > + * The GPU driver will call this to enable TTBR0 when per-instance pagetables
> > + * are active
> > + */
> > +static int qcom_adreno_smmu_set_pgtable_cfg(struct arm_smmu_domain *smmu_domain,
> > +               struct io_pgtable_cfg *pgtbl_cfg)
> > +{
> > +       struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> > +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> > +       struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> > +
> > +       /* The domain must have split pagetables already enabled */
> > +       if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> > +               return -EINVAL;
> > +
> > +       /* If the pagetable config is NULL, disable TTBR0 */
> > +       if (!pgtbl_cfg) {
> > +               /* Do nothing if it is already disabled */
> > +               if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> > +                       return -EINVAL;
> > +
> > +               /* Set TCR to the original configuration */
> > +               cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
> > +               cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> > +       } else {
> > +               u32 tcr = cb->tcr[0];
> > +
> > +               /* FIXME: What sort of validation do we need to do here? */
> > +
> > +               /* Don't call this again if TTBR0 is already enabled */
> > +               if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> > +                       return -EINVAL;
> > +
> > +               tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
> > +               tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
> > +
> > +               cb->tcr[0] = tcr;
> > +               cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > +               cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> > +       }
> > +
> > +       arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
> > +       return 0;
> > +}
> > +
> >  static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> >                 struct device *dev, int start, int count)
> >  {
> > @@ -131,6 +177,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> >         .def_domain_type = qcom_smmu_def_domain_type,
> >         .reset = qcom_smmu500_reset,
> >         .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> > +       .set_pgtable_cfg = qcom_adreno_smmu_set_pgtable_cfg,
> >  };
> >
> >  static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index fff536a44faa..e1036ae54a8d 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -86,13 +86,6 @@ struct arm_smmu_smr {
> >         bool                            valid;
> >  };
> >
> > -struct arm_smmu_cb {
> > -       u64                             ttbr[2];
> > -       u32                             tcr[2];
> > -       u32                             mair[2];
> > -       struct arm_smmu_cfg             *cfg;
> > -};
> > -
> >  static bool using_legacy_binding, using_generic_binding;
> >
> >  static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> > @@ -558,7 +551,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> >         }
> >  }
> >
> > -static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> > +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  {
> >         u32 reg;
> >         bool stage1;
> > @@ -1515,6 +1508,18 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
> >                 case DOMAIN_ATTR_NESTING:
> >                         *(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
> >                         return 0;
> > +               case DOMAIN_ATTR_PGTABLE_CFG: {
> > +                       struct io_pgtable *pgtable;
> > +                       struct io_pgtable_cfg *dest = data;
> > +
> > +                       if (!smmu_domain->pgtbl_ops)
> > +                               return -ENODEV;
> > +
> > +                       pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> > +
> > +                       memcpy(dest, &pgtable->cfg, sizeof(*dest));
> > +                       return 0;
> > +               }
> 
> hmm, maybe it would make sense to have impl hooks for get/set_attr, so
> we could handle DOMAIN_ATTR_PGTABLE_CFG inside the adreno_smmu_impl?
> 
> Having impl specific domain attrs would be useful for what I have in
> mind to enable stall/resume support, so we can hook in devcoredump to
> iova faults (which would be a huge improvement for debugability, right
> now iova faults are somewhat harder to debug than needed).  My rough
> idea was to add DOMAIN_ATTR_RESUME, which could be used with
> set_attr() to (1) enable STALL and let drm/msm know whether the iommu
> supports it, and (2) resume translation from wq context after
> devcoredump snapshot is collected.

Expanding on that, maybe a DOMAIN_ATTR_IMPL with struct { int subtype; void
*data } as the payload would let us add things without having to populate the
generic enum.  That would force us to export an arm-smmu header but at this
point it might be such a bad thing.

Jordan


> BR,
> -R
> 
> >                 default:
> >                         return -ENODEV;
> >                 }
> > @@ -1555,6 +1560,17 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> >                         else
> >                                 smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> >                         break;
> > +               case DOMAIN_ATTR_PGTABLE_CFG: {
> > +                       struct arm_smmu_device *smmu = smmu_domain->smmu;
> > +
> > +                       ret = -EPERM;
> > +
> > +                       if (smmu)
> > +                               if (smmu->impl && smmu->impl->set_pgtable_cfg)
> > +                                       ret = smmu->impl->set_pgtable_cfg(smmu_domain,
> > +                                               data);
> > +                       }
> > +                       break;
> >                 default:
> >                         ret = -ENODEV;
> >                 }
> > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > index 9f81c1fffe1e..9325fc28d24a 100644
> > --- a/drivers/iommu/arm-smmu.h
> > +++ b/drivers/iommu/arm-smmu.h
> > @@ -328,6 +328,13 @@ struct arm_smmu_cfg {
> >  };
> >  #define ARM_SMMU_INVALID_IRPTNDX       0xff
> >
> > +struct arm_smmu_cb {
> > +       u64                             ttbr[2];
> > +       u32                             tcr[2];
> > +       u32                             mair[2];
> > +       struct arm_smmu_cfg             *cfg;
> > +};
> > +
> >  enum arm_smmu_domain_stage {
> >         ARM_SMMU_DOMAIN_S1 = 0,
> >         ARM_SMMU_DOMAIN_S2,
> > @@ -408,6 +415,8 @@ struct arm_smmu_impl {
> >         int (*def_domain_type)(struct device *dev);
> >         int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> >                         struct device *dev, int start, int max);
> > +       int (*set_pgtable_cfg)(struct arm_smmu_domain *smmu_domain,
> > +                       struct io_pgtable_cfg *cfg);
> >  };
> >
> >  #define INVALID_SMENDX                 -1
> > @@ -493,6 +502,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
> >  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> >  struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
> >
> > +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
> >  int arm_mmu500_reset(struct arm_smmu_device *smmu);
> >
> >  #endif /* _ARM_SMMU_H */
> > --
> > 2.25.1
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
