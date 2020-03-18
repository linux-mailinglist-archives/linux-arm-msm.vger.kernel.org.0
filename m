Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C784918A890
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 23:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCRWsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 18:48:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:57654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRWsp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 18:48:45 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7DC020752;
        Wed, 18 Mar 2020 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584571725;
        bh=sxbtUTf11iJytMzmHFkvIe4CnT3yrC6BYKS3V/0Z0Fk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jaM0G/5trMtdFkV2/vhMxNOFWaSGhrrs52HK2xDjUYl+JI3hUsWXm6CPYojhT/ldL
         j3jQDJn+SmUHKWEmCw8/fOnx7X2yRYKJ3RXUvmhvhVIUEaKPQzUP3rG1mL4eh2B5sb
         HN/0wISxOh2nwOxnShOj3pxzI9FpXy/K2iWAVTrY=
Date:   Wed, 18 Mar 2020 22:48:40 +0000
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v1 2/6] arm/smmu: Add auxiliary domain support for
 arm-smmuv2
Message-ID: <20200318224840.GA10796@willie-the-truck>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
 <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 03:16:06PM -0700, Jordan Crouse wrote:
> Support auxiliary domains for arm-smmu-v2 to initialize and support
> multiple pagetables for a single SMMU context bank. Since the smmu-v2
> hardware doesn't have any built in support for switching the pagetable
> base it is left as an exercise to the caller to actually use the pagetable.
> 
> Aux domains are supported if split pagetable (TTBR1) support has been
> enabled on the master domain.  Each auxiliary domain will reuse the
> configuration of the master domain. By default the a domain with TTBR1
> support will have the TTBR0 region disabled so the first attached aux
> domain will enable the TTBR0 region in the hardware and conversely the
> last domain to be detached will disable TTBR0 translations.  All subsequent
> auxiliary domains create a pagetable but not touch the hardware.
> 
> The leaf driver will be able to query the physical address of the
> pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> address with whatever means it has to switch the pagetable base.
> 
> Following is a pseudo code example of how a domain can be created
> 
>  /* Check to see if aux domains are supported */
>  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> 	 iommu = iommu_domain_alloc(...);
> 
> 	 if (iommu_aux_attach_device(domain, dev))
> 		 return FAIL;
> 
> 	/* Save the base address of the pagetable for use by the driver
> 	iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
>  }

I'm not really understanding what the pagetable base gets used for here and,
to be honest with you, the whole thing feels like a huge layering violation
with the way things are structured today. Why doesn't the caller just
interface with io-pgtable directly?

Finally, if we need to support context-switching TTBR0 for a live domain
then that code really needs to live inside the SMMU driver because the
ASID and TLB management necessary to do that safely doesn't belong anywhere
else.

Will
