Return-Path: <linux-arm-msm+bounces-43534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82EC9FD8E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 04:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836933A1D3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 03:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7D62D05E;
	Sat, 28 Dec 2024 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSDBlsco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87233EA;
	Sat, 28 Dec 2024 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735356903; cv=none; b=TdyMmuVklzJKNERevEH8Yp/Dlq7ygMIwtmtJcFBCE6E5XQpPG2ED+ZD9+5wwaGvDhNBvuYSrvqyTV/IF/Yu1O9p0f3L1qeH0J5draIbr0ZYUf1yQLnsWs5uMWjMWMlIsUm/SsWyz9qxvVqJrrDeuK/HWjyGloiys00cdT1STKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735356903; c=relaxed/simple;
	bh=LhJv/4Gi+O4oDT6OnolW3Smqy40jsKAZ1+0gE3Km+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2emo48vjZD9CqA4lOP5AYq4t78RW18+t0Z+ujbVqO0Yn9TmV4aNfwJ+440h2/B5CcTUJNf6P1AuU1N3nvwFQvypoCZrBbrgARpOy/Y5qnzbLVvMz91su6jZg81a6spsR1/9SmEfKqT/9+lUaPEuLwQNODyJEaa80lC6PzYP290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSDBlsco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37977C4CECD;
	Sat, 28 Dec 2024 03:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735356902;
	bh=LhJv/4Gi+O4oDT6OnolW3Smqy40jsKAZ1+0gE3Km+Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSDBlsco+xCsGceBs6KaRwnfV/tFZJnpCzWujviYk/6xq7c6zXijANMLVg+Uf8bFt
	 p1pCZvBbUbGMJ4Mgj/WY/6sp92upA4PZYQsVv0+nKnvC9LzCTc8GDJn7XxDa62EeRK
	 nia75hlkXkZk9J0QpnQthy5ROJCT8AjRbNO7GnmHhcDCmg9fT+Hcguf1fUsdpRZ6CS
	 43cd4wfZjNSym6D7cto3nkf3Y3CU/THDe57LaKFBKn7ipNHKio3ukinfxNo7N8oO61
	 rO7gJy44OGY5aWmyaLkBH3kJLTwLf65publaTb9tv+GfEjfqYmYIRq5BB7TQJ4nnOW
	 YIK5dlV21aIhQ==
Date: Fri, 27 Dec 2024 21:35:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <64ak7h5pwqinmcymas5i4xexa6bntvti7zkwfhzx7qrsmgaow3@zmn7jffcrp5f>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227110024.30203-1-quic_pbrahma@quicinc.com>

On Fri, Dec 27, 2024 at 04:30:24PM +0530, Pratyush Brahma wrote:
> Add the device node for gfx smmu that is required for gpu
> specific address translations.
> 
> This patch depends on the patch series [1] posted by Imran Shaik
> adding the clock support for gpu.
> 
> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/

It's over a month since Konrad rejected that patch so you're just
wasting out time sending this to the list.

Further, this dependency has no value in the git history, and as such it
should not be mentioned in the commit message, but rather under the
'---' line.

Lastly, you sent this same patch both as part of a series and then
alone, within 2 minutes. go/upstream has instructions on how to use b4
instead of making these manual mistakes.


PS. Just to be clear, either make sure this patch is sent together with
the next version of [1], or wait for that to have become available in
linux-next before resubmitting it.

Regards,
Bjorn

> 
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

