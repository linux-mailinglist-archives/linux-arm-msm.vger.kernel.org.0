Return-Path: <linux-arm-msm+bounces-78452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4BBFF35B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 25ECB4EDEEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 05:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A24A26158C;
	Thu, 23 Oct 2025 05:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIxWK84X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE317D2;
	Thu, 23 Oct 2025 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195744; cv=none; b=T8BXO5/+VGtpL3q0QRN0psPPXNzMztwTpBn4az4jkZSIwNHQZk3XIh1FjksBox+jRzbOvNJm3z7UGt4GvB22ZAxs8jtq/wTsiSPocscNAMNKG9xlMHt5WFNJdm9rqccKZ+oDx8Slh4YT7DW2PdcH733TmJApvrd9yu4AoHX16+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195744; c=relaxed/simple;
	bh=xnBFwakM2k1JPYwO3/Qy+Tx8eLKNZ7gwkUwwpTfHUOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7mzHyb1qK5lp6NHKT4CESwZVmIJZjV5ov9vw+mmfBMhSzuVJpf4b/975GTEoX9cGsumeUBCuJolVGmEfaLTfPs9ZWv0tWk2OiBlZopv7A7v1kx6TcSfoF0FyMTkw7kgfJJtddTCzVHRMu9JTaR7vUIkf/hXDflOiqDvGs+Logo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIxWK84X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195742; x=1792731742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xnBFwakM2k1JPYwO3/Qy+Tx8eLKNZ7gwkUwwpTfHUOQ=;
  b=WIxWK84XMJJx8AcVC72JPDNPt7vkb3i8YAGfP0PIDaanLn3mF5TIrTeM
   V367lSNM5aQhpmCTy82ZVP3RHZ0/jN4T97F8Sz9CJnhuC258PDh1mysIS
   CD0Wc3XV/VjL/nyoGcv5OzCiISGm2eGBfrSesGBVEVQyu9cUMz4FHcUZd
   tFhGD5wNmluz9SpHLqeIF1r/Z6aQCbmB1KbI2F0CyIx44SnJ+7ClGz2YS
   PP3m5aNg3FAQUbNtSJYFT+WBENxJ/cGbEkY2NPWWmMqwevfYHD+zMZp/q
   A7eS2rpTTcTVyeOzWIKZWdhTcSfabPmZmfkIE8nepzgIATBPecW3D0ccA
   Q==;
X-CSE-ConnectionGUID: 8o2ArTLJSCGhO23WYBSuww==
X-CSE-MsgGUID: bJSgA2j+TtCjY9REVtLA+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50933427"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="50933427"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:02:20 -0700
X-CSE-ConnectionGUID: kWA0S5r3S1ua2kzqQUzTDA==
X-CSE-MsgGUID: MuIS53hmREe4ygA3mF8heg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214986870"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:02:11 -0700
Message-ID: <3a9698ac-ac50-499f-871c-ee44d7371815@linux.intel.com>
Date: Thu, 23 Oct 2025 12:58:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] iommu: Pass in old domain to attach_dev callback
 functions
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
 <7f760e795097e3052da82abf410c6ee963e4c62b.1761017765.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7f760e795097e3052da82abf410c6ee963e4c62b.1761017765.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 10:21, Nicolin Chen wrote:
> The IOMMU core attaches each device to a default domain on probe(). Then,
> every new "attach" operation has a fundamental meaning of two-fold:
>   - detach from its currently attached (old) domain
>   - attach to a given new domain
> 
> Modern IOMMU drivers following this pattern usually want to clean up the
> things related to the old domain, so they call iommu_get_domain_for_dev()
> to fetch the old domain.
> 
> Pass in the old domain pointer from the core to drivers, aligning with the
> set_dev_pasid op that does so already.
> 
> Ensure all low-level attach fcuntions in the core can forward the correct
> old domain pointer. Thus, rework those functions as well.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h                         |  3 ++-
>   arch/powerpc/kernel/iommu.c                   |  5 ++--
>   drivers/iommu/amd/iommu.c                     | 11 ++++----
>   drivers/iommu/apple-dart.c                    |  9 ++++---
>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++--
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 24 +++++++++++-------
>   drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++++---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++++----
>   drivers/iommu/exynos-iommu.c                  |  8 +++---
>   drivers/iommu/fsl_pamu_domain.c               | 12 ++++-----
>   drivers/iommu/intel/iommu.c                   | 10 +++++---
>   drivers/iommu/intel/nested.c                  |  2 +-
>   drivers/iommu/iommu.c                         | 25 +++++++++++--------
>   drivers/iommu/iommufd/selftest.c              |  2 +-
>   drivers/iommu/ipmmu-vmsa.c                    | 10 ++++----
>   drivers/iommu/msm_iommu.c                     | 11 ++++----
>   drivers/iommu/mtk_iommu.c                     |  8 +++---
>   drivers/iommu/mtk_iommu_v1.c                  |  7 ++++--
>   drivers/iommu/omap-iommu.c                    | 12 ++++-----
>   drivers/iommu/riscv/iommu.c                   |  9 ++++---
>   drivers/iommu/rockchip-iommu.c                | 20 +++++++++++----
>   drivers/iommu/s390-iommu.c                    | 13 ++++++----
>   drivers/iommu/sprd-iommu.c                    |  3 ++-
>   drivers/iommu/sun50i-iommu.c                  |  8 +++---
>   drivers/iommu/tegra-smmu.c                    | 10 ++++----
>   drivers/iommu/virtio-iommu.c                  |  6 +++--
>   26 files changed, 153 insertions(+), 100 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

