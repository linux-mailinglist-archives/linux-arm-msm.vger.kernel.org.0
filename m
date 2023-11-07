Return-Path: <linux-arm-msm+bounces-51-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF17E390B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE63F280F4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300D912E7A;
	Tue,  7 Nov 2023 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irR4zols"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C312E67;
	Tue,  7 Nov 2023 10:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9324BC433C8;
	Tue,  7 Nov 2023 10:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699352724;
	bh=BJYa7WwWYDL69BqG3PQQTMCd6K2zi9dVHj9I654KmmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irR4zolsO5pqpVMR7T/OGz8JIEzjqy7/l6bKFeYZWEeovZ10siQeU5vk7ohwGOEaL
	 S5sBBVp6TiyYQAc1k9jZTuctPrIvgU17UMPcPhg6L5zK5Zlj3AGpE6uXsrQnS41KR5
	 W3i/XMA0gRZZX22niJPbPUAxMGmNGcU7kt4GN+amtJVSt40L/ozAjbOld6pxNWAY2V
	 o/irCpUJHfxHFtxYHAHgzlNnfMmg4K8lZspHwUnONrKDrZ2YIvaf5SxOMRByUHD3GU
	 Ok8YSGewLBEY3H0xwLW6EVvVoLeNutE6h7a8NkX/zKvVhvKJoda1Q0b2O5qzKynDUb
	 IupOiwpsUiPMg==
Date: Tue, 7 Nov 2023 10:25:19 +0000
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: list all Qualcomm IOMMU drivers in the
 QUALCOMM IOMMU entry
Message-ID: <20231107102519.GE18944@willie-the-truck>
References: <20231103225413.1479857-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103225413.1479857-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Nov 04, 2023 at 12:54:13AM +0200, Dmitry Baryshkov wrote:
> For historical reasons the 'QUALCOMM IOMMU' entry lists only one
> Qualcomm IOMMU driver. However there are also the historical MSM IOMMU
> driver, which is used for old 32-bit platforms, and the
> Qualcomm-specific customisations for the generic ARM SMMU driver. List
> all these files under the QUALCOMM IOMMU entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a7dc3e56e1e..ed1c864794aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17888,6 +17888,8 @@ L:	iommu@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +F:	drivers/iommu/arm/arm-smmu/arm-smmu-qcom*
> +F:	drivers/iommu/msm_iommu*

Acked-by: Will Deacon <will@kernel.org>

Will

