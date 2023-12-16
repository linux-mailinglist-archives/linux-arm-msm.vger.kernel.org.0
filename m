Return-Path: <linux-arm-msm+bounces-5062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E18157BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 06:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D9BAB240C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 05:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28575111A6;
	Sat, 16 Dec 2023 05:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofEErLlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D210A12;
	Sat, 16 Dec 2023 05:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDAFC433C8;
	Sat, 16 Dec 2023 05:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702704400;
	bh=k+HLfjiotNDdVkHZHPA8yO2hBIysL09Q2lJMiNnUa44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofEErLlT+b+m/fmlepLCT++JDLi3yPPnJyCUphwt7syqNT/9ZhptTJGovAn0CKNkE
	 09qrbA4RafIeeCltUNVbYhqDRiBSifBC9kb7lzoHfeU7m+LOPgjPexkfjRyLjwgM2F
	 O3s+eX/TuWHlE7XhlcLHWBx0gSYcwm5oRVKTiNeIEsgqvevb+MBnpt77K/RT33xSoS
	 8uBFQMuK0qFYrRh+fuRakGmXws5zyStAtQ6JQDjOUJSVfv7pqbTfB43Ca0dQ/MptTc
	 3TkfMAOqON19cFJe0VC8QDEq2mHns6yqvVdZ8LwTC8nIwW4NEcbVjTeomfwYYTbNKc
	 RQyvjbFlBNb9w==
Date: Fri, 15 Dec 2023 23:26:37 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] ARM: qcom: merge remaining subplatforms into
 sensible Kconfig entry
Message-ID: <hhaf3ocpnejsxpkg6mfodwnkbjttyb2h5p3qsifbyukosvsavj@rwdpgzsovwak>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
 <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>

On Thu, Dec 07, 2023 at 03:55:00PM +0300, Dmitry Baryshkov wrote:
> Three remaining Qualcomm platforms have special handling of the
> TEXT_OFFSET to reserve the memory at the beginnig of the system RAM, see
> the commit 9e775ad19f52 ("ARM: 7012/1: Set proper TEXT_OFFSET for newer
> MSMs"). This is required for older platforms like IPQ40xx, MSM8x60,
> MSM8960 and APQ8064 and is compatible with other 32-bit Qualcomm
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/Makefile          |  4 +---
>  arch/arm/mach-qcom/Kconfig | 13 +++++--------
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 5ba42f69f8ce..45fa8ac001c5 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -158,9 +158,7 @@ textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
>  ifeq ($(CONFIG_ARCH_SA1100),y)
>  textofs-$(CONFIG_SA1111) := 0x00208000
>  endif
> -textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> -textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> -textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> +textofs-$(CONFIG_ARCH_QCOM_SMEM) := 0x00208000
>  textofs-$(CONFIG_ARCH_MESON) := 0x00208000
>  textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
>  
> diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
> index 27d5ca0043be..0c99d0a746d4 100644
> --- a/arch/arm/mach-qcom/Kconfig
> +++ b/arch/arm/mach-qcom/Kconfig
> @@ -15,13 +15,10 @@ menuconfig ARCH_QCOM
>  
>  if ARCH_QCOM
>  
> -config ARCH_IPQ40XX
> -	bool "Enable support for IPQ40XX"
> -
> -config ARCH_MSM8X60
> -	bool "Enable support for MSM8X60"
> -
> -config ARCH_MSM8960
> -	bool "Enable support for MSM8960"
> +config ARCH_QCOM_SMEM

How about expanding this to ARCH_QCOM_RESERVE_SMEM or similar, to make
it more descriptive and less similar to the existing QCOM_SMEM option?

Regards,
Bjorn


> +	bool "Reserve SMEM at the beginning of RAM"
> +	help
> +	  Reserve 2MB at the beginning of the System RAM for shared mem.
> +	  This is required on IPQ40xx, MSM8x60 and MSM8960 platforms.
>  
>  endif
> -- 
> 2.39.2
> 

