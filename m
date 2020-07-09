Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB54A21A547
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 18:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgGIQ4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 12:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgGIQ4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 12:56:01 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DE2C08C5CE;
        Thu,  9 Jul 2020 09:56:01 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dp18so3025628ejc.8;
        Thu, 09 Jul 2020 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJhKCSfHKsoJq4+iPmQ+CTnGGZoUh1cxbcC3UfHyjno=;
        b=YCCFpwhAdScWo2NWfpfFGy3rxPsKKaZjmZRlb18rP5v1cvYOij740tvclRToFsaIin
         pcN7FFHj3v2IfHI87Q5VfSOk/WdXBTgN8IQpHHHP98CEN1EvkoTIG+zI16KpitiV3Ifu
         5WUaE2ZiPYTl5RuaCQjpfagluu5ivdWJoApNz1z60fSrPrZ2BQ6qUxJhBTR9+YteqsbA
         wT0ilhtiI1FJ5qnucRZ1qiDokSUCI5bV7EJPcOyWSCYQoCjTB5dAo0tr4/rtDA7rEdyv
         t1WqEH9s5K28y2Y89NtCuRvcW/pYVnMoztDPTJuH1DeadrMyVYM0PDb5j83PE1B4qnG1
         RGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJhKCSfHKsoJq4+iPmQ+CTnGGZoUh1cxbcC3UfHyjno=;
        b=DVBHySOlYgtUSi/eyQ+mtGG1j5iZdrVxHXdykknffYYnATjmEd/fSrC+4RufH8EILw
         hlz31aaexiWjv3CCDy9ViJEIW1Irkym3OTe3tolJ3bvdpWBYioC+skPTlnE8LaUtjGg1
         V7lxwll8wrO5j1C1lJOWiuROX3b4lXiyURyBQSmOYtcFZQxTaMzb6idNGm11g5UyFlaO
         nSAzuvMihhiGML1wh1/b7HHk5rIs1xyXfM7UQ7YNlGqhB9R5H/g8Y8Fq+qYMab0C+brg
         bYUVEraTAefv/06rP8clvJ1YBfwJxSzshAk3E93ivWn5q36vqCdiZCxMoBe/y9jKacMq
         HLFQ==
X-Gm-Message-State: AOAM533qNMCCk8U3jZOMFF5Va0R9rBsV3Urhz2pDU2wA/DztjnpnMSUA
        JkmRHOZBKP6JBmKjzBAEn07i2P/Fc4i6lzhwz2g=
X-Google-Smtp-Source: ABdhPJxL2gSk8Byau/BSY6kZmFScPsa7g6bppC6AWZ9vfbc8KmC0NMwTfuPXPyOCy48yyEb+BQYtGIYgo+5gQhtG7do=
X-Received: by 2002:a17:906:494a:: with SMTP id f10mr60249442ejt.428.1594313759675;
 Thu, 09 Jul 2020 09:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-3-bjorn.andersson@linaro.org> <CAF6AEGugJYmMpeH_9mWXcegq1awzraUzBTa0S1Rqcr3=Bmk0uQ@mail.gmail.com>
 <20200709164833.GR11847@yoga>
In-Reply-To: <20200709164833.GR11847@yoga>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Jul 2020 09:56:31 -0700
Message-ID: <CAF6AEGvmqSNeQSFhc4SDJ=09x_LMVz=DmzUEb6GGv=s=f8P2aA@mail.gmail.com>
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

On Thu, Jul 9, 2020 at 9:48 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 09 Jul 09:17 PDT 2020, Rob Clark wrote:
>
> > On Wed, Jul 8, 2020 at 10:01 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> [..]
> > > @@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > >         if (smmu_domain->smmu)
> > >                 goto out_unlock;
> > >
> > > -       if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> > > +       /*
> > > +        * Nothing to do for IDENTITY domains,unless disabled context banks are
> > > +        * used to emulate bypass mappings on Qualcomm platforms.
> > > +        */
> > > +       if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {
> >
> > maybe I'm overlooking something, but I think this would put us back to
> > allocating pgtables (and making iommu->map/unmap() no longer no-ops),
> > which I don't think we want
> >
>
> You're right, we are allocating page tables for these contexts and
> map/unmap would modify the page tables. But afaict traversal is never
> performed, given that the banks are never enabled.
>
> But as drivers probe properly, or the direct mapped drivers sets up
> their iommu domains explicitly with translation this would not be used.
>
> So afaict we're just wasting some memory - for the gain of not
> overcomplicating this function.

the problem is that it makes dma_map/unmap less of a no-op than it
should be (for the case where the driver is explicitly managing it's
own domain)..  I was hoping to get rid of the hacks to use dma_sync go
back to dma_map/unmap for cache cleaning

BR,
-R


>
> Regards,
> Bjorn
>
> > BR,
> > -R
> >
> > >                 smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
> > >                 smmu_domain->smmu = smmu;
> > >                 goto out_unlock;
> > > @@ -826,6 +832,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > >         domain->geometry.aperture_end = (1UL << ias) - 1;
> > >         domain->geometry.force_aperture = true;
> > >
> > > +       /* Enable translation for non-identity context banks */
> > > +       if (domain->type != IOMMU_DOMAIN_IDENTITY)
> > > +               cfg->m = true;
> > > +
> > >         /* Initialise the context bank with our page table cfg */
> > >         arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> > >         arm_smmu_write_context_bank(smmu, cfg->cbndx);
> > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > index d172c024be61..a71d193073e4 100644
> > > --- a/drivers/iommu/arm-smmu.h
> > > +++ b/drivers/iommu/arm-smmu.h
> > > @@ -305,6 +305,8 @@ struct arm_smmu_device {
> > >
> > >         /* IOMMU core code handle */
> > >         struct iommu_device             iommu;
> > > +
> > > +       bool                            qcom_bypass_quirk;
> > >  };
> > >
> > >  enum arm_smmu_context_fmt {
> > > @@ -323,6 +325,7 @@ struct arm_smmu_cfg {
> > >         };
> > >         enum arm_smmu_cbar_type         cbar;
> > >         enum arm_smmu_context_fmt       fmt;
> > > +       bool                            m;
> > >  };
> > >  #define ARM_SMMU_INVALID_IRPTNDX       0xff
> > >
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
