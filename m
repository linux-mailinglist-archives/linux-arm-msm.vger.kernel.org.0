Return-Path: <linux-arm-msm+bounces-62728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E453DAEAF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42CC316862B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 06:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F0C219E8F;
	Fri, 27 Jun 2025 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XU+Ec1H6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB15218EBA;
	Fri, 27 Jun 2025 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007400; cv=none; b=KR75RSduUkpNsUJxobrImWMeJSxAeXsHXMnLRYu1QbNscjhRkSjDah2zeODrZINspJ1vSHMaAwqxnNtlRdV8uIcCfQGgYHD0JTbUGXrdOrRjt6lKcKXTQf1q0YFgDXuB/bC7kLWt+Oe+8XTW/iye2wpGVR0pl0zabvPllQRKz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007400; c=relaxed/simple;
	bh=8cyCUVLrNKS6tVu4VEKnS5rU8EEbVvMM4YBN4njzgJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcZRh5mJwlr6jXbEsMoKvyjZTpZJEFLpuIa+HYUTnctvxw0zcuIHvyQ9nqL6LT2y2AxlHlwWSt6nxrQ1/Mr2o5rhBksNLT+vkk4XCsGmdeK2Hbw8dWtZ5tn6s4hSbrAcd+UwAonWAko3YttadjhH6Si8muhheksMvpLSJx2eiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XU+Ec1H6; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B2DBE4D686;
	Fri, 27 Jun 2025 08:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751007397;
	bh=8cyCUVLrNKS6tVu4VEKnS5rU8EEbVvMM4YBN4njzgJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XU+Ec1H6zYbpoJnBguJ7GDr9FEN9rGsre0pu8KqaKGy81Z4kSMmAWmsLnuh8C6DXX
	 NNDbZaaw/8hi+SEmWsp5x3pevvQorZ/gnxPIioOfE8HvHGxwz1755SXHcf4LYAXtZ2
	 4mCpj7FQzDFz6VXNwUJwKVqKYmzDv8PJ9OZQsqYZo+D5KCzC+3KXRAYaDgs30cvzbf
	 b9rnpd2DjGQE4e7TFeqIpB49EWs2qUxIo370ZNhi4u0ii2sX+By78Bt9A5CzII9ZQu
	 qAYA7JvY8BJ+VxyGicYP9L2BwXzRfRdSbcDYET1GuYoeHH7ug+hgwd2x2yUSyjfWiH
	 g0r0oGD4DIalg==
Date: Fri, 27 Jun 2025 08:56:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 0/7] Remove ops.pgsize_bitmap
Message-ID: <aF5Ao_yAbTGCPh3u@8bytes.org>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>

> Jason Gunthorpe (7):
>   qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
>   iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
>   iommu: Remove ops.pgsize_bitmap from drivers that don't use it
>   iommu: Remove iommu_ops pgsize_bitmap from simple drivers
>   iommu/mtk: Remove iommu_ops pgsize_bitmap
>   iommu/qcom: Remove iommu_ops pgsize_bitmap
>   iommu: Remove ops->pgsize_bitmap

Applied, thanks Jason.

