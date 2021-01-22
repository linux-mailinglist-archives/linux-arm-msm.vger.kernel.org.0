Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09937300364
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 13:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbhAVMmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 07:42:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728025AbhAVMmM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 07:42:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75CE122DBF;
        Fri, 22 Jan 2021 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611319291;
        bh=7rbUbkdEvJJvR3jEHrdTAYGXW1UTMHgBbr6d4EQwOhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A9lp3fd+MM+zlTZ7LhS0bL5D77eTmFbjEsclVnm181waq+jpKLXMvdkm8wi0NKpzg
         AOXvTWfwYFnfWXunCnyyabRSrzc3OTmYU3H9NEl2z9Nv1i07yb4SeuZ5ZO3Km3cZlM
         yKUhHfxTYK3cJ7tozZjEb/pd51F3ET4WejY3GwXRWcgmZX7dcOO5zbysL77wv7SmFn
         xUlQ1a6mUHpRI0mHor2RndETI8jRVNQrfg/JeRud9H6aKciNEu8Sd586RaCCLRhhqY
         lk1IVQrgIuyktBHf0dRqMnSeO2oHV38FJREzx1/pYPxZzITVyVeVZxEf9mf6r18S82
         qJog8QJ8i66/A==
Date:   Fri, 22 Jan 2021 12:41:26 +0000
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: Add support for driver IOMMU
 fault handlers
Message-ID: <20210122124125.GA24102@willie-the-truck>
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
 <20201124191600.2051751-2-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124191600.2051751-2-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 12:15:58PM -0700, Jordan Crouse wrote:
> Call report_iommu_fault() to allow upper-level drivers to register their
> own fault handlers.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0f28a8614da3..7fd18bbda8f5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -427,6 +427,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	int idx = smmu_domain->cfg.cbndx;
> +	int ret;
>  
>  	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>  	if (!(fsr & ARM_SMMU_FSR_FAULT))
> @@ -436,11 +437,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>  	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>  
> -	dev_err_ratelimited(smmu->dev,
> -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> +	ret = report_iommu_fault(domain, dev, iova,
> +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +
> +	if (ret == -ENOSYS)
> +		dev_err_ratelimited(smmu->dev,
> +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>  			    fsr, iova, fsynr, cbfrsynra, idx);
>  
> -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> +	/*
> +	 * If the iommu fault returns an error (except -ENOSYS) then assume that
> +	 * they will handle resuming on their own
> +	 */
> +	if (!ret || ret == -ENOSYS)
> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);

Hmm, I don't grok this part. If the fault handler returned an error and
we don't clear the FSR, won't we just re-take the irq immediately? I think
it would be better to do this unconditionally, and print the "Unhandled
context fault" message for any non-zero value of ret.

Will
