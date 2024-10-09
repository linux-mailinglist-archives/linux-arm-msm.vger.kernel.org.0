Return-Path: <linux-arm-msm+bounces-33621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28515996018
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73631F22C5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 06:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3549B1684AC;
	Wed,  9 Oct 2024 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaVoHJOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065151E48A;
	Wed,  9 Oct 2024 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728456548; cv=none; b=JLpZZtkzSfz11PJhOKxha7d7qDmKdaq8M/j8AJrkLFwMK02Sn+/8vjbjS9NiwcyIU0Jiz6PTE9FQY7a3DNa4eo1iuYua9cMDzmCnQ5OYsHWUgg9+5m8eT2GZ8EOsKtZP6t45B7PyqaIiclTZOcwJ6fDmAY2BDHDMtq4n/98zBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728456548; c=relaxed/simple;
	bh=ucAg1m6COK1agpvptaine6ajoz5RBEwgMbZMz2fV+i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYZyWn2eQln8Hs0bYOgJsX1NtI1N3hI4NJz4MFE2N1ckFgST7VJyBY/wvKFaM89Guo8rKw3j1/49OwXvp6IxYkZbymyIXZHqcMNS4ZGDLcVNJoy0qmtqqSSpRCFrhpTaY3pIdymhLSCwCNKba48M9epDAgLqhvb5XgN+3ISOjFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaVoHJOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4286C4CEC5;
	Wed,  9 Oct 2024 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728456547;
	bh=ucAg1m6COK1agpvptaine6ajoz5RBEwgMbZMz2fV+i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FaVoHJOQVSN/60dfw8bMYcTTxTbMCG9XZWONYL6yvobz3zDjd5/14mQ6bPtP4xIGT
	 VgHLfJvDX3r10KnEuH5LP9I8J/wlEZfT97e4DpIFeBwNI7AGexVvmkfpPE4RBnGNvi
	 7ME3ycs5bO4TsASSwXO0hmcxiDxNrxD5NE7k7EAiyJeLJYyC3a2gZ7BzsGKtI9J8lx
	 qjXaW7GZWhf0OnoNlMS3IK805aGGCDlq02HfjiA7iUmgNgT8LXG07CGSUQplNwsGh0
	 0J1XB+ZfSanu0Wt4thzxD8swGySNG1R9HFZT11ekxXSkfsisEk6rbXDqobl6kR55JQ
	 RR7iVcKT/o8rQ==
Date: Wed, 9 Oct 2024 08:49:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
Message-ID: <syf3uyoyh55rxieyjnhsskmythce6vnkuq77asgml736gcysd7@op5b2pd6ijsj>
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
 <20241008-x1e80100-qcp-sdhc-v1-2-dfef4c92ae31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008-x1e80100-qcp-sdhc-v1-2-dfef4c92ae31@linaro.org>

On Tue, Oct 08, 2024 at 05:05:56PM +0300, Abel Vesa wrote:
> Describe the two SHDC v5 controllers found on x1e80100 platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 108 +++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b5b8815eb41ec55e2e1e5bd878201..b835fd87b977ae81f687c4ea15f6f2f89e02e9b1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3880,6 +3880,114 @@ lpass_lpicx_noc: interconnect@7430000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x520 0>;
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> +			bus-width = <4>;
> +			dma-coherent;
> +
> +			/* Forbid SDR104/SDR50 - broken hw! */

Is it still valid or was it just copied from old code?

> +			sdhci-caps-mask = <0x3 0>;

Best regards,
Krzysztof


