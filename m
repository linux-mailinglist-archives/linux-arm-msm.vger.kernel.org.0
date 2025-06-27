Return-Path: <linux-arm-msm+bounces-62736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE7CAEB159
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 10:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C422B6409A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA021F4608;
	Fri, 27 Jun 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ruBmO6pE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B734EB38;
	Fri, 27 Jun 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012913; cv=none; b=jvJcpJEUMSu4Bta0txEUuYKCETGtrA1b6D/AvZNYEbakFMOhRewlrzn78MEdaO/zNy+6vGp7kjlMo3BJYi1PDgWZXO/6n5yyg848J05DVtswCD22OvtI9kCB+0DdGtclSF2GmirOg0kTyo7LRo29qYhvFDQ18JqP7rriX7FtmtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012913; c=relaxed/simple;
	bh=spP82C2j5HjhFI0G1+bra4EcZ2gIWe3Xap3JvO6Y+tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugvhp0FkpKRopHS8nBH1OvaoeHUn2om7q/7taQTFpNBSkRZr3qTQdcCI1HuBNI/n4c7uDpqixOoPdwl/bq7B0ZVnoWZhgJ7WnpxOBApgxmYvb1/xyMSqoSFbGTO/+2CSOly0Os6h0bcE+zSXg6jUjGxryfKddMaSbOpwB7ZOyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ruBmO6pE; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AFEEC4CD24;
	Fri, 27 Jun 2025 10:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751012910;
	bh=spP82C2j5HjhFI0G1+bra4EcZ2gIWe3Xap3JvO6Y+tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruBmO6pEKxHw+iozycJ13LII2JRcnlvNJbdkcSPtOvF+7GcYHHzQ8rIwQsDyGYdm4
	 WJoGBf2xPamc7hgsjAF1E+f1v20tTwnCyok8JG8vLlQJJLSj4ROIDyejWb6Q5Gu157
	 blQjCKlEmYkU5eFyu3Zr/8IYwouNWYpdl74bpyomnipeY0J6lDTGjOrT9p1pBhlPec
	 eKZkDo2TECJdKfSKqfRMI8vxpVjNmEzyMlfWU2TLjQ/XuPehgEnYJHJNJtMEbqyKdH
	 tQmL3gD1g1KD8+Sfs25b06SXqogj0/2g+e263Fp0JteVfDPr+VYn/CLyNUsnc+j+we
	 MqcTPrBaNcFRg==
Date: Fri, 27 Jun 2025 10:28:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 7/7] iommu: Remove ops->pgsize_bitmap
Message-ID: <r55jzziwjtb37qufil4zgj22zqbmu7gpjs7gciib66ix564baz@juuhk6bqoj2j>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>

Hi Jason,

On Mon, Jun 09, 2025 at 05:41:31PM -0300, Jason Gunthorpe wrote:
> No driver uses it now, remove the core code.

That is actually not true, the MSM driver still uses it, and this patch breaks
my arm32 compile tests. Please send a fix for this driver so that I can put it
on-top.

Regards,

	Joerg

