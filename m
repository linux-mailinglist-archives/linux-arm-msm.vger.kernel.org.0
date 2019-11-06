Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528DCF1330
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 11:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfKFKDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 05:03:19 -0500
Received: from foss.arm.com ([217.140.110.172]:37006 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbfKFKDT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 05:03:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE9AB328;
        Wed,  6 Nov 2019 02:03:17 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FB8B3F6C4;
        Wed,  6 Nov 2019 02:03:17 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 43BB5681DBE; Wed,  6 Nov 2019 10:03:16 +0000 (GMT)
Date:   Wed, 6 Nov 2019 10:03:16 +0000
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robert Richter <rrichter@cavium.com>,
        Jayachandran C <jnair@caviumnetworks.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/7] arm64: dts: Use IRQ flags for legacy PCI IRQ
 interrupts
Message-ID: <20191106100316.2h5qfpxxoxvns4rz@e110455-lin.cambridge.arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-3-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191104163834.8932-3-andrew.murray@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 04, 2019 at 04:38:16PM +0000, Andrew Murray wrote:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/arm64/boot/dts/al/alpine-v2.dtsi            |  6 +++---
>  arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |  2 +-
>  arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |  2 +-
>  arch/arm64/boot/dts/amd/amd-overdrive.dts        |  2 +-
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     | 12 +++++++-----
>  arch/arm64/boot/dts/amd/husky.dts                |  2 +-
>  arch/arm64/boot/dts/arm/fvp-base-revc.dts        | 10 +++++-----
>  arch/arm64/boot/dts/arm/juno-base.dtsi           | 12 +++++++-----
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi    | 10 +++++-----
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi   | 10 +++++-----
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi        | 10 +++++-----
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi         | 10 +++++-----
>  arch/arm64/boot/dts/qcom/msm8998.dtsi            | 10 +++++-----
>  arch/arm64/boot/dts/qcom/qcs404.dtsi             | 10 +++++-----
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi         | 10 +++++-----
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 11 ++++++-----
>  arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 11 ++++++-----
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 12 +++++++-----
>  18 files changed, 80 insertions(+), 72 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/al/alpine-v2.dtsi b/arch/arm64/boot/dts/al/alpine-v2.dtsi
> index d5e7e2bb4e6c..35a540090026 100644
> --- a/arch/arm64/boot/dts/al/alpine-v2.dtsi
> +++ b/arch/arm64/boot/dts/al/alpine-v2.dtsi
> @@ -132,10 +132,10 @@
>  			#address-cells = <3>;
>  			#interrupt-cells = <1>;
>  			reg = <0x0 0xfbc00000 0x0 0x100000>;
> -			interrupt-map-mask = <0xf800 0 0 7>;
> +			interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
>  			/* add legacy interrupts for SATA only */
> -			interrupt-map = <0x4000 0 0 1 &gic 0 53 4>,
> -					<0x4800 0 0 1 &gic 0 54 4>;
> +			interrupt-map = <0x4000 0 0 IRQ_INTA &gic 0 53 4>,
> +					<0x4800 0 0 IRQ_INTA &gic 0 54 4>;
>  			/* 32 bit non prefetchable memory space */
>  			ranges = <0x2000000 0x0 0xfe000000 0x0 0xfe000000 0x0 0x1000000>;
>  			bus-range = <0x00 0x00>;
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> index 8e341be9a399..d4a8d3a5eebb 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> @@ -8,7 +8,7 @@
>  
>  /dts-v1/;
>  
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>  
>  / {
>  	model = "AMD Seattle (Rev.B0) Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> index 92cef05c6b74..e55254e714f2 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> @@ -8,7 +8,7 @@
>  
>  /dts-v1/;
>  
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>  
>  / {
>  	model = "AMD Seattle (Rev.B1) Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive.dts b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> index 41b3a6c0993d..4e09c9a2ceda 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> @@ -7,7 +7,7 @@
>  
>  /dts-v1/;
>  
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>  
>  / {
>  	model = "AMD Seattle Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> index b664e7af74eb..efc6f42f3bd1 100644
> --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2014 Advanced Micro Devices, Inc.
>   */
>  
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
>  / {
>  	compatible = "amd,seattle";
>  	interrupt-parent = <&gic0>;
> @@ -213,12 +215,12 @@
>  			msi-parent = <&v2m0>;
>  			reg = <0 0xf0000000 0 0x10000000>;
>  
> -			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
> +			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
>  			interrupt-map =
> -				<0x1000 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x120 0x1>,
> -				<0x1000 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x121 0x1>,
> -				<0x1000 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x122 0x1>,
> -				<0x1000 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x123 0x1>;
> +				<0x1000 0x0 0x0 IRQ_INTA &gic0 0x0 0x0 0x0 0x120 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTB &gic0 0x0 0x0 0x0 0x121 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTC &gic0 0x0 0x0 0x0 0x122 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTD &gic0 0x0 0x0 0x0 0x123 0x1>;
>  
>  			dma-coherent;
>  			dma-ranges = <0x43000000 0x0 0x0 0x0 0x0 0x100 0x0>;
> diff --git a/arch/arm64/boot/dts/amd/husky.dts b/arch/arm64/boot/dts/amd/husky.dts
> index 7acde34772cb..5463e89b2811 100644
> --- a/arch/arm64/boot/dts/amd/husky.dts
> +++ b/arch/arm64/boot/dts/amd/husky.dts
> @@ -8,7 +8,7 @@
>  
>  /dts-v1/;
>  
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>  
>  / {
>  	model = "Linaro 96Boards Enterprise Edition Server (Husky) Board";
> diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> index 62ab0d54ff71..8352c3ad43ab 100644
> --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> @@ -161,11 +161,11 @@
>  		bus-range = <0x0 0x1>;
>  		reg = <0x0 0x40000000 0x0 0x10000000>;
>  		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000>;
> -		interrupt-map = <0 0 0 1 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 2 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 3 &gic GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 4 &gic GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +		interrupt-map = <0 0 0 IRQ_INTA &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTB &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTC &gic GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTD &gic GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map-mask = <0x0 0x0 0x0 IRQ_INT_ALL>;
>  		msi-map = <0x0 &its 0x0 0x10000>;
>  		iommu-map = <0x0 &smmu 0x0 0x10000>;
>  
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 26a039a028b8..b01a922a9fbf 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -1,4 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
>  #include "juno-clocks.dtsi"
>  #include "juno-motherboard.dtsi"
>  
> @@ -519,11 +521,11 @@
>  			 <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000>,
>  			 <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
>  		#interrupt-cells = <1>;
> -		interrupt-map-mask = <0 0 0 7>;
> -		interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 2 &gic 0 0 GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 3 &gic 0 0 GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> -				<0 0 0 4 &gic 0 0 GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +		interrupt-map = <0 0 0 IRQ_INTA &gic 0 0 GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTB &gic 0 0 GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTC &gic 0 0 GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 IRQ_INTD &gic 0 0 GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
>  		msi-parent = <&v2m_0>;
>  		status = "disabled";
>  		iommu-map-mask = <0x0>;	/* RC has no means to output PCI RID */

For the Juno and FVP changes:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> index dfb41705a9a9..6776b116e3db 100644
> --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> @@ -115,13 +115,13 @@
>  		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
>  		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
>  		bus-range = <0 0xff>;
> -		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
>  		interrupt-map =
>  		      /* addr  pin  ic   icaddr  icintr */
> -			<0 0 0  1  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  2  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  3  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  4  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			<0 0 0  IRQ_INTA  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTB  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTC  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTD  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>  		msi-parent = <&gicits>;
>  		dma-coherent;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> index 337919366dc8..662cbf7c6588 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -492,11 +492,11 @@
>  				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
>  			msi-parent = <&msi>;
>  			#interrupt-cells = <1>;
> -			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map = <0000 0 0 1 &gic 0 110 IRQ_TYPE_LEVEL_HIGH>,
> -					<0000 0 0 2 &gic 0 111 IRQ_TYPE_LEVEL_HIGH>,
> -					<0000 0 0 3 &gic 0 112 IRQ_TYPE_LEVEL_HIGH>,
> -					<0000 0 0 4 &gic 0 113 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0000 0 0 IRQ_INTA &gic 0 110 IRQ_TYPE_LEVEL_HIGH>,
> +					<0000 0 0 IRQ_INTB &gic 0 111 IRQ_TYPE_LEVEL_HIGH>,
> +					<0000 0 0 IRQ_INTC &gic 0 112 IRQ_TYPE_LEVEL_HIGH>,
> +					<0000 0 0 IRQ_INTD &gic 0 113 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 253cc345f143..9469e1c935c0 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1013,14 +1013,14 @@
>  			#interrupt-cells = <1>;
>  			interrupts = <0 283 4>;
>  			interrupt-names = "msi";
> -			interrupt-map-mask = <0xf800 0 0 7>;
> -			interrupt-map = <0x0 0 0 1
> +			interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0x0 0 0 IRQ_INTA
>  					 &gic GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 2
> +					<0x0 0 0 IRQ_INTB
>  					 &gic GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 3
> +					<0x0 0 0 IRQ_INTC
>  					 &gic GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 4
> +					<0x0 0 0 IRQ_INTD
>  					 &gic GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&crg_ctrl HI3660_PCIEPHY_REF>,
>  				 <&crg_ctrl HI3660_CLK_GATE_PCIEAUX>,
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> index 50ceaa959bdc..179a61e171de 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> @@ -741,11 +741,11 @@
>  				 0x5ff0000 0x01000000 0 0 0 0xb7ff0000
>  				 0 0x10000>;
>  			#interrupt-cells = <1>;
> -			interrupt-map-mask = <0xf800 0 0 7>;
> -			interrupt-map = <0x0 0 0 1 &mbigen_pcie0 650 4
> -					0x0 0 0 2 &mbigen_pcie0 650 4
> -					0x0 0 0 3 &mbigen_pcie0 650 4
> -					0x0 0 0 4 &mbigen_pcie0 650 4>;
> +			interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0x0 0 0 IRQ_INTA &mbigen_pcie0 650 4
> +					0x0 0 0 IRQ_INTB &mbigen_pcie0 650 4
> +					0x0 0 0 IRQ_INTC &mbigen_pcie0 650 4
> +					0x0 0 0 IRQ_INTD &mbigen_pcie0 650 4>;
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index c6f81431983e..63e72069d21e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -867,11 +867,11 @@
>  			#interrupt-cells = <1>;
>  			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "msi";
> -			interrupt-map-mask = <0 0 0 0x7>;
> -			interrupt-map =	<0 0 0 1 &intc 0 135 IRQ_TYPE_LEVEL_HIGH>,
> -					<0 0 0 2 &intc 0 136 IRQ_TYPE_LEVEL_HIGH>,
> -					<0 0 0 3 &intc 0 138 IRQ_TYPE_LEVEL_HIGH>,
> -					<0 0 0 4 &intc 0 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +			interrupt-map =	<0 0 0 IRQ_INTA &intc 0 135 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTB &intc 0 136 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTC &intc 0 138 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTD &intc 0 139 IRQ_TYPE_LEVEL_HIGH>;
>  
>  			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
>  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index a97eeb4569c0..8e0a9fa37c82 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -980,11 +980,11 @@
>  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "msi";
>  			#interrupt-cells = <1>;
> -			interrupt-map-mask = <0 0 0 0x7>;
> -			interrupt-map = <0 0 0 1 &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> -					<0 0 0 2 &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> -					<0 0 0 3 &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> -					<0 0 0 4 &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +			interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0 0 0 IRQ_INTA &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTB &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTC &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 IRQ_INTD &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>  				 <&gcc GCC_PCIE_0_AUX_CLK>,
>  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index cede1ad81be2..bb68826bac6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -242,11 +242,11 @@
>  			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
>  			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
>  		interrupt-names = "sys", "legacy", "client";
> -		interrupt-map-mask = <0 0 0 7>;
> -		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
> -				<0 0 0 2 &pcie0_intc 1>,
> -				<0 0 0 3 &pcie0_intc 2>,
> -				<0 0 0 4 &pcie0_intc 3>;
> +		interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +		interrupt-map = <0 0 0 IRQ_INTA &pcie0_intc 0>,
> +				<0 0 0 IRQ_INTB &pcie0_intc 1>,
> +				<0 0 0 IRQ_INTC &pcie0_intc 2>,
> +				<0 0 0 IRQ_INTD &pcie0_intc 3>;
>  		linux,pci-domain = <0>;
>  		max-link-speed = <1>;
>  		msi-map = <0x0 &its 0x0 0x1000>;
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index b658f2b641e2..8a1a3e5bb11c 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/gpio/uniphier-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -900,11 +901,11 @@
>  			#interrupt-cells = <1>;
>  			interrupt-names = "dma", "msi";
>  			interrupts = <0 224 4>, <0 225 4>;
> -			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map = <0 0 0 1 &pcie_intc 0>,	/* INTA */
> -					<0 0 0 2 &pcie_intc 1>,	/* INTB */
> -					<0 0 0 3 &pcie_intc 2>,	/* INTC */
> -					<0 0 0 4 &pcie_intc 3>;	/* INTD */
> +			interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0 0 0 IRQ_INTA &pcie_intc 0>,
> +					<0 0 0 IRQ_INTB &pcie_intc 1>,
> +					<0 0 0 IRQ_INTC &pcie_intc 2>,
> +					<0 0 0 IRQ_INTD &pcie_intc 3>;
>  			phy-names = "pcie-phy";
>  			phys = <&pcie_phy>;
>  
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
> index d6f6cee4d549..ec20417fbd31 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/gpio/uniphier-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
>  	compatible = "socionext,uniphier-pxs3";
> @@ -758,11 +759,11 @@
>  			#interrupt-cells = <1>;
>  			interrupt-names = "dma", "msi";
>  			interrupts = <0 224 4>, <0 225 4>;
> -			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map = <0 0 0 1 &pcie_intc 0>,	/* INTA */
> -					<0 0 0 2 &pcie_intc 1>,	/* INTB */
> -					<0 0 0 3 &pcie_intc 2>,	/* INTC */
> -					<0 0 0 4 &pcie_intc 3>;	/* INTD */
> +			interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0 0 0 IRQ_INTA &pcie_intc 0>,
> +					<0 0 0 IRQ_INTB &pcie_intc 1>,
> +					<0 0 0 IRQ_INTC &pcie_intc 2>,
> +					<0 0 0 IRQ_INTD &pcie_intc 3>;
>  			phy-names = "pcie-phy";
>  			phys = <&pcie_phy>;
>  
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 9aa67340a4d8..30c9b0b275de 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -12,6 +12,8 @@
>   * the License, or (at your option) any later version.
>   */
>  
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
>  / {
>  	compatible = "xlnx,zynqmp";
>  	#address-cells = <2>;
> @@ -462,11 +464,11 @@
>  			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 0xe0000000 0x00000000 0x10000000	/* non-prefetchable memory */
>  				  0x43000000 0x00000006 0x00000000 0x00000006 0x00000000 0x00000002 0x00000000>;/* prefetchable memory */
>  			bus-range = <0x00 0xff>;
> -			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> -			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc 0x1>,
> -					<0x0 0x0 0x0 0x2 &pcie_intc 0x2>,
> -					<0x0 0x0 0x0 0x3 &pcie_intc 0x3>,
> -					<0x0 0x0 0x0 0x4 &pcie_intc 0x4>;
> +			interrupt-map-mask = <0x0 0x0 0x0 IRQ_INT_ALL>;
> +			interrupt-map = <0x0 0x0 0x0 IRQ_INTA &pcie_intc 0x1>,
> +					<0x0 0x0 0x0 IRQ_INTB &pcie_intc 0x2>,
> +					<0x0 0x0 0x0 IRQ_INTC &pcie_intc 0x3>,
> +					<0x0 0x0 0x0 IRQ_INTD &pcie_intc 0x4>;
>  			pcie_intc: legacy-interrupt-controller {
>  				interrupt-controller;
>  				#address-cells = <0>;
> -- 
> 2.21.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
