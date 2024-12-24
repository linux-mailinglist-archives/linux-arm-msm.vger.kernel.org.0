Return-Path: <linux-arm-msm+bounces-43251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E139FBEA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 14:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5334B18802F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2862940D;
	Tue, 24 Dec 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h3X39GqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800124C9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735046746; cv=none; b=u73fwU8GmlvWjhsVhvj8OHP52myqfOqi4GHwAdp1CAccIXvh4zqRURpZaJanmvP9YtYdNKhY+FL6OPfFlU+IgASd63iQo/rdHiV/yLw+Ki8OcBIY0nyj6O8leVevQZa+hVN4QMULS7/yp1f3lM8FDSMd0AEorJUhS/lESjup74A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735046746; c=relaxed/simple;
	bh=U7A1u+JJfcKyPCoIyoFaip7cCsy9h7TTdvIZdlMjGqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9It3IJzgCSAaHq3zuHvVgpZvgzcKag5RoESJuW60nEyWa6bCMEHyqe83IqkwcG7IWD2Wlt33xTgJj+LDFTJ8Vcx3sYPFD25u+G9jzMJhMQYX+UZN7Tqwg8VrXMvoudMsspQPVwPN4c1l2RvogmFrbNIO4QnKFrwXfkvPgFtCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h3X39GqI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30225b2586cso65826071fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 05:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735046743; x=1735651543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hv30jFOQ39cBCdo28rZ29NibAXM1yv1msAZG8kg/Yg8=;
        b=h3X39GqIhZPdkoqzVMKIB8m7A0m0Jtm9GUd+5XmUxB6kpVdkZhs8wD25lFuw5SfuDJ
         tsriSQsW6j1lpTyR1d+4qKMoNTOf/XbBSeE2s+zcLO7hTDtz3c+Ca/eRF6tEAwyPi3JD
         ZK5OEAMR3Fmy2541xxUfGTfNIAGqdPKLO/M9uCmgeou8LjJ+RQwqsj5pF+xdj9fxj4Ag
         tL1paeIrr5FSm6c4fShle+/spXfQPTDOl9KlSAxcu186SsCaq7e3v2I329LbjjVYhF1w
         ORe5Jqr4ehb143WPqb7Fs+ppkHgXgwpK1nih/5gdgGxdNs2+4aHKozNeC6iJ51vyTEfp
         9dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735046743; x=1735651543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv30jFOQ39cBCdo28rZ29NibAXM1yv1msAZG8kg/Yg8=;
        b=qTBWxbru2er3KNaCwhLepdma8RcvizoBqQMQbQN8SJE8rsBsKStPhv8h/PNTq6Y2TZ
         gG3SyyOmT7Z3/BsFL2yp1FXskqGcyFJVI+VfZs2q9GvpPvK9V1M8XO7/VnxpRAg1RrHC
         C/OgKPVZVrLaBSM1Kj4Fnlv0LQfbkj6lbwLWIZ1PvIue+wDwVKT8TBpb58bROwCc95vg
         Oe6OpmyuU8WC0nwdeDGpsMfJ0FZwF58Pdrt4BDRpnkC/X1RNgmiWJGl4JcvXh53OfdC0
         /4ndmqRT37ACeHAzUKoC7Mtd3aRSQNcXBvv8Nuf2W0jUB7eAGoLHUNGdTQIQTp9SkfK2
         WmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo7lEtQFnH7OZ3QuZ7ASX+kZ809+ICFXn9Hcc5yr0DW07ng6u/u8THgiGVT8oKGhAoRNrlnpNQH5ZVK6P9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+J+QZUXP/wz9TsjENqxIPMCbYtXNaMhY2GBtXL1BSURSNAPu2
	D7W148yQtMaazwtjdZg3O/0rgY561pzz9aB6Jkp9LCOIVFVJWRprhDLKLSzC7CM=
X-Gm-Gg: ASbGnctHLLnj469LG/4TF2LjZhqjQZOXLJndBMKR3rRGFI2l8ASfOirDsksWISdnRIw
	9L5I2epDJRfK+jZsgYbZ6ZF8QfFSP/VsfyVsYI3skSphVgGB89aJdxwUE7ZSiTj8bppLMVQ7laz
	s0kKW+KV9kHGWePsuOLJVrqx1JEjp6V0QKwWcupNG3O9KtQKY9NCmjYqdoIQTpp+L/SmYXLwIVk
	1c5XvhvtNApHte3W7fOTuGccEoIaLbe9Bj0+GlfyCZtt6LFZmvY5cxWcSiYJozdNPqZaWXzouhA
	hRQgwOM6t1gHSzwkX44SxA35edYWlJ59/cFS
X-Google-Smtp-Source: AGHT+IHJZH8ANhU8/YIizeYlLT7pab12drEMXwuvQIS6w5Ypom40nZXywZPK+ZkrHbO1srQH+7HtJw==
X-Received: by 2002:a2e:6109:0:b0:302:3021:9b23 with SMTP id 38308e7fff4ca-30469bffe1amr43750481fa.17.1735046742432;
        Tue, 24 Dec 2024 05:25:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c604sm17259641fa.15.2024.12.24.05.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 05:25:41 -0800 (PST)
Date: Tue, 24 Dec 2024 15:25:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <7sy7ogdlvvahk7pdfusdi4sx5fc2qoqexvgcwskoxywnmtx6tt@2od6sbwzohg3>
References: <20241224100521.7616-1-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224100521.7616-1-quic_pbrahma@quicinc.com>

On Tue, Dec 24, 2024 at 03:35:21PM +0530, Pratyush Brahma wrote:
> Adding device node for gfx smmu that is served for gpu.
> 
> This patch depends on the patch series [1] posted by Imran Shaik
> adding the clock support for gpu.
> 
> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

It doesn't seem that this was tested against the current bindings.

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

-- 
With best wishes
Dmitry

