Return-Path: <linux-arm-msm+bounces-59831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19850AC8352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 22:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7C6E7AEF5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 20:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835023185B;
	Thu, 29 May 2025 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XIvqNns9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2C29291F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748551584; cv=none; b=ThYvuqJbGRyWV+VNUrct8flQP+bDY7T85d/g3ez0hGMqf47WlL3YXDAVvsKNLmiKqQErxGgw3R6yO13s9V8sDwYCsLCldeG5LUbwNTRFdcTz5beIzMXDmN9fQm75ACTMlcruQlrC2twUfkLxz2FQDTtFgZTw9nuxlcQixK6WVsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748551584; c=relaxed/simple;
	bh=/6z1v/qNBfUFOoxicD1V48QdZQfp4IVH4S3L1yiqKHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GG/v2WNJjHQJxtGTpNnqkmK58a4+V4yJbrmeT3r6tweIDOuvcBlfvjNeEpeXAarg+K0eTI+Qoy4khcaCp8c3wj/3fomzADpLubVg5qubQyDi/28ScPTOopBk1LnNZTmUwLsQhxd5zjaROm/UdM26LcvgnoiwSZA84Ujf6WdRHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XIvqNns9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b170c99aa49so871611a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=XIvqNns9ls/HGWvWQNu791RDA+NMA/YEPxyggEhVbL2i+z4BXfGCTpY52IwPgra9FR
         d1nN6q5UEyqlfXLtzpmbgCycsZqlJS77ZGVQwjxfqRRxYz8/iduVhtR4rR+75I0Boa2M
         GbIfASXNfsS8lh1k49srFIfuXeZy439ELQVnqPpABa8uTRERxvt5T3mkBvWyChbub969
         KecqPD0gn/3PPWUqnQ8g3HIUuWYlICf833vlxY4RUNnTo4nMLlizX5sSP0GG9y++98P3
         ocnHf7RM5v0M4SuEeJtuf6crf48EKIjY8EUO8ks+d0MjXoKoH79KiLc5SPN3uwPD70In
         LVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=JxrachY+s1ZNi048ikFLYTgpi4qdMFFI5zt8NwSgc6tvutuPM0DoSwaharw/5w6QhF
         jkGsSX0YT/QB3OxSORZUxAtLHZNieM8OFHlTYrrbqC2Vh43TeGm4evsYLcOneU+76TcC
         wIcwx7m3rw1I+ZxBfDzZQUwMAa7KHWOWXP86wxDCzQ9K0T8mzGbveBNNIWhwIGtX9To9
         k6lwyHSJGK/jKArqZkYUjH9kRvvkCB5n70kLPQlNjYbjc1iOf9kmAcPweX0102tzWLZc
         loeVZ85Lu2YkwluCMYTnBHEHew3vbdHen2Ht0dMmXK8K2vQgAkcmkw+BLEuPtxI5j+EH
         KIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmtrM6tcVEHmscAwjM4YFGdKfnStHyaUUPiP/QgCPPSKXjkpF/l/mXyVl1XXnMtDf2n7dsHlf6Z8hs05eI@vger.kernel.org
X-Gm-Message-State: AOJu0YwmL1vJy9Wo8pyR3JaLKUxhGT/VZip8HJIFdyazLsuql2AWqmdg
	tQVLmGAgOLXvY1+3flvxOP1xHWFjNu6hwSjkmHLeT2El7ckF7ySRLll6JNytfV515q0=
X-Gm-Gg: ASbGncuQa/at+HxWnkDw9CeG+1KloPjIlWtB0Uejq+J+Afw1tqK+UN1QpuaSdCb7VTP
	lfQgEhA2G0/denTYK8qMqNk6QeV+56P5xj73b9Jo09Frzlbj81D9PTScLT0zdYbsexyUJ3xZrGc
	j30yo/It4+6ILl7+EguV2si6ysVRFqYeFOMJueYTN7zbD/FuopXGt+p9DSyOllUYVBFi00KkbhG
	K7nxHiRC0WgCsuzyYWgKit0WV0iqzHCZQe2Vv94KCFu+XmsE6h/HMxtOwCDO1JNm5UbVrR/WUsu
	4hklrlwUbhh59eeqniSfiqp+HcEYCTQ0+XICkK1h95V8b329ZzMEtkttvnMcBNJsteMwoQ==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
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
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
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
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz

