Return-Path: <linux-arm-msm+bounces-39914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575ED9E0787
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180EA280A78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1C13D96D;
	Mon,  2 Dec 2024 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBQ6mZoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D51D545;
	Mon,  2 Dec 2024 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154626; cv=none; b=qWbzvi1YtETT+seygSijYgqYyd3UwoBhm/Sw+pSKKCmE7iTyTuACVb7s3vkr7u5AvHjkXh309O8ASNahY35q4ws4mxz0uXxzahhu6RpQQpYzQpPFsoRUcuvoDe+P2QJ6W6kRGJRT33CbMyEnhZ3aDK4Xi5JdJ6RJ3pLQ6qp3x8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154626; c=relaxed/simple;
	bh=2C+01ilR2uaMCLXM0YBsaDEPxn95hwxCPO81Y47qsp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAxH/jcrzDwc95ffM2nJ78sqkB4zJ19XrllmXL+yjtrPIfL5VXS9W/XsrWX3UQicHy0JGGxKNnJDXqc5ujy23WXAZghWv+bnf1xpVZHaerrjQK7xp2Gjipt3xzJyqFkHzTsfVVhCV5kvB1MJjqbjzen/SZzvqlAfvmsKFxEEZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBQ6mZoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B902C4CED1;
	Mon,  2 Dec 2024 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154626;
	bh=2C+01ilR2uaMCLXM0YBsaDEPxn95hwxCPO81Y47qsp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBQ6mZoSHTYziHn2Qt9gUMJOesnJYmIQmO5p7SvFcVkHWnLO35G4TvR2A6ayLIEsS
	 wQsXDlMKya0a49BZu5YUNCFVnFGfmUYNegBe+JOz+z6kp7q47VwTmhTYcnzjhXOO+U
	 NW5U0m0P6jXpy8UmSe+6/992pEBgVe9D7+gXMUiw678RTWy8THmgtHKmqBnstWrBni
	 oprYd8Cj0+6CHZKtzzJx3drJfG02HMhgxnBASWUhJy5zb2/CL5Vkt0O7rvDmDtsup1
	 Vo5iwnukgPDo/z6AXV7pJcNj7ogQURKea3N25qJ7ezBwvsgz9zWz0njOjB8BI4YnMx
	 OrpX9aSb9IC7g==
Date: Mon, 2 Dec 2024 09:50:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v4 RESEND] arm64: dts: qcom: qcs615: Add QUPv3
 configuration
Message-ID: <pn75quwy5ikeryeerczk7knathg6gbxydipacezqmj5fzluqnz@lxcmodmaunjo>
References: <20241202085939.2022191-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085939.2022191-1-quic_vdadhani@quicinc.com>

On Mon, Dec 02, 2024 at 02:29:39PM +0530, Viken Dadhaniya wrote:
> Add DT support for QUPv3 Serial Engines.
> 

Why was this resent?

Regards,
Bjorn

> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> 
> Build Dependencies:
> 
> Base:
> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-6-e37617e91c62@quicinc.com/
> 
> Clock: https://lore.kernel.org/linux-devicetree/20240920-qcs615-clock-driver-v2-3-2f6de44eb2aa@quicinc.com/
> ICC: https://lore.kernel.org/linux-devicetree/20240924143958.25-2-quic_rlaggysh@quicinc.com/
> Apps SMMU: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/
> GPI documentation: https://lore.kernel.org/r/linux-devicetree/20241115092854.1877369-1-quic_vdadhani@quicinc.com/
> 
> v3 -> v4:
> 
> - Correct gpi compatible string as qcs615 requires an ee_offset of 0x0.
> 
> v3 Link: https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
> 
> v2 -> v3:
> 
> - Modify GPI DMA node name and compatible string.
> - Drop buses aliases from SOC DTSI.
> - Add GPI compatible for QCS615 in seperate patch.
> 
> v2 Link: https://lore.kernel.org/all/20241028112049.30734-1-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Add opp-shared property.
> - Use QCOM_ICC_TAG_ALWAYS flag in interconnect property.
> 
> v1 Link: https://lore.kernel.org/all/20241011103346.22925-1-quic_vdadhani@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 627 ++++++++++++++++++++++++++-
>  1 file changed, 623 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 865ead601f85..cccfde956973 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -296,6 +297,26 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	qup_opp_table: opp-table-qup {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-75000000 {
> +			opp-hz = /bits/ 64 <75000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-128000000 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
> @@ -392,6 +413,24 @@ qfprom: efuse@780000 {
>  			#size-cells = <1>;
>  		};
>  
> +		gpi_dma0: dma-controller@800000  {
> +			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
> +			reg = <0x0 0x800000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <8>;
> +			dma-channel-mask = <0xf>;
> +			iommus = <&apps_smmu 0xd6 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_0: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x8c0000 0x0 0x6000>;
> @@ -400,6 +439,7 @@ qupv3_id_0: geniqup@8c0000 {
>  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>  			clock-names = "m-ahb",
>  				      "s-ahb";
> +			iommus = <&apps_smmu 0xc3 0x0>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			status = "disabled";
> @@ -412,13 +452,416 @@ uart0: serial@880000 {
>  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
>  				pinctrl-names = "default";
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> -				interconnects = <&aggre1_noc MASTER_QUP_0 0
> -						 &mc_virt SLAVE_EBI1 0>,
> -						<&gem_noc MASTER_APPSS_PROC 0
> -						 &config_noc SLAVE_QUP_0 0>;
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@884000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x884000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c1_data_clk>;
> +				pinctrl-names = "default";
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@888000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x888000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c2_data_clk>;
> +				pinctrl-names = "default";
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			spi2: spi@888000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0x00888000 0x0 0x4000>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
> +				pinctrl-names = "default";
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			uart2: serial@888000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0x0 0x00888000 0x0 0x4000>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
> +					    <&qup_uart2_tx>, <&qup_uart2_rx>;
> +				pinctrl-names = "default";
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@88c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x88c000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c3_data_clk>;
> +				pinctrl-names = "default";
> +				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		gpi_dma1: dma-controller@a00000 {
> +			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
> +			reg = <0x0 0xa00000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <8>;
> +			dma-channel-mask = <0xf>;
> +			iommus = <&apps_smmu 0x376 0x0>;
> +			status = "disabled";
> +		};
> +
> +		qupv3_id_1: geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0xac0000 0x0 0x2000>;
> +			ranges;
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			clock-names = "m-ahb",
> +				      "s-ahb";
> +			iommus = <&apps_smmu 0x363 0x0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			status = "disabled";
> +
> +			i2c4: i2c@a80000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0xa80000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c4_data_clk>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			spi4: spi@a80000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0xa80000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			uart4: serial@a80000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0x0 0xa80000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
> +					    <&qup_uart4_tx>, <&qup_uart4_rx>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				status = "disabled";
> +			};
> +
> +			i2c5: i2c@a84000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0xa84000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c5_data_clk>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			i2c6: i2c@a88000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0xa88000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c6_data_clk>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			spi6: spi@a88000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0xa88000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			uart6: serial@a88000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0x0 0xa88000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
> +					    <&qup_uart6_tx>, <&qup_uart6_rx>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				status = "disabled";
> +			};
> +
> +			i2c7: i2c@a8c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0xa8c000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_i2c7_data_clk>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			spi7: spi@a8c000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0xa8c000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
> +				status = "disabled";
> +			};
> +
> +			uart7: serial@a8c000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0x0 0xa8c000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>,
> +					    <&qup_uart7_tx>, <&qup_uart7_rx>;
> +				pinctrl-names = "default";
> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
>  				interconnect-names = "qup-core",
>  						     "qup-config";
>  				power-domains = <&rpmhpd RPMHPD_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		};
> @@ -478,6 +921,102 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
> +				pins = "gpio4", "gpio5";
> +				function = "qup0";
> +
> +			};
> +
> +			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
> +				pins = "gpio0", "gpio1";
> +				function = "qup0";
> +			};
> +
> +			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
> +				pins = "gpio18", "gpio19";
> +				function = "qup0";
> +			};
> +
> +			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
> +				pins = "gpio20", "gpio21";
> +				function = "qup1";
> +			};
> +
> +			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
> +				pins = "gpio14", "gpio15";
> +				function = "qup1";
> +			};
> +
> +			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
> +				pins = "gpio6", "gpio7";
> +				function = "qup1";
> +			};
> +
> +			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
> +				pins = "gpio10", "gpio11";
> +				function = "qup1";
> +			};
> +
> +			qup_spi2_data_clk: qup-spi2-data-clk-state {
> +				pins = "gpio0", "gpio1", "gpio2";
> +				function = "qup0";
> +			};
> +
> +			qup_spi2_cs: qup-spi2-cs-state {
> +				pins = "gpio3";
> +				function = "qup0";
> +			};
> +
> +			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
> +				pins = "gpio3";
> +				function = "gpio";
> +			};
> +
> +			qup_spi4_data_clk: qup-spi4-data-clk-state {
> +				pins = "gpio20", "gpio21", "gpio22";
> +				function = "qup1";
> +			};
> +
> +			qup_spi4_cs: qup-spi4-cs-state {
> +				pins = "gpio23";
> +				function = "qup1";
> +			};
> +
> +			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
> +				pins = "gpio23";
> +				function = "gpio";
> +			};
> +
> +			qup_spi6_data_clk: qup-spi6-data-clk-state {
> +				pins = "gpio6", "gpio7", "gpio8";
> +				function = "qup1";
> +			};
> +
> +			qup_spi6_cs: qup-spi6-cs-state {
> +				pins = "gpio9";
> +				function = "qup1";
> +			};
> +
> +			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
> +				pins = "gpio9";
> +				function = "gpio";
> +			};
> +
> +			qup_spi7_data_clk: qup-spi7-data-clk-state {
> +				pins = "gpio10", "gpio11", "gpio12";
> +				function = "qup1";
> +			};
> +
> +			qup_spi7_cs: qup-spi7-cs-state {
> +				pins = "gpio13";
> +				function = "qup1";
> +			};
> +
> +			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
> +				pins = "gpio13";
> +				function = "gpio";
> +			};
> +
>  			qup_uart0_tx: qup-uart0-tx-state {
>  				pins = "gpio16";
>  				function = "qup0";
> @@ -487,6 +1026,86 @@ qup_uart0_rx: qup-uart0-rx-state {
>  				pins = "gpio17";
>  				function = "qup0";
>  			};
> +
> +			qup_uart2_cts: qup-uart2-cts-state {
> +				pins = "gpio0";
> +				function = "qup0";
> +			};
> +
> +			qup_uart2_rts: qup-uart2-rts-state {
> +				pins = "gpio1";
> +				function = "qup0";
> +			};
> +
> +			qup_uart2_tx: qup-uart2-tx-state {
> +				pins = "gpio2";
> +				function = "qup0";
> +			};
> +
> +			qup_uart2_rx: qup-uart2-rx-state {
> +				pins = "gpio3";
> +				function = "qup0";
> +			};
> +
> +			qup_uart4_cts: qup-uart4-cts-state {
> +				pins = "gpio20";
> +				function = "qup1";
> +			};
> +
> +			qup_uart4_rts: qup-uart4-rts-state {
> +				pins = "gpio21";
> +				function = "qup1";
> +			};
> +
> +			qup_uart4_tx: qup-uart4-tx-state {
> +				pins = "gpio22";
> +				function = "qup1";
> +			};
> +
> +			qup_uart4_rx: qup-uart4-rx-state {
> +				pins = "gpio23";
> +				function = "qup1";
> +			};
> +
> +			qup_uart6_cts: qup-uart6-cts-state {
> +				pins = "gpio6";
> +				function = "qup1";
> +			};
> +
> +			qup_uart6_rts: qup-uart6-rts-state {
> +				pins = "gpio7";
> +				function = "qup1";
> +			};
> +
> +			qup_uart6_tx: qup-uart6-tx-state {
> +				pins = "gpio8";
> +				function = "qup1";
> +			};
> +
> +			qup_uart6_rx: qup-uart6-rx-state {
> +				pins = "gpio9";
> +				function = "qup1";
> +			};
> +
> +			qup_uart7_cts: qup-uart7-cts-state {
> +				pins = "gpio10";
> +				function = "qup1";
> +			};
> +
> +			qup_uart7_rts: qup-uart7-rts-state {
> +				pins = "gpio11";
> +				function = "qup1";
> +			};
> +
> +			qup_uart7_tx: qup-uart7-tx-state {
> +				pins = "gpio12";
> +				function = "qup1";
> +			};
> +
> +			qup_uart7_rx: qup-uart7-rx-state {
> +				pins = "gpio13";
> +				function = "qup1";
> +			};
>  		};
>  
>  		dc_noc: interconnect@9160000 {
> -- 
> 2.34.1
> 

