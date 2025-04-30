Return-Path: <linux-arm-msm+bounces-56189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB83AA40FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 04:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581149A4D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336DF1C3BE0;
	Wed, 30 Apr 2025 02:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyBh+egf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFE5288CC;
	Wed, 30 Apr 2025 02:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745980722; cv=none; b=FwIq7yQMdnUpB4wWp2WocqFMi9Nv/b2TQPmvrpCQEK2s0wmNAHkaLcrVsMymQdH7i8+jFU8IA2+PkQHzvjWXrK7gaHXgBfjXMf/wyFR771C8k9EwAROHNSYSnirCaADq2ewvJYopVfyqzkhR62ZL0q3C3cQGBMssnTo7Hj2CiRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745980722; c=relaxed/simple;
	bh=z6s3YPMqRWDP6hk7iOLyjE8AjXiCVoO/HzYvSsyvfgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrLDO54jtgnHcnI3I2huvLRq6NmyFGmCd/a+7UDpqnaM3ywhRAEoEFhtfHNN6CwUAclLfGrt9TUZ3PP2FEAzkd+gDGVDGgLC8QHI+5t5KTPLK/ItshQho/HY/IQW+dBamxcmcYCYYOId5yF0PROhLcpOwoa7D8yNRUvhLtGx30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyBh+egf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745980721; x=1777516721;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z6s3YPMqRWDP6hk7iOLyjE8AjXiCVoO/HzYvSsyvfgc=;
  b=jyBh+egfB5TtqaKouTV8ZdiPsvsTM9tLTelFFyJzbIyXKWvBNmw6LHFu
   /XrujNg+DBlAfcpFY/zzaHSz8+VFcKvXr1Nz2o3rQJzwIUMa0TVgkmseG
   egZx7XybZcfw13PRVCFzqM5QFgIU6KvVP0Ga8Faa17pGd0VxOtIOQ85P4
   vT3El3l/hk+MyU0u7A8BlF3DkeoOo8yjABbe+xc2PgNU7hVlllRZ42NWA
   i7VoDwgCGCF5w4IvXm0/tnH1q90UlQMKYl0u5EMbEmUajj5RYUA/BCWDd
   e96NrAdmtt/frkYGwJvDgNYyNvhichLK28Iy/5XazLujbpKt2HLsvmI+s
   Q==;
X-CSE-ConnectionGUID: g6EqXwtRSZKZoLggUM6J2A==
X-CSE-MsgGUID: CwkHdNwWSraQGXNBsqeSlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51445378"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51445378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:38:40 -0700
X-CSE-ConnectionGUID: x1GszayAR3umhh+jpQ6E4A==
X-CSE-MsgGUID: PISqLkxoS+KMge4QNm3Eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134508627"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:38:26 -0700
Message-ID: <75c7d479-5310-4e1d-bb0e-71ea363fcc90@linux.intel.com>
Date: Wed, 30 Apr 2025 10:34:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] iommu: Remove ops->pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
References: <7-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 22:34, Jason Gunthorpe wrote:
> No driver uses it now, remove the core code.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

