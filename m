Return-Path: <linux-arm-msm+bounces-56934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A9AAC2C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA461C4080E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6906C27B4E3;
	Tue,  6 May 2025 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+FElNUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECEB27AC55;
	Tue,  6 May 2025 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531175; cv=none; b=q0jxga7ucw+DdcoFOgGXuRux6oye9Pf9heQx6TEiA6KMhIY2k0Bew3/IHXoO/ztSKYcCjYpjU4ea5NvnQdA+pshDCUhj0t8mlVhqG5Z/lLFVjfkWuHCYbjm/BJ81UTW8lho1IB2ks6dlz/cQCqDBzlnTyHsfD6ivcDzwpE4GuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531175; c=relaxed/simple;
	bh=mE1e1B9m9uhzxTNZaDZ3TY+lY86rVvjhSEag8/l7vDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT55k11kLacpLBYPHBN9Ico8KELY+3YNlhw/qm1Yv4dx0X3cgbsyoj52hNCN2DrxGqkyPHh+9OjEBA2Zqamu0VF2+6nS/30H/BseQ5tzxkSJLdo7rAdagy7zb+Dbgp3oZ2PO6/DLNgEsXsQH3txLUSgHgXitz+5GTrhlLU/BKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+FElNUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4D4C4CEE4;
	Tue,  6 May 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746531172;
	bh=mE1e1B9m9uhzxTNZaDZ3TY+lY86rVvjhSEag8/l7vDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+FElNUNhdG5CYgnApQsUFYFp+lb9D4evnzqSTmmE3FJtKAA5aDKSQq9jDoh1b+uq
	 Qmvb5zCPGb51aJ8iAHF1LRTFA4EdtPTaS7yN3EahbaJHl4AVY3Z3yy2TN5HoAfgZmW
	 WfWzf+kPc5cHicOck1lE7ZB+j+UfmUzzpkximKT9KQmSyixoPaVzM3FlbXzht8aJQC
	 LA3yNCAtSJX1w0hDiUB9QQ1iEhCG9qgFME2SviolTzXq+lEEjA9KRip8/v6JMUlftA
	 anKqkQ+2LIoi1JtBxda8j9cG7AO5KGzAtZP5qML5SV0Es1CK7n/tlFEphi5y07Dewh
	 yAxG4yeV/iD2A==
Date: Tue, 6 May 2025 12:32:46 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250506113246.GA723@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 19, 2025 at 10:44:00AM -0400, Connor Abbott wrote:
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
>  3 files changed, 29 insertions(+), 19 deletions(-)

[...]

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086ed7007ea2a453ef94 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
>  };
>  
>  
> -void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> +void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
>  				      struct arm_smmu_context_fault_info *cfi)
>  {
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	int idx = smmu_domain->cfg.cbndx;
> +
>  	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>  	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>  	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> +	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
> +		cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);

I think this leaves 'cfi->contextidr' uninitialised for stage-2 domains.
We should probably either zero it here or just zero-initialise the whole
'cfi' struct in arm_smmu_context_fault() with a:

	struct arm_smmu_context_fault_info cfi = {};

line.

Will

