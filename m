Return-Path: <linux-arm-msm+bounces-78904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C322FC0DCA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11783B2F6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8B425782A;
	Mon, 27 Oct 2025 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="HA4IsI57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0484F24169D;
	Mon, 27 Oct 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569759; cv=none; b=isT81xFxsGKsHMiUdQmGhicigFp4PhSC8JOZiFcsHVrthgzlr/X8gPmy63Xj/RFF1nerD1+R187PcLAuzTbRvpwfEFz9zvijO54gHbsz94BnJCvv8GXI4/Xmp6Q7EeRsAuFv7OXgQ/phCUKFCsw6se0lxc8i8m04mRX02SjC7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569759; c=relaxed/simple;
	bh=wdPrvvPNgCJ92pfYnd82XapNMb2/K9Lk7SnMdXsPwYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcxjKKuroC0M+JM/6H3PTXelv5YUJUaRVBaBlump9zUQEFADlhhcYntmpeub5vf3hjGcblHLCpBw9dccC5iPf1B+yXbbwXj4vbf0GKyH+bhl3QV31b90Tf1EuP7MOHgTSfjncgROJu/kG0BgyCmumZifBhOlpdDp5F/lWEw2ej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=HA4IsI57; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 574F959993;
	Mon, 27 Oct 2025 13:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761569756;
	bh=wdPrvvPNgCJ92pfYnd82XapNMb2/K9Lk7SnMdXsPwYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HA4IsI57/crRJKm5huZnz2yM9cueuQ83JrqqF31F0g7mwiTfeSnd43x0jF6LZthZc
	 xInJr7Dl8APiu4Qf/1dKwgAOW7EJNTBxKaqeF3SCeMWstoORITwx7nsvUeINWh5k+9
	 Ny8WfW/m0sLSzi4YzjffMfU5XZZBpghT634JsVKbHjtinJ84F0IqokpBXMlZ9vPJO6
	 HareDmhYXldiDUpmdDec87KCRVmJXWOlsHVldVZQAV6o+WAdhsPOkS6ZLKvwvFxjCx
	 iZSNYPT42T4jbU1r7D4nVssf6XfXSjG7/V3tsl+vP1evUijU+Z9RswofRmqxeAExhN
	 NJmXcf6NEl0nQ==
Date: Mon, 27 Oct 2025 13:55:55 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, suravee.suthikulpanit@amd.com, 
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org, j@jannau.net, 
	robin.clark@oss.qualcomm.com, m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org, 
	baolu.lu@linux.intel.com, yong.wu@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com, mjrosato@linux.ibm.com, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, jean-philippe@linaro.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/6] iommu: Pass in old_domain pointer to attach_dev
Message-ID: <xlu227m6u3wubnexhxh2cpx7nwudhvbmgqcqoas57a6sqgvege@p4s5i5p77v7a>
References: <cover.1761017765.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>

On Wed, Oct 22, 2025 at 07:21:03PM -0700, Nicolin Chen wrote:
> Jason Gunthorpe (1):
>   iommu: Generic support for RMRs during device release
> 
> Nicolin Chen (5):
>   iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
>   iommu/exynos-iommu: Set release_domain to exynos_identity_domain
>   iommu/amd: Set release_domain to blocked_domain
>   iommu: Do not revert set_domain for the last gdev
>   iommu: Pass in old domain to attach_dev callback functions
> 
>  include/linux/iommu.h                         |  3 +-
>  arch/powerpc/kernel/iommu.c                   |  5 ++-
>  drivers/iommu/amd/iommu.c                     | 21 +++------
>  drivers/iommu/apple-dart.c                    |  9 ++--
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 31 ++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++--
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++---
>  drivers/iommu/exynos-iommu.c                  | 11 ++---
>  drivers/iommu/fsl_pamu_domain.c               | 12 ++---
>  drivers/iommu/intel/iommu.c                   | 10 +++--
>  drivers/iommu/intel/nested.c                  |  2 +-
>  drivers/iommu/iommu.c                         | 44 +++++++++++++------
>  drivers/iommu/iommufd/selftest.c              |  2 +-
>  drivers/iommu/ipmmu-vmsa.c                    | 10 ++---
>  drivers/iommu/msm_iommu.c                     | 11 ++---
>  drivers/iommu/mtk_iommu.c                     |  8 ++--
>  drivers/iommu/mtk_iommu_v1.c                  |  7 ++-
>  drivers/iommu/omap-iommu.c                    | 12 ++---
>  drivers/iommu/riscv/iommu.c                   |  9 ++--
>  drivers/iommu/rockchip-iommu.c                | 20 ++++++---
>  drivers/iommu/s390-iommu.c                    | 13 +++---
>  drivers/iommu/sprd-iommu.c                    |  3 +-
>  drivers/iommu/sun50i-iommu.c                  |  8 ++--
>  drivers/iommu/tegra-smmu.c                    | 10 ++---
>  drivers/iommu/virtio-iommu.c                  |  6 ++-
>  26 files changed, 172 insertions(+), 120 deletions(-)

Applied, thanks.

