Return-Path: <linux-arm-msm+bounces-60935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A753AD503E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCA2B3A4955
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A80262FDD;
	Wed, 11 Jun 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G1EFhqLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215BA2609F0;
	Wed, 11 Jun 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634819; cv=none; b=cf0tBekk9n2CgXA50m+8J6HqWdaCvq4JEeeZBS0PCb44zkuNAO9Vt1evpwvnjH/r3BsC8DmsIf3O86ZbFVTjmkMTGVsLpxOUqAiptnF4THX4ZLWzD2bpV0Bnk4HcaPsIBlEu1z67hLDL2Ch7SI1pydqDgyIK1U5N8OIC++ckt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634819; c=relaxed/simple;
	bh=EOF0wPKaDO4VgvfGSVrXCHsbhCfTQG4KN/6dg+9yv4s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hE9ZrSywuDAB8B9Ty7kfGOVbaR2FJCOidO4+xjCYa1RVdgx+leegRXmkErMX075rvqOBH2DJ5DXrBcQ+9esFl6JWEYgu91e6sYGvOV1iE2I13RVJq9uEvF41Echp0BSIrusz8o3J4vT5VWEC7ZoKep8oIQwU7kikLM+8wWgdQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G1EFhqLh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634815;
	bh=EOF0wPKaDO4VgvfGSVrXCHsbhCfTQG4KN/6dg+9yv4s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=G1EFhqLhpfUNHYRce2Shf7OUW7CiLa9zTxIYeMK9msSvQcpGRddVYbboJFxp09cTw
	 pfCXxWcB111nao4H/6Un1OT5MRE1keyyNcCbWArEQxEoS4sKk6cKLDyN5wQmCcFRe0
	 6ULMq4cpFtCfLIVeK1Vn1ahRyCQau3XZn5ofNA0qvwhRWHfYxuoovAr99sRCcgUx2z
	 P6tlwpz/dHR3L5Keiq4qtZ7yTZES8vavuGGH4aTGckSgw/BhIDDk1c1a8p1aR852Yb
	 iTSEbqL8vlmj9ANW56RRvQAKnFqOpvUFvx70VMhHzOFWrfwNI15zoQoSEU0wkePWUt
	 D6rgOCsNCAr2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4FA517E0FAD;
	Wed, 11 Jun 2025 11:40:12 +0200 (CEST)
Message-ID: <d5f0a339-11a4-42d1-82b6-807e6e45953b@collabora.com>
Date: Wed, 11 Jun 2025 11:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
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
References: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/06/25 22:41, Jason Gunthorpe ha scritto:
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



