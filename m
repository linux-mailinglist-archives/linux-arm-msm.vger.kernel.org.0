Return-Path: <linux-arm-msm+bounces-60936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF34AD5064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0721893958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 09:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791ED41C69;
	Wed, 11 Jun 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AIOCDZdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AD2206BB;
	Wed, 11 Jun 2025 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634825; cv=none; b=Nu2QZdxbA+23dn4FW+fDFKS8j/0ufkBn21rpBFJkNEyCLf9dFaVUDRgPTvJELN4jnSKih1xsiReTDVrBIXorP/4EroZDhslD4UUpyuCdU3wNHDBnZ+ZXRwZ3x+AxVH2SRazBubc1hXTmmbmSkK7KTRakjIL2AVktvJw1PAKk99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634825; c=relaxed/simple;
	bh=oW4XgX/lmD63EJZeg/21ZPWf1q1qDffFRs1xh6RK0tk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=vBhJ1JFSjrKuOKd4/f+ruYNN5776Cq5L740Tq3d6IRvzHsCKbeGud5zlJX4A96yf4bJ9wzejsV8TktodImvtyq0dIfUOaouBsHKt0/wGOrtBLn6vmFoNUnLaBqtjn1FB+ImES6ViLAxF7GebIKFPWnB5QCkx2fqqQ7mErNnSjkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AIOCDZdJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634821;
	bh=oW4XgX/lmD63EJZeg/21ZPWf1q1qDffFRs1xh6RK0tk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AIOCDZdJNc4cvOI+9dR4QtiyWejVsnTsx76OJcpPK2K47PYK1K25nHnx7NC15UZWg
	 U9iGg3zXSwKKrJstGNXHeDB23pm48ImbKGlYG1lleu82ZHF8IMyGMJg8CoSFiMOB09
	 llPZk4oMAaRxc2xD98eB9goX51LHvtnwlnwATWVveVXNtXOc7Cfm9S6nwsYZXbfqDG
	 HA4RJSB5h6KeYuPVxfELN8+upjB6gR127HILGMeipNd1WbkfAHOPr61vUR+JENTSmt
	 JzjqERVGHb5WeTn4mDzbcXqS2kGco68WwNBPjsFQYfXHpcbeJnE9wkx4DkdjOxORI8
	 55Km+HNivIKsw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D1AB17E36B3;
	Wed, 11 Jun 2025 11:40:19 +0200 (CEST)
Message-ID: <3827d632-6407-40bf-9b7a-148b0c46bea8@collabora.com>
Date: Wed, 11 Jun 2025 11:40:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 5/7] iommu/mtk: Remove iommu_ops pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Sven Peter <sven@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 patches@lists.linux.dev, Niklas Schnelle <schnelle@linux.ibm.com>,
 Sven Peter <sven@svenpeter.dev>, Tomasz Jeznach <tjeznach@rivosinc.com>
References: <5-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
In-Reply-To: <5-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/06/25 22:41, Jason Gunthorpe ha scritto:
> This driver just uses a constant, put it in domain_alloc_paging
> and use the domain's value instead of ops during finalise.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



