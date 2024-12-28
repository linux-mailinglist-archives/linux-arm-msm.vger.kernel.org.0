Return-Path: <linux-arm-msm+bounces-43535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E715C9FD8E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 04:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 805B03A24F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 03:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C904A35949;
	Sat, 28 Dec 2024 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfL3MckK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC42D05E;
	Sat, 28 Dec 2024 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357053; cv=none; b=gNwjunbs2O/Pp5u1N0+015DdAwrBTdoelN9Cv1oTjfn28oJpR9+8GYdpwxwC0PJ8zlScFu4Lk6h6HX6iQq7MxbdSliN/f6KVWyFa79NGAhErNcoxBp7ulSZlOQXNIgukNjdCWtNnqnlnOC/TJRpy+nQ+s9q1TXyuaB7rXv+PFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357053; c=relaxed/simple;
	bh=SmYZUEDX/MU1VkhUZsVFSuK4z6Ay9QJSmX3fL+Sg2sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCglB1VVuh6c4Vo7TiQJApTxK7ITmA8PK9SJZsGA1wLn08lfZ6+QdqGWfzFo7bkGtV9SHvKUC4sguV/qUB2ocAQEovKFsufs3+K2oGF5Kwcf3IxJPvsFAfu6R9WOWTQpOvxPTQFkLYzjjtvYnn34SxEzdEOq/UAb6dhAUjGV3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfL3MckK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712CFC4CECD;
	Sat, 28 Dec 2024 03:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735357053;
	bh=SmYZUEDX/MU1VkhUZsVFSuK4z6Ay9QJSmX3fL+Sg2sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfL3MckKQ6C5k4fKx9/Y3E07JzV6NOYZX0ey6x7wFS3gzSau82RvvfKyHo89dOELf
	 uBMsAoBFGn5v6eA56Wk1HylGpIEuJvVeYgRURYhduTZ7ZzWR9DnetZH6KSB/ihKtwr
	 KuNeqcNJa5iqQ30zvohcxoopOEaaqUtMfAWOINIV6GryqWBC4rAzhGcxMYWr2PYhwN
	 W2NJlB6CF9EE+dzkEOkrSrskqrrzssByyP/cTxZWDw6Waekggj6EUkJ3/5pUXJkLWR
	 3NSy2oa2b4A83atzsAmPWK8JvCULIU1TxnbZD4z6VfVyCgg6EY1VjYWjMTVxMVPCUA
	 bKBjX6stGQeuw==
Date: Fri, 27 Dec 2024 21:37:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <u74u7ufvy46fw3hr2qswsaxil3aswetpqlhg7k7j2w3dc6q3kk@atujlcdgbp76>
References: <20241227105818.28516-1-quic_pbrahma@quicinc.com>
 <20241227105818.28516-3-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227105818.28516-3-quic_pbrahma@quicinc.com>

On Fri, Dec 27, 2024 at 04:28:18PM +0530, Pratyush Brahma wrote:
> Add the device node for gfx smmu that is required for gpu
> specific address translations.
> 
> This patch depends on the patch series [1] posted by Imran Shaik
> adding the clock support for gpu.
> 
> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
> 

To save other reviewers' time, this is a duplicate and rejected at:
https://lore.kernel.org/all/64ak7h5pwqinmcymas5i4xexa6bntvti7zkwfhzx7qrsmgaow3@zmn7jffcrp5f/

Regards,
Bjorn

> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 80226992a65d..8eb688e2df0a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -816,6 +816,43 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
> +				   "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +			clock-names = "gcc_gpu_memnoc_gfx_clk",
> +				      "gcc_gpu_snoc_dvm_gfx_clk",
> +				      "gpu_cc_ahb_clk",
> +				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				      "gpu_cc_cx_gmu_clk",
> +				      "gpu_cc_hub_cx_int_clk",
> +				      "gpu_cc_hub_aon_clk";
> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		pmu@9091000 {
>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0x0 0x9091000 0x0 0x1000>;
> -- 
> 2.17.1
> 

