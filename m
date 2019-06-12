Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A414A42EB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 20:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfFLS24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 14:28:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46788 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfFLS24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 14:28:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id 81so10148004pfy.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 11:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+79M0qC52KBqcZi+aAUpykO9qkYyBvSKoD8+NYjzNgM=;
        b=UMBN/yACkW2pNaFWRj1LqT4MeRqs6jVBZFDrKU77NJNGt1VVfDJJhryte4q7uKq3Ib
         fn1OfIpyKXGCm7/wU587tEChAQygjDEwkz/IvzS4nUjtKgzz1jngIK+x1Owt2Eia+HVu
         /H3V5yPWRDxfYXA9Zhsb+5mKKfM9WZcjmkQ0aUy0DC6BZQF9QdY+AKqLMUnXcuBjUYUQ
         cjyNOX/IaQ9GipKJj+d2B3ic/GXtZiogNyyhysUgWqMt1PnGnLNvJbhM01n4sMR9wSzK
         Jod4ubMgCZ1RKt2iHUw+WaJtNpBjESm5rnza2DmyPbXAeLFJLpY+m13EdM+fbV/wan6J
         WYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+79M0qC52KBqcZi+aAUpykO9qkYyBvSKoD8+NYjzNgM=;
        b=dCK676ZomJdQgp/t4+ZI2uPRpAfXOrA9U46d8H0FM8bCCc64ySN5iE7yGW46aGmA61
         7wxd1gyDptp7KqWpbKI7temSS90/N4BtR/ehYogUEf8+7pKFal5OXTA5vqz30jN+Et4S
         Z3t+5HnQAbNz4luhjSIPOFdaoAf3T302htC7l5F19/g84Tu9pIFccox6ybTrVFRv/Mu9
         tZKQgQrFVweLNogBApkiACrfyf91mHLsqENgfallEA70QPZkcRliNReu4KKp7xhlmHxm
         5/MRsWywzPFP4YPCeMB/vEtDTSBPd8G51czl1glfGsE0ojHJRSHhMpIDXAAaHy1kWDjg
         +9qQ==
X-Gm-Message-State: APjAAAUbPY1Szbktqx6Ej3+L+QNOr25I/024g4KN2QJvpy7nNq0UnTO2
        kJAhQ2Ml0qIlOOJXObU7mKPqriXhj9M=
X-Google-Smtp-Source: APXvYqxcLb0CPq068YSlGSvzRAqyu+g9y/Z69rYUysAsAXumU30uGmd1vWH79G+P3Vh9Thbj9PPDXQ==
X-Received: by 2002:a63:a08:: with SMTP id 8mr26483042pgk.46.1560364135521;
        Wed, 12 Jun 2019 11:28:55 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q198sm252178pfq.155.2019.06.12.11.28.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 11:28:54 -0700 (PDT)
Date:   Wed, 12 Jun 2019 11:28:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Patrick Daly <pdaly@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC 2/2] iommu: arm-smmu: Don't blindly use first SMR to
 calculate mask
Message-ID: <20190612182852.GA4814@minitux>
References: <20190605210856.20677-1-bjorn.andersson@linaro.org>
 <20190605210856.20677-3-bjorn.andersson@linaro.org>
 <CAOCk7Nocb7VO5xCcuK1FAPVdPr9U-7z8qOL4yt3ig=05e7brgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nocb7VO5xCcuK1FAPVdPr9U-7z8qOL4yt3ig=05e7brgg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 10:58 PDT 2019, Jeffrey Hugo wrote:

> On Wed, Jun 5, 2019 at 3:09 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > With the SMRs inherited from the bootloader the first SMR might actually
> > be valid and in use. As such probing the SMR mask using the first SMR
> > might break a stream in use. Search for an unused stream and use this to
> > probe the SMR mask.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 
> I don't quite like the situation where the is no SMR to compute the mask, but I
> think the way you've handled it is the best option/
> 

Right, if this happens we would end up using the smr_mask that was
previously calculated. We just won't update it based on the hardware.

> I'm curious, why is this not included in patch #1?  Seems like patch
> #1 introduces
> the issue, yet doesn't also fix it.
> 

You're right, didn't think about that. This needs to either predate that
patch or be included in it.

Thanks,
Bjorn

> > ---
> >  drivers/iommu/arm-smmu.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index c8629a656b42..0c6f5fe6f382 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -1084,23 +1084,35 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
> >  {
> >         void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
> >         u32 smr;
> > +       int idx;
> >
> >         if (!smmu->smrs)
> >                 return;
> >
> > +       for (idx = 0; idx < smmu->num_mapping_groups; idx++) {
> > +               smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
> > +               if (!(smr & SMR_VALID))
> > +                       break;
> > +       }
> > +
> > +       if (idx == smmu->num_mapping_groups) {
> > +               dev_err(smmu->dev, "Unable to compute streamid_mask\n");
> > +               return;
> > +       }
> > +
> >         /*
> >          * SMR.ID bits may not be preserved if the corresponding MASK
> >          * bits are set, so check each one separately. We can reject
> >          * masters later if they try to claim IDs outside these masks.
> >          */
> >         smr = smmu->streamid_mask << SMR_ID_SHIFT;
> > -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> > -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> > +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> > +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
> >         smmu->streamid_mask = smr >> SMR_ID_SHIFT;
> >
> >         smr = smmu->streamid_mask << SMR_MASK_SHIFT;
> > -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> > -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> > +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> > +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
> >         smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
> >  }
> >
> > --
> > 2.18.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
