Return-Path: <linux-arm-msm+bounces-76950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56842BD226A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 575E14EC60B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF11E2FB619;
	Mon, 13 Oct 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BQoGMpil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C92E7BCB;
	Mon, 13 Oct 2025 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345525; cv=none; b=C4XYXhCWRoOMpNcfWHYFol6PnFRFuho+2sEsUDQCsOM7OBwfbGuUcy6NN+Q0BhCb00VLS7ixht/g3tmOqx6pZJgX/iGCm+Jog44GsYzC0hJlFH5nqgys3yVPPa8CyL4zvLzBOscseYY09miELxoHK4/3bpJEWnz3kT97CpJZYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345525; c=relaxed/simple;
	bh=D0Pm5gDAEf/J/fLMJeYhII2rupxN55IU1PVARShdLz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=rfM1wRomOUfd+XYcPqYCWIB0APG5z7CRIlW/9u7tcd7H8jNFwzjOVf7fe/0Zdj+ns6UPjn7Btwpr7naShEeTX34O6XSxdvMhNLevwN1GIOT198EOBVDObxX4cWtBuaSeLbEsRoqKNrZgbXrdYDEmnSEiz2aJmTdeBenK9R8hT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BQoGMpil; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251013085200euoutp0266e34edf90c863a4c01eb72fc5c48eb3~uAOyYTX0q1874618746euoutp02G;
	Mon, 13 Oct 2025 08:52:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251013085200euoutp0266e34edf90c863a4c01eb72fc5c48eb3~uAOyYTX0q1874618746euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760345520;
	bh=JyDd/uFH2Am1LZ5SPDN+k8UExukF9D/xq2Z7HY8ZnFU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BQoGMpilRJCUe8Y44BcqjJWkeRiS+JPfur3kcgk/2YoTAS+ViVlUzaRYX89zuEjDq
	 wkZ//2bWyV40qfk9fRhKG5W52cbl/HFo0RcqE6+fae76UZ4N7VyDdV6dd9ILg/D8OP
	 faJI0JVLj/Gc3HQk8b0emDKXb80ilcDcD66u6PCM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251013085200eucas1p2f4ded79121c5a222f59ecf4ddda0816c~uAOx-fHcX0880708807eucas1p26;
	Mon, 13 Oct 2025 08:52:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251013085157eusmtip27fccd916a2ad4442a7f4d1fa1f91c70b~uAOvsyZiW2933229332eusmtip2d;
	Mon, 13 Oct 2025 08:51:57 +0000 (GMT)
Message-ID: <e1d3661d-26ba-49ae-a124-dc5233c9107d@samsung.com>
Date: Mon, 13 Oct 2025 10:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v1 3/6] iommu/exynos-iommu: Set release_domain to
 exynos_identity_domain
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
	kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
	sven@kernel.org, j@jannau.net, robin.clark@oss.qualcomm.com,
	krzk@kernel.org, dwmw2@infradead.org, baolu.lu@linux.intel.com,
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
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251013085200eucas1p2f4ded79121c5a222f59ecf4ddda0816c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251012235812eucas1p1209a75bffb5a4784955781d437746731
X-EPHeader: CA
X-CMS-RootMailID: 20251012235812eucas1p1209a75bffb5a4784955781d437746731
References: <cover.1760312540.git.nicolinc@nvidia.com>
	<CGME20251012235812eucas1p1209a75bffb5a4784955781d437746731@eucas1p1.samsung.com>
	<56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>

On 13.10.2025 01:57, Nicolin Chen wrote:
> Following a coming core change to pass in the old domain pointer into the
> attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
> this new argument too, which the release_device op doesn't provide.
>
> Instead, the core provides a release_domain to attach to the device prior
> to invoking the release_device callback. Thus, simply use that.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/iommu/exynos-iommu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index b6edd178fe25e..0857519ca7188 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1429,8 +1429,6 @@ static void exynos_iommu_release_device(struct device *dev)
>   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   
> -	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
> -
>   	list_for_each_entry(data, &owner->controllers, owner_node)
>   		device_link_del(data->link);
>   }
> @@ -1476,6 +1474,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   
>   static const struct iommu_ops exynos_iommu_ops = {
>   	.identity_domain = &exynos_identity_domain,
> +	.release_domain = &exynos_identity_domain,
>   	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
>   	.device_group = generic_device_group,
>   	.probe_device = exynos_iommu_probe_device,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


