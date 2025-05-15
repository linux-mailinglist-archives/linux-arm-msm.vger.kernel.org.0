Return-Path: <linux-arm-msm+bounces-58106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6DAB8C83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985191BC1985
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70E4221728;
	Thu, 15 May 2025 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESjhprCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A91E9B2F;
	Thu, 15 May 2025 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326799; cv=none; b=hHgxwd6dAfhD/Xs8+obIQrhjBzIC/0bCK2pjPJiaYakrnTL84+AUUllCywHUrcXpeqDxJtzGf2icVqb3KafM/adoavA4JqFjQzzqbpWfCxX9U8Hppg6nsZcNxxxKjzlt71/ap/4CnsxBrhACokhdEym0P9d+QtPFgS1du4JYGjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326799; c=relaxed/simple;
	bh=kKPojMJd9kqH6u8NArAZ+Lui+uo9ndwDNquYyy93G0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFsyrOQMc3Okqe2XSTaMkfLCbg1F6RZfS1OT4At0Ain6h4SfcZ6AEeRx59lV/w4ku59wfRlNv+RCEmASCkB1O7z7fPs+dR2/u+xxlhuYDBjAkDkkPCFc+1ByT1eUv7Icnb2g4f8uKs6stDo34UaMe4VwYhSN4HZFi4qiN/W3LBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESjhprCJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD5EC4CEE7;
	Thu, 15 May 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326799;
	bh=kKPojMJd9kqH6u8NArAZ+Lui+uo9ndwDNquYyy93G0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESjhprCJouXAhjQr0dZG6SyTXibttfDkEXUZ8Ep+z+gy7A2IEg74Pih3DzIhR92mQ
	 Wg1fRLZ7AahHltL5KOdUISnA+OaOb/NOKa//4TXRGsVv+rtItX6BET9OvhMNCVjW8U
	 De/WmZChNK1Me4d3LxDTawHPD0qDmGXiVYicOpf6dOYdfucJiAUxulmuYxUjdIzoNg
	 rv5OilXcNBVStDgu4CYEBWfv8QrLAI7K0VbMfOL+gk/FQ5MrHdl540MrndCpVvuVnX
	 7099wIC/Jq/PwBwkwpUYCjiluxA04ZhHxA2VwN2NdOyoYvtGtPBJorxsEY9l/w9orN
	 6Z7TkSd+Kro/w==
Date: Thu, 15 May 2025 17:33:07 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 0/7] Remove ops.pgsize_bitmap
Message-ID: <20250515163307.GA12396@willie-the-truck>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 29, 2025 at 11:34:10AM -0300, Jason Gunthorpe wrote:
> Now that all drivers are using domain_alloc_paging() and dev is never
> NULL, we can have all drivers correctly set domain.pgsize_bitmap during
> their allocation function.
> 
> There are a few oddities that have accumulated here over past changes:
> 
>  - Some drivers always set domain.pgsize_bitmap during their
>    domain_alloc_paging() call but still provide a value in ops. This is dead
>    code, delete it.
> 
>  - Some drivers calculate a system global pgsize_bitmap in the ops, but
>    it is now trivial to use the per-instance value instead. In several
>    cases this is dead code, delete it. This also allows
>    constifying the ops in these drivers as a hardening measure
> 
>  - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
>    geometry in their domain_alloc_paging() functions.
> 
>  - Finally a few drivers still use ops because they have a delayed
>    finalize operation. Set the constant pgsize_bitmap in the
>    domain_alloc_paging().
> 
> Then remove ops.pgsize_bitmap.
> 
> This is based on iommu next, and must go after the virtio
> domain_alloc_paging() conversion.
> 
> Jason Gunthorpe (7):
>   iommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
>   iommu/arm-smmu: Remove iommu_ops pgsize_bitmap

These two SMMU changes look correct to me:

Acked-by: Will Deacon <will@kernel.org>

Please yell if you'd like me to pick them up separately from the rest
of the series.

Will

