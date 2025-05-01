Return-Path: <linux-arm-msm+bounces-56394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114AAA6374
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 21:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB1A4A18D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1BA224AE8;
	Thu,  1 May 2025 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="gMWu11vI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kRRWrsXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65754224B04;
	Thu,  1 May 2025 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126494; cv=none; b=VoZ5KGRyuNwLE6a1HdHbUl0bDYxqJLC1fyHRRFzkUCQh15jl17C6h7zMtmtSjML45gpF/LUSUV+pniCJ4F6922djtaX+TgdClN5/4++Np6Vu+09qIFna9H1/jjHvK7/LRYVmsgC2EE1ZJ1LUmRSjunQwQ9r2Ac7XcL5Al2gKP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126494; c=relaxed/simple;
	bh=t72V4cMXfgECq2XlBkakvc0ngW0PUat2k9kI4OAGgGQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h647JfEl1mBzQaHIkIyktzt1dH0Ir2wlz0rdsuB+RBPQmKP8hmYuEpwdvHdTVuaD7xn4mS3AGAL8Kh8d8fOs97MQs5HUeTjeNVPqWa3NHGWM9ZzGWBfPdLo2FIDUtPXGXiSVj5EVVkITFsZb9lJ5F44pmY8njVtCp8Q243+X88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=gMWu11vI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kRRWrsXt; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 2F84F2007A6;
	Thu,  1 May 2025 15:08:09 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Thu, 01 May 2025 15:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1746126489; x=1746133689; bh=uy2Z23D4UX2pb4MGng/RS7Rc0DqXehjP
	gXYL1GZyHEA=; b=gMWu11vIGwyUkebQS6FfJoMbvmG1K5I4PcYPfgos/+3IKTG9
	gplwSngSdL9b0tzDvioUBprhL4wfVkOmTpNtoAAODeB28Xg6R/kwHB7dvxSuftFL
	yhPHuhfnyZhbGy1Hk4LH0DS38ZnX4s0nqvPXJdj6j6YsCbSDjUNCmIVLH/A/20KP
	oo3/VMPCqW0WLap/EGtkYjtqLqADG6I7601JRBgJjC9L0IW/fnmqPmRfywBz38B2
	l4rECgxFIIXyjmPcKpJ3MKrLDuuogSY9AnqaHJ7N27iyCvQLDrLJO+Uzbvq2a1Ob
	z/jW7mFvVIaWGr7pr0l6vyW2GdTQ2Hejj4c04Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746126489; x=
	1746133689; bh=uy2Z23D4UX2pb4MGng/RS7Rc0DqXehjPgXYL1GZyHEA=; b=k
	RRWrsXtBP2dGvKqi4W7O8NcUE4T3criJTN4RNqnwM3jvVZB6DFHHOoJRSzF4WwTC
	zyfSgrVfEAEZo6Ar3KWwXFFgpo9OcSnMRAJNahqn3nlXJrX0g/PcOryetxJVwBdg
	bMvCV+WGJfrIwElsLCpZTQGf+AFh+vAPQIz7pR9L3B7fo46k+1htBqhXoVi3Nr6i
	iPfXM7t0uPbUxV6yQuN2xxuUHDxXOhwyx1GBr0m/YPvpPLJFGrE4r55Y1vhjLJkG
	EYbgK2ov6OqW9yBM/N3vWdDrYa4RmB3gucHV7PaTEJHhJOlijJtkhtTp35Hug9Lp
	KdTUch2CHWx/XAiNccw8Q==
X-ME-Sender: <xms:lMYTaGgjwoD9jvvLQF3kWWQqAITXOwX2J_Tz44npf0_rwZTz5vZWuA>
    <xme:lMYTaHCfTlr4IcDYYP9mfLiZVIcfetmb5w7EMXV6Z0z5aHP8l6w5d06NcLSmpdfDF
    y_HHxOzjxiGRzZWmjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeegledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhorhhose
    eksgihthgvshdrohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdr
    tghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnh
    hosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhr
    ghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhope
    grohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehg
    hhhithhirdhfrhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilh
    drtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:lMYTaOHaWClXa7praEdCDETzg-YVo8ghBfqAEKgcYyCNv-z3uiOvlg>
    <xmx:lMYTaPTDyplPkZ6QrXRyRgI6CFJO6g9IDexaTEMgKEAyXB5CcIWOgQ>
    <xmx:lMYTaDxrliDpH1IiImjsat2Qz56tDsozwSqIgW3l_ha48UqBCKavYA>
    <xmx:lMYTaN4smmith_jw1KGBc7w4dLVQ7r3zWaP24jB2SlIhLdcRPVRmOw>
    <xmx:mcYTaH2ZstH58KGLmGnY3MmWQlgQtyVkrQuLwkep4LE-hnCp6R9N54B6>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6CE25BA0070; Thu,  1 May 2025 15:08:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5b013bf7ff4edb46
Date: Thu, 01 May 2025 21:07:44 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Stuebner" <heiko@sntech.de>, iommu@lists.linux.dev,
 "Janne Grunau" <j@jannau.net>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Joerg Roedel" <joro@8bytes.org>, "Kevin Tian" <kevin.tian@intel.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Matthew Rosato" <mjrosato@linux.ibm.com>, "Neal Gompa" <neal@gompa.dev>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Rob Clark" <robdclark@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Tomasz Jeznach" <tjeznach@rivosinc.com>,
 "Krishna Reddy" <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
 "Chen-Yu Tsai" <wens@csie.org>, "Will Deacon" <will@kernel.org>,
 "Yong Wu" <yong.wu@mediatek.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
Message-Id: <38706b77-4e58-4dfb-add3-814746f4a3c5@app.fastmail.com>
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that don't use it
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 29, 2025, at 16:34, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 757d24f67ad45a..190f28d7661515 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -991,7 +991,6 @@ static const struct iommu_ops apple_dart_iommu_ops = {
>  	.of_xlate = apple_dart_of_xlate,
>  	.def_domain_type = apple_dart_def_domain_type,
>  	.get_resv_regions = apple_dart_get_resv_regions,
> -	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
>  	.owner = THIS_MODULE,
>  	.default_domain_ops = &(const struct iommu_domain_ops) {
>  		.attach_dev	= apple_dart_attach_dev_paging,

Reviewed-by: Sven Peter <sven@svenpeter.dev> # for Apple DART



Best,


Sven

