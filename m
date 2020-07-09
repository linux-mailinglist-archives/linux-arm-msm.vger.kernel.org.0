Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639C521A7F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 21:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGITm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 15:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGITm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 15:42:28 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6C9C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 12:42:28 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so1246842plr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 12:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RioqnPMkVqNkvL0qwtl83DPVR6qY0R22jJG9ZzsK4ps=;
        b=FoBl5rfNFNF7RvfrMZsfGQpRYnl5VL/d9OqDtLbMx7J82YIVogRqiyjg6viQRbY+2J
         sTW1A3ir/PtIWNZEM6ULSEO2nNc+yv0S1qyqib1pleNf+mjT5TvR0yZiIUyEcaH0FIcA
         ioe3ofKBxKlluH6T9my5/Q+TQeGAuzy/JsjtAUjoILV2h+JvxOmISR8UiatNtpihyrEx
         Y0li6/XqOccp0iEXvWrUkYdnMeokyZYkWJBDqFmSLdNTXJSeHuDXw+WJl4ZBfzWZb45Z
         BuIIzcn2cSkFtDqq75Cq5AcJzfZq7uM2JUab2iXercNaTm48unxLZIEoKOzu0kc4hztU
         Tq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RioqnPMkVqNkvL0qwtl83DPVR6qY0R22jJG9ZzsK4ps=;
        b=mz7bCqsmjv0/Q7CCA+f6H4yUtppKbravFvAWgnncPvy+jeXEOkVRU9f9L9f7casF+9
         P+lNbO7ujmhieyJ9Iwny6XhRF/RtIeACWSgCLVijoeAC/IoHic31t90b48FrQwQjLQzO
         QGIFtbD5criaIYKjTqvlgZor+0RUYtAX5+r6SFNT5/po2TTJ0j+KuMYlMX3f7N8s6xj4
         lG9XL2I4x7kWkEISGL/lhwD1ehDgWTsz8EQ9Zzlx3tZGsDs2cAfYQQBBwqlnLDyp+yc5
         8eUbqxQPp/WzdTtZB9DDmUBgN3y1xQFX2/eyDwOYtQDVxix+ZdWfVTeBzmSTVoy766SU
         gxeA==
X-Gm-Message-State: AOAM533Ty25o0w8xlCz0Mp5hrghDD4AXKEdEWqwRDPUJiqaCaozlv4u0
        i0YY1zpGy2CfqESIyLqiVFWEPg==
X-Google-Smtp-Source: ABdhPJyve4niYHT9cwXeej5Gpn/TePKakafs8sB2QJi42hBXqcwUfp/cv0b8La4DdeVsv0QPYrPoZw==
X-Received: by 2002:a17:90a:f014:: with SMTP id bt20mr1758584pjb.135.1594323748072;
        Thu, 09 Jul 2020 12:42:28 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m16sm3870910pfd.101.2020.07.09.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:42:27 -0700 (PDT)
Date:   Thu, 9 Jul 2020 12:40:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
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
Subject: Re: [PATCH 2/5] iommu/arm-smmu: Emulate bypass by using context banks
Message-ID: <20200709194012.GX388985@builder.lan>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-3-bjorn.andersson@linaro.org>
 <CAF6AEGugJYmMpeH_9mWXcegq1awzraUzBTa0S1Rqcr3=Bmk0uQ@mail.gmail.com>
 <20200709164833.GR11847@yoga>
 <CAF6AEGvmqSNeQSFhc4SDJ=09x_LMVz=DmzUEb6GGv=s=f8P2aA@mail.gmail.com>
 <CAF6AEGvHjiS8r32FkVs5yK+nk+caEr4dikCnrE205nqToTA4tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvHjiS8r32FkVs5yK+nk+caEr4dikCnrE205nqToTA4tg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Jul 11:55 PDT 2020, Rob Clark wrote:

> On Thu, Jul 9, 2020 at 9:56 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Jul 9, 2020 at 9:48 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Thu 09 Jul 09:17 PDT 2020, Rob Clark wrote:
> > >
> > > > On Wed, Jul 8, 2020 at 10:01 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > [..]
> > > > > @@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > > > >         if (smmu_domain->smmu)
> > > > >                 goto out_unlock;
> > > > >
> > > > > -       if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> > > > > +       /*
> > > > > +        * Nothing to do for IDENTITY domains,unless disabled context banks are
> > > > > +        * used to emulate bypass mappings on Qualcomm platforms.
> > > > > +        */
> > > > > +       if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {
> > > >
> > > > maybe I'm overlooking something, but I think this would put us back to
> > > > allocating pgtables (and making iommu->map/unmap() no longer no-ops),
> > > > which I don't think we want
> > > >
> > >
> > > You're right, we are allocating page tables for these contexts and
> > > map/unmap would modify the page tables. But afaict traversal is never
> > > performed, given that the banks are never enabled.
> > >
> > > But as drivers probe properly, or the direct mapped drivers sets up
> > > their iommu domains explicitly with translation this would not be used.
> > >
> > > So afaict we're just wasting some memory - for the gain of not
> > > overcomplicating this function.
> >
> > the problem is that it makes dma_map/unmap less of a no-op than it
> > should be (for the case where the driver is explicitly managing it's
> > own domain)..  I was hoping to get rid of the hacks to use dma_sync go
> > back to dma_map/unmap for cache cleaning
> 
> That said, it seems to cause less explosions than before.. either that
> or I'm not trying hard enough.  Still, I think it would probably
> result in unnecessary tlb inv's.
> 
> Previously, *somehow* we seemed to end up with dma_map/unmap trying to
> modify the domain that we had attached.
> 

I might need some help to really understand the plumbing here, but this
is what I read from the code and can see in my debugging...


The display device will upon creation be allocated a default_domain, of
type IOMMU_DOMAIN_IDENTITY - per the qcom-impl. Then you then allocate a
new iommu domain on the platform bus in the display driver and attach
this to the device. This will result in the group's domain being of type
IOMMU_DOMAIN_UNMANAGED.

But when you then invoke dma_map_single() on the display device, the map
operation will acquire the iommu_group's default_domain (not domain) and
as such attempt to map stuff on the IDENTITY domain.

__iommu_map() will however reject this, given that the type does not
have __IOMMU_DOMAIN_PAGING set. Afaict, this would happen regardless of
this patch actually setting up a page table for the default_domain or
not.


So, afaict, you can't use dma_map_single()/dma_unmap() to operate your
page table on a lately attached iommu domain.

This would also imply that the display device consumes two context
banks, which worries me more than the waste of page tables etc.

Regards,
Bjorn

> BR,
> -R
> 
> > BR,
> > -R
> >
> >
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > BR,
> > > > -R
> > > >
> > > > >                 smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
> > > > >                 smmu_domain->smmu = smmu;
> > > > >                 goto out_unlock;
> > > > > @@ -826,6 +832,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > > > >         domain->geometry.aperture_end = (1UL << ias) - 1;
> > > > >         domain->geometry.force_aperture = true;
> > > > >
> > > > > +       /* Enable translation for non-identity context banks */
> > > > > +       if (domain->type != IOMMU_DOMAIN_IDENTITY)
> > > > > +               cfg->m = true;
> > > > > +
> > > > >         /* Initialise the context bank with our page table cfg */
> > > > >         arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> > > > >         arm_smmu_write_context_bank(smmu, cfg->cbndx);
> > > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > > index d172c024be61..a71d193073e4 100644
> > > > > --- a/drivers/iommu/arm-smmu.h
> > > > > +++ b/drivers/iommu/arm-smmu.h
> > > > > @@ -305,6 +305,8 @@ struct arm_smmu_device {
> > > > >
> > > > >         /* IOMMU core code handle */
> > > > >         struct iommu_device             iommu;
> > > > > +
> > > > > +       bool                            qcom_bypass_quirk;
> > > > >  };
> > > > >
> > > > >  enum arm_smmu_context_fmt {
> > > > > @@ -323,6 +325,7 @@ struct arm_smmu_cfg {
> > > > >         };
> > > > >         enum arm_smmu_cbar_type         cbar;
> > > > >         enum arm_smmu_context_fmt       fmt;
> > > > > +       bool                            m;
> > > > >  };
> > > > >  #define ARM_SMMU_INVALID_IRPTNDX       0xff
> > > > >
> > > > > --
> > > > > 2.26.2
> > > > >
> > > > > _______________________________________________
> > > > > iommu mailing list
> > > > > iommu@lists.linux-foundation.org
> > > > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
