Return-Path: <linux-arm-msm+bounces-44462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD2A0686C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D34188701A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCA6204F65;
	Wed,  8 Jan 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIHCTyPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5EB204C37;
	Wed,  8 Jan 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736375696; cv=none; b=byCUajAHoTSyL/mzdeUlhaJDmU8WvQi1qmkDyD1lYE7zXgGI4pi0wu3zPq3tScixWEB3YSDaDfTjWIikRWKdf/2hI/LjyzTIAyTLMr03cR/Irlr2kYPM/38YgLTUbTvoy7qdiakExMUEASnRxwe8Td3wa1eQOOinVTlIinq7LgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736375696; c=relaxed/simple;
	bh=c1y6CJhU0MlPeCvA4ixwlFby2yJDyQrNFh2NOkdJtUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKf9CRGWfXv844HHfjjH+7VxW/E+gEo03uPmwlzCGi4u9vTQi/uqh+i6m1M0aELdfX0cuM+YECMVz674Ne5s61KPCigFHIOlf/BGVrttG0VSrdzNRI/PjQ4ApVqOqzeFF47gyv9u/XA44GUc2WiHPXtB1HzbyRfqXNZkxdp/E/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIHCTyPl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D027C4CEE1;
	Wed,  8 Jan 2025 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736375696;
	bh=c1y6CJhU0MlPeCvA4ixwlFby2yJDyQrNFh2NOkdJtUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIHCTyPld8Y4L74iZF0RoQek8FV2iZ0i01TbFRDYQ4oC1lyy4jBGlD/WJaVrXJn9/
	 fl6Qc3uQiSTjsLDEkLc3VQktvFqxjc8za0M4sCFAj3MsgkH+I7LGLWnaSeg8FVZF9F
	 43hdwuGpOQS63V1Fw6AnRS4b2nA48yqzdmWUxZ0Xlm8c5OGG90ZzQhRlu13TUEjaNr
	 f7KqwVobj/ysPQetvKWLMGFhV178sIxFlCMAQjSXFffYfkaCKbDV9wQs+SaFUcDF2J
	 sAtXYFvG1PAUG2UIfbdW96eAEBRo0FnmVQIxJ855NnEhbYJOEfgj+hJit8SDNAd7l5
	 HCvFXQOjTb4bg==
Date: Wed, 8 Jan 2025 16:34:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: add the GPU SMMU node
Message-ID: <fgcpk3dxmhsqvjijzcben53f4gpihkc7fwyzafih4fgubbz7j6@qzpqjaudfnxi>
References: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
 <20241122074922.28153-3-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122074922.28153-3-quic_qqzhou@quicinc.com>

On Fri, Nov 22, 2024 at 01:19:22PM +0530, Qingqing Zhou wrote:
> Add the Adreno GPU SMMU node for QCS615 platform.
> 

Please resubmit this in a series together with gpucc, gmu and gpu nodes.

Regards,
Bjorn

> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 56af38d4f75f..4e0f26563db9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -528,6 +528,33 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@50a0000 {
> +			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x50a0000 0x0 0x10000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc CX_GDSC>;
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
> +			clock-names = "mem",
> +				      "hlos",
> +				      "iface";
> +
> +			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		dc_noc: interconnect@9160000 {
>  			reg = <0x0 0x09160000 0x0 0x3200>;
>  			compatible = "qcom,qcs615-dc-noc";
> -- 
> 2.17.1
> 

