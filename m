Return-Path: <linux-arm-msm+bounces-56943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD4AAC3E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4150A5056C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6228153D;
	Tue,  6 May 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+35fbHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A7280025;
	Tue,  6 May 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534297; cv=none; b=kD48wYpTz7JRfpsP+J/ijS/Ukk84gDJ/UizPWfIpR4afNf4MKH6ZjcOEOV+rLS38N7P+9HpqZSdXBz3TSlYlCS8+B6wIgWsfeK3kxTtehTLIYq5fNuaedhDPBOwQmRR7q6JOrv3rytbQ9ulnERe49K+6X0ecvD21iBLQ9be3lBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534297; c=relaxed/simple;
	bh=uHFytVThoQE6dUumluQFq3LQiUBoMdRX4mX8c3oM/4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJQSxrZWNmX/tKc12Bl8hTidkEh0ajh664NOEaHHDfAFVLZOrrHCvpXvRpcTqWnP2lE9+NbrOPVpBVeicBkF5nLOofg06Y4e1hYleWNCSUuZR3xAc7vsnt3S1xNL1gYUpAsMwYoJzdSrkaxaMKMVNyeuIZ2bw+6s2KYB8iiLsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+35fbHB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCEEC4CEEE;
	Tue,  6 May 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534296;
	bh=uHFytVThoQE6dUumluQFq3LQiUBoMdRX4mX8c3oM/4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+35fbHBzNKxob6ajbve9++4e8fpbs6JR0eRq111tR5VN13esZUIzNzg1FBgVP3T+
	 hNdgE+3iiK07JzUljoCZV5tmOCow4qUFHS9KS1bmi4dBTTGgLqa3/N4iMhLVuo2B+2
	 L+gsWTLL5cdUlGMCzPqMYMVJsOJROiqSDURspw2woMSmGFFWGgGNmou9TKzXboevc0
	 qfByVdUPxhAbUYi9KV5fM/cCk0USbLf5qTtt8OHNF4YSkwB8X0+zK8l12RQAkTWcF7
	 awpCxLTZy5t27xW3csBWhG2TSaPtZ2XoybDzTqDNxL5euuaJjSjqs89oRVEXv2X2pz
	 8OoPKtjwDf8WQ==
Date: Tue, 6 May 2025 13:24:50 +0100
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
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250506122449.GB723@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
> 
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> asserted unless an external user enabled stall-on-fault, and they are
> expected to resume the translation and re-enable interrupts.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3ab80e0fba936e214 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>  	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	u32 reg = 0;
> +	u32 reg = 0, sctlr;
> +	unsigned long flags;
>  
>  	if (terminate)
>  		reg |= ARM_SMMU_RESUME_TERMINATE;
>  
> +	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>  	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +	/*
> +	 * Re-enable interrupts after they were disabled by
> +	 * arm_smmu_context_fault().
> +	 */
> +	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +	sctlr |= ARM_SMMU_SCTLR_CFIE;
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>  
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>  		return IRQ_NONE;
>  
> +	/*
> +	 * On some implementations FSR.SS asserts a context fault
> +	 * interrupt. We do not want this behavior, because resolving the
> +	 * original context fault typically requires operations that cannot be
> +	 * performed in IRQ context but leaving the stall unacknowledged will
> +	 * immediately lead to another spurious interrupt as FSR.SS is still
> +	 * set. Work around this by disabling interrupts for this context bank.
> +	 * It's expected that interrupts are re-enabled after resuming the
> +	 * translation.

s/translation/transaction/

> +	 *
> +	 * We have to do this before report_iommu_fault() so that we don't
> +	 * leave interrupts disabled in case the downstream user decides the
> +	 * fault can be resolved inside its fault handler.
> +	 *
> +	 * There is a possible race if there are multiple context banks sharing
> +	 * the same interrupt and both signal an interrupt in between writing
> +	 * RESUME and SCTLR. We could disable interrupts here before we
> +	 * re-enable them in the resume handler, leaving interrupts enabled.
> +	 * Lock the write to serialize it with the resume handler.
> +	 */

I'm struggling to understand this last part. If the resume handler runs
synchronously from report_iommu_fault(), then there's no need for
locking because we're in interrupt context. If the resume handler can
run asynchronously from report_iommu_fault(), then the locking doesn't
help because the code below could clear CFIE right after the resume
handler has set it.

I think the broader problem is that we can end up reporting a spurious
fault when the irq is shared between context banks. However, your change
to ARM_SMMU_CB_FSR_FAULT fixes that afaict:

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08aea14ea5656d3e31328 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
>  					 ARM_SMMU_CB_FSR_TLBLKF)
>  
>  #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> -					 ARM_SMMU_CB_FSR_SS |		\
>  					 ARM_SMMU_CB_FSR_UUT |		\
>  					 ARM_SMMU_CB_FSR_EF |		\
>  					 ARM_SMMU_CB_FSR_PF |		\

because now any subsequent spurious IRQs will return IRQ_NONE. So I
don't see why we need the locking at all. What am I missing?

Also, I think your change probably exposes a benign bug in the qcom
debug code as qcom_tbu_halt() has the following:

if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS))
	...

Will

