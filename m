Return-Path: <linux-arm-msm+bounces-42788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173A9F7AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 13:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71AE4188E18A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79B2223C72;
	Thu, 19 Dec 2024 12:08:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10221222562;
	Thu, 19 Dec 2024 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610129; cv=none; b=M1du3+KPpkqpxXUXzi+mHKfvkR0PQ/BQ0LgQzj1XKRRp8nhZqtggYu6sMrISQWnem89h//wfTGnpeUtlK2DNJ15Vz8gYlJpXWbRwo40mdJO6rrtVmRosHYYeShDezOoVG8cNQsSSGCQslotCv542CF5hCaQx84kUkZmbZpBMTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610129; c=relaxed/simple;
	bh=0vkEU4CJSsngyQAQN0BsZ2fcKrOspUByzZHcYMCLOLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiA8aYpdyr7ldKciKcrG7KDPlIYEa4gBUXfhPKAwKBUBtlhLUZtDhSRY8+eNitLi9q7epRBBL6NFGqWbRmoI91+s0La/ELImq14I27xZW0Qex5MwI8nQF4BTTbfVQteIFOyaVOAZxbrDpJHKsw/TBR19zrREcxVzMNAFQs9/MM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6FD1477;
	Thu, 19 Dec 2024 04:09:15 -0800 (PST)
Received: from [10.57.1.39] (unknown [10.57.1.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDD43F720;
	Thu, 19 Dec 2024 04:08:45 -0800 (PST)
Message-ID: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
Date: Thu, 19 Dec 2024 12:08:39 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241216171017.4881-1-robdclark@gmail.com>
 <20241219113019.GA23640@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219113019.GA23640@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-19 11:30 am, Will Deacon wrote:
> On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> On mmu-500, stall-on-fault seems to stall all context banks, causing the
>> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> MMU-500 has public documentation so please can you dig up what the
> actual behaviour is rather than guess?

Yeah, I'm pretty sure that's not true as stated, especially with 
SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is 
plausible that at the system interconnect level, a sufficient number of 
stalled transactions might backpressure other transactions from entering 
the same TBU, even if they are destined for a different context. That's 
more about the configuration and integration of individual SoCs than the 
SMMU IP used.

Robin.

>> This fixes an issue with an older mesa bug taking outo the system
>> because of GMU going off into the year.
> 
> Sorry, but I don't understand this sentence.
> 
> Will


