Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7383E162ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgBRSlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:41:15 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:12400 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726667AbgBRSlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:41:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582051274; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=EvQfb4KB0Yt3g3r/UGv9gwTSbjpcLofIpVM7Lm1Z4Z4=; b=IEZGXvCo1dbZWY4lMEmmWj2lnQNJ/EJLvKF/soxjbdxBBLP1VaAiKPPQzHqzvq1t9NaV2f/f
 5vjXMR+xAPVms2M2vUuiwIBUOfyEnJM78AHZw5EgR1l/PNavVR8ezkD4q40YKVH9a3Z7cWHX
 9PotPgnjgoXhy8Fy0oQpbhbdL34=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c2fc6.7ff82a921228-smtp-out-n03;
 Tue, 18 Feb 2020 18:41:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B630C447A4; Tue, 18 Feb 2020 18:41:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 898CBC43383;
        Tue, 18 Feb 2020 18:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 898CBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 18 Feb 2020 11:41:05 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [RFC PATCH v1] iommu/arm-smmu: Allow domains to choose a context
 bank
Message-ID: <20200218184103.GA15947@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>
References: <1580250823-30739-1-git-send-email-jcrouse@codeaurora.org>
 <CAF6AEGvQyaZL8iSKkzTZ-X4nqXWcyO6RBf-pUfOZFg0w52BGUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvQyaZL8iSKkzTZ-X4nqXWcyO6RBf-pUfOZFg0w52BGUA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 18, 2020 at 10:19:53AM -0800, Rob Clark wrote:
> On Tue, Jan 28, 2020 at 2:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Domains which are being set up for split pagetables usually want to be
> > on a specific context bank for hardware reasons. Force the context
> > bank for domains with the split-pagetable quirk to context bank 0.
> > If context bank 0 is taken, move that context bank to another unused
> > bank and rewrite the stream matching registers accordingly.
> 
> Is the only reason for dealing with the case that bank 0 is already in
> use, due to the DMA domain that gets setup before driver probes?

Right. On Adreno GPUs only one context bank at a time is accessible from the
GPU through an aperture which defaults to context bank 0 and as you might
expect, the aperture controls are protected by the secure world on AC enabled
targets.

Some of the newer targets have a SCM call to switch the aperture but for all the
currently merged platforms we are forced to use context bank 0.

> I'm kinda thinking that we need to invent a way to unwind/detatch the
> DMA domain, and unhook the iommu-dmaops, since this seems to already
> be already causing problems with dma-bufs imported from other drivers
> (who expect that dma_map_*(), with the importing device's dev ptr,
> will do something sane.

That could work, assuming that we could guarantee that our new replacement
domain got the context bank we wanted.

Jordan

> >
> > This is be used by [1] and [2] to leave context bank 0 open so that
> > the Adreno GPU can program it.
> >
> > [1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041438.html
> > [2] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041444.html
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/iommu/arm-smmu.c | 63 +++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 59 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index 85a6773..799a254 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -254,6 +254,43 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> >         return idx;
> >  }
> >
> > +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx);
> > +
> > +static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
> > +               int target)
> > +{
> > +       int new, i;
> > +
> > +       /* Allocate a new context bank id */
> > +       new = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> > +               smmu->num_context_banks);
> > +
> > +       if (new < 0)
> > +               return new;
> > +
> > +       /* If no target is set or we actually got the bank index we wanted */
> > +       if (target == -1 || new == target)
> > +               return new;
> > +
> > +       /* Copy the context configuration to the new index */
> > +       memcpy(&smmu->cbs[new], &smmu->cbs[target], sizeof(*smmu->cbs));
> > +       smmu->cbs[new].cfg->cbndx = new;
> > +
> > +       /* FIXME: Do we need locking here? */
> > +       for (i = 0; i < smmu->num_mapping_groups; i++) {
> > +               if (smmu->s2crs[i].cbndx == target) {
> > +                       smmu->s2crs[i].cbndx = new;
> > +                       arm_smmu_write_s2cr(smmu, i);
> > +               }
> > +       }
> > +
> > +       /*
> > +        * FIXME: Does getting here imply that 'target' is already set in the
> > +        * context_map?
> > +        */
> > +       return target;
> > +}
> > +
> >  static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
> >  {
> >         clear_bit(idx, map);
> > @@ -770,6 +807,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >         struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >         struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> >         unsigned long quirks = 0;
> > +       int forcecb = -1;
> >
> >         mutex_lock(&smmu_domain->init_mutex);
> >         if (smmu_domain->smmu)
> > @@ -844,8 +882,25 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >                          * SEP_UPSTREAM so we don't need to reduce the size of
> >                          * the ias to account for the sign extension bit
> >                          */
> > -                       if (smmu_domain->split_pagetables)
> > -                               quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> > +                       if (smmu_domain->split_pagetables) {
> > +                               /*
> > +                                * If split pagetables are enabled, assume that
> > +                                * the user's intent is to use per-instance
> > +                                * pagetables which, at least on a QCOM target,
> > +                                * means that this domain should be on context
> > +                                * bank 0.
> > +                                */
> > +
> > +                               /*
> > +                                * If we can't force to context bank 0 then
> > +                                * don't bother enabling split pagetables which
> > +                                * then would not allow aux domains
> > +                                */
> > +                               if (start == 0) {
> > +                                       forcecb = 0;
> > +                                       quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> > +                               }
> > +                       }
> >                 } else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
> >                         fmt = ARM_32_LPAE_S1;
> >                         ias = min(ias, 32UL);
> > @@ -883,8 +938,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >                 ret = -EINVAL;
> >                 goto out_unlock;
> >         }
> > -       ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> > -                                     smmu->num_context_banks);
> > +
> > +       ret = __arm_smmu_alloc_cb(smmu, start, forcecb);
> >         if (ret < 0)
> >                 goto out_unlock;
> >
> > --
> > 2.7.4

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
