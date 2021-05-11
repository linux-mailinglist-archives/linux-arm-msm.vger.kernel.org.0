Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC4937AEE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhEKS5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhEKS47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:56:59 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1592CC061574;
        Tue, 11 May 2021 11:55:53 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h4so21144837wrt.12;
        Tue, 11 May 2021 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Zs2w1HOP/qUoGoZPFD129RRQnAW6mhOM8nlH2tVXXm0=;
        b=U9VKy9xefUTo0JPaWnmt30KRBSx0FFWjTyU5ynccfCcKLBvhVjyiGw1DKfuVNALdpO
         ylLstzc11KlvCRQC28txPn0l2ENDMcUk84uNYCVYz13fFW57tz0ro3bpcm4MavuqPhdQ
         67khLKO4CWEEbLV8Mq1MlUx4VIzMwAgdFx3xgPVJn3CAGq7nZUb1J8WeZxoGiQRAtcPd
         557lg5tlghwF7DDzCYbKR+WAJlbgMUWEK5hn93p2AzO9qSsYMAO3vH25Tnwh/5x+pW3P
         c0rRBNDJn6xtBfJsuSbSCGaaylw4Adx8CvLc4cccqnl+YgTpJRFHpFDIMQ4247mZsMO0
         4+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Zs2w1HOP/qUoGoZPFD129RRQnAW6mhOM8nlH2tVXXm0=;
        b=NRgxMnXIDhe6pcPoc2vG0Q8pS3eNbKuOIQ2+7yvc895vOe0rlOYX0V5YcrTGfbW0zi
         stB1gfx1ulXUqU008Kg+TQcEK0gFNzQJvVVvVBHcrCjtXQqrSW8/uO+esXFV5TWjoIi1
         AudiYv59tOGhsviinm3Xa/1uyr6g8D6ZqrrU1CqP6iAr/O21DmFiV9GzcElXtZsMm4Ft
         S2OsQ2XuNYfXztlo0dHjXZKO6ZlPE0bCmaLSSF9pJxRbld3CTHb/JkduLMRIafTnnpLi
         11SpQIFoRXeMWFlnTXr/bUA4FFtbYQpmrtjMN/Lfzr3JDsE9Sr7uF6yNqcMPE/oj9AsV
         VTlQ==
X-Gm-Message-State: AOAM533LUpKAEwYqoy4SLG2gN+qjv4AVu7LbSB1GHomD75YPDs1xUUF4
        jC+c0nxaJtS3UuBUe54sYC9UXyO7xnrrH38wZl4=
X-Google-Smtp-Source: ABdhPJyakjIL56t5dhmPl//cGax6lJy/o0FLjV2gh72JwcB7alCTdlfruKiiPv6bYQhv49TrcFtQmAilkW7Onv68xVM=
X-Received: by 2002:adf:f74d:: with SMTP id z13mr39583073wrp.147.1620759351799;
 Tue, 11 May 2021 11:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210225175135.91922-1-jcrouse@codeaurora.org>
 <20210225175135.91922-2-jcrouse@codeaurora.org> <2d3c7595-0186-7231-96dc-ae52414480ee@arm.com>
 <20210302155423.3e7xlal3phcz26bh@cosmicpenguin.net>
In-Reply-To: <20210302155423.3e7xlal3phcz26bh@cosmicpenguin.net>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 11 May 2021 11:59:33 -0700
Message-ID: <CAF6AEGsCbYDsLLPdVdJHdQbd9xrO==UMWMQVkwhuG8gdp3gd+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Add support for driver IOMMU fault handlers
To:     Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 2, 2021 at 7:54 AM Jordan Crouse <jordan@cosmicpenguin.net> wrote:
>
> On Tue, Mar 02, 2021 at 12:17:24PM +0000, Robin Murphy wrote:
> > On 2021-02-25 17:51, Jordan Crouse wrote:
> > > Call report_iommu_fault() to allow upper-level drivers to register their
> > > own fault handlers.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index d8c6bfde6a61..0f3a9b5f3284 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > >     struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> > >     struct arm_smmu_device *smmu = smmu_domain->smmu;
> > >     int idx = smmu_domain->cfg.cbndx;
> > > +   int ret;
> > >     fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > >     if (!(fsr & ARM_SMMU_FSR_FAULT))
> > > @@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > >     iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > >     cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > -   dev_err_ratelimited(smmu->dev,
> > > -   "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > > +   ret = report_iommu_fault(domain, dev, iova,
> >
> > Beware that "dev" here is not a struct device, so this isn't right. I'm not
> > entirely sure what we *should* be passing here, since we can't easily
> > attribute a context fault to a specific client device, and passing the IOMMU
> > device seems a bit dubious too, so maybe just NULL?
>
> Agreed. The GPU doesn't use it and I doubt anything else would either since the
> SMMU device is opaque to the leaf driver.

Looks like other iommu drivers use a fun mix of attached device (for
ones that can make assumptions about one device per domain) and the
iommu dev ptr.. probably NULL is the right answer..

BR,
-R

> Jordan
>
> > Robin.
> >
> > > +           fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +
> > > +   if (ret == -ENOSYS)
> > > +           dev_err_ratelimited(smmu->dev,
> > > +           "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > >                         fsr, iova, fsynr, cbfrsynra, idx);
> > >     arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> > >
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
