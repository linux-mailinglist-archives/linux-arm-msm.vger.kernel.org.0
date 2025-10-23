Return-Path: <linux-arm-msm+bounces-78444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3BBFF29C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC841A0268C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D070A242D92;
	Thu, 23 Oct 2025 04:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCvoaAU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F0B155389;
	Thu, 23 Oct 2025 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194828; cv=none; b=VMMslG1cnMyiARytCceExoDX7ohRYjK+aATOzw9xYbDl7e8hzk/Irbn+NAoxZ7ICwBq5bzYOBHi4SXVdOVxBSXAq1Xpwr/UqJLa/AoFO4ChR+vwModFRuLnpILS0k2feybV4clA0hY5nicUQUvphD2GVNKRJPsGBfmqs2/bNEjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194828; c=relaxed/simple;
	bh=toggoyR65FRMD2salpJRgrdbeLvnI/1Ai4wkilIe08M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/HdyxnDSmt9qqpLRNcey3ldOwl4C/x7tVPC++5iflu51+/vCF5earBY2QDO7StkH73zLx4nk6AUFlWPxethpW462gtBL2/C7IjYwuzoiR6tutpCuA8XOjy0bdDXOVqI4Jd3fro+te+tUC926cQNxzKyW2xVfR2HGcxhSbOhVjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCvoaAU+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761194827; x=1792730827;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=toggoyR65FRMD2salpJRgrdbeLvnI/1Ai4wkilIe08M=;
  b=KCvoaAU+SMb3mSAA/+AxYCMrz2PZnRF4oyaXxLhzMkjVvuzOaUsM3Pe4
   +S6XpJ1xTMue91kKwZjDdEMoYOsm9gPkrtuZahyo/BU2a2Pz96LPCGgro
   EeLhHlswv6nj3bky5RVV4tZSlTfiNrmN+F8isGfruPtUODQLgNB34fzNm
   6aMJNEK2hOhJnYg6eJ7++U5Rt0DDeu0zfacoNg+JuPCbJQ+qb1hxTQHW6
   FZ5+I8AY6/v2RgOzB7WxDV4iqNFDQ63NUossfKqt6Z+7gpLaEgdlnOBgk
   gjnJNP5ssys3wPYRjkdZ3IjE2LQvcstQ0A70/QFYao0Vj3Ddj+/eEYhNG
   A==;
X-CSE-ConnectionGUID: VCiy3azBQbyZTI6nC0Pndg==
X-CSE-MsgGUID: b1GmCMHwQoGVsbUnbpByFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63501590"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63501590"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:47:05 -0700
X-CSE-ConnectionGUID: KCuFwfgeQhOOzq78NUB0nQ==
X-CSE-MsgGUID: +WIDlni6TjybQawi0SaEdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214984355"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:46:56 -0700
Message-ID: <99d27f65-4797-401f-a374-b3fccd67cdac@linux.intel.com>
Date: Thu, 23 Oct 2025 12:43:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iommu: Generic support for RMRs during device
 release
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
 kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
 sven@kernel.org, j@jannau.net, robin.clark@oss.qualcomm.com,
 m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
 yong.wu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 schnelle@linux.ibm.com, mjrosato@linux.ibm.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jean-philippe@linaro.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 patches@lists.linux.dev
References: <cover.1761017765.git.nicolinc@nvidia.com>
 <80bbe9125d90b001f3ce08429704aa4168b0a00b.1761017765.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <80bbe9125d90b001f3ce08429704aa4168b0a00b.1761017765.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 10:21, Nicolin Chen wrote:
> From: Jason Gunthorpe<jgg@nvidia.com>
> 
> Generally an IOMMU driver should leave the translation as BLOCKED until the
> translation entry is probed onto a struct device. When the struct device is
> removed, the translation should be put back to BLOCKED.
> 
> Drivers that are able to work like this can set their release_domain to the
> blocking domain, and the core code handles this work.
> 
> The exception is when the device has an IOMMU_RESV_DIRECT region, in which
> case the OS should continuously allow translations for the given range. And
> the core code generally prevents using a BLOCKED domain with this device.
> 
> Continue this logic for the device release and hoist some open coding from
> drivers. If the device has dev->iommu->require_direct and the driver uses a
> BLOCKED release_domain, override it to IDENTITY to preserve the semantics.
> 
> The only remaining required driver code for IOMMU_RESV_DIRECT should preset
> an IDENTITY translation during early IOMMU startup for those devices.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

