Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B7DF5DA3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 07:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfKIGDf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Nov 2019 01:03:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6172 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbfKIGDf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Nov 2019 01:03:35 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B22B2E6142BB3A3D090A;
        Sat,  9 Nov 2019 14:03:30 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 9 Nov 2019
 14:03:27 +0800
Subject: Re: [PATCH v1 2/7] arm64: dts: Use IRQ flags for legacy PCI IRQ
 interrupts
To:     Andrew Murray <andrew.murray@arm.com>,
        Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Brijesh Singh" <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robert Richter <rrichter@cavium.com>,
        Jayachandran C <jnair@caviumnetworks.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-3-andrew.murray@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5DC656A1.2000808@hisilicon.com>
Date:   Sat, 9 Nov 2019 14:03:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20191104163834.8932-3-andrew.murray@arm.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2019/11/5 0:38, Andrew Murray wrote:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>   arch/arm64/boot/dts/al/alpine-v2.dtsi            |  6 +++---
>   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |  2 +-
>   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |  2 +-
>   arch/arm64/boot/dts/amd/amd-overdrive.dts        |  2 +-
>   arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     | 12 +++++++-----
>   arch/arm64/boot/dts/amd/husky.dts                |  2 +-
>   arch/arm64/boot/dts/arm/fvp-base-revc.dts        | 10 +++++-----
>   arch/arm64/boot/dts/arm/juno-base.dtsi           | 12 +++++++-----
>   arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi    | 10 +++++-----
>   arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi   | 10 +++++-----
>   arch/arm64/boot/dts/hisilicon/hi3660.dtsi        | 10 +++++-----
>   arch/arm64/boot/dts/hisilicon/hip06.dtsi         | 10 +++++-----
>   arch/arm64/boot/dts/qcom/msm8998.dtsi            | 10 +++++-----
>   arch/arm64/boot/dts/qcom/qcs404.dtsi             | 10 +++++-----
>   arch/arm64/boot/dts/rockchip/rk3399.dtsi         | 10 +++++-----
>   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 11 ++++++-----
>   arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 11 ++++++-----
>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 12 +++++++-----
>   18 files changed, 80 insertions(+), 72 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/al/alpine-v2.dtsi b/arch/arm64/boot/dts/al/alpine-v2.dtsi
> index d5e7e2bb4e6c..35a540090026 100644
> --- a/arch/arm64/boot/dts/al/alpine-v2.dtsi
> +++ b/arch/arm64/boot/dts/al/alpine-v2.dtsi
> @@ -132,10 +132,10 @@
>   			#address-cells = <3>;
>   			#interrupt-cells = <1>;
>   			reg = <0x0 0xfbc00000 0x0 0x100000>;
> -			interrupt-map-mask = <0xf800 0 0 7>;
> +			interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
>   			/* add legacy interrupts for SATA only */
> -			interrupt-map = <0x4000 0 0 1 &gic 0 53 4>,
> -					<0x4800 0 0 1 &gic 0 54 4>;
> +			interrupt-map = <0x4000 0 0 IRQ_INTA &gic 0 53 4>,
> +					<0x4800 0 0 IRQ_INTA &gic 0 54 4>;
>   			/* 32 bit non prefetchable memory space */
>   			ranges = <0x2000000 0x0 0xfe000000 0x0 0xfe000000 0x0 0x1000000>;
>   			bus-range = <0x00 0x00>;
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> index 8e341be9a399..d4a8d3a5eebb 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> @@ -8,7 +8,7 @@
>   
>   /dts-v1/;
>   
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>   
>   / {
>   	model = "AMD Seattle (Rev.B0) Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> index 92cef05c6b74..e55254e714f2 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> @@ -8,7 +8,7 @@
>   
>   /dts-v1/;
>   
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>   
>   / {
>   	model = "AMD Seattle (Rev.B1) Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive.dts b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> index 41b3a6c0993d..4e09c9a2ceda 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> @@ -7,7 +7,7 @@
>   
>   /dts-v1/;
>   
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>   
>   / {
>   	model = "AMD Seattle Development Board (Overdrive)";
> diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> index b664e7af74eb..efc6f42f3bd1 100644
> --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2014 Advanced Micro Devices, Inc.
>    */
>   
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
>   / {
>   	compatible = "amd,seattle";
>   	interrupt-parent = <&gic0>;
> @@ -213,12 +215,12 @@
>   			msi-parent = <&v2m0>;
>   			reg = <0 0xf0000000 0 0x10000000>;
>   
> -			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
> +			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
>   			interrupt-map =
> -				<0x1000 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x120 0x1>,
> -				<0x1000 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x121 0x1>,
> -				<0x1000 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x122 0x1>,
> -				<0x1000 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x123 0x1>;
> +				<0x1000 0x0 0x0 IRQ_INTA &gic0 0x0 0x0 0x0 0x120 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTB &gic0 0x0 0x0 0x0 0x121 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTC &gic0 0x0 0x0 0x0 0x122 0x1>,
> +				<0x1000 0x0 0x0 IRQ_INTD &gic0 0x0 0x0 0x0 0x123 0x1>;
>   
>   			dma-coherent;
>   			dma-ranges = <0x43000000 0x0 0x0 0x0 0x0 0x100 0x0>;
> diff --git a/arch/arm64/boot/dts/amd/husky.dts b/arch/arm64/boot/dts/amd/husky.dts
> index 7acde34772cb..5463e89b2811 100644
> --- a/arch/arm64/boot/dts/amd/husky.dts
> +++ b/arch/arm64/boot/dts/amd/husky.dts
> @@ -8,7 +8,7 @@
>   
>   /dts-v1/;
>   
> -/include/ "amd-seattle-soc.dtsi"
> +#include "amd-seattle-soc.dtsi"
>   
>   / {
>   	model = "Linaro 96Boards Enterprise Edition Server (Husky) Board";
> diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> index 62ab0d54ff71..8352c3ad43ab 100644
> --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> @@ -161,11 +161,11 @@
>   		bus-range = <0x0 0x1>;
>   		reg = <0x0 0x40000000 0x0 0x10000000>;
>   		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000>;
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
>   		msi-map = <0x0 &its 0x0 0x10000>;
>   		iommu-map = <0x0 &smmu 0x0 0x10000>;
>   
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 26a039a028b8..b01a922a9fbf 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -1,4 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
>   #include "juno-clocks.dtsi"
>   #include "juno-motherboard.dtsi"
>   
> @@ -519,11 +521,11 @@
>   			 <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000>,
>   			 <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
>   		#interrupt-cells = <1>;
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
>   		msi-parent = <&v2m_0>;
>   		status = "disabled";
>   		iommu-map-mask = <0x0>;	/* RC has no means to output PCI RID */
> diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> index dfb41705a9a9..6776b116e3db 100644
> --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> @@ -115,13 +115,13 @@
>   		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
>   		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
>   		bus-range = <0 0xff>;
> -		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map-mask = <0 0 0 IRQ_INT_ALL>;
>   		interrupt-map =
>   		      /* addr  pin  ic   icaddr  icintr */
> -			<0 0 0  1  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  2  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  3  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> -			 0 0 0  4  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			<0 0 0  IRQ_INTA  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTB  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTC  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> +			 0 0 0  IRQ_INTD  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>   		msi-parent = <&gicits>;
>   		dma-coherent;
>   	};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> index 337919366dc8..662cbf7c6588 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -492,11 +492,11 @@
>   				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
>   			msi-parent = <&msi>;
>   			#interrupt-cells = <1>;
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
>   			status = "disabled";
>   		};
>   	};
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 253cc345f143..9469e1c935c0 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1013,14 +1013,14 @@
>   			#interrupt-cells = <1>;
>   			interrupts = <0 283 4>;
>   			interrupt-names = "msi";
> -			interrupt-map-mask = <0xf800 0 0 7>;
> -			interrupt-map = <0x0 0 0 1
> +			interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
> +			interrupt-map = <0x0 0 0 IRQ_INTA
>   					 &gic GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 2
> +					<0x0 0 0 IRQ_INTB
>   					 &gic GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 3
> +					<0x0 0 0 IRQ_INTC
>   					 &gic GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> -					<0x0 0 0 4
> +					<0x0 0 0 IRQ_INTD
>   					 &gic GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&crg_ctrl HI3660_PCIEPHY_REF>,
>   				 <&crg_ctrl HI3660_CLK_GATE_PCIEAUX>,
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> index 50ceaa959bdc..179a61e171de 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> @@ -741,11 +741,11 @@
>   				 0x5ff0000 0x01000000 0 0 0 0xb7ff0000
>   				 0 0x10000>;
>   			#interrupt-cells = <1>;
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
>   			status = "disabled";
>   		};
>

Thanks!
For the Hisilicon part,
Acked-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei

