Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD6950A2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 13:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfFXLxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 07:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:37392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfFXLxz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 07:53:55 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD100212F5;
        Mon, 24 Jun 2019 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561377234;
        bh=DPkbnAX2UC8HCyA8iQCpieXXckaaIIzpSDhByDPzn7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8wC7xM9KFMtvOYu/kOVa2McfZiycme1sJMB4laZoRfGXGAGxgIe7MIfXLQhc8m2m
         /hdHyPsY8pRnYQbF5ft5LW2dkkPKET0OwfkBg31pxiBy90cEVRNKtqVeRUmkH9RQLL
         uV2aZb1cM9c8ClPfyvJg5QO6FlwjOKMf0hSks0D4=
Date:   Mon, 24 Jun 2019 12:53:49 +0100
From:   Will Deacon <will@kernel.org>
To:     Will Deacon <will.deacon@arm.com>, bjorn.andersson@linaro.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Vivek Gautam <vgautam@qti.qualcomm.com>
Subject: Re: [PATCH] iommu: io-pgtable: Support non-coherent page tables
Message-ID: <20190624115349.f62uqypyt7l73skf@willie-the-truck>
References: <20190515233234.22990-1-bjorn.andersson@linaro.org>
 <20190618173929.GG4270@fuggles.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618173929.GG4270@fuggles.cambridge.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi again, Bjorn,

On Tue, Jun 18, 2019 at 06:39:33PM +0100, Will Deacon wrote:
> On Wed, May 15, 2019 at 04:32:34PM -0700, Bjorn Andersson wrote:
> > Describe the memory related to page table walks as non-cachable for iommu
> > instances that are not DMA coherent.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 4e21efbc4459..68ff22ffd2cb 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -803,9 +803,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> >  		return NULL;
> >  
> >  	/* TCR */
> > -	reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> > -	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > -	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> > +	if (cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) {
> > +		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> > +		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > +		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> > +	} else {
> > +		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> 
> Nit: this should be outer-shareable (ARM_LPAE_TCR_SH_OS).
> 
> > +		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > +		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_ORGN0_SHIFT);
> > +	}
> 
> Should we also be doing something similar for the short-descriptor code
> in io-pgtable-arm-v7s.c? Looks like you just need to use ARM_V7S_RGN_NC
> instead of ARM_V7S_RGN_WBWA when initialising ttbr0 for non-coherent
> SMMUs.

Do you plan to respin this? I'll need it this week if you're shooting for
5.3.

Thanks,

Will
