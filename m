Return-Path: <linux-arm-msm+bounces-114255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3U2FIS9OmpBFggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:08:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D746B8F69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:08:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=QhyoxRA7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114255-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114255-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F89303DAFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEF9388E44;
	Tue, 23 Jun 2026 17:08:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF424388898;
	Tue, 23 Jun 2026 17:08:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234497; cv=none; b=MBz1kjnQHwmteQjzogb4db32O50Ems4Xz9IqGfoTA60enjDewi9yyTFzEdyU6A3m3dsxfkI/uAcFxZD19f+QOHt9elX5pMwvbQuNSoJLaJhu5j3bvbn7cu0gX/4diaHOo8iZo+MmQIMdBz2BiPYbBciXgfPYoHD3VShwlZF42Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234497; c=relaxed/simple;
	bh=ADQsnugpFHOxuOxzTph2IW6GGFQJ6O5IwKd6BdjGweM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwTLvhSu/SAKEDN9LaQmy5wOgjs+qfWqNl/QuWAoH40MbnRWJKkEPhhwtn84iXByV+6IUFuPvKFFrrFC0OOnOhuB6KBI37ojf8VJg95xEQoCx7cuQKSMJdVmbeWeyP0tnUJPSXWskVNiEmSOSXbHHD1o/2x31wJrnbQ81wWhMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QhyoxRA7; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F22B14BF;
	Tue, 23 Jun 2026 10:08:08 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34D7B3F62B;
	Tue, 23 Jun 2026 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782234492; bh=ADQsnugpFHOxuOxzTph2IW6GGFQJ6O5IwKd6BdjGweM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QhyoxRA7HjCf8/agBkdHSW4FjaPUxoIO2W2pmMUtZ318jEYJfOnK/ZBEtsdyTPH7T
	 ACSjdThyLAFzSuwkDruxCYsK2sQRa3zvNt2wpaZh1LamZmZYEAAW5MNvJa5gr7cAtC
	 wyU0cVSBm5o6W/adqj6i8O6EXBxX4UuqBLYxrA7Y=
Message-ID: <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
Date: Tue, 23 Jun 2026 18:08:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114255-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52D746B8F69

On 23/06/2026 1:20 pm, Mukesh Ojha wrote:
> to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> corresponding context bank failed to probe or was already removed.
> qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> directly, risking a NULL pointer dereference.

But if there's no context bank, then how has a domain been allocated in 
order to permit io-pgtable operations that would eventually call into 
qcom_flush_ops at all? Can you please clarify whether you've actually 
observed a real-world issue here, and if so how?

Thanks,
Robin.

> Add WARN_ON(!ctx) guards with continue so TLB operations skip
> broken context banks without crashing.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 40fb0408dc07..51b60b296bb8 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>   		unsigned int val, ret;
>   
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
>   
>   		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> @@ -138,6 +141,10 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
>   
>   	for (i = 0; i < fwspec->num_ids; i++) {
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
> +
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
>   	}
>   
> @@ -157,6 +164,9 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>   		size_t s = size;
>   
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iova = (iova >> 12) << 12;
>   		iova |= ctx->asid;
>   		do {


