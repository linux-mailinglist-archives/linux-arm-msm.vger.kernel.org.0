Return-Path: <linux-arm-msm+bounces-57172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F2DAAE3F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B301C037DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E1428A1E5;
	Wed,  7 May 2025 15:09:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B3B289806;
	Wed,  7 May 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630598; cv=none; b=n0v1nVyYeOcIId/Vwphu/d9Dv3U31y5drozSve5nrYq2QUDBLNZihEAq7+FlhcktUJVjQfKmD/kf0Af8kPi3ojE4wlL1VC2/tA2ZS9iyBAvYtTmNYHfZcoeJoFEFNgzfpsJb2HPkBfGlsfJ3BvKL0HfQP1pejb8QFhg4AjwjS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630598; c=relaxed/simple;
	bh=hx26bMO+Cl+2FZ8rWOwKKXC9e8Uj3DCL+IbCY1vsf60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSQtP5MOqNahaH5f+GA9KYssqxVRbmJphwd1Gs02lV7JRItTtONlcP1eUohZzm4Xwa+wnebUM4Rhuiat6plQCWoEcopd7bvA+22mxLi0bBE225WFasyFGyPTchqBrdoW+0EiqS924zraTS8K24Hn2NUw2KKhDSjqb6YQpEZJKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47416339;
	Wed,  7 May 2025 08:09:45 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAD23F778;
	Wed,  7 May 2025 08:09:48 -0700 (PDT)
Message-ID: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
Date: Wed, 7 May 2025 16:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507144038.GC33739@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> In situations where mapping/unmapping sequence can be controlled by
>> userspace, attempting to map over a region that has not yet been
>> unmapped is an error.  But not something that should spam dmesg.
>>
>> Now that there is a quirk, we can also drop the selftest_running
>> flag, and use the quirk instead for selftests.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Sending v2 stand-alone, since I'm not quite ready to send a new
>> iteration of the full VM_BIND series.  And with selftest_running
>> removed, I think this patch stands on it's own.  (And maybe there
>> is still time to sneak this in for v6.16, removing an iommu dep
>> for the VM_BIND series in v6.17?)
> 
> You should just remove the warn on completely, no other driver does this.

What do you mean "no other driver"?

 From a quick look, these IOMMU drivers have some sort of visible 
warning related to the state of an existing PTE during map/unmap:

apple-dart
arm-smmu
arm-smmu-v3
arm-smmu-qcom
exynos-iommu
ipmmu_vmsa
msm_iommu
mtk_iommu
rockchip-iommu
s390-iommu
sun50i-iommu
qcom_iommu

while these IOMMU drivers do not:

amd
intel
mtk_iommu_v1
omap-iommu
riscv
sprd-iommu
tegra-smmu
virtio-iommu

By driver count, warning is literally the majority behaviour :/

Thanks,
Robin.

