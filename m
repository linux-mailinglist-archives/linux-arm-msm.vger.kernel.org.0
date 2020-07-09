Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE04F21A758
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 20:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgGISyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 14:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGISyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 14:54:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E39C08C5CE;
        Thu,  9 Jul 2020 11:54:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id bm28so679793edb.2;
        Thu, 09 Jul 2020 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZzXAPkftkjwIiTphx145Tg9PbZ/KHwLrGaBNp1a/xzQ=;
        b=tvU8QRAcYPj7xFR2ZHt/uKYrnPP4wkoFfX28TjcL/pFxTLV2IgSaR2IfCTVUc5C8ft
         wAK8oqMsRtX943tVcu41vQrumnICSdXvMbI/NTQyYkYZgardoazLQTKgv+X4h39scIQi
         TODpYm6aeYq7ibHXJ3L2oLrJYfTaVhDdaMBabgLLCr/5dtgUD+X0sTbTVHDrOyVxmwWY
         BOY0G5TV0xFy8lZEpKtb2aTjrKTW+UougWVzOxB2Zn5MfrcY5pxVhjn20F/tVx+UDPo5
         B4ZXm9JFtu8jGgY9izBB36l0NrExqWlBwHFBt4j1jD2NIYabekiiIwNQ30LpmUJDo8eP
         tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzXAPkftkjwIiTphx145Tg9PbZ/KHwLrGaBNp1a/xzQ=;
        b=JDg024M38NsZNWdXI7aBDulTGCtkLv3bjNOx+q1jpWrpZhvIfuG3czAs9rUAAqKHbk
         bt/CL8wogOznYc90btky93fRdlX36F3FaeIa9kAVp6Xf9JataalacU9G8Djj38VrUeTA
         57RDtioDdLa3D0aDWdR+0rHPjJXGDpFJ0dfQqK/svZujQp5doFqLBLZCJdEYG58beZYN
         oSXnxmcab+jco/dBaLzMUCytqKfqz635Zk9re25nVHSEe9yHK1lk2LL72aOHATkHBWqP
         eRmKEuztKHMuejmMF1HPgcfQSs4AisYkIBVco2Qx2CoOWGBT8BDDw7OpserwaAXCEvIC
         xFlQ==
X-Gm-Message-State: AOAM533yR1rSNZr3WwTx/vBSlaNEGpWSTUPSubIlgFTR2zO+jC7PHRJG
        AhgLAATr+SWwJTytCj54llwSnrPKMAlb3G98OgY=
X-Google-Smtp-Source: ABdhPJym+0byF6j2MSgwE+oVtEh+E1cDSaOiZnSMabgRzWHKmr9yu4WK140lJjmBsViWfoDA1MBCeBx5R81Ch8oM2oM=
X-Received: by 2002:a05:6402:1250:: with SMTP id l16mr74987434edw.362.1594320890278;
 Thu, 09 Jul 2020 11:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-3-bjorn.andersson@linaro.org> <CAF6AEGugJYmMpeH_9mWXcegq1awzraUzBTa0S1Rqcr3=Bmk0uQ@mail.gmail.com>
 <20200709164833.GR11847@yoga> <CAF6AEGvmqSNeQSFhc4SDJ=09x_LMVz=DmzUEb6GGv=s=f8P2aA@mail.gmail.com>
In-Reply-To: <CAF6AEGvmqSNeQSFhc4SDJ=09x_LMVz=DmzUEb6GGv=s=f8P2aA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Jul 2020 11:55:22 -0700
Message-ID: <CAF6AEGvHjiS8r32FkVs5yK+nk+caEr4dikCnrE205nqToTA4tg@mail.gmail.com>
Subject: Re: [PATCH 2/5] iommu/arm-smmu: Emulate bypass by using context banks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 9, 2020 at 9:56 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jul 9, 2020 at 9:48 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 09 Jul 09:17 PDT 2020, Rob Clark wrote:
> >
> > > On Wed, Jul 8, 2020 at 10:01 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > [..]
> > > > @@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > > >         if (smmu_domain->smmu)
> > > >                 goto out_unlock;
> > > >
> > > > -       if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> > > > +       /*
> > > > +        * Nothing to do for IDENTITY domains,unless disabled context banks are
> > > > +        * used to emulate bypass mappings on Qualcomm platforms.
> > > > +        */
> > > > +       if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {
> > >
> > > maybe I'm overlooking something, but I think this would put us back to
> > > allocating pgtables (and making iommu->map/unmap() no longer no-ops),
> > > which I don't think we want
> > >
> >
> > You're right, we are allocating page tables for these contexts and
> > map/unmap would modify the page tables. But afaict traversal is never
> > performed, given that the banks are never enabled.
> >
> > But as drivers probe properly, or the direct mapped drivers sets up
> > their iommu domains explicitly with translation this would not be used.
> >
> > So afaict we're just wasting some memory - for the gain of not
> > overcomplicating this function.
>
> the problem is that it makes dma_map/unmap less of a no-op than it
> should be (for the case where the driver is explicitly managing it's
> own domain)..  I was hoping to get rid of the hacks to use dma_sync go
> back to dma_map/unmap for cache cleaning

That said, it seems to cause less explosions than before.. either that
or I'm not trying hard enough.  Still, I think it would probably
result in unnecessary tlb inv's.

Previously, *somehow* we seemed to end up with dma_map/unmap trying to
modify the domain that we had attached.

BR,
-R

> BR,
> -R
>
>
> >
> > Regards,
> > Bjorn
> >
> > > BR,
> > > -R
> > >
> > > >                 smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
> > > >                 smmu_domain->smmu = smmu;
> > > >                 goto out_unlock;
> > > > @@ -826,6 +832,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > > >         domain->geometry.aperture_end = (1UL << ias) - 1;
> > > >         domain->geometry.force_aperture = true;
> > > >
> > > > +       /* Enable translation for non-identity context banks */
> > > > +       if (domain->type != IOMMU_DOMAIN_IDENTITY)
> > > > +               cfg->m = true;
> > > > +
> > > >         /* Initialise the context bank with our page table cfg */
> > > >         arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> > > >         arm_smmu_write_context_bank(smmu, cfg->cbndx);
> > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > index d172c024be61..a71d193073e4 100644
> > > > --- a/drivers/iommu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm-smmu.h
> > > > @@ -305,6 +305,8 @@ struct arm_smmu_device {
> > > >
> > > >         /* IOMMU core code handle */
> > > >         struct iommu_device             iommu;
> > > > +
> > > > +       bool                            qcom_bypass_quirk;
> > > >  };
> > > >
> > > >  enum arm_smmu_context_fmt {
> > > > @@ -323,6 +325,7 @@ struct arm_smmu_cfg {
> > > >         };
> > > >         enum arm_smmu_cbar_type         cbar;
> > > >         enum arm_smmu_context_fmt       fmt;
> > > > +       bool                            m;
> > > >  };
> > > >  #define ARM_SMMU_INVALID_IRPTNDX       0xff
> > > >
> > > > --
> > > > 2.26.2
> > > >
> > > > _______________________________________________
> > > > iommu mailing list
> > > > iommu@lists.linux-foundation.org
> > > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
