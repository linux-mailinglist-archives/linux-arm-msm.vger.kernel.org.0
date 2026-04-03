Return-Path: <linux-arm-msm+bounces-101602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL+rNewjz2notAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 04:20:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4393905A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 04:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F5A03037496
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 02:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFA63491C9;
	Fri,  3 Apr 2026 02:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W958vsGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA1314B9D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775182817; cv=none; b=WIgAV8hX+FJkD6iYzX0sw8MvX1//oNDj0/eL08dkBdvZ6j6bh0DeIe3U8EsYu1bl2+cK9T5uA/CGIRcOc3vE9LgQtCqFFUy5ub+evQwJc93p9zPQ1HKoOH2QtPJxgx0SjC+CcPUfFYmJRfOlwgWyLaYQbfi+1c6hF4dL6i9NU2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775182817; c=relaxed/simple;
	bh=bda+2S/CRRI24v+0YtjXyLzM6YHcwsrVhQlTDGYXBi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGIQULAWiF2ofPpppAlQisq4i0lUgnOFr0SiGgPy6Qo5vITHx9XTUlBlvxesfXfrblGllPOFTPDCWO1iHebhjRE0asbcJP6A+QBQ4X2hTabiQe52JEUkLPGbD3MI4w9GH95JH7lZ0A4tlw0kTl3U8ifLjxNb3NfpvYiiAIRpvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W958vsGF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b243198058so23815ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 19:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775182814; x=1775787614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLyfrpphk/pri+vsSR8ZKPbndfkUJotLPgfVmPM7TEQ=;
        b=W958vsGFUdCI2tabe1gORw7jMM058RIXSXTAAdq6uYZaIE8HAm2QJ97DGE1EkYvjm/
         ixLe2j+fpACgmlZ54RZUy9IoNRvVGAc+15IrLDRRUpKIgMAav4MqmTRTbPNrQMTqZkyh
         o9YOrS65TwsUT4F4lP/dMe+H2lK3D+4rwOcfREshb+LQF8OlTnDoHoi1n1Z/1H0s5xpQ
         fdhqNRcRCip21GgY3oQm56BAx9vtrkj9QNCBSa/8Ois6Y9FmE2jdBvqWVS9HRxNz33J2
         Y4tIRm22CtH9YU/+usv3IgE3s1/EhpeTawxAE/jtkyV3/xauS39Mnyu4gNw0m5DU9ghp
         aeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775182814; x=1775787614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLyfrpphk/pri+vsSR8ZKPbndfkUJotLPgfVmPM7TEQ=;
        b=Wb5bI3a0vaU9WO7F10nrWgIpRKx5wGkXbrQVjYHa9+WQBptNX08dfn2zU+Ul1QDdxe
         p+2cWKLtwx4PrEIrt9XUqwDk8H7+WcAowSKZIaKv+QgXc2gaYG96VjPgchhwZSmkTacL
         fq1b9E7lw3uRi2YBKDdqIpPnDxAkY1ldjTGPAUOj0gpkz9QfnalSLeP2IjWRZsldu/H+
         N9Zgi0jJ+O/LsyPOUNfhwv5z8oJAzxfpNFBvz8AQ2GHWhzrb0YnrD2wqEpVsZD2MYzKk
         ByUbaGTMhSOBZ792dQnY6VTjekGlptFh3m1tQh0SSylmdRTSWrLXlFKtuvrOYeMRSAiq
         78jA==
X-Forwarded-Encrypted: i=1; AJvYcCWiNhkdqz+yFtqmS4dumaHSDyT7JdGhwfZeHZg8otu92yOgYWXnNXl98STZBOYCpJi8rsk9VjIAOxzeWsld@vger.kernel.org
X-Gm-Message-State: AOJu0YwsKcZVpdzxwbhLRnh7+esVVJK3BFITo1rybASex8qheDEoS9A5
	JQxSg1n4vHWXm71w3Jq0hDLfYkISTYzTOSkX5DCuFaOz0PD40cBBZzLnfqyuUaccyQ==
X-Gm-Gg: AeBDiev7Pn+uySgEfVI1uMutGU8Tt9oMvNb8zi7RpyHVMoyYa1BhQnlsc1Xu/bNN+XD
	Zm1pAjA20p8hTP/2FJG68rL4qtSzkNmq+383RVjJKOqxf8d3bAVs7tgLEvjUH2iWfDH6a2IYUyg
	7kvifBwvny3jsf4lA8i9mZcJReZASRrfJKGEqq2A9HNsa2wT58hnAmeqYVYJviJQVWgUGehXo42
	9S+AnNLCRn2S1YsC6F8fUh2ltGY4RyUvExkOyqLfKotXzLeMqYJKgbLBeLzyh1dV/LwaIQ4udAt
	t6Gz6mfEyuIPIpN2HOyKvLShaku8Dr+dMhv4Cf3P6jyUVoawJSDG0zCldQie9+1XoUbWjNZUhaK
	p+dhrEtap4ed2GOA8OdFh9pLbskcP4RxvcPrwDLKueiKkLBc8Y7AHW8NDDL2HHPVPW7XZGTL5hW
	BcFi8I6QcktUcKy2rZoYtv0xZjIRGpU7uWS77RsbsW1yIALkiskxgD6sTWhg==
X-Received: by 2002:a17:903:2f0d:b0:2ae:4808:bd99 with SMTP id d9443c01a7336-2b282ed3780mr1613755ad.2.1775182813067;
        Thu, 02 Apr 2026 19:20:13 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c71e62sm4165949b3a.44.2026.04.02.19.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:20:12 -0700 (PDT)
Date: Fri, 3 Apr 2026 02:20:06 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <ac8j1jlFNxgZWzzK@google.com>
References: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-101602-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4E4393905A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:53:53PM +0530, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
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
> 
> Guard the context and global fault handlers with pm_runtime_get_if_active()
> and pm_runtime_put_autosuspend() so that all SMMU fault register accesses
> are done with the SMMU powered. In case pm_runtime is not active we can
> safely ignore the fault as for pm runtime resume the smmu device is
> reset and fault registers are cleared.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
> - Added support for smmu->impl->global_fault callback in global fault handler
> - Remove threaded irq context fault restriction to allow modifying stall
>   mode for adreno smmu
> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 60 +++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 5e690cf85ec9..f4c46491a03d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -462,10 +462,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	int idx = smmu_domain->cfg.cbndx;
>  	int ret;
>  
> +	if (!pm_runtime_get_if_active(smmu->dev))

Note that the pm_runtime_get_if_active(dev) only returns a positive
value if the device state is exactly RPM_ACTIVE. If the device is in the
middle of its runtime_suspend callback, its state is RPM_SUSPENDING.

Thus, if a fault races with the suspend callback, we'll return IRQ_NONE
and the suspend callback doesn't seem to be disabling interrupts.

This isn't any better if we're in a fault-storm caused by
level-triggered interrupts, we'd simply keep entering this handler and
return.

I believe we should clear / handle any pending faults/interrupts or
atleast mask interrupt in the suspend handler to avoid this situation.

> +		return IRQ_NONE;
> +

Maybe we could add another wrapped-helper to maintain consistency:

static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
{
     if (!pm_runtime_enabled(smmu->dev))
         return 1; // Assume active/powered if RPM is not used
     return pm_runtime_get_if_active(smmu->dev);
}

This returns -EINVAL otherwise which isn't a problem for the if
condition but slightly cleaner.

> +	if (smmu->impl && smmu->impl->context_fault) {
> +		ret = smmu->impl->context_fault(irq, dev);
> +		goto out_power_off;
> +	}
> +

We've moved impl-specific handlers here, I don't see a functional change.
This looks fine.

>  	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>  
> -	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> -		return IRQ_NONE;
> +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>  
>  	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>  		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> @@ -480,7 +490,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>  	}
>  
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +	pm_runtime_put_autosuspend(smmu->dev);

Nit: Please use arm_smmu_rpm_put() here.. while at it, I guess we can
also bring back pm_runtime_put_autosuspend() in arm_smmu_rpm_put() since
it is updated now to also mark last busy.

> +
> +	return ret;
>  }
>  
>  static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
> @@ -489,14 +504,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>  	struct arm_smmu_device *smmu = dev;
>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>  				      DEFAULT_RATELIMIT_BURST);
> +	int ret;
> +
> +	if (!pm_runtime_get_if_active(smmu->dev))
> +		return IRQ_NONE;
> +

Same here.

> +	if (smmu->impl && smmu->impl->global_fault) {
> +		ret = smmu->impl->global_fault(irq, dev);
> +		goto out_power_off;
> +	}
>  
>  	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>  	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>  	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>  	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>  
> -	if (!gfsr)
> -		return IRQ_NONE;
> +	if (!gfsr) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>  
>  	if (__ratelimit(&rs)) {
>  		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
> @@ -513,7 +539,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>  	}
>  
>  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +	pm_runtime_put_autosuspend(smmu->dev);
> +	return ret;
>  }
>  
>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> @@ -683,7 +713,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>  	enum io_pgtable_fmt fmt;
>  	struct iommu_domain *domain = &smmu_domain->domain;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	irqreturn_t (*context_fault)(int irq, void *dev);
>  
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -850,19 +879,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>  	 */
>  	irq = smmu->irqs[cfg->irptndx];
>  
> -	if (smmu->impl && smmu->impl->context_fault)
> -		context_fault = smmu->impl->context_fault;
> -	else
> -		context_fault = arm_smmu_context_fault;
> -
>  	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>  		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						context_fault,
> +						arm_smmu_context_fault,
>  						IRQF_ONESHOT | IRQF_SHARED,
>  						"arm-smmu-context-fault",
>  						smmu_domain);
>  	else
> -		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
>  				       "arm-smmu-context-fault", smmu_domain);
>  
>  	if (ret < 0) {
> @@ -2125,7 +2149,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int num_irqs, i, err;
>  	u32 global_irqs, pmu_irqs;
> -	irqreturn_t (*global_fault)(int irq, void *dev);
>  
>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> @@ -2205,18 +2228,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  		smmu->num_context_irqs = smmu->num_context_banks;
>  	}
>  
> -	if (smmu->impl && smmu->impl->global_fault)
> -		global_fault = smmu->impl->global_fault;
> -	else
> -		global_fault = arm_smmu_global_fault;
> -
>  	for (i = 0; i < global_irqs; i++) {
>  		int irq = platform_get_irq(pdev, i);
>  
>  		if (irq < 0)
>  			return irq;
>  
> -		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
> +		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
>  				       "arm-smmu global fault", smmu);
>  		if (err)
>  			return dev_err_probe(dev, err,
> 

Thanks,
Praan

