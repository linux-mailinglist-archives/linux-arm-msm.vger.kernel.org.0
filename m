Return-Path: <linux-arm-msm+bounces-75165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D86BA0D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E07E6C11B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7CA30CD9B;
	Thu, 25 Sep 2025 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbz1+dic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6F217704;
	Thu, 25 Sep 2025 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758821178; cv=none; b=DVpYXtHUwtIXZKBYOEU1LK+uHEP5gUhlnErqI7GeJIy81/jPa1brlVuWtwYakeclzdwlUiwDTPDLZ6GPlf5Nf4GIvswFrip77m9vygNGI1jpSt4doP485iwyKsW//THEuanKLsMZLPPWtao643X3fGg4Tcyel1LHYZg/pSGAbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758821178; c=relaxed/simple;
	bh=uEHoubd+jXiKp4UeQuZAR42eJq6TWQ5AdZiqcqwCMao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek6r9SFj5+krNbq8DvtS5YoeZgI5RXVPB8gvWPBsvvbVMjB7P2MOHitOvotEgDmqSFox9qFykloqyYBMObHDeQ5soJXZB/LvmttXST1w0ApxySANKc9B9mlIWJCLo6oYki5LKEJTq0T0ovado0bVm22AFRuBMI8THIvmAxIMeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbz1+dic; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCF3C4CEF0;
	Thu, 25 Sep 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758821178;
	bh=uEHoubd+jXiKp4UeQuZAR42eJq6TWQ5AdZiqcqwCMao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbz1+dic/byPh0for5v0oHpIsqVgXebtvThwY1WcBlST8GZ9MQ1seeo/f7dcNFETB
	 7FJ8NhUnUrcB0Oioqu6/5zcMV/vDiPMlHVvSho5REijrBXM2ye9HftTNZXUa7sj4nh
	 0OnhoXLGIaD5xN3+Dqx0jQ707RAkU+eU92ZUajuIIpqCAqHFpsyFwDpbXrYSQ38Blc
	 wSapVnNqV5Qmk9z9iLy9Btf4SygI8aeQjrNxIWy4Yap3hhIDcGFVbVbPPJ6N3BZ/w7
	 nogunUMUOROTuuS86lgDhjKpqosp2WyaV2iZonOUVLGiwxdluYDY6wZfY5XYC1j8N3
	 703QnYTMGrSzg==
Date: Thu, 25 Sep 2025 12:26:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Taniya Das <taniya.das@qualcomm.com>
Subject: Re: [PATCH 07/24] arm64: dts: qcom: glymur: Enable cpu dvfs for CPU
 scaling
Message-ID: <qyawy6hltqwa2a4vcx6mzlaitrzvd5vgndeizqtgl4iegaxahb@vungjrwh3am2>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-7-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-7-24b601bbecc0@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 12:02:15PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add sram and scmi nodes required to have a functional cpu dvfs
> on Glymur SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@qualcomm.com>

Checkpatch doesn't approve

Regards,
Bjorn

> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 +++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index ae013c64e096b7c90c0aa4cfc50f078a85518acb..d924b4778fd37af8fe7b0bceca466dee73269481 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -46,8 +46,8 @@ cpu0: cpu0@0 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD0>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD0>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  
> @@ -63,8 +63,8 @@ cpu1: cpu1@100 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD1>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD1>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  		};
> @@ -74,8 +74,8 @@ cpu2: cpu2@200 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD2>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD2>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  		};
> @@ -85,8 +85,8 @@ cpu3: cpu3@300 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD3>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD3>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  		};
> @@ -96,8 +96,8 @@ cpu4: cpu4@400 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD4>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD4>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  		};
> @@ -107,8 +107,8 @@ cpu5: cpu5@500 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD5>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD5>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER0_C4>;
>  			next-level-cache = <&l2_0>;
>  		};
> @@ -118,8 +118,8 @@ cpu6: cpu6@10000 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10000>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD6>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD6>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  
> @@ -135,8 +135,8 @@ cpu7: cpu7@10100 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10100>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD7>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD7>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  		};
> @@ -146,8 +146,8 @@ cpu8: cpu8@10200 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10200>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD8>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD8>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  		};
> @@ -157,8 +157,8 @@ cpu9: cpu9@10300 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10300>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD9>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD9>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  		};
> @@ -168,8 +168,8 @@ cpu10: cpu10@10400 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10400>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD10>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD10>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  		};
> @@ -179,8 +179,8 @@ cpu11: cpu11@10500 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x10500>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD11>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD11>, <&scmi_perf 1>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER1_C4>;
>  			next-level-cache = <&l2_1>;
>  		};
> @@ -190,8 +190,8 @@ cpu12: cpu12@20000 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20000>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD12>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD12>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  
> @@ -207,8 +207,8 @@ cpu13: cpu13@20100 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20100>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD13>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD13>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  		};
> @@ -218,8 +218,8 @@ cpu14: cpu14@20200 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20200>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD14>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD14>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  		};
> @@ -229,8 +229,8 @@ cpu15: cpu15@20300 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20300>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD15>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD15>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  		};
> @@ -240,8 +240,8 @@ cpu16: cpu16@20400 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20400>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD16>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD16>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  		};
> @@ -251,8 +251,8 @@ cpu17: cpu17@20500 {
>  			compatible = "qcom,oryon";
>  			reg = <0x0 0x20500>;
>  			enable-method = "psci";
> -			power-domains = <&CPU_PD17>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD17>, <&scmi_perf 2>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER2_C4>;
>  			next-level-cache = <&l2_2>;
>  		};
> @@ -397,6 +397,21 @@ scm: scm {
>  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};
> +
> +		scmi {
> +			compatible = "arm,scmi";
> +			mboxes = <&pdp0_mbox 0>, <&pdp0_mbox 1>;
> +			mbox-names = "tx", "rx";
> +			shmem = <&cpu_scp_lpri1>, <&cpu_scp_lpri0>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_perf: protocol@13 {
> +				reg = <0x13>;
> +				#power-domain-cells = <1>;
> +			};
> +		};
>  	};
>  
>  	reserved-memory {
> 
> -- 
> 2.34.1
> 

