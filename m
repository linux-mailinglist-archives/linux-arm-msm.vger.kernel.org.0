Return-Path: <linux-arm-msm+bounces-106452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC+7KHCo/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:57:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD14EAB1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031373115B44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528893EE1F1;
	Thu,  7 May 2026 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gtVe0tCZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C683EF65A;
	Thu,  7 May 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165267; cv=none; b=A2C1VxJsWOb0TdqgEiFj7Jd0z0xuCIvX7vr6XKLGwH4++hm2sud+YQKdOJTqMO8maAHu5GnKFcYcBVZHqhqby7k4M8Hl9kbEI1oon2zmMOvM9eLuCfOrKqgwUL6kRPV+u0kH3VtQPvUnxlnl5YLE+IzI2Lloa/5gleQyrGz14wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165267; c=relaxed/simple;
	bh=i3owsY/+oXUlrOEzPMd95B5YMU8jZAMY2STW0oTZHr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+GI+VycjU13sz8U9X8slTf9A0r3BbVPjrkj8cPQPNKRgiOgNAP75Qko8+4a8KpUrMn4zaks8AVPv89pol4x2Jt3SdZZvaTAke/v+eny7rVae0F77CmFMugBM2OPqZ0HJW6s81bDGz6oUVCkxHpVJ6YfVJAJmHUHGAEav7CpAMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gtVe0tCZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D39315F;
	Thu,  7 May 2026 07:47:36 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D11C43F763;
	Thu,  7 May 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778165262; bh=i3owsY/+oXUlrOEzPMd95B5YMU8jZAMY2STW0oTZHr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtVe0tCZhXfitC5cNR5oLS4Itl1ViKnX/RdnkkwvXSspbw4Qja0B4d+oICIcuzcxU
	 Y+b2xi4mr31KS2oqujVgdhS8xTYVNeb77wnBKIeWZVaf7xvwQ5+7jdPhKubUdDbrfQ
	 gMG2hfB/lwk/4gp0yzmFoNePWFxYiVqe3p9lsyz0=
Message-ID: <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Date: Thu, 7 May 2026 15:47:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CAAD14EAB1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,8bytes.org];
	TAGGED_FROM(0.00)[bounces-106452-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 25/03/2026 9:11 pm, Anna Maniscalco wrote:
> Previously the device was being accessed while potentially in a
> suspended state.

The SMMU driver's own write_context_bank() calls all look to be safely 
within arm_smmu_rpm_get() scopes that are holding an RPM count when 
relevant (or the one at probe time before RPM is activated at all), so 
indeed this seems like the appropriate solution for here where we're 
free to assume that Adreno platforms must always have a power domain.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Just a minor nit: it's probably OK in this case (unless Will disagrees), 
but for future patches, it's preferable for the commit message to be 
self-contained, so as to give a sufficiently clear description of the 
problem, and summary of the solution, without having to be read in the 
context of the title and the whole diff to make sense. For example, if I 
were writing this I'd put it something like:

"
   iommu/arm-smmu-qcom: Ensure SMMU is powered up in set_ttbr0_cfg

   arm_smmu_write_context_bank() assumes it is being called with RPM
   active, but it turns out that is not guaranteed in the path from
   qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the the
   register accesses to lead to an [external abort/hang/whatever] when
   [doing whatever it is] while the GPU is idle. Add the RPM calls here
   to make sure the SMMU is active before we touch it.
"

Thanks,
Robin.

> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Simplify patch by acquiring device just around the call that needs it
> - Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..cab7d110aaf5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +	int ret;
>   
>   	/* The domain must have split pagetables already enabled */
>   	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
>   	}
>   
> +	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
>   	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>   
> +	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
> 
> Best regards,


