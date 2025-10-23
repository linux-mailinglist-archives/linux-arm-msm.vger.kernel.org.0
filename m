Return-Path: <linux-arm-msm+bounces-78447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82132BFF2E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82A274E2E67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43B424DCF9;
	Thu, 23 Oct 2025 04:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbYYuDXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96191235063;
	Thu, 23 Oct 2025 04:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195257; cv=none; b=cKCwGgbmrBfvMDoWqHo9u31Z7IhQ7QJTN3SzgyrdBSk0J9R9iMCmRnV+x/M5tsA7rOJJUe+PC0bjfzVD8XQrUn1rV6WXyLKInQqpFhXPKBLpMsKwFZ1I79suvA99OVjTmUj4jO2s+UjksBDrWWjXWJU7g7TWe5QCBEOe61J/8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195257; c=relaxed/simple;
	bh=o/X8ig17zbEWg83ccAFqusXE4QA15fbF7lAl6rfU1tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bN5rycMMryd7OlYWuYuntftxxo1TQ1/SJy525sTz+TQ21IrPvSRlsHog96BkjysRF63FUHdDMzZf8Z97+4tDIBJmFX2STRjJoE/G2aI0dm+Cyybz7kJ1q0OdSyHBUw4jmcVVGOTqPaxwX9sM1fALD6A3jyBCvMHxaprmKZ30VMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbYYuDXA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195256; x=1792731256;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o/X8ig17zbEWg83ccAFqusXE4QA15fbF7lAl6rfU1tQ=;
  b=FbYYuDXAp/LXLr+T3JMvJyAe8UJgcWn1t5Y2vDTt3UTKFIKOOH4JxxCy
   llEi+DpMBv7kXbjdFxyRkDDP7IYV5+GC92iilLgSAS6cReFNy2Ab2/fyo
   H6wZaXgFFvzSpeRUN502qtCDUhW/YEDidgH3nl/OZs7UcXuwYcwYI2Xrg
   Nl9DXGN6mYLXXYlVAdJ4AgM3UNjmRyxJufX6tvXL5lLMaD+wvK9or9VDl
   gi+YC+1DTOqOeRcsh8fGuM/UjA7WAge31AQJtdauc6ClH1LRYcgLkBpz0
   PrZM6oyi5BNoDofZKdSZxMVlEvJkoobW4I4gOryrs2Ew8Fo/tHrwk/ls4
   w==;
X-CSE-ConnectionGUID: u3l4LyIOQRe4s2S0B0Dq+w==
X-CSE-MsgGUID: qHoVY+sKRiq++ux8oK7eYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63502010"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63502010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:54:15 -0700
X-CSE-ConnectionGUID: HMCARIInQHW636C3OauOVA==
X-CSE-MsgGUID: LmNg6KDHRqKFY/2EChkiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214985320"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:54:06 -0700
Message-ID: <47b5dfbe-dda7-419d-9032-d61bda44eb9f@linux.intel.com>
Date: Thu, 23 Oct 2025 12:50:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] iommu: Do not revert set_domain for the last gdev
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
 <276875013de662fe50f3fdd9e9a5bfbc0f12602e.1761017765.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <276875013de662fe50f3fdd9e9a5bfbc0f12602e.1761017765.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 10:21, Nicolin Chen wrote:
> The last gdev is the device that failed the __iommu_device_set_domain().
> So, it doesn't need to be reverted, given it's attached to group->domain
> already.
> 
> This is not a problem currently, since it's a simply re-attach. However,
> the core will need to pass in the old domain to __iommu_device_set_domain
> so the old domain pointers would be inconsistent between a failed device
> and all its prior succeeded devices, as all the prior devices need to be
> reverted.
> 
> Avoid the re-attach for the last gdev, by breaking before the revert.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

