Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE6F39F4A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhFHLME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:12:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231266AbhFHLME (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:12:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A876134F;
        Tue,  8 Jun 2021 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623150611;
        bh=E/PY1UUD0KVjzvXwESFNHuR3PIRHP6Q6G/raiw7orh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eMMSLasg1PmEGczdlpPNC/tnoIY1jN2TaOZq1u7kDB9K8fUTo1Op3BE4uLZMP1ctr
         NUdcL7feiHhZexDss1zM937C/zcB92+4tA1wiLaIgOP192NFCrBWDmPlDJaLq8Jwi7
         6mhw7sE1+rfG7LygR3YeFtiZ5mkSPbyX6cfHDpotOyLRqfbBJGLYHI1uEw+GKfGW0C
         oGpK+eRsBsLO86Vk44p3QYp3meRwzP6NzhiXNIWaSAwoC2Q5OiIR/x4MrJ9Ya9m/sv
         Q0Y+XI0KrtyPi7TE89vBnH96X/X3BkNlEfb347+3ELimyho0r44vZpjqbdA3vyiKQf
         Y2eUoQhmUCXYQ==
Date:   Tue, 8 Jun 2021 12:10:05 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] iommu/arm-smmu: Add support for driver
 IOMMU fault handlers
Message-ID: <20210608111005.GB9051@willie-the-truck>
References: <20210602165313.553291-1-robdclark@gmail.com>
 <20210602165313.553291-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602165313.553291-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 02, 2021 at 09:52:44AM -0700, Rob Clark wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Call report_iommu_fault() to allow upper-level drivers to register their
> own fault handlers.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..b4b32d31fc06 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	int idx = smmu_domain->cfg.cbndx;
> +	int ret;
>  
>  	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>  	if (!(fsr & ARM_SMMU_FSR_FAULT))
> @@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>  	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>  
> -	dev_err_ratelimited(smmu->dev,
> -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> +	ret = report_iommu_fault(domain, NULL, iova,
> +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +
> +	if (ret == -ENOSYS)
> +		dev_err_ratelimited(smmu->dev,
> +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>  			    fsr, iova, fsynr, cbfrsynra, idx);

Acked-by: Will Deacon <will@kernel.org>

Will
