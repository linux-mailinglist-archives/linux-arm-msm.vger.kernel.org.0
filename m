Return-Path: <linux-arm-msm+bounces-56295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661EAA4D3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D103F1B60FB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82E825D1FF;
	Wed, 30 Apr 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DOG7cRsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19652221F0E;
	Wed, 30 Apr 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018984; cv=none; b=ZcOSMRtMnyohAIf8xTApMqxR/bbfs7WJTcoCpp+1L5RuFlQietwLdLpuIgMwdHCLwF6DbkPvTXFIppY3l2HMcI7Uq144ZUKqVsSPZH36cuExlL2D4r6F5Qd07KexoODTGixkZtoQisodhEF0ZqAtEIqXgnJ0vzqusplueNhBnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018984; c=relaxed/simple;
	bh=nmsWtbOQeVaahxPJX79RmdbIgyWrU+syOxMVYt3Q9hk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YhEhuVBzm2cbiVgPR9Jf7dmPFU/WZIYhAkA6ylMP1k/G7eEEjsdCDwhfjfB8o0/PEgvr+31y31x8eU7fTYl/5XPm8N5nhBpyRmCmL2PvWqHx7gnSM7KrpVsv72Ma6tj5/2sWpUoFq2TH2USVZ5d9j1RrzBS+YCNuDO8JB4C2ua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DOG7cRsp; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UA4Dwk006413;
	Wed, 30 Apr 2025 13:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q/kum/
	xyIExGMc5hG28NRFZbeGIOSqBLoOtMSE9kQno=; b=DOG7cRspj7YVva03zbzaew
	s/h5qhtz+RmrLfuzsQjKqli6vyk+MQaCg7PM5jGZfr348vQjgPOOmfEiXXDzdbbR
	GAT8WVzE+rcm1+C0oJHsODPKDMSF89umb6nhM/pZH56IQ4tPabd/R+Lf6V7xjQLA
	cEVsMxAryq2y7hXaK6WHZWwD9evw2sfZqkjxBRDud/shVP28JoS9ZoOKfW46+GGU
	KhntCIY0Hu88JkqRaWWeTvAI9GRc3I2KDQm5VmmT9rBQlM/Vknbbp49I+UQ905/+
	2ayvVw/NMpjUM/CGINyT6dJyAbtc/XZ3TbswfR4Ze/Ty/Au38w1QrbMe4U4pQYWQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjrupg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:15:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UDElTg022870;
	Wed, 30 Apr 2025 13:15:27 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjrupb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:15:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53UC99Q8016145;
	Wed, 30 Apr 2025 13:15:26 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70g3cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:15:25 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UDFOdT63766940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:15:24 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50CFB58052;
	Wed, 30 Apr 2025 13:15:24 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B775158060;
	Wed, 30 Apr 2025 13:15:15 +0000 (GMT)
Received: from [9.111.36.251] (unknown [9.111.36.251])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 13:15:15 +0000 (GMT)
Message-ID: <176e3870fd0284a05a19d424ad1a56e73120573c.camel@linux.ibm.com>
Subject: Re: [PATCH 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Lu Baolu	 <baolu.lu@linux.intel.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Janne Grunau	 <j@jannau.net>,
        Jean-Philippe Brucker
 <jean-philippe@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel	 <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
        Krzysztof Kozlowski	 <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski	 <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
        Orson Zhai
 <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Rob Clark	 <robdclark@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>,
        Samuel Holland	 <samuel@sholland.org>,
        Sven Peter
 <sven@svenpeter.dev>,
        Thierry Reding	 <thierry.reding@gmail.com>,
        Tomasz
 Jeznach <tjeznach@rivosinc.com>,
        Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon
 <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
Date: Wed, 30 Apr 2025 15:15:14 +0200
In-Reply-To: <4-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References: <4-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dcuA3WXe c=1 sm=1 tr=0 ts=68122270 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8 a=_knvdkSgN1paDctlJl8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: R-J8zs6vbU8Fj3Hg9HUhfjU7mRcYm1f9
X-Proofpoint-ORIG-GUID: vs1u3Uxwur-7V56wvsM_6u35JXL4UxRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX0crM3ye1wDMC kbmvOcxMpt8qp2kb4hwNdhueblTXbdKjNKMEcOSa9phlvxoFwMQXJmwiAp7rlQ7umEpUTk9O8CH UCh1SsJLhJFOGqLkqdLIUMVxHD2tmkVHp21Kmq6apmJj6BpFoInlRLKY9vyZKSLjWOjbIl3rD7l
 YawL/LEQRbIf0uhOvsspLktyC77qIIQvgQt4rRFWnDeyuOyiGrRyPobDRpyhZCfQTwFfkLm8LtY NZ7rCINGc6RERQcdHZhgAdny2ZdDjlFvLirlNByExuRX1MLsV5nVvf+goh9gNvItulc1gKtQGp+ rq1FAXQIMKZNw/CwAz671p6Mrn4TKgH4erOUiMN+gjKhWQapr6AEiC7/lnishFqsgt9s/516iPH
 LvI+GvtmUiFHTYwvCG4xuzdAArZsdz5kRIQHBnA3AwCDoxMRS+qc0YKJmRX8qpFUjzE3x0Dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094

On Tue, 2025-04-29 at 11:34 -0300, Jason Gunthorpe wrote:
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c   | 3 ++-
>  drivers/iommu/ipmmu-vmsa.c     | 4 ++--
>  drivers/iommu/mtk_iommu_v1.c   | 3 ++-
>  drivers/iommu/omap-iommu.c     | 3 ++-
>  drivers/iommu/rockchip-iommu.c | 3 ++-
>  drivers/iommu/s390-iommu.c     | 2 +-
>  drivers/iommu/sprd-iommu.c     | 3 ++-
>  drivers/iommu/sun50i-iommu.c   | 3 ++-
>  drivers/iommu/tegra-smmu.c     | 3 ++-
>  9 files changed, 17 insertions(+), 10 deletions(-)
>=20
--- snip ---
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 3c62337f43c677..21c218976143ef 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1584,6 +1584,8 @@ static struct iommu_domain *omap_iommu_domain_alloc=
_paging(struct device *dev)
> =20
>  	spin_lock_init(&omap_domain->lock);
> =20
> +	omap_domain->domain.pgsize_bitmap =3D OMAP_IOMMU_PGSIZES;
> +
>  	omap_domain->domain.geometry.aperture_start =3D 0;
>  	omap_domain->domain.geometry.aperture_end   =3D (1ULL << 32) - 1;
>  	omap_domain->domain.geometry.force_aperture =3D true;
> @@ -1735,7 +1737,6 @@ static const struct iommu_ops omap_iommu_ops =3D {
>  	.release_device	=3D omap_iommu_release_device,
>  	.device_group	=3D generic_single_device_group,
>  	.of_xlate	=3D omap_iommu_of_xlate,
> -	.pgsize_bitmap	=3D OMAP_IOMMU_PGSIZES,
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) {
>  		.attach_dev	=3D omap_iommu_attach_dev,
>  		.map_pages	=3D omap_iommu_map,
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 22f74ba33a0e38..f4a5ad096343ab 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1081,6 +1081,8 @@ static struct iommu_domain *rk_iommu_domain_alloc_p=
aging(struct device *dev)
>  	spin_lock_init(&rk_domain->dt_lock);
>  	INIT_LIST_HEAD(&rk_domain->iommus);
> =20
> +	rk_domain->domain.pgsize_bitmap =3D RK_IOMMU_PGSIZE_BITMAP;
> +
>  	rk_domain->domain.geometry.aperture_start =3D 0;
>  	rk_domain->domain.geometry.aperture_end   =3D DMA_BIT_MASK(32);
>  	rk_domain->domain.geometry.force_aperture =3D true;
> @@ -1171,7 +1173,6 @@ static const struct iommu_ops rk_iommu_ops =3D {
>  	.probe_device =3D rk_iommu_probe_device,
>  	.release_device =3D rk_iommu_release_device,
>  	.device_group =3D generic_single_device_group,
> -	.pgsize_bitmap =3D RK_IOMMU_PGSIZE_BITMAP,
>  	.of_xlate =3D rk_iommu_of_xlate,
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) {
>  		.attach_dev	=3D rk_iommu_attach_device,
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index 433b59f435302b..9c80d61deb2c0b 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -557,6 +557,7 @@ static struct iommu_domain *s390_domain_alloc_paging(=
struct device *dev)
>  	}
>  	zdev->end_dma =3D zdev->start_dma + aperture_size - 1;
> =20
> +	s390_domain->domain.pgsize_bitmap =3D SZ_4K;
>  	s390_domain->domain.geometry.force_aperture =3D true;
>  	s390_domain->domain.geometry.aperture_start =3D 0;
>  	s390_domain->domain.geometry.aperture_end =3D max_tbl_size(s390_domain)=
;
> @@ -1158,7 +1159,6 @@ static struct iommu_domain blocking_domain =3D {
>  	.domain_alloc_paging =3D s390_domain_alloc_paging, \
>  	.probe_device =3D s390_iommu_probe_device, \
>  	.device_group =3D generic_device_group, \
> -	.pgsize_bitmap =3D SZ_4K, \
>  	.get_resv_regions =3D s390_iommu_get_resv_regions, \
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) { \
>  		.attach_dev	=3D s390_iommu_attach_device, \

I'm guessing there's no particular thought behind not adding an empty
line for s390-iommu.c like for the others? I slightly prefer not having
an empty line here but would be fine with it too, so just curious.

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c

> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
--- snip ---

