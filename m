Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4830F4E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 15:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKHOe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 09:34:28 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59408 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfKHOe2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 09:34:28 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iT5Kx-0001br-PV; Fri, 08 Nov 2019 15:34:07 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robert Richter <rrichter@cavium.com>,
        Jayachandran C <jnair@caviumnetworks.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/7] arm64: dts: Use IRQ flags for legacy PCI IRQ interrupts
Date:   Fri, 08 Nov 2019 15:34:06 +0100
Message-ID: <4293211.PqsBVBjssI@phil>
In-Reply-To: <20191104163834.8932-3-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com> <20191104163834.8932-3-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Montag, 4. November 2019, 17:38:16 CET schrieb Andrew Murray:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>

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

For the Rockchip part
Acked-by: Heiko Stuebner <heiko@sntech.de>


