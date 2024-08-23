Return-Path: <linux-arm-msm+bounces-29373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 474EB95D240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 18:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AC341C2272A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 16:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8331898F8;
	Fri, 23 Aug 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riwlz6LI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C1188903;
	Fri, 23 Aug 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428765; cv=none; b=d7TMzzAFUcYYjnyYlfVyP3YyCGjXiEbM+6nPEIvnqoEG1IkMLhncYBLne5z4Isr41EcpSFSaOgbjEj9OeDNP0r7fL2kkIRq6WqWDiqsqORv93DpBvEGBSbVdBh1YKMxwa9WzmZe3YjdWIM4b15ixFVR07vDycl18PLsJHXKwtc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428765; c=relaxed/simple;
	bh=0HRvVg+YyEHc+kywsKJk0vWlQ3aA90NvCzXe/aKIlyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f29WEHxw2tggVDJ0Vp7tP5FYG1gI/6NjmmpOC1HJRPWXDpQKVqgV1yZyK6rA22CmZYlEgQ0z4qHMSqz7kwurfcamWPB44QHPY4TS7TP6nQWDvDxarhIiSc31Ot4d4vxVRcPl98T/LS10LHB2SbOjLnPWSw24YCSRjEL+4wEzp4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riwlz6LI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B394C32786;
	Fri, 23 Aug 2024 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724428764;
	bh=0HRvVg+YyEHc+kywsKJk0vWlQ3aA90NvCzXe/aKIlyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riwlz6LIf2Pymnypnc/MJDlMct1gq2mDyLkLXe7rb56gRpjjhC3FzxSLYDLbdI7V8
	 0btplPPz2BUPNPlHALtJQMwSy7kN+xixkekp5zOHusd5kcsMECSDsYqhJvFT5o36pX
	 KHb1resMxE5ApDWpoO/oB9gIWOVh5HKblq7JrpphHaztzH58KqGqVSIV3EztswH6tr
	 MiP15E4rKZlcFwVq8cYwH5oKBXApwsauSkidFQ/ENPO0+a8jDA6Dq8Q/lOX9gk6ihD
	 7gVCNVrirWS7QttwJl9Qrm9tA9hW10GXYK+e/ok8hiRFjVnz0+RAjgb6nNvYaP7xQO
	 D/oH6+gzIdSZA==
Date: Fri, 23 Aug 2024 16:59:18 +0100
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
Message-ID: <20240823155918.GD525@willie-the-truck>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
> Add ACTLR data table for SC7280 along with support for
> same including SC7280 specific implementation operations.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 +++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index dc143b250704..a776c7906c76 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -31,6 +31,55 @@
>  #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>  #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
> 
> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
> +	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> +	{ 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
> +	{ 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> +};
> +
> +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
> +	{ 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
> +};

It's Will "stuck record" Deacon here again to say that I don't think
this data belongs in the driver.

Have a great weekend!

Will

