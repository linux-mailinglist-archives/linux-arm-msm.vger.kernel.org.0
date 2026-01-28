Return-Path: <linux-arm-msm+bounces-91072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dpCJAitZemm35QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:44:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86EA7DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 522A63013B60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93FB36921B;
	Wed, 28 Jan 2026 18:44:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D58336EC5;
	Wed, 28 Jan 2026 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625895; cv=none; b=k4AUA3f8+J3ITKBHEB0NJohFwzDAaMuEHPS8VgZhTfBhKtAP66pVuBUI0oNSegL3eB8SYoonGSfJ821sVvHnbbbYdFRkVyr6ZB1zgqm1i0tkuV6ZwCKMKF4zrABjFb5RLRvqsMONx0G0CzK3GxXWhzFgEZ+AHmO2XA2HmHGRYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625895; c=relaxed/simple;
	bh=YWYdf9VXH4blRVtgKNmi/VpABd2r97IKD4NwZPdQJw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIhMIj4/kOUrt0TzW5MZhLFJL/ROdwkBrzWtRwg+yhPy3ZiMGLFTag52Eok/sFkz2VKisv7DusGVdsF0l+knsBXmewirTmyp+/StOBN7nOI+V1ecWMT1i6iwXkfEd6pirxKD6xzJz4n72sTbq9M72WSXEexJL5bXpgmAAtsYLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C644B1516;
	Wed, 28 Jan 2026 10:44:46 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D3B3F5CA;
	Wed, 28 Jan 2026 10:44:47 -0800 (PST)
Message-ID: <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
Date: Wed, 28 Jan 2026 18:44:35 +0000
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
 Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91072-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,8bytes.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: 6A86EA7DB2
X-Rspamd-Action: no action

[ +Pranjal as this might matter for v3 too... ]

On 28/01/2026 5:56 am, Prakash Gupta wrote:
> 
> On 1/27/2026 9:35 PM, Robin Murphy wrote:
>> On 2026-01-27 12:11 pm, Prakash Gupta wrote:
>>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the
>>> driver")
>>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>>> sits in a power domain, all register accesses must be done while the
>>> device is runtime-resumed to avoid unclocked register reads and
>>> potential NoC errors.
>>>
>>> So far, this has not been an issue for most SMMU clients because
>>> stall-on-fault is enabled by default. While a translation fault is
>>> being handled, the SMMU stalls further translations for that context
>>> bank, so the fault handler would not race with a powered-down
>>> SMMU.
>>>
>>> Adreno SMMU now disables stall-on-fault in the presence of fault
>>> storms to avoid saturating SMMU resources and hanging the GMU. With
>>> stall-on-fault disabled, the SMMU can generate faults while its power
>>> domain may no longer be enabled, which makes unclocked accesses to
>>> fault-status registers in the SMMU fault handlers possible.
>>
>> At face value, that sounds wrong - how does an SMMU generate a fault,
>> or indeed do anything, when it's powered off? In principle it's
>> possible that the SMMU might signal an interrupt, and is _then_
>> suspended (with the interrupt line somehow remaining asserted, so
>> probably more clock-gated than completely powered down) before the
>> interrupt hander runs, but we rather assume that we're not going to
>> have an unhandled hardware IRQ hanging around for longer than the
>> autosuspend delay.
>>
>> So, judging by the diff below, I guess what you really mean is that in
>> the case of a threaded context IRQ handler, it can take long enough
>> between handling the hardware IRQ and the thread actually running that
>> the SMMU may have suspended in between?
> 
> You are correct that the SMMU cannot generate a fault while powered
> down. A more accurate description of the race condition is as follows:
> When stall-on-fault is disabled, the faulting transaction does is
> terminated. This allows the master (the GPU) to complete its work, drop
> its power vote for the SMMU, and allow the SMMU to suspend. However, the
> SMMU fault handler may still be waiting to execute on the CPU.
> If the SMMU suspends before the handler reads the fault registers, an
> unclocked access occurs. This scenario is significantly more likely when
> using threaded IRQs due to the scheduling latency involved. I will
> update the next iteration to reflect this.
> 
>>
>>> Guard the context and global fault handlers with arm_smmu_rpm_get() /
>>> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
>>> with the SMMU powered.
>>>
>>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault
>>> after a page fault")
>>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>> ---
>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53
>>> ++++++++++++++++++++++--------
>>>    2 files changed, 43 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 573085349df3..2d03df72612d 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct
>>> arm_smmu_domain *smmu_domain,
>>>        struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>        struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>        const struct of_device_id *client_match;
>>> +    const struct arm_smmu_impl *impl = qsmmu->data->impl;
>>>        int cbndx = smmu_domain->cfg.cbndx;
>>>        struct adreno_smmu_priv *priv;
>>>    @@ -350,10 +351,12 @@ static int
>>> qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>        priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>>        priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>>        priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>> -    priv->set_stall = qcom_adreno_smmu_set_stall;
>>>        priv->set_prr_bit = NULL;
>>>        priv->set_prr_addr = NULL;
>>>    +    if (impl->context_fault_needs_threaded_irq)
>>> +        priv->set_stall = qcom_adreno_smmu_set_stall;
>>> +
>>>        if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>            !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
>>>            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 5e690cf85ec9..183f12e45b02 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int
>>> irq, void *dev)
>>>        int idx = smmu_domain->cfg.cbndx;
>>>        int ret;
>>>    +    if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {
>>
>> Why is this conditional on being threaded, if the global fault handler
>> that can never be threaded at all apparently needs it unconditionally?
> Synchronous runtime PM calls can sleep, which would cause issue if
> called within a hard IRQ context. This is why I added the conditional
> check for threaded IRQs.
> Furthermore, this change only allow the driver to override the
> stall-on-fault setting when context_fault_needs_threaded_irq is true.
> Since the unclocked access issue is tied to disabling stall-on-fault,
> the fix is only logically required for the threaded IRQ path.
> For the Global Fault handler, which runs in a hard IRQ context, you are
> right—we cannot safely vote for power there. I will remove the runtime
> PM call from that section.

Hmm, but then how *do* we actually guarantee that autosuspend doesn't 
happen to kick in and power down the SMMU just as a hardirq handler 
runs, when there's some unexpected event? I fear there's a horrible can 
of worms here...

Thanks,
Robin.

