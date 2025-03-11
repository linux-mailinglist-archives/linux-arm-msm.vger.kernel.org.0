Return-Path: <linux-arm-msm+bounces-51037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE67A5CD66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C910189F3CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3779F263C6C;
	Tue, 11 Mar 2025 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9rsaALq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45C2638BA;
	Tue, 11 Mar 2025 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716718; cv=none; b=rQ32Y5qzfO6ioH7lMdjcdippzr0qya9Hqjax3MfWQ3Npu5Q18PaZPt6K35BEt6yQz5xE1zdKUOPqUx4aSXKTFuIinXGD/u29OKQfj7Rn/MQhnc4EEiWGRDkxbSedAohC+OC5XO2T1LeyKlBU+2hmAADVtOgiMJtb4JZOCu2GY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716718; c=relaxed/simple;
	bh=lU7fvyEx/byBpU2OPa/0abt93RzPvbli7uszSlFeqB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWnghW5+Yg68PTzpp/WP2m8CDqQl6d/gBL8+fhCgOG2E8KVu1Dj2pvp00S1XEDqNuG5M0wJ2ZLRBKbPwtxmgJekI4c/TVp1nVml7Y1rrGFpF05WipL5CoU0D6E0EiiHFdphdmPsGsU5Y13v67mYImpyHPMQLKUqVFWyWHjg1CDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9rsaALq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C269C4CEE9;
	Tue, 11 Mar 2025 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716717;
	bh=lU7fvyEx/byBpU2OPa/0abt93RzPvbli7uszSlFeqB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9rsaALqeGfRdT/7Tbh3HFOYal+hAmgqpz9e90GwHYCCC5d1YgpLSiLF6T7jrAfcP
	 2CRWzL+4AR+G50o+tj87tDolr4WqPvl4JRNfSFDbLXx2HMiczGkrDU6RznzKezFpcW
	 7Od5Owt/QCnquBVFV8cDm2/zAPqNz8j+mp6NX3q07BpTuBkwvIcU32uEaLg62WUTsW
	 W7BiiFetPLOupwmR8fEuJUBXnUZ4SFzDk3PH9a6ScRFw38XfnurQh1QEbizcmn5Vhe
	 eXA6bIHut2Y3Vugdr8iy5GKpdwGzCUm9+s/cxujaojGTIbGr1Or0rWDYsBC2NB+bEZ
	 TyuHIAK0twNIg==
Date: Tue, 11 Mar 2025 18:11:52 +0000
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
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Message-ID: <20250311181151.GD5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> Up until now we have only called the set_stall callback during
> initialization when the device is off. But we will soon start calling it
> to temporarily disable stall-on-fault when the device is on, so handle
> that by checking if the device is on and writing SCTLR.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
>  {
>  	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	u32 mask = BIT(cfg->cbndx);
> +	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
> +	unsigned long flags;
>  
>  	if (enabled)
> -		qsmmu->stall_enabled |= BIT(cfg->cbndx);
> +		qsmmu->stall_enabled |= mask;
>  	else
> -		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> +		qsmmu->stall_enabled &= ~mask;
> +
> +	/*
> +	 * If the device is on and we changed the setting, update the register.
> +	 */
> +	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> +		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
> +		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +
> +		if (enabled)
> +			reg |= ARM_SMMU_SCTLR_CFCFG;
> +		else
> +			reg &= ~ARM_SMMU_SCTLR_CFCFG;
> +
> +		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);

Are you sure you don't need TLB invalidation for this to take effect? I
think some fields in the SCTLR can be cached in the TLB but you'll need
to check whether or not that applies to CFCFG.

Will

