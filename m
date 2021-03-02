Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6035232B2ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242533AbhCCBQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838896AbhCBPzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 10:55:09 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8D2C061788
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 07:54:26 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id e2so18401418ilu.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 07:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=4YmTDrctAKsG8cdbZH7XiMulPHMmL+Exyv4xwBQWD5M=;
        b=x2eE6P8J5KaO4DD0hNyzGz7Bru3WjGacf4IWFcF96JbCi3uflZJ3KWwSD3mb8vBH8Y
         a+6uictKWrojWO3H0XIV7GkIWxXJj8H/PIPNZorNQlkt6nuV7LxoNdwPgRDoAI/Gs6k/
         vltvTCdwZe0e8BxrWARFh4IgpX5RvemqQjmiLruck622jgL4pwslhEMGk8nrZ+T7bVaH
         j90QXNGuFzpXHZCd5Z/KHbfqh5zk14zaSDsGL+aCNySc+X9JAtxAwpSF32Dmozx8TFS4
         cGaxFEfZ245lWW5UEgzedysJtgECdzW7klS6VkJoGydEc00k/b3sBm0j7V/JHYD4iRes
         JH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=4YmTDrctAKsG8cdbZH7XiMulPHMmL+Exyv4xwBQWD5M=;
        b=AGB2qTNN/RI/U8LMhKW4udf+OCppoK1GcCs3KCz1PLmmP0bVJ1xxRL00Uh5DIz8DwT
         bpU6Q5JmPAhtZWHKKEB6Nka3FJ1MCjoy3Ve/CiXwUAnpIDI7s7X4d6H1nTYY4ILNOyLx
         GEcwJQQvpGZveLUfy3qRSwTnyL3fPyDjVJte+CfNn1iDWsrLUulH/V0slkYidn0tjfGR
         MsRUXvGPF4Cx5QYfzMzGDCB9vRcKjrk0nLH2uW0akz1Zdr63S7uN5wNN1ILqU3zObkBF
         n1GqJ+Wr1rP+91yTnSEYWL3DGSEXoJNoYV95OsPiJiLqQL4NGXpox6N3BKFZ7aH6jNBP
         ExWQ==
X-Gm-Message-State: AOAM5323CF/e1q4+KwriM5t8EF2PrQcB5Lcp2Sp0qUtJyvuC0aTx8kBJ
        W6hM/lyh+mFFwRs0x+I9QouSAA==
X-Google-Smtp-Source: ABdhPJxklLSBBngic8Uzfbl/eBdoqe4frY99R/xM56OTzhIiYdli7cBeVq1FMv0i41nQlHiUfRCgwg==
X-Received: by 2002:a92:c54e:: with SMTP id a14mr18413282ilj.285.1614700465998;
        Tue, 02 Mar 2021 07:54:25 -0800 (PST)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id k23sm11935810iol.36.2021.03.02.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:54:25 -0800 (PST)
Date:   Tue, 2 Mar 2021 08:54:23 -0700
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Add support for driver IOMMU
 fault handlers
Message-ID: <20210302155423.3e7xlal3phcz26bh@cosmicpenguin.net>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210225175135.91922-1-jcrouse@codeaurora.org>
 <20210225175135.91922-2-jcrouse@codeaurora.org>
 <2d3c7595-0186-7231-96dc-ae52414480ee@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d3c7595-0186-7231-96dc-ae52414480ee@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 02, 2021 at 12:17:24PM +0000, Robin Murphy wrote:
> On 2021-02-25 17:51, Jordan Crouse wrote:
> > Call report_iommu_fault() to allow upper-level drivers to register their
> > own fault handlers.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index d8c6bfde6a61..0f3a9b5f3284 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >   	struct arm_smmu_device *smmu = smmu_domain->smmu;
> >   	int idx = smmu_domain->cfg.cbndx;
> > +	int ret;
> >   	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >   	if (!(fsr & ARM_SMMU_FSR_FAULT))
> > @@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >   	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> >   	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > -	dev_err_ratelimited(smmu->dev,
> > -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > +	ret = report_iommu_fault(domain, dev, iova,
> 
> Beware that "dev" here is not a struct device, so this isn't right. I'm not
> entirely sure what we *should* be passing here, since we can't easily
> attribute a context fault to a specific client device, and passing the IOMMU
> device seems a bit dubious too, so maybe just NULL?

Agreed. The GPU doesn't use it and I doubt anything else would either since the
SMMU device is opaque to the leaf driver.

Jordan

> Robin.
> 
> > +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +
> > +	if (ret == -ENOSYS)
> > +		dev_err_ratelimited(smmu->dev,
> > +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> >   			    fsr, iova, fsynr, cbfrsynra, idx);
> >   	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> > 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
