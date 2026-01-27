Return-Path: <linux-arm-msm+bounces-90833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lOA7Go7reGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:45:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC297E93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 191873053A49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DEF35F8D0;
	Tue, 27 Jan 2026 16:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC74335EDC8;
	Tue, 27 Jan 2026 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529946; cv=none; b=PD8L8aQsy0DJG0cIrI1jWZLr/5VlJ7PY2Imp4a5XVxjK6mQZ2uEZseg5SSLAgcmtfB1ThkXzxOoumN8BquiZRvlSw1XF/bCuSOmGrRboDbAXzixmoqk0uxhrMpJ1dTRe+8gZkR8zQ7HSYt7jB6Hi46Y42fNMaywc2we2PTqSK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529946; c=relaxed/simple;
	bh=VVRnbH7HDrlqzajWyOFBuObibnIfFXIKFTqlO2bLbp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYszsZD2uwNa1eZ1SjZiXbjGfW9D/ljYXcUdHNZIhtU9XN3wOrtMWNLtmGZo/PhInvEiJGvHCPBYbPjcNSInASKepZZMc7JPcJbFk5eQtjXD2Zsez/MHUTwHm1MWVRkVtwuVKJQGpBYK8/Bx25z9lVqFYmDoR1IODe5LygGo0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1B121596;
	Tue, 27 Jan 2026 08:05:36 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 576813F73F;
	Tue, 27 Jan 2026 08:05:41 -0800 (PST)
Message-ID: <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
Date: Tue, 27 Jan 2026 16:05:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,8bytes.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,arm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1EC297E93
X-Rspamd-Action: no action

On 2026-01-27 12:11 pm, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime-resumed to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down
> SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.

At face value, that sounds wrong - how does an SMMU generate a fault, or 
indeed do anything, when it's powered off? In principle it's possible 
that the SMMU might signal an interrupt, and is _then_ suspended (with 
the interrupt line somehow remaining asserted, so probably more 
clock-gated than completely powered down) before the interrupt hander 
runs, but we rather assume that we're not going to have an unhandled 
hardware IRQ hanging around for longer than the autosuspend delay.

So, judging by the diff below, I guess what you really mean is that in 
the case of a threaded context IRQ handler, it can take long enough 
between handling the hardware IRQ and the thread actually running that 
the SMMU may have suspended in between?

> Guard the context and global fault handlers with arm_smmu_rpm_get() /
> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
> with the SMMU powered.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53 ++++++++++++++++++++++--------
>   2 files changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..2d03df72612d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>   	const struct of_device_id *client_match;
> +	const struct arm_smmu_impl *impl = qsmmu->data->impl;
>   	int cbndx = smmu_domain->cfg.cbndx;
>   	struct adreno_smmu_priv *priv;
>   
> @@ -350,10 +351,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>   	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>   	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>   	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
> -	priv->set_stall = qcom_adreno_smmu_set_stall;
>   	priv->set_prr_bit = NULL;
>   	priv->set_prr_addr = NULL;
>   
> +	if (impl->context_fault_needs_threaded_irq)
> +		priv->set_stall = qcom_adreno_smmu_set_stall;
> +
>   	if (of_device_is_compatible(np, "qcom,smmu-500") &&
>   	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
>   	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 5e690cf85ec9..183f12e45b02 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	int idx = smmu_domain->cfg.cbndx;
>   	int ret;
>   
> +	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {

Why is this conditional on being threaded, if the global fault handler 
that can never be threaded at all apparently needs it unconditionally?

Thanks,
Robin.

> +		ret = arm_smmu_rpm_get(smmu);
> +		if (ret < 0)
> +			return IRQ_NONE;
> +	}
> +
> +	if (smmu->impl && smmu->impl->context_fault) {
> +		ret = smmu->impl->context_fault(irq, dev);
> +		goto out_power_off;
> +	}
> +
>   	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>   
> -	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> -		return IRQ_NONE;
> +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>   
>   	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>   		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> @@ -480,7 +493,14 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>   	}
>   
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +
> +	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
> +		arm_smmu_rpm_put(smmu);
> +
> +	return ret;
>   }
>   
>   static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
> @@ -489,14 +509,21 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>   	struct arm_smmu_device *smmu = dev;
>   	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>   				      DEFAULT_RATELIMIT_BURST);
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret < 0)
> +		return IRQ_NONE;
>   
>   	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>   	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>   	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>   	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>   
> -	if (!gfsr)
> -		return IRQ_NONE;
> +	if (!gfsr) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>   
>   	if (__ratelimit(&rs)) {
>   		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
> @@ -513,7 +540,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>   	}
>   
>   	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +	arm_smmu_rpm_put(smmu);
> +	return ret;
>   }
>   
>   static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> @@ -683,7 +714,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>   	enum io_pgtable_fmt fmt;
>   	struct iommu_domain *domain = &smmu_domain->domain;
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	irqreturn_t (*context_fault)(int irq, void *dev);
>   
>   	mutex_lock(&smmu_domain->init_mutex);
>   	if (smmu_domain->smmu)
> @@ -850,19 +880,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>   	 */
>   	irq = smmu->irqs[cfg->irptndx];
>   
> -	if (smmu->impl && smmu->impl->context_fault)
> -		context_fault = smmu->impl->context_fault;
> -	else
> -		context_fault = arm_smmu_context_fault;
> -
>   	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>   		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						context_fault,
> +						arm_smmu_context_fault,
>   						IRQF_ONESHOT | IRQF_SHARED,
>   						"arm-smmu-context-fault",
>   						smmu_domain);
>   	else
> -		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
>   				       "arm-smmu-context-fault", smmu_domain);
>   
>   	if (ret < 0) {
> 
> ---
> base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
> change-id: 20251208-smmu-rpm-8bd67db93dca
> 
> Best regards,
> --
> Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> 


