Return-Path: <linux-arm-msm+bounces-85048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C9CB5E00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C74523046382
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D327C3148BC;
	Thu, 11 Dec 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PyBQKQwU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ju+ofwEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18845313E3B;
	Thu, 11 Dec 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455904; cv=none; b=g0Jd/zc9mS5vvWUGrGB4/uOvFJWcqYESLOLCDbypv16AH8UAXc2vOc2Pi/ge2ejNaIC131s7O0KtOLCZAiuyVva4bcp9Dc023dmEizSB7cwl7pgEjosWYWkML5llz8coitBIVhZ0TIuWqTmzYQng+MPVg+yH94WJOjMjcSogMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455904; c=relaxed/simple;
	bh=I6mK/5KEjDmLPodxPX30VL7/uKkqbUo/vCMZQAIfd5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGtRuAppDPBLYBtgttDNZnhuFvXsxjbbd0wT5/sprJ6Y9wDkreaIO5tccU/kXCgQgMEyaHt0fDe+Am081sxRP3OCS4Z1XxNVVBHhtA4o0fYx1Y/mP9r8WhzsgtRA9Q5ZyYqJqx5yoml8oSgAdFLHiuafxEGQwptCRgKKuJ4ADA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PyBQKQwU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ju+ofwEN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765455894; bh=fuvF+6EZ6fDEkp0uovYh3Xh
	DxgJaGH/XZj+pFEfBuKk=; b=PyBQKQwUtDoDyi4DCc7Dt7pmhEwZiTkBH+5udIvJOIPDLW2bMN
	zBq1bFRqazRF3LbMuYIBiXKmnaepvx/y/7M+A9cG09rlfcibdkMuNHIhmA2X/KzRP9dxpmdFwlc
	ef0ifZBvbB7GA9Dqw1rK01p1fyE6eOT1Do5jrE+eVbCKTo8MqfTlSi6bVmPddWFcuyIKT7BR90n
	nCoO5/CLZ7FCY9sEJlYYVr7RUattwcuOgohYHud+LcKz77f1jhY+SuFMweq9AC598clKaIaRV6R
	eelwuB1VIsElF8ux6OIGq/I+iXwJS0E5FGWluS8JuDIikQCfBfYmQX593rFKmd0gJpw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765455894; bh=fuvF+6EZ6fDEkp0uovYh3Xh
	DxgJaGH/XZj+pFEfBuKk=; b=Ju+ofwENizzNX6CssRSDDs/qNfQMrtCwmUDUDeZ6DUlxPo3yJV
	i3MJym9vOGLuFHzNYQERZYU/34eIGMf/H2DQ==;
Message-ID: <9009eb8b-309d-4ddc-bb3f-081b974b1fa0@mainlining.org>
Date: Thu, 11 Dec 2025 15:24:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


23.10.2025 22:51, Nickolay Goppen пишет:
> In order to enable CDSP support for SDM660 SoC:
>   * add shared memory p2p nodes for CDSP
>   * add CDSP-specific smmu node
>   * add CDSP peripheral image loader node
>
> Memory region for CDSP in SDM660 occupies the same spot as
> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> cdsp_region, which is also larger in size.
>
> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> related nodes and add buffer_mem back.
>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
>   arch/arm64/boot/dts/qcom/sdm636.dtsi |  23 +++--
>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 162 +++++++++++++++++++++++++++++++++++
>   3 files changed, 177 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8b1a45a4e56e..a6a1933229b9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
>   		};
>   	};
>   
> -	soc@0 {
> +	soc: soc@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0xffffffff>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> index ae15d81fa3f9..38e6e3bfc3ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> @@ -7,15 +7,20 @@
>   
>   #include "sdm660.dtsi"
>   
> -/*
> - * According to the downstream DTS,
> - * 636 is basically a 660 except for
> - * different CPU frequencies, Adreno
> - * 509 instead of 512 and lack of
> - * turing IP. These differences will
> - * be addressed when the aforementioned
> - * peripherals will be enabled upstream.
> - */
> +/delete-node/ &remoteproc_cdsp;
> +/delete-node/ &cdsp_smmu;
> +/delete-node/ &cdsp_region;
> +
> +/ {
> +	/delete-node/ smp2p-cdsp;
> +
> +	reserved-memory {
> +		buffer_mem: tzbuffer@94a00000 {
> +			reg = <0x0 0x94a00000 0x00 0x100000>;
> +			no-map;
> +		};
> +	};
> +};
>   
>   &adreno_gpu {
>   	compatible = "qcom,adreno-509.0", "qcom,adreno";
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index ef4a563c0feb..d50cce25ccbe 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -9,6 +9,37 @@
>   
>   #include "sdm630.dtsi"
>   
> +/delete-node/ &buffer_mem;
> +
> +/ {
> +	smp2p-cdsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apcs_glb 30>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		cdsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		cdsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		cdsp_region: cdsp@94a00000 {
> +			reg = <0x0 0x94a00000 0x00 0x600000>;
> +			no-map;
> +		};
> +	};
> +};
> +
>   &adreno_gpu {
>   	compatible = "qcom,adreno-512.0", "qcom,adreno";
>   	operating-points-v2 = <&gpu_sdm660_opp_table>;
> @@ -247,6 +278,137 @@ &mmcc {
>   			<0>;
>   };
>   
> +&soc {
> +	cdsp_smmu: iommu@5180000 {
> +		compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
> +		reg = <0x5180000 0x40000>;
> +		#iommu-cells = <1>;
> +
> +		#global-interrupts = <2>;
> +		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks = <&gcc GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK>;
> +		clock-names = "bus";
> +
> +		power-domains = <&gcc HLOS1_VOTE_TURING_ADSP_GDSC>;
> +
> +	};
> +
> +	remoteproc_cdsp: remoteproc@1a300000 {
> +		compatible = "qcom,sdm660-cdsp-pas";
> +		reg = <0x1a300000 0x00100>;
> +		interrupts-extended = <&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog",
> +				  "fatal",
> +				  "ready",
> +				  "handover",
> +				  "stop-ack";
> +
> +		clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +		clock-names = "xo";
> +
> +		memory-region = <&cdsp_region>;
> +		power-domains = <&rpmpd SDM660_VDDCX>;
> +		power-domain-names = "cx";
> +
> +		qcom,smem-states = <&cdsp_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +
> +		glink-edge {
> +			interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
> +
> +			label = "turing";
> +			mboxes = <&apcs_glb 29>;
> +			qcom,remote-pid = <5>;
> +
> +			fastrpc {
> +				compatible = "qcom,fastrpc";
> +				qcom,glink-channels = "fastrpcglink-apps-dsp";
> +				label = "cdsp";
> +				qcom,non-secure-domain;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				compute-cb@5 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <5>;
> +					iommus = <&cdsp_smmu 3>;
> +				};
> +
> +				compute-cb@6 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <6>;
> +					iommus = <&cdsp_smmu 4>;
> +				};
> +
> +				compute-cb@7 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <7>;
> +					iommus = <&cdsp_smmu 5>;
> +				};
> +
> +				compute-cb@8 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <8>;
> +					iommus = <&cdsp_smmu 6>;
> +				};
> +
> +				compute-cb@9 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <9>;
> +					iommus = <&cdsp_smmu 7>;
> +				};
> +
> +				compute-cb@10 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <10>;
> +					iommus = <&cdsp_smmu 8>;
> +				};
> +
> +				compute-cb@11 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <11>;
> +					iommus = <&cdsp_smmu 9>;
> +				};
> +
> +				compute-cb@12 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <12>;
> +					iommus = <&cdsp_smmu 10>;
> +				};
> +
> +				compute-cb@13 {
> +					compatible = "qcom,fastrpc-compute-cb";
> +					reg = <13>;
> +					iommus = <&cdsp_smmu 11>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &tlmm {
>   	compatible = "qcom,sdm660-pinctrl";
>   };
>
I've found out that all (both ADSP's and CDSP's) fastrpc-compute-cb's in 
downstream are defined under the one node [1], and all of them are 
handled by one adsprpc driver. There's a node [2], where a memory-region 
is assigned to this driver.

Does this mean that both DSP's are using this one region for FastRPC?

[1] 
https://github.com/pix106/android_kernel_xiaomi_southwest-4.19/blob/main/arch/arm64/boot/dts/vendor/qcom/sdm660.dtsi#L1349

[2] 
https://github.com/pix106/android_kernel_xiaomi_southwest-4.19/blob/main/arch/arm64/boot/dts/vendor/qcom/sdm660.dtsi#L1342


-- 
Best regards,
Nickolay


