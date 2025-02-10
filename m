Return-Path: <linux-arm-msm+bounces-47412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB2A2EA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 12:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74333A10EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12DD14F70;
	Mon, 10 Feb 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGqm8akA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB91C701D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185292; cv=none; b=O37AaPKqNSTeZbyzVyiLZ0hYKLdQtGV612pMVyPap7xLT7JKNbsBq1Hq0lDpN/EKFpJ9FefR7fn+ETzOSSKS5E2zE8AD0/UN9j6p1Og6AWmIIBZ+zaq/crNH4B7ayn1Kcj9HmqlmsrFie7PxMdbf1/AyEuxqYZABwqt7Ip8WEI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185292; c=relaxed/simple;
	bh=WgW6ZEWyu81z7BrqyHmBRuGMtk2zuQXDhJEjREDVx6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBV8vohqVQfRqpO0OMeylK5GZL4EdbUJmIX5SwJGD8fcBWgmKiMHvsy3JB/IL9N7rQW7VZrxtraVpT6Oev1jdis4hphiAiCDH4/t77HCu7vmfX8vah4cVWWm63COUa/2p9lCMy5BLnnpuGjV4AvDVOLTzwwT9AUPwdeTSJ7WisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YGqm8akA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54504f29000so1824338e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739185289; x=1739790089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=YGqm8akAE8gSZd1S7vpanZvGYy1GVJ+v6hmPJkO+E2m72RZYbt7eZZwHva2orJ5w58
         4EovFDkM1tJwKmTA95tLhs5Ua+hVJUv3jazgqT9mecFlUI7TEhhcIBTd6YzIqQyTdIXf
         t5H9wZFSIMi0l8wN98n3/F4ZNU8TtXMEG2pAjzhL0QK1oxiY+cegCvEdRrHOhSOEAL0H
         yQTGXF6WUPtszeZFs9wqbJzoZSXqXav/im/Y9U83Hcrmn3af0p/j9Zz0nPDBbzVKGnhB
         07zG+9YyVNtm8t5AVYm3+XqsfWjTPhAdyzrsJXgQYREiG4W6MVzmqHgZZrIOO53zcCqh
         7jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185289; x=1739790089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=Ti1RORgEGYsMvWZcTqVF/zRHjz4N6XRlVDE7KemYvb6vN6GjuPfkDh7HM3OM3XN/j5
         bzhzCzihxx7H251zgYTcB8VR5NF3zcuLc2GWH8tFHZokwekPQLpx77urcmOreqtOBOay
         VTH7aQLgAHr9FY77lfBAF7zKpj7TxW9kdiGifaphR1DHYRF8rI0K/lwRH2IzJk25b74l
         Rslnu0H+lNiD8Jjtzw4lPhCC42J6mXKs4UJwjV8EC78Za77PSc982spskALqxzZVfPKL
         ug4hJ59E/VcnaFrvr4cq7Y2QG5D0oYynf9yaNkDNUi0B9ijmFLjS9JPAnoF5jJlHS3wO
         eeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlPbmNlHa5o7/Nj6kxIGR06UD4tFl8PR7UBdYhqbvU6m1NVTeh/CUhLmfGxpCLWo0pgPHyWPY9QpMjuAL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SLqKv3hXhD175wqcaVBlJjojAZjJWKV992qDDPtS8py1r6pt
	E3CurhegJ2k3qKoMCh4MizJAoe7kkrS6XJ31hkN7ipgytU/AX8wOEYEr1d3A6W8=
X-Gm-Gg: ASbGncsCNDDek8U/yBG4MC0UMtRkzJ5EezOPkrJKVdANzou29IV8aV6aLL2DFYQJHQF
	e8tgWhPjRek5EZ/ORP4LWhsv1PcgZJvCdatfKlxVgwr/sBY1LI9niHClx1mQhWO1Hu5zvrGwK0K
	79vnceCexTb/XLDTBjBcZ30B0p5Li3N45Al8WRtCvWjLLAU4490jw+c4i1YyfdjhEbY9/mvyyAI
	g1+Knxz4qgy+QOq6VCgyAFOoxasxTCSChzl78jDEwkD//R5lEvn8irg0OG5KSeA0Fd9FfXNJLw2
	TMMJNOEmhNW5MLz5kI40ShTZspg3jlkFS77PH9hXa3Je2mowxJFhAXPL27p56NBgZG/Yz8k=
X-Google-Smtp-Source: AGHT+IESGWlTJg2cuv8Kgo6v/dDQZjg10SE7StQf8S4vcvj1tAiGKln4CJ/xT6Y54Ae/tQTmSnk31g==
X-Received: by 2002:a05:6512:4022:b0:545:ae6:d740 with SMTP id 2adb3069b0e04-5450ae6d79amr1090753e87.41.1739185289056;
        Mon, 10 Feb 2025 03:01:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450c0823acsm321386e87.118.2025.02.10.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:01:28 -0800 (PST)
Date: Mon, 10 Feb 2025 13:01:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>

On Mon, Feb 03, 2025 at 11:17:02AM +0530, Pratyush Brahma wrote:
> Add the device node for gfx smmu that is required for gpu
> specific address translations.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..7a8211bec139375b5aab939f123d88fca7aceff2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +
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
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +
> +			 clock-names = "gcc_gpu_memnoc_gfx_clk",

Stray whitespace after the Tab symbol

> +				       "gcc_gpu_snoc_dvm_gfx_clk",
> +				       "gpu_cc_ahb_clk",
> +				       "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				       "gpu_cc_cx_gmu_clk",
> +				       "gpu_cc_hub_cx_int_clk",
> +				       "gpu_cc_hub_aon_clk";

clocks and clock-names do not match.

> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		pmu@9091000 {
>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0x0 0x9091000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

