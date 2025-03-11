Return-Path: <linux-arm-msm+bounces-51033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 952ADA5CD2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDB8189CE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6663326388F;
	Tue, 11 Mar 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBp//bpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F314263888;
	Tue, 11 Mar 2025 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716360; cv=none; b=EvV9A3yU5XGSaljbjvt1xRIAYfg3A5kgZaYhgOcumk6zw162plLkd+n6INRTMIGhq+3djK2VtuzqTj/td6ofvBRILCUZ7DUDI42PCCAL92VPZtHHBG99wNBc9HFqtnA2AIgk+Zi+RPszuYjK8VuLpF+JKa4vjg1pdNw8bDZUL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716360; c=relaxed/simple;
	bh=2l2XhsUVNSUFOt0o115rgFxjPYd6cJC3mPPoy2QKMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rd3RMREoIDoc2l6x0i7WfviMqMiu2dSZDEELEU2IQUwkFlJk8Jgb0/vyEI3Txk2siuVrk4TRlHTDn45kxfzsy3VIk+5SDlLZXL1x0DYer0ZCaMh50fQG7mmDicRz4Be0+sFqLWCcpnSMPLBgl4GV4ykh6BVOwpK2jWp91DRfXMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBp//bpj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7045AC4CEE9;
	Tue, 11 Mar 2025 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716359;
	bh=2l2XhsUVNSUFOt0o115rgFxjPYd6cJC3mPPoy2QKMPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBp//bpjCPjkHJ3ILoEGKodCweFXovgnjhV4rgtptw6/m7Zzj+p53kp6VirBwPjci
	 ViqhpM3WG8v8ETukGo+d+tkJ5+UZrx/2WI4/3npcj7S5hHyFjIpzNk5so1NwKI2SDA
	 56aimhHxBxSfY5fPuF9w8Snvo0ygOn1CHugTZN37xPdvF0uWcL8uBhIu1U1FxIvheX
	 KicV+Z5wY8TTNwCVT+LjSsl22yyuAooJZdrvCII5MOtMqC/SoUF0Fo/Y6YNvIWar96
	 eTO5pXYPd84De8yIqwxuvOB7ohjcXX0sIUdmmxRgQEVGRobJGFII6Cc232+TCNhfyn
	 aMc2Gsa+5e/KQ==
Date: Tue, 11 Mar 2025 18:05:54 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250311180553.GB5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
>  3 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  
>  	if (list_empty(&tbu_list)) {
>  		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +					 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>  
>  		if (ret == -ENOSYS)
>  			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  	phys_soft = ops->iova_to_phys(ops, cfi.iova);
>  
>  	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +				 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>  	if (!tmp || tmp == -EBUSY) {
>  		ret = IRQ_HANDLED;
>  		resume = ARM_SMMU_RESUME_TERMINATE;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
>  				      struct arm_smmu_context_fault_info *cfi)
>  {
>  	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>  	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);

We already have an implementation hook (->get_fault_info()) which the
qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
That thing dumps these registers already so if we're moving that into
the core SMMU driver, let's get rid of the hook and move everybody over
rather than having it done in both places.

>  	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> +	cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);

I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
it for stage-2 domains.

Will

