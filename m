Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98F0241F69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 19:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgHKRwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 13:52:44 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2594 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbgHKRwn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 13:52:43 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 57EFC2EEE6DF367ACF51;
        Tue, 11 Aug 2020 18:52:41 +0100 (IST)
Received: from localhost (10.52.125.40) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 11 Aug
 2020 18:52:40 +0100
Date:   Tue, 11 Aug 2020 18:51:11 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Rob Herring <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Mayulong <mayulong1@huawei.com>, <linuxarm@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/33] Add driver for HiSilicon SPMI PMIC for Hikey 970
Message-ID: <20200811185111.00000648@Huawei.com>
In-Reply-To: <20200811175429.748a69b6@coco.lan>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <20200811175429.748a69b6@coco.lan>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.40]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Aug 2020 17:54:29 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 11 Aug 2020 17:41:26 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > The Hikey 970 board uses a different PMIC than the one found on Hikey 960.
> > 
> > This PMIC uses a SPMI board.
> > 
> > This patch series backport the OOT drivers from the Linaro's official
> > tree for this board:
> > 
> > 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> > 	
> > Porting them to upstream, cleaning up coding style issues, solving
> > driver probing order and adding DT documentation.
> > 
> > I opted to not fold all patches into a single one, in order to:
> > 
> > - Preserve the authorship of the original authors;
> > - Keep a history of changes.
> > 
> > As this could be harder for people to review, I'll be replying to patch 00/32
> > with all patches folded. This should help reviewers to see the current
> > code after the entire series is applied.  
> 
> As promised, it follows the diff from this entire patch series.
> 
> Feel free to review either on the top of this e-mail or on the
> individual patches.
> 

Whilst I agree entirely with Mark about the need to turn this into a clean series,
I was bored at the end of the day so here is a drive by review..

I've not looked at anything that really needed any thought as it is too hot for
thinking.

Jonathan

> Thanks!
> Mauro
> 
>  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml      | 175 ++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml |  54 ++++++++++++
>  MAINTAINERS                                                                |   8 ++
>  arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts                          |  16 +---
>  arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi                           | 200 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/Kconfig                                                        |  17 +++-
>  drivers/mfd/Makefile                                                       |   1 +
>  drivers/mfd/hi6421-spmi-pmic.c                                             | 399 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/regulator/Kconfig                                                  |   8 ++
>  drivers/regulator/Makefile                                                 |   1 +
>  drivers/regulator/hi6421v600-regulator.c                                   | 493 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/spmi/Kconfig                                                       |   9 ++
>  drivers/spmi/Makefile                                                      |   2 +
>  drivers/spmi/hisi-spmi-controller.c                                        | 384 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/spmi/spmi.c                                                        |  10 +--
>  include/linux/mfd/hi6421-spmi-pmic.h                                       |  67 +++++++++++++++
>  16 files changed, 1826 insertions(+), 18 deletions(-)
> 
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> new file mode 100644
> index 000000000000..33dcbaeb474e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/hisilicon,hi6421v600-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon 6421v600 SPMI PMIC
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  HiSilicon 6421v600 uses a MIPI System Power Management (SPMI) bus in order
> +  to provide interrupts and power supply.
> +
> +  The GPIO and interrupt settings are represented as part of the top-level PMIC
> +  node.
> +
> +  The SPMI controller part is provided by
> +  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml.
> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]"
> +
> +  compatible:
> +    const: hisilicon,hi6421-spmi-pmic
> +
> +  reg:
> +    maxItems: 1
> +
> +  spmi-channel:
> +    description: number of the SPMI channel where the PMIC is connected
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      Identify that the PMIC is capable of behaving as an interrupt controller.
> +
> +  gpios:
> +    maxItems: 1
> +
> +  irq-num:
> +    description: Interrupt request number
> +
> +  'irq-array':
> +    description: Interrupt request array
> +
> +  'irq-mask-addr':
> +    description: Address for the interrupt request mask
> +
> +  'irq-addr':
> +    description: Address for the interrupt request
> +
> +  regulators:
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^ldo@[0-9]+$':
> +        type: object
> +
> +        $ref: "/schemas/regulator/regulator.yaml#"
> +
> +        properties:
> +          reg:
> +            description: Enable register.
> +
> +          vsel-reg:
> +            description: Voltage selector register.
> +
> +          enable-mask:
> +            description: Bitmask used to enable the regulator.
> +
> +#          voltage-table:
> +#            description: Table with the selector items for the voltage regulator.
> +#            minItems: 2
> +#            maxItems: 16

Guess this needs fixing up.

> +
> +          off-on-delay-us:
> +            description: Time required for changing state to enabled in microseconds.
> +
> +          startup-delay-us:
> +            description: Startup time in microseconds.
> +
> +          idle-mode-mask:
> +            description: Bitmask used to put the regulator on idle mode.
> +
> +          eco-microamp:
> +            description: Maximum current while on idle mode.
> +
> +        required:
> +          - reg
> +          - vsel-reg
> +          - enable-mask
> +          - voltage-table
> +          - off-on-delay-us
> +          - startup-delay-us
> +
> +required:
> +  - compatible
> +  - reg
> +  - spmi-channel
> +  - regulators
> +
> +examples:
> +  - |
> +    pmic: pmic@0 {
> +      compatible = "hisilicon,hi6421-spmi-pmic";
> +      slave_id = <0>;
> +      reg = <0 0>;
> +
> +      #interrupt-cells = <2>;
> +      interrupt-controller;
> +      gpios = <&gpio28 0 0>;
> +      irq-num = <16>;
> +      irq-array = <2>;
> +      irq-mask-addr = <0x202 2>;
> +      irq-addr = <0x212 2>;
> +
> +      regulators {
> +        ldo3: ldo3@16 {
> +          reg = <0x16>;
> +          vsel-reg = <0x51>;
> +
> +          regulator-name = "ldo3";
> +          regulator-min-microvolt = <1500000>;
> +          regulator-max-microvolt = <2000000>;
> +          regulator-boot-on;
> +
> +          enable-mask = <0x01>;
> +
> +          voltage-table = <1500000>, <1550000>,
> +              <1600000>, <1650000>,
> +              <1700000>, <1725000>,
> +              <1750000>, <1775000>,
> +              <1800000>, <1825000>,
> +              <1850000>, <1875000>,
> +              <1900000>, <1925000>,
> +              <1950000>, <2000000>;
> +          off-on-delay-us = <20000>;
> +          startup-delay-us = <120>;
> +        };
> +
> +        ldo4: ldo4@17 { /* 40 PIN */
> +          reg = <0x17>;
> +          vsel-reg = <0x52>;
> +
> +          regulator-name = "ldo4";
> +          regulator-min-microvolt = <1725000>;
> +          regulator-max-microvolt = <1900000>;
> +          regulator-boot-on;
> +
> +          enable-mask = <0x01>;
> +          idle-mode-mask = <0x10>;
> +          eco-microamp = <10000>;
> +
> +          hi6421-vsel = <0x52 0x07>;
> +          voltage-table = <1725000>, <1750000>,
> +              <1775000>, <1800000>,
> +              <1825000>, <1850000>,
> +              <1875000>, <1900000>;
> +          off-on-delay-us = <20000>;
> +          startup-delay-us = <120>;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> new file mode 100644
> index 000000000000..d087f9067e4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon SPMI controller
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  The HiSilicon SPMI controller is found on some Kirin-based designs.
> +  It is a MIPI System Power Management (SPMI) controller.
> +
> +  The PMIC part is provided by
> +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
> +
> +properties:
> +  $nodename:
> +    pattern: "spmi@[0-9a-f]"
> +
> +  compatible:
> +    const: hisilicon,spmi-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +  spmi-channel:
> +    const: number of the SPMI channel where the PMIC is connected
> +
> +patternProperties:
> +  "^pmic@[0-9a-f]$":
> +    $ref: "/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#"
> +
> +examples:
> +  - |
> +    spmi: spmi@fff24000 {
> +      compatible = "hisilicon,spmi-controller";
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +      status = "ok";
> +      reg = <0x0 0xfff24000 0x0 0x1000>;
> +      spmi-channel = <2>;
> +
> +      /* pmic properties */
> +
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 956ecd5ba426..6410df78e301 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7736,6 +7736,14 @@ F:	include/linux/hippidevice.h
>  F:	include/uapi/linux/if_hippi.h
>  F:	net/802/hippi.c
>  
> +HISILICON 6421v600 SPMI PMIC DRIVER
> +M:	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	drivers/mfd/hi6421-spmi-pmic.c
> +F:	drivers/regulator/hi6421v600-regulator.c
> +F:	drivers/spmi/spmi.c
> +
>  HISILICON DMA DRIVER
>  M:	Zhou Wang <wangzhou1@hisilicon.com>
>  L:	dmaengine@vger.kernel.org
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> index 01234a175dcd..c8a72c0873bf 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> @@ -12,6 +12,7 @@
>  
>  #include "hi3670.dtsi"
>  #include "hikey970-pinctrl.dtsi"
> +#include "hikey970-pmic.dtsi"
>  
>  / {
>  	model = "HiKey970";
> @@ -39,7 +40,7 @@ memory@0 {
>  		reg = <0x0 0x0 0x0 0x0>;
>  	};
>  
> -	sd_1v8: regulator-1v8 {
> +	fixed_1v8: regulator-1v8 {

Rename relevant?

>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
>  		regulator-min-microvolt = <1800000>;
> @@ -47,15 +48,6 @@ sd_1v8: regulator-1v8 {
>  		regulator-always-on;
>  	};
>  
> -	sd_3v3: regulator-3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "fixed-3.3V";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		regulator-boot-on;
> -		regulator-always-on;
> -	};
> -
>  	wlan_en: wlan-en-1-8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "wlan-en-regulator";
> @@ -402,8 +394,8 @@ &dwmmc1 {
>  	pinctrl-0 = <&sd_pmx_func
>  		     &sd_clk_cfg_func
>  		     &sd_cfg_func>;  
> -	vmmc-supply = <&sd_3v3>;
> -	vqmmc-supply = <&sd_1v8>;
> +	vmmc-supply = <&ldo16>;
> +	vqmmc-supply = <&ldo9>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
> new file mode 100644
> index 000000000000..2a6c366d9be6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dts file for Hi6421v600 SPMI PMIC used at the HiKey970 Development Board
> + *
> + * Copyright (C) 2020, Huawei Tech. Co., Ltd.
> + */
> +
> +/ {
> +	spmi: spmi@fff24000 {
> +		compatible = "hisilicon,spmi-controller";
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +		status = "ok";
> +		reg = <0x0 0xfff24000 0x0 0x1000>;
> +		spmi-channel = <2>;
> +
> +		pmic: pmic@0 {
> +			compatible = "hisilicon,hi6421-spmi-pmic";
> +			slave_id = <0>;
> +			reg = <0 0>;
> +
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			gpios = <&gpio28 0 0>;
> +			irq-num = <16>;
> +			irq-array = <2>;
> +			irq-mask-addr = <0x202 2>;
> +			irq-addr = <0x212 2>;
> +
> +			regulators {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ldo3: ldo3@16 {
> +					reg = <0x16>;
> +					vsel-reg = <0x51>;
> +
> +					regulator-name = "ldo3";
> +					regulator-min-microvolt = <1500000>;
> +					regulator-max-microvolt = <2000000>;
> +					regulator-boot-on;
> +
> +					enable-mask = <0x01>;
> +
> +					voltage-table = <1500000>, <1550000>,
> +							<1600000>, <1650000>,
> +							<1700000>, <1725000>,
> +							<1750000>, <1775000>,
> +							<1800000>, <1825000>,
> +							<1850000>, <1875000>,
> +							<1900000>, <1925000>,
> +							<1950000>, <2000000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +
> +				ldo4: ldo4@17 { /* 40 PIN */
> +					reg = <0x17>;
> +					vsel-reg = <0x52>;
> +
> +					regulator-name = "ldo4";
> +					regulator-min-microvolt = <1725000>;
> +					regulator-max-microvolt = <1900000>;
> +					regulator-boot-on;
> +
> +					enable-mask = <0x01>;
> +					idle-mode-mask = <0x10>;
> +					eco-microamp = <10000>;
> +
> +					hi6421-vsel = <0x52 0x07>;
> +					voltage-table = <1725000>, <1750000>,
> +							<1775000>, <1800000>,
> +							<1825000>, <1850000>,
> +							<1875000>, <1900000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +
> +				ldo9: ldo9@1C { /* SDCARD I/O */
> +					reg = <0x1C>;
> +					vsel-reg = <0x57>;
> +
> +					regulator-name = "ldo9";
> +					regulator-min-microvolt = <1750000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-boot-on;
> +
> +					enable-mask = <0x01>;
> +					idle-mode-mask = <0x10>;
> +					eco-microamp = <10000>;
> +
> +					voltage-table = <1750000>, <1800000>,
> +							<1825000>, <2800000>,
> +							<2850000>, <2950000>,
> +							<3000000>, <3300000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <360>;
> +				};
> +
> +				ldo15: ldo15@21 { /* UFS */
> +					reg = <0x21>;
> +					vsel-reg = <0x5c>;
> +
> +					regulator-name = "ldo15";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-always-on;
> +
> +					enable-mask = <0x01>;
> +					idle-mode-mask = <0x10>;
> +					eco-microamp = <10000>;
> +
> +					voltage-table = <1800000>, <1850000>,
> +							<2400000>, <2600000>,
> +							<2700000>, <2850000>,
> +							<2950000>, <3000000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +
> +				ldo16: ldo16@22 { /* SD */
> +					reg = <0x22>;
> +					vsel-reg = <0x5d>;
> +
> +					regulator-name = "ldo16";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-boot-on;
> +
> +					enable-mask = <0x01>;
> +					idle-mode-mask = <0x10>;
> +					eco-microamp = <10000>;
> +
> +					voltage-table = <1800000>, <1850000>,
> +							<2400000>, <2600000>,
> +							<2700000>, <2850000>,
> +							<2950000>, <3000000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <360>;
> +				};
> +
> +				ldo17: ldo17@23 {
> +					reg = <0x23>;
> +					vsel-reg = <0x5e>;
> +
> +					regulator-name = "ldo17";
> +					regulator-min-microvolt = <2500000>;
> +					regulator-max-microvolt = <3300000>;
> +
> +					enable-mask = <0x01>;
> +					idle-mode-mask = <0x10>;
> +					eco-microamp = <10000>;
> +
> +					voltage-table = <2500000>, <2600000>,
> +							<2700000>, <2800000>,
> +							<3000000>, <3100000>,
> +							<3200000>, <3300000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +
> +				ldo33: ldo33@32 { /* PEX8606 */
> +					reg = <0x32>;
> +					vsel-reg = <0x6d>;
> +					regulator-name = "ldo33";
> +					regulator-min-microvolt = <2500000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-boot-on;
> +
> +					enable-mask = <0x01>;
> +
> +					voltage-table = <2500000>, <2600000>,
> +							<2700000>, <2800000>,
> +							<3000000>, <3100000>,
> +							<3200000>, <3300000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +
> +				ldo34: ldo34@33 { /* GPS AUX IN VDD */
> +					reg = <0x33>;
> +					vsel-reg = <0x6e>;
> +
> +					regulator-name = "ldo34";
> +					regulator-min-microvolt = <2600000>;
> +					regulator-max-microvolt = <3300000>;
> +
> +					enable-mask = <0x01>;
> +
> +					voltage-table = <2600000>, <2700000>,
> +							<2800000>, <2900000>,
> +							<3000000>, <3100000>,
> +							<3200000>, <3300000>;
> +					off-on-delay-us = <20000>;
> +					startup-delay-us = <120>;
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a37d7d171382..04c249649532 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -493,10 +493,25 @@ config MFD_HI6421_PMIC
>  	  Add support for HiSilicon Hi6421 PMIC. Hi6421 includes multi-
>  	  functions, such as regulators, RTC, codec, Coulomb counter, etc.
>  	  This driver includes core APIs _only_. You have to select
> -	  individul components like voltage regulators under corresponding
> +	  individual components like voltage regulators under corresponding

Don't fix other drivers.

>  	  menus in order to enable them.
>  	  We communicate with the Hi6421 via memory-mapped I/O.
>  
> +config MFD_HI6421_SPMI
> +	tristate "HiSilicon Hi6421v600 SPMI PMU/Codec IC"
> +	depends on OF
> +	select MFD_CORE
> +	select REGMAP_MMIO

Nice thought, but it doesn't use it yet!

> +	help
> +	  Add support for HiSilicon Hi6421v600 SPMI PMIC. Hi6421 includes
> +	  multi-functions, such as regulators, RTC, codec, Coulomb counter,
> +	  etc.
> +
> +	  This driver includes core APIs _only_. You have to select
> +	  individual components like voltage regulators under corresponding
> +	  menus in order to enable them.
> +	  We communicate with the Hi6421v600 via a SPMI bus.
> +
>  config MFD_HI655X_PMIC
>  	tristate "HiSilicon Hi655X series PMU/Codec IC"
>  	depends on ARCH_HISI || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9367a92f795a..2ac0727dafc9 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -233,6 +233,7 @@ obj-$(CONFIG_MFD_IPAQ_MICRO)	+= ipaq-micro.o
>  obj-$(CONFIG_MFD_IQS62X)	+= iqs62x.o
>  obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
>  obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
> +obj-$(CONFIG_MFD_HI6421_SPMI)	+= hi6421-spmi-pmic.o
>  obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
>  obj-$(CONFIG_MFD_DLN2)		+= dln2.o
>  obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
> diff --git a/drivers/mfd/hi6421-spmi-pmic.c b/drivers/mfd/hi6421-spmi-pmic.c
> new file mode 100644
> index 000000000000..d8b84d64041e
> --- /dev/null
> +++ b/drivers/mfd/hi6421-spmi-pmic.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device driver for regulators in HISI PMIC IC
> + *
> + * Copyright (c) 2013 Linaro Ltd.
> + * Copyright (c) 2011 Hisilicon.
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Drop license text.

> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_irq.h>
> +#include <linux/mfd/hi6421-spmi-pmic.h>
> +#include <linux/irq.h>
> +#include <linux/spmi.h>
> +#ifndef NO_IRQ
> +#define NO_IRQ       0

Drop

> +#endif
> +
> +/* 8-bit register offset in PMIC */
> +#define HISI_MASK_STATE			0xff
> +
> +#define HISI_IRQ_KEY_NUM		0
> +#define HISI_IRQ_KEY_VALUE		0xc0
> +#define HISI_IRQ_KEY_DOWN		7
> +#define HISI_IRQ_KEY_UP			6
> +
> +/*#define HISI_NR_IRQ			25*/

Drop

> +#define HISI_MASK_FIELD		0xFF
> +#define HISI_BITS			8
> +
> +/*define the first group interrupt register number*/
> +#define HISI_PMIC_FIRST_GROUP_INT_NUM        2
> +
> +static const struct mfd_cell hi6421v600_devs[] = {
> +	{ .name = "hi6421v600-regulator", },
> +};
> +
> +/*
> + * The PMIC register is only 8-bit.
> + * Hisilicon SoC use hardware to map PMIC register into SoC mapping.
> + * At here, we are accessing SoC register with 32-bit.
Can we return the 8 bits in an int and hence also return error codes?
> + */
> +u32 hi6421_spmi_pmic_read(struct hi6421_spmi_pmic *pmic, int reg)
> +{
> +	u32 ret;
> +	u8 read_value = 0;
> +	struct spmi_device *pdev;
> +
> +	pdev = to_spmi_device(pmic->dev);
> +	if (!pdev) {
> +		pr_err("%s: pdev get failed!\n", __func__);
> +		return 0;
> +	}
> +
> +	ret = spmi_ext_register_readl(pdev, reg,
> +				      (unsigned char *)&read_value, 1);
> +	if (ret) {
> +		pr_err("%s: spmi_ext_register_readl failed!\n", __func__);
> +		return 0;
> +	}
> +	return (u32)read_value;
> +}
> +EXPORT_SYMBOL(hi6421_spmi_pmic_read);
> +
> +void hi6421_spmi_pmic_write(struct hi6421_spmi_pmic *pmic, int reg, u32 val)
> +{
> +	u32 ret;
> +	struct spmi_device *pdev;
> +
> +	pdev = to_spmi_device(pmic->dev);
> +	if (!pdev) {
> +		pr_err("%s: pdev get failed!\n", __func__);
> +		return;
> +	}
> +
> +	ret = spmi_ext_register_writel(pdev, reg, (unsigned char *)&val, 1);
> +	if (ret) {
> +		pr_err("%s: spmi_ext_register_writel failed!\n", __func__);
> +		return;
> +	}
> +}
> +EXPORT_SYMBOL(hi6421_spmi_pmic_write);
> +
> +void hi6421_spmi_pmic_rmw(struct hi6421_spmi_pmic *pmic, int reg,
> +			  u32 mask, u32 bits)
> +{
> +	u32 data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pmic->lock, flags);
> +	data = hi6421_spmi_pmic_read(pmic, reg) & ~mask;
> +	data |= mask & bits;
> +	hi6421_spmi_pmic_write(pmic, reg, data);
> +	spin_unlock_irqrestore(&pmic->lock, flags);
> +}
> +EXPORT_SYMBOL(hi6421_spmi_pmic_rmw);
> +
> +static irqreturn_t hi6421_spmi_irq_handler(int irq, void *data)
> +{
> +	struct hi6421_spmi_pmic *pmic = (struct hi6421_spmi_pmic *)data;
> +	unsigned long pending;
> +	int i, offset;
> +
> +	for (i = 0; i < pmic->irqarray; i++) {
> +		pending = hi6421_spmi_pmic_read(pmic, (i + pmic->irq_addr.start_addr));
> +		pending &= HISI_MASK_FIELD;
> +		if (pending != 0)
> +			pr_debug("pending[%d]=0x%lx\n\r", i, pending);
> +
> +		hi6421_spmi_pmic_write(pmic, (i + pmic->irq_addr.start_addr),
> +				       pending);
> +
> +		/* solve powerkey order */
> +		if ((i == HISI_IRQ_KEY_NUM) && ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
> +			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
> +			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
> +			pending &= (~HISI_IRQ_KEY_VALUE);
> +		}
> +
> +		if (pending) {
> +			for_each_set_bit(offset, &pending, HISI_BITS)
> +				generic_handle_irq(pmic->irqs[offset + i * HISI_BITS]);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void hi6421_spmi_irq_mask(struct irq_data *d)
> +{
> +	struct hi6421_spmi_pmic *pmic = irq_data_get_irq_chip_data(d);
> +	u32 data, offset;
> +	unsigned long flags;
> +
> +	offset = (irqd_to_hwirq(d) >> 3);
> +	offset += pmic->irq_mask_addr.start_addr;
> +
> +	spin_lock_irqsave(&pmic->lock, flags);
> +	data = hi6421_spmi_pmic_read(pmic, offset);
> +	data |= (1 << (irqd_to_hwirq(d) & 0x07));
> +	hi6421_spmi_pmic_write(pmic, offset, data);
> +	spin_unlock_irqrestore(&pmic->lock, flags);
> +}
> +
> +static void hi6421_spmi_irq_unmask(struct irq_data *d)
> +{
> +	struct hi6421_spmi_pmic *pmic = irq_data_get_irq_chip_data(d);
> +	u32 data, offset;
> +	unsigned long flags;
> +
> +	offset = (irqd_to_hwirq(d) >> 3);
> +	offset += pmic->irq_mask_addr.start_addr;
> +
> +	spin_lock_irqsave(&pmic->lock, flags);
> +	data = hi6421_spmi_pmic_read(pmic, offset);
> +	data &= ~(1 << (irqd_to_hwirq(d) & 0x07));
> +	hi6421_spmi_pmic_write(pmic, offset, data);
> +	spin_unlock_irqrestore(&pmic->lock, flags);
> +}
> +
> +static struct irq_chip hi6421_spmi_pmu_irqchip = {
> +	.name		= "hisi-irq",
> +	.irq_mask	= hi6421_spmi_irq_mask,
> +	.irq_unmask	= hi6421_spmi_irq_unmask,
> +	.irq_disable	= hi6421_spmi_irq_mask,
> +	.irq_enable	= hi6421_spmi_irq_unmask,
> +};
> +
> +static int hi6421_spmi_irq_map(struct irq_domain *d, unsigned int virq,
> +			       irq_hw_number_t hw)
> +{
> +	struct hi6421_spmi_pmic *pmic = d->host_data;
> +
> +	irq_set_chip_and_handler_name(virq, &hi6421_spmi_pmu_irqchip,
> +				      handle_simple_irq, "hisi");
> +	irq_set_chip_data(virq, pmic);
> +	irq_set_irq_type(virq, IRQ_TYPE_NONE);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops hi6421_spmi_domain_ops = {
> +	.map	= hi6421_spmi_irq_map,
> +	.xlate	= irq_domain_xlate_twocell,
> +};
> +
> +static int get_pmic_device_tree_data(struct device_node *np,
> +				     struct hi6421_spmi_pmic *pmic)
> +{
> +	int ret = 0;

always set.

> +
> +	/*get pmic irq num*/
Comments are mostly fiarly obvious.
Also if there is one, why use an array read?

> +	ret = of_property_read_u32_array(np, "irq-num",
> +					 &pmic->irqnum, 1);
> +	if (ret) {
> +		pr_err("no irq-num property set\n");
> +		ret = -ENODEV;
> +		return ret;
> +	}
> +
> +	/*get pmic irq array number*/
> +	ret = of_property_read_u32_array(np, "irq-array",
> +					 &pmic->irqarray, 1);
> +	if (ret) {
> +		pr_err("no irq-array property set\n");
> +		ret = -ENODEV;
> +		return ret;
> +	}
> +
> +	/*SOC_PMIC_IRQ_MASK_0_ADDR*/
spacing in comments.

> +	ret = of_property_read_u32_array(np, "irq-mask-addr",
> +					 (int *)&pmic->irq_mask_addr, 2);
> +	if (ret) {
> +		pr_err("no irq-mask-addr property set\n");
> +		ret = -ENODEV;
> +		return ret;
> +	}
> +
> +	/*SOC_PMIC_IRQ0_ADDR*/

These superficially feel like things that would come from
the compatible, but maybe I'm missing something.

> +	ret = of_property_read_u32_array(np, "irq-addr",
> +					 (int *)&pmic->irq_addr, 2);

Unsurprisingly this takes a u32 * not a int *

> +	if (ret) {f_prop
> +		pr_err("no irq-addr property set\n");
> +		ret = -ENODEV;
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void hi6421_spmi_pmic_irq_prc(struct hi6421_spmi_pmic *pmic)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < pmic->irq_mask_addr.array; i++)
> +		hi6421_spmi_pmic_write(pmic, pmic->irq_mask_addr.start_addr + i,
> +				       HISI_MASK_STATE);
> +
> +	for (i = 0 ; i < pmic->irq_addr.array; i++) {
> +		unsigned int pending = hi6421_spmi_pmic_read(pmic, pmic->irq_addr.start_addr + i);
> +
> +		pr_debug("PMU IRQ address value:irq[0x%x] = 0x%x\n",
> +			 pmic->irq_addr.start_addr + i, pending);
> +		hi6421_spmi_pmic_write(pmic, pmic->irq_addr.start_addr + i,
> +				       HISI_MASK_STATE);
> +	}
> +}
> +
> +static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct hi6421_spmi_pmic *pmic = NULL;
> +	enum of_gpio_flags flags;
> +	int ret = 0;
> +	int i;
> +	unsigned int virq;
> +
> +	pmic = devm_kzalloc(dev, sizeof(*pmic), GFP_KERNEL);
> +	if (!pmic)
> +		return -ENOMEM;
> +
> +	/*TODO: get pmic dts info*/

Seems to be done?

> +	ret = get_pmic_device_tree_data(np, pmic);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Error reading hisi pmic dts\n");
> +		return ret;
> +	}
> +
> +	/* TODO: get and enable clk request */
> +	spin_lock_init(&pmic->lock);
> +
> +	pmic->dev = dev;
> +
> +	pmic->gpio = of_get_gpio_flags(np, 0, &flags);

Do we need flags for something?

Can we use the gpio/consumer.h interfaces for all this?

Though I'm not sure we need a gpio at all. Looks like we just
use it as an interrupt.  Get an interrupt directly instead.



> +	if (pmic->gpio < 0)
> +		return pmic->gpio;
> +
> +	if (!gpio_is_valid(pmic->gpio))
> +		return -EINVAL;
> +
> +	ret = gpio_request_one(pmic->gpio, GPIOF_IN, "pmic");
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request gpio%d\n", pmic->gpio);
> +		return ret;
> +	}
> +
> +	pmic->irq = gpio_to_irq(pmic->gpio);
> +
> +	/* mask && clear IRQ status */
> +	hi6421_spmi_pmic_irq_prc(pmic);
> +
> +	pmic->irqs = devm_kzalloc(dev, pmic->irqnum * sizeof(int), GFP_KERNEL);
> +	if (!pmic->irqs)
> +		goto irq_malloc;
> +
> +	pmic->domain = irq_domain_add_simple(np, pmic->irqnum, 0,
> +					     &hi6421_spmi_domain_ops, pmic);
> +	if (!pmic->domain) {
> +		dev_err(dev, "failed irq domain add simple!\n");
> +		ret = -ENODEV;
> +		goto irq_domain;
> +	}
> +
> +	for (i = 0; i < pmic->irqnum; i++) {
> +		virq = irq_create_mapping(pmic->domain, i);
> +		if (virq == NO_IRQ) {
> +			pr_debug("Failed mapping hwirq\n");
> +			ret = -ENOSPC;
> +			goto irq_create_mapping;
> +		}
> +		pmic->irqs[i] = virq;
> +		pr_info("[%s]. pmic->irqs[%d] = %d\n", __func__, i, pmic->irqs[i]);

Noise

> +	}
> +
> +	ret = request_threaded_irq(pmic->irq, hi6421_spmi_irq_handler, NULL,
> +				   IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
> +				   "pmic", pmic);
> +	if (ret < 0) {
> +		dev_err(dev, "could not claim pmic %d\n", ret);
> +		ret = -ENODEV;
> +		goto request_theaded_irq;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, pmic);
> +
> +	/*
> +	 * The logic below will rely that the pmic is already stored at
> +	 * drvdata.
> +	 */
> +	dev_dbg(&pdev->dev, "SPMI-PMIC: adding children for %pOF\n",
> +		pdev->dev.of_node);
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +				   hi6421v600_devs, ARRAY_SIZE(hi6421v600_devs),
> +				   NULL, 0, NULL);

This is mixing and matching managed an unmanaged. Should be one or the other
or we might be hiding some race conditions.


> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to add child devices: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +request_theaded_irq:
> +irq_create_mapping:
> +irq_domain:
> +irq_malloc:
> +	gpio_free(pmic->gpio);
> +	return ret;
> +}
> +
> +static void hi6421_spmi_pmic_remove(struct spmi_device *pdev)
> +{
> +	struct hi6421_spmi_pmic *pmic = dev_get_drvdata(&pdev->dev);
> +
> +	free_irq(pmic->irq, pmic);
> +	gpio_free(pmic->gpio);
> +	devm_kfree(&pdev->dev, pmic);

I hope that isn't needed!

> +}
> +
> +static const struct of_device_id pmic_spmi_id_table[] = {
> +	{ .compatible = "hisilicon,hi6421-spmi-pmic" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
> +
> +static struct spmi_driver hi6421_spmi_pmic_driver = {
> +	.driver = {
> +		.name	= "hi6421-spmi-pmic",
> +		.of_match_table = pmic_spmi_id_table,
> +	},
> +	.probe	= hi6421_spmi_pmic_probe,
> +	.remove	= hi6421_spmi_pmic_remove,
> +};
> +module_spmi_driver(hi6421_spmi_pmic_driver);
> +
> +MODULE_DESCRIPTION("HiSilicon Hi6421v600 SPMI PMIC driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index edb1c4f8b496..de8a78487bb9 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -356,6 +356,14 @@ config REGULATOR_HI6421V530
>  	  provides 5 general purpose LDOs, and all of them come with support
>  	  to either ECO (idle) or sleep mode.
>  
> +config REGULATOR_HI6421V600
> +	tristate "HiSilicon Hi6421v600 PMIC voltage regulator support"
> +	depends on MFD_HI6421_PMIC && OF

Can we do a COMPILE_TEST here?

> +	help
> +	  This driver provides support for the voltage regulators on
> +	  HiSilicon Hi6421v600 PMU / Codec IC.
> +	  This is used on Kirin 3670 boards, like HiKey 970.
> +
>  config REGULATOR_HI655X
>  	tristate "Hisilicon HI655X PMIC regulators support"
>  	depends on ARCH_HISI || COMPILE_TEST
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 0796e4a47afa..f59d5e3b5fd4 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_REGULATOR_FAN53555) += fan53555.o
>  obj-$(CONFIG_REGULATOR_GPIO) += gpio-regulator.o
>  obj-$(CONFIG_REGULATOR_HI6421) += hi6421-regulator.o
>  obj-$(CONFIG_REGULATOR_HI6421V530) += hi6421v530-regulator.o
> +obj-$(CONFIG_REGULATOR_HI6421V600) += hi6421v600-regulator.o
>  obj-$(CONFIG_REGULATOR_HI655X) += hi655x-regulator.o
>  obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
>  obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
> diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
> new file mode 100644
> index 000000000000..c80dfac1e4c3
> --- /dev/null
> +++ b/drivers/regulator/hi6421v600-regulator.c
> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device driver for regulators in Hisi IC
> + *
> + * Copyright (c) 2013 Linaro Ltd.
> + * Copyright (c) 2011 Hisilicon.
> + *
> + * Guodong Xu <guodong.xu@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Need to remove license text as have SPDX.

Blank line doesn't add anything here.


> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/mfd/hi6421-spmi-pmic.h>
> +#include <linux/delay.h>
> +#include <linux/time.h>
> +#include <linux/version.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +#include <linux/spmi.h>
> +
> +#define rdev_dbg(rdev, fmt, arg...)	\
> +		 pr_debug("%s: %s: " fmt, (rdev)->desc->name, __func__, ##arg)

Not worth defining in my view.

> +
> +struct hi6421v600_regulator {
> +	struct regulator_desc rdesc;
> +	struct hi6421_spmi_pmic *pmic;
> +	u32 eco_mode_mask, eco_uA;
> +};
> +
> +static DEFINE_MUTEX(enable_mutex);
> +
> +/* helper function to ensure when it returns it is at least 'delay_us'
> + * microseconds after 'since'.
> + */
> +
> +static int hi6421_spmi_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	u32 reg_val;
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +
> +	reg_val = hi6421_spmi_pmic_read(pmic, rdev->desc->enable_reg);
> +
> +	rdev_dbg(rdev,
> +		 "enable_reg=0x%x, val= 0x%x, enable_state=%d\n",
> +		 rdev->desc->enable_reg,
> +		 reg_val, (reg_val & rdev->desc->enable_mask));
> +
> +	return ((reg_val & rdev->desc->enable_mask) != 0);
> +}
> +
> +static int hi6421_spmi_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +
> +	/* cannot enable more than one regulator at one time */
> +	mutex_lock(&enable_mutex);
> +	usleep_range(HISI_REGS_ENA_PROTECT_TIME,
> +		     HISI_REGS_ENA_PROTECT_TIME + 1000);
> +
> +	/* set enable register */
> +	rdev_dbg(rdev,
> +		 "off_on_delay=%d us, enable_reg=0x%x, enable_mask=0x%x\n",
> +		 rdev->desc->off_on_delay, rdev->desc->enable_reg,
> +		 rdev->desc->enable_mask);
> +
> +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
> +			     rdev->desc->enable_mask,
> +			     rdev->desc->enable_mask);
> +
> +	mutex_unlock(&enable_mutex);
> +
> +	return 0;
> +}
> +
> +static int hi6421_spmi_regulator_disable(struct regulator_dev *rdev)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +
> +	/* set enable register to 0 */
> +	rdev_dbg(rdev, "enable_reg=0x%x, enable_mask=0x%x\n",
> +		 rdev->desc->enable_reg, rdev->desc->enable_mask);
> +
> +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
> +			     rdev->desc->enable_mask, 0);
> +
> +	return 0;
> +}
> +
> +static int hi6421_spmi_regulator_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +	u32 reg_val, selector;
> +
> +	/* get voltage selector */
> +	reg_val = hi6421_spmi_pmic_read(pmic, rdev->desc->vsel_reg);
> +
> +	selector = (reg_val & rdev->desc->vsel_mask) >>	(ffs(rdev->desc->vsel_mask) - 1);
> +
> +	rdev_dbg(rdev,
> +		 "vsel_reg=0x%x, value=0x%x, entry=0x%x, voltage=%d mV\n",
> +		 rdev->desc->vsel_reg, reg_val, selector,
> +		rdev->desc->ops->list_voltage(rdev, selector) / 1000);
> +
> +	return selector;
> +}
> +
> +static int hi6421_spmi_regulator_set_voltage_sel(struct regulator_dev *rdev,
> +						 unsigned int selector)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +	u32 reg_val;
> +
> +	/* unlikely to happen. sanity test done by regulator core */

Unlikely or can't?

> +	if (unlikely(selector >= rdev->desc->n_voltages))
> +		return -EINVAL;
> +
> +	reg_val = selector << (ffs(rdev->desc->vsel_mask) - 1);
> +
> +	/* set voltage selector */
> +	rdev_dbg(rdev,
> +		 "vsel_reg=0x%x, mask=0x%x, value=0x%x, voltage=%d mV\n",
> +		 rdev->desc->vsel_reg, rdev->desc->vsel_mask, reg_val,
> +		 rdev->desc->ops->list_voltage(rdev, selector) / 1000);
> +
> +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->vsel_reg,
> +			     rdev->desc->vsel_mask, reg_val);
> +
> +	return 0;
> +}
> +
> +static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +	u32 reg_val;
> +	unsigned int mode;
> +
> +	reg_val = hi6421_spmi_pmic_read(pmic, rdev->desc->enable_reg);
> +
> +	if (reg_val & sreg->eco_mode_mask)
> +		mode = REGULATOR_MODE_IDLE;
> +	else
> +		mode = REGULATOR_MODE_NORMAL;
> +
> +	rdev_dbg(rdev,
> +		 "enable_reg=0x%x, eco_mode_mask=0x%x, reg_val=0x%x, %s mode\n",
> +		 rdev->desc->enable_reg, sreg->eco_mode_mask, reg_val,
> +		 mode == REGULATOR_MODE_IDLE ? "idle" : "normal");
> +
> +	return mode;
> +}
> +
> +static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
> +					  unsigned int mode)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> +	u32 val;
> +
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
> +		val = 0;
> +		break;
> +	case REGULATOR_MODE_IDLE:
> +		val = sreg->eco_mode_mask << (ffs(sreg->eco_mode_mask) - 1);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* set mode */
> +	rdev_dbg(rdev, "enable_reg=0x%x, eco_mode_mask=0x%x, value=0x%x\n",
> +		 rdev->desc->enable_reg, sreg->eco_mode_mask, val);
> +
> +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
> +			     sreg->eco_mode_mask, val);
> +
> +	return 0;
> +}
> +
> +static unsigned int
> +hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
> +				       int input_uV, int output_uV,
> +				       int load_uA)
> +{
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +
> +	if (load_uA || ((unsigned int)load_uA > sreg->eco_uA)) {
> +		rdev_dbg(rdev, "normal mode");

Debug seems unnecessary to me, but maybe keep it if you want.

> +		return REGULATOR_MODE_NORMAL;
> +	} else {
> +		rdev_dbg(rdev, "idle mode");
> +		return REGULATOR_MODE_IDLE;
> +	}
> +}
> +
> +static int hi6421_spmi_dt_parse(struct platform_device *pdev,
> +				struct hi6421v600_regulator *sreg,
> +			 struct regulator_desc *rdesc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	unsigned int *v_table;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "reg", &rdesc->enable_reg);
> +	if (ret) {
> +		dev_err(dev, "missing reg property\nn");
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(np, "vsel-reg", &rdesc->vsel_reg);
> +	if (ret) {
> +		dev_err(dev, "missing vsel-reg property\n");
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(np, "enable-mask", &rdesc->enable_mask);
> +	if (ret) {
> +		dev_err(dev, "missing enable-mask property\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Not all regulators work on idle mode
> +	 */
> +	ret = of_property_read_u32(np, "idle-mode-mask", &sreg->eco_mode_mask);
> +	if (ret) {
> +		dev_dbg(dev, "LDO doesn't support economy mode.\n");
> +		sreg->eco_mode_mask = 0;
> +		sreg->eco_uA = 0;
> +	} else {
> +		ret = of_property_read_u32(np, "eco-microamp",
> +					   &sreg->eco_uA);

one line.

> +		if (ret) {
> +			dev_err(dev, "missing eco-microamp property\n");
> +			return ret;
> +		}
> +	}
> +
> +	/* parse .off-on-delay */
> +	ret = of_property_read_u32(np, "off-on-delay-us",
> +				   &rdesc->off_on_delay);
> +	if (ret) {
> +		dev_err(dev, "missing off-on-delay-us property\n");
> +		return ret;
> +	}
> +
> +	/* parse .enable_time */
> +	ret = of_property_read_u32(np, "startup-delay-us",
> +				   &rdesc->enable_time);
> +	if (ret) {
> +		dev_err(dev, "missing startup-delay-us property\n");
> +		return ret;
> +	}
> +
> +	/* FIXME: are there a better value for this? */
> +	rdesc->ramp_delay = rdesc->enable_time;
> +
> +	/* parse volt_table */
> +
> +	rdesc->n_voltages = of_property_count_u32_elems(np, "voltage-table");
> +
> +	v_table = devm_kzalloc(dev, sizeof(unsigned int) * rdesc->n_voltages,
> +			       GFP_KERNEL);
> +	if (unlikely(!v_table))
> +		return  -ENOMEM;
> +	rdesc->volt_table = v_table;
> +
> +	ret = of_property_read_u32_array(np, "voltage-table",
> +					 v_table, rdesc->n_voltages);
> +	if (ret) {
> +		dev_err(dev, "missing voltage-table property\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Instead of explicitly requiring a mask for the voltage selector,
> +	 * as they all start from bit zero (at least on the known LDOs),
> +	 * just use the number of voltages at the voltage table, getting the
> +	 * minimal mask that would pick everything.
> +	 */
> +	rdesc->vsel_mask = (1 << (fls(rdesc->n_voltages) - 1)) - 1;
> +
> +	dev_dbg(dev, "voltage selector settings: reg: 0x%x, mask: 0x%x",
> +		rdesc->vsel_reg, rdesc->vsel_mask);
> +
> +	return 0;
> +}
> +
> +static struct regulator_ops hi6421_spmi_ldo_rops = {
> +	.is_enabled = hi6421_spmi_regulator_is_enabled,
> +	.enable = hi6421_spmi_regulator_enable,
> +	.disable = hi6421_spmi_regulator_disable,
> +	.list_voltage = regulator_list_voltage_table,
> +	.map_voltage = regulator_map_voltage_iterate,
> +	.get_voltage_sel = hi6421_spmi_regulator_get_voltage_sel,
> +	.set_voltage_sel = hi6421_spmi_regulator_set_voltage_sel,
> +	.get_mode = hi6421_spmi_regulator_get_mode,
> +	.set_mode = hi6421_spmi_regulator_set_mode,
> +	.get_optimum_mode = hi6421_spmi_regulator_get_optimum_mode,
> +};
> +
> +/*
> + * Used only for parsing the DT properties
Odd comment. Clearly does more than that.

> + */
> +
> +static int hi6421_spmi_regulator_probe_ldo(struct platform_device *pdev,
> +					   struct device_node *np,
> +					   struct hi6421_spmi_pmic *pmic)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_desc *rdesc;
> +	struct regulator_dev *rdev;
> +	struct hi6421v600_regulator *sreg = NULL;

Always set.

> +	struct regulator_init_data *initdata;
> +	struct regulator_config config = { };
> +	struct regulation_constraints *constraint;
> +	const char *supplyname = NULL;
> +	int ret = 0;

Always set I think

> +
> +	initdata = of_get_regulator_init_data(dev, np, NULL);
> +	if (!initdata) {
> +		dev_err(dev, "failed to get regulator data\n");
> +		return -EINVAL;
> +	}
> +
> +	sreg = kzalloc(sizeof(*sreg), GFP_KERNEL);

> +	if (!sreg)
> +		return -ENOMEM;
> +
> +	sreg->pmic = pmic;
> +	rdesc = &sreg->rdesc;
> +
> +	rdesc->name = initdata->constraints.name;
> +	rdesc->ops = &hi6421_spmi_ldo_rops;
> +	rdesc->type = REGULATOR_VOLTAGE;
> +	rdesc->min_uV = initdata->constraints.min_uV;
> +
> +	supplyname = of_get_property(np, "supply_name", NULL);
> +	if (supplyname)
> +		initdata->supply_regulator = supplyname;
> +
> +	/* parse device tree data for regulator specific */
> +	ret = hi6421_spmi_dt_parse(pdev, sreg, rdesc);
> +	if (ret)
> +		goto probe_end;
> +
> +	/* hisi regulator supports two modes */
> +	constraint = &initdata->constraints;
> +
> +	constraint->valid_modes_mask = REGULATOR_MODE_NORMAL;
> +	if (sreg->eco_mode_mask) {
> +		constraint->valid_modes_mask |= REGULATOR_MODE_IDLE;
> +		constraint->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> +	}
> +
> +	config.dev = &pdev->dev;
> +	config.init_data = initdata;
> +	config.driver_data = sreg;
> +	config.of_node = pdev->dev.of_node;
> +
> +	/* register regulator */
> +	rdev = regulator_register(rdesc, &config);
> +	if (IS_ERR(rdev)) {
> +		dev_err(dev, "failed to register %s\n",
> +			rdesc->name);
> +		ret = PTR_ERR(rdev);
> +		goto probe_end;
> +	}
> +
> +	rdev_dbg(rdev, "valid_modes_mask: 0x%x, valid_ops_mask: 0x%x\n",
> +		 constraint->valid_modes_mask, constraint->valid_ops_mask);
> +
> +	dev_set_drvdata(dev, rdev);
I'd do separate error path.

	return 0;

> +probe_end:
> +	if (ret)

ret is set if separate error path.
I haven't figured out lifetime but can we not use devm for sreg?

> +		kfree(sreg);
> +	return ret;
> +}
> +
> +static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
> +{
> +	struct device *pmic_dev = pdev->dev.parent;
> +	struct device_node *np = pmic_dev->of_node;
> +	struct device_node *regulators, *child;
> +	struct platform_device *new_pdev;
> +	struct hi6421_spmi_pmic *pmic;
> +	int ret;
> +
> +	dev_dbg(&pdev->dev, "probing hi6421v600 regulator\n");

Noise.

> +	/*
> +	 * This driver is meant to be called by hi6421-spmi-core,
> +	 * which should first set drvdata. If this doesn't happen, hit
> +	 * a warn on and return.
> +	 */
> +	pmic = dev_get_drvdata(pmic_dev);
> +	if (WARN_ON(!pmic))
> +		return -ENODEV;
> +
> +	regulators = of_get_child_by_name(np, "regulators");
> +	if (!regulators) {
> +		dev_err(&pdev->dev, "regulator node not found\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Parse all LDO regulator nodes
> +	 */
> +	for_each_child_of_node(regulators, child) {
> +		dev_dbg(&pdev->dev, "adding child %pOF\n", child);
> +
> +		new_pdev = platform_device_alloc(child->name, -1);
> +		new_pdev->dev.parent = pmic_dev;
> +		new_pdev->dev.of_node = of_node_get(child);
> +
> +		ret = platform_device_add(new_pdev);
> +		if (ret < 0) {
> +			platform_device_put(new_pdev);
> +			continue;
> +		}
> +
> +		ret = hi6421_spmi_regulator_probe_ldo(new_pdev, child, pmic);
> +		if (ret < 0)
> +			platform_device_put(new_pdev);
> +	}
> +
> +	of_node_put(regulators);
> +
> +	return 0;
> +}
> +
> +static int hi6421_spmi_regulator_remove(struct platform_device *pdev)
> +{
> +	struct regulator_dev *rdev = dev_get_drvdata(&pdev->dev);
> +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> +
> +	regulator_unregister(rdev);
> +
> +	/* TODO: should i worry about that? devm_kzalloc */

Answer that TODO.  No unless something odd going on.

> +	if (rdev->desc->volt_table)
> +		devm_kfree(&pdev->dev, (unsigned int *)rdev->desc->volt_table);
> +
> +	kfree(sreg);

This is a worrying mix of devm and not.  Never a good sign.
Lifetime of sreg seems strange.

> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id hi6421v600_regulator_table[] = {
> +	{ .name = "hi6421v600-regulator" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, hi6421v600_regulator_table);
> +
> +static struct platform_driver hi6421v600_regulator_driver = {
> +	.id_table = hi6421v600_regulator_table,
> +	.driver = {
> +		.name	= "hi6421v600-regulator",
> +	},
> +	.probe	= hi6421_spmi_regulator_probe,
> +	.remove	= hi6421_spmi_regulator_remove,
> +};
> +module_platform_driver(hi6421v600_regulator_driver);
> +
> +MODULE_DESCRIPTION("Hi6421v600 regulator driver");
> +MODULE_LICENSE("GPL v2");
> +
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a53bad541f1a..b44e2ab6bf81 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -25,4 +25,13 @@ config SPMI_MSM_PMIC_ARB
>  	  This is required for communicating with Qualcomm PMICs and
>  	  other devices that have the SPMI interface.
>  
> +config SPMI_HISI3670
> +	tristate "Hisilicon 3670 SPMI Controller"
> +	select IRQ_DOMAIN_HIERARCHY
> +	depends on HAS_IOMEM

I have a vague recollection some magic was done to mean we don't need that
any more (stubs for the few cases where it doesn't exist).
Could have remembered wrong though.

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  built-in SPMI PMIC Arbiter interface on Hisilicon 3670
> +	  processors.
> +
>  endif
> diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
> index 55a94cadeffe..694853e391cb 100644
> --- a/drivers/spmi/Makefile
> +++ b/drivers/spmi/Makefile
> @@ -5,3 +5,5 @@
>  obj-$(CONFIG_SPMI)	+= spmi.o
>  
>  obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
> +
> +obj-$(CONFIG_SPMI_HISI3670) += hisi-spmi-controller.o
> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
> new file mode 100644
> index 000000000000..153bcdb0cde4
> --- /dev/null
> +++ b/drivers/spmi/hisi-spmi-controller.c
> @@ -0,0 +1,384 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

I don't know much about spmi so this is very much a drive by review.

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/seq_file.h>
> +#include <linux/spmi.h>

Nice to do alphabetical if no reason to do otherwise.

> +
> +#define SPMI_CONTROLLER_NAME		"spmi_controller"

Feels like we should have hisi in there.
Also should prefix naming throughout with HISI_SPMI

> +
> +/*
> + * SPMI register addr
> + */
> +#define SPMI_CHANNEL_OFFSET				0x0300
> +#define SPMI_SLAVE_OFFSET				0x20
> +
> +#define SPMI_APB_SPMI_CMD_BASE_ADDR			0x0100
> +
> +#define SPMI_APB_SPMI_WDATA0_BASE_ADDR			0x0104
> +#define SPMI_APB_SPMI_WDATA1_BASE_ADDR			0x0108
> +#define SPMI_APB_SPMI_WDATA2_BASE_ADDR			0x010c
> +#define SPMI_APB_SPMI_WDATA3_BASE_ADDR			0x0110
> +
> +#define SPMI_APB_SPMI_STATUS_BASE_ADDR			0x0200
> +
> +#define SPMI_APB_SPMI_RDATA0_BASE_ADDR			0x0204
> +#define SPMI_APB_SPMI_RDATA1_BASE_ADDR			0x0208
> +#define SPMI_APB_SPMI_RDATA2_BASE_ADDR			0x020c
> +#define SPMI_APB_SPMI_RDATA3_BASE_ADDR			0x0210
> +
> +#define SPMI_PER_DATAREG_BYTE				4
> +/*
> + * SPMI cmd register
> + */
> +#define SPMI_APB_SPMI_CMD_EN				BIT(31)
> +#define SPMI_APB_SPMI_CMD_TYPE_OFFSET			24
> +#define SPMI_APB_SPMI_CMD_LENGTH_OFFSET			20
> +#define SPMI_APB_SPMI_CMD_SLAVEID_OFFSET		16
> +#define SPMI_APB_SPMI_CMD_ADDR_OFFSET			0
> +
> +/* Command Opcodes */
> +
> +enum spmi_controller_cmd_op_code {
> +	SPMI_CMD_REG_ZERO_WRITE = 0,
> +	SPMI_CMD_REG_WRITE = 1,
> +	SPMI_CMD_REG_READ = 2,
> +	SPMI_CMD_EXT_REG_WRITE = 3,
> +	SPMI_CMD_EXT_REG_READ = 4,
> +	SPMI_CMD_EXT_REG_WRITE_L = 5,
> +	SPMI_CMD_EXT_REG_READ_L = 6,
> +	SPMI_CMD_REG_RESET = 7,
> +	SPMI_CMD_REG_SLEEP = 8,
> +	SPMI_CMD_REG_SHUTDOWN = 9,
> +	SPMI_CMD_REG_WAKEUP = 10,
> +};
> +
> +/*
> + * SPMI status register
> + */
> +#define SPMI_APB_TRANS_DONE			BIT(0)
> +#define SPMI_APB_TRANS_FAIL			BIT(2)
> +
> +/* Command register fields */
> +#define SPMI_CONTROLLER_CMD_MAX_BYTE_COUNT	16
> +
> +/* Maximum number of support PMIC peripherals */
> +#define SPMI_CONTROLLER_TIMEOUT_US		1000
> +#define SPMI_CONTROLLER_MAX_TRANS_BYTES		16
> +
> +/*

Nice to make this both correct kernel doc and reflect the
structure I assume it is documenting.

> + * @base base address of the PMIC Arbiter core registers.
> + * @rdbase, @wrbase base address of the PMIC Arbiter read core registers.
> + *     For HW-v1 these are equal to base.
> + *     For HW-v2, the value is the same in eeraly probing, in order to read
> + *     PMIC_ARB_CORE registers, then chnls, and obsrvr are set to
> + *     PMIC_ARB_CORE_REGISTERS and PMIC_ARB_CORE_REGISTERS_OBS respectivly.
> + * @intr base address of the SPMI interrupt control registers
> + * @ppid_2_chnl_tbl lookup table f(SID, Periph-ID) -> channel num
> + *      entry is only valid if corresponding bit is set in valid_ppid_bitmap.
> + * @valid_ppid_bitmap bit is set only for valid ppids.
> + * @fmt_cmd formats a command to be set into PMIC_ARBq_CHNLn_CMD
> + * @chnl_ofst calculates offset of the base of a channel reg space
> + * @ee execution environment id
> + * @irq_acc0_init_val initial value of the interrupt accumulator at probe time.
> + *      Use for an HW workaround. On handling interrupts, the first accumulator
> + *      register will be compared against this value, and bits which are set at
> + *      boot will be ignored.
> + * @reserved_chnl entry of ppid_2_chnl_tbl that this driver should never touch.
> + *      value is positive channel number or negative to mark it unused.
> + */
> +struct spmi_controller_dev {
> +	struct spmi_controller	*controller;
> +	struct device		*dev;
> +	void __iomem		*base;
> +	spinlock_t		lock;
> +	u32			channel;
> +};
> +
> +static int spmi_controller_wait_for_done(struct device *dev,
> +					 struct spmi_controller_dev *ctrl_dev,
> +					 void __iomem *base, u8 sid, u16 addr)
> +{
> +	u32 status = 0;

always set.

> +	u32 timeout = SPMI_CONTROLLER_TIMEOUT_US;
> +	u32 offset;
> +
> +	offset  = SPMI_APB_SPMI_STATUS_BASE_ADDR;
> +	offset += SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * sid;
> +
> +	while (timeout--) {
> +		status = readl(base + offset);
> +
> +		if (status & SPMI_APB_TRANS_DONE) {
> +			if (status & SPMI_APB_TRANS_FAIL) {
> +				dev_err(dev, "%s: transaction failed (0x%x)\n",
> +					__func__, status);
> +				return -EIO;
> +			}
> +			dev_dbg(dev, "%s: status 0x%x\n", __func__, status);
> +			return 0;
> +		}
> +		udelay(1);
> +	}
> +
> +	dev_err(dev, "%s: timeout, status 0x%x\n", __func__, status);
> +	return -ETIMEDOUT;
> +}
> +
> +static int spmi_read_cmd(struct spmi_controller *ctrl,
> +			 u8 opc, u8 sid, u16 addr, u8 *__buf, size_t bc)
> +{

Same stuff as for the write below.

> +	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
> +	unsigned long flags;
> +	u8 *buf = __buf;
> +	u32 cmd, data;
> +	int rc;
> +	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
> +	u8 op_code, i;
> +
> +	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
> +		dev_err(&ctrl->dev,
> +			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
> +			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
> +		return  -EINVAL;
> +	}
> +
> +	/* Check the opcode */
> +	if (opc == SPMI_CMD_READ) {
> +		op_code = SPMI_CMD_REG_READ;
> +	} else if (opc == SPMI_CMD_EXT_READ) {
> +		op_code = SPMI_CMD_EXT_REG_READ;
> +	} else if (opc == SPMI_CMD_EXT_READL) {
> +		op_code = SPMI_CMD_EXT_REG_READ_L;
> +	} else {
> +		dev_err(&ctrl->dev, "invalid read cmd 0x%x", opc);
> +		return -EINVAL;
> +	}
> +
> +	cmd = SPMI_APB_SPMI_CMD_EN |
> +	     (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |
> +	     ((bc - 1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |
> +	     ((sid & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |  /* slvid */
> +	     ((addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET); /* slave_addr */
> +
> +	spin_lock_irqsave(&spmi_controller->lock, flags);
> +
> +	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
> +
> +	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
> +					   spmi_controller->base, sid, addr);
> +	if (rc)
> +		goto done;
> +
> +	i = 0;
> +	do {
> +		data = readl(spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET * sid + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i * SPMI_PER_DATAREG_BYTE);
> +		data = be32_to_cpu((__be32)data);
> +		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
> +			memcpy(buf, &data, sizeof(data));
> +			buf += sizeof(data);
> +		} else {
> +			memcpy(buf, &data, bc % SPMI_PER_DATAREG_BYTE);
> +			buf += (bc % SPMI_PER_DATAREG_BYTE);
> +		}
> +		i++;
> +	} while (bc > i * SPMI_PER_DATAREG_BYTE);
> +
> +done:
> +	spin_unlock_irqrestore(&spmi_controller->lock, flags);
> +	if (rc)
> +		dev_err(&ctrl->dev,
> +			"spmi read wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
> +			opc, sid, addr, bc + 1);
> +	else
> +		dev_dbg(&ctrl->dev, "%s: id:%d addr:0x%x, read value: %*ph\n",
> +			__func__, sid, addr, (int)bc, __buf);
> +
> +	return rc;
> +}
> +
> +static int spmi_write_cmd(struct spmi_controller *ctrl,
> +			  u8 opc, u8 sid, u16 addr, const u8 *__buf, size_t bc)
> +{
> +	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
> +	const u8 *buf = __buf;
> +	unsigned long flags;
> +	u32 cmd, data;
> +	int rc;
> +	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
> +	u8 op_code, i;
> +
> +	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
> +		dev_err(&ctrl->dev,
> +			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
> +			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
> +		return  -EINVAL;
> +	}
> +
> +	/* Check the opcode */

Kind of obvious given the code :)

> +	if (opc == SPMI_CMD_WRITE) {
> +		op_code = SPMI_CMD_REG_WRITE;
> +	} else if (opc == SPMI_CMD_EXT_WRITE) {
> +		op_code = SPMI_CMD_EXT_REG_WRITE;
> +	} else if (opc == SPMI_CMD_EXT_WRITEL) {
> +		op_code = SPMI_CMD_EXT_REG_WRITE_L;

Looks like something better expressed as a switch statement to me.

> +	} else {
> +		dev_err(&ctrl->dev, "invalid write cmd 0x%x", opc);
> +		return -EINVAL;
> +	}
> +
> +	cmd = SPMI_APB_SPMI_CMD_EN |
> +	      (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |
> +	      ((bc - 1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |
> +	      ((sid & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |  /* slvid */
> +	      ((addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET); /* slave_addr */
Those two comments pretty clearly highlight that names of variables could
be better.

could we use FIELD_PREP and friends to do this more neatly?

> +
> +	/* Write data to FIFOs */
> +	spin_lock_irqsave(&spmi_controller->lock, flags);
> +
> +	i = 0;
> +	do {
> +		data = 0;
> +		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
> +			memcpy(&data, buf, sizeof(data));
> +			buf += sizeof(data);
> +		} else {
> +			memcpy(&data, buf, bc % SPMI_PER_DATAREG_BYTE);
> +			buf += (bc % SPMI_PER_DATAREG_BYTE);
> +		}
> +
> +		writel((u32)cpu_to_be32(data),
> +		       spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR + SPMI_PER_DATAREG_BYTE * i);
> +		i++;
> +	} while (bc > i * SPMI_PER_DATAREG_BYTE);
> +
> +	/* Start the transaction */
> +	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
> +
> +	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
> +					   spmi_controller->base, sid, addr);
> +	spin_unlock_irqrestore(&spmi_controller->lock, flags);
> +
> +	if (rc)
> +		dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
> +			opc, sid, addr, bc);
> +	else
> +		dev_dbg(&ctrl->dev, "%s: id:%d addr:0x%x, wrote value: %*ph\n",
> +			__func__, sid, addr, (int)bc, __buf);

I'd drop the debug.  Adds a lot of code for limited benefit.

> +
> +	return rc;
> +}
> +
> +static int spmi_controller_probe(struct platform_device *pdev)
> +{
> +	struct spmi_controller_dev *spmi_controller;
> +	struct spmi_controller *ctrl;
> +	struct resource *iores;
> +	int ret = 0;
Fairly sure that's set in all paths.

> +
> +	dev_info(&pdev->dev, "HISI SPMI probe\n");

Too noisy

> +
> +	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));

We don't seem to clean this up in failure paths.

> +	if (!ctrl) {
> +		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
> +		return -ENOMEM;
> +	}
> +	spmi_controller = spmi_controller_get_drvdata(ctrl);
> +	spmi_controller->controller = ctrl;
> +
> +	/* NOTE: driver uses the static register mapping */

Do we need to Note it for some reason I'm not seeing?

> +	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!iores) {
> +		dev_err(&pdev->dev, "can not get resource!\n");
> +		return -EINVAL;
> +	}
> +
> +	spmi_controller->base = ioremap(iores->start, resource_size(iores));
> +	if (!spmi_controller->base) {
> +		dev_err(&pdev->dev, "can not remap base addr!\n");
> +		return -EADDRNOTAVAIL;
> +	}
> +	dev_dbg(&pdev->dev, "spmi_add_controller base addr=0x%lx!\n",
> +		(unsigned long)spmi_controller->base);

I doubt that one is ever of any use to anyone after initial driver
writing. I'd drop it.

> +
> +	/* Get properties from the device tree */

Comment doesn't add anything

> +	ret = of_property_read_u32(pdev->dev.of_node, "spmi-channel",
> +				   &spmi_controller->channel);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can not get channel\n");
> +		return -ENODEV;
> +	}
> +
> +	platform_set_drvdata(pdev, spmi_controller);
> +	dev_set_drvdata(&ctrl->dev, spmi_controller);
> +
> +	spin_lock_init(&spmi_controller->lock);
> +
> +	ctrl->nr = spmi_controller->channel;
> +	ctrl->dev.parent = pdev->dev.parent;
> +	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
> +
> +	/* Callbacks */
> +	ctrl->read_cmd = spmi_read_cmd;
> +	ctrl->write_cmd = spmi_write_cmd;
> +
> +	ret = spmi_controller_add(ctrl);
> +	if (ret)
> +		goto err_add_controller;
> +
> +	dev_info(&pdev->dev, "spmi_add_controller initialized\n");

Too noisy.

> +	return 0;
> +
> +err_add_controller:
> +	dev_err(&pdev->dev, "spmi_add_controller failed!\n");

Seems too noisy to me given information provided is minimal.


> +	platform_set_drvdata(pdev, NULL);

not needed.

> +	return ret;
Use direct returns if not cleaning anything up... THough see above,
there are things that I'm fairly sure you should be!

> +}
> +
> +static int spmi_del_controller(struct platform_device *pdev)
> +{
> +	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
> +
> +	platform_set_drvdata(pdev, NULL);

Doubt you need that. Core sets it to null on remove or error.

> +	spmi_controller_remove(ctrl);

It's asking for a devm_spmi_controller_add.  or just go
with devm_add_action_or_reset perhaps.


> +	return 0;
> +}
> +
> +static const struct of_device_id spmi_controller_match_table[] = {
> +	{	.compatible = "hisilicon,spmi-controller",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, spmi_controller_match_table);
> +
> +static struct platform_driver spmi_controller_driver = {
> +	.probe		= spmi_controller_probe,
> +	.remove		= spmi_del_controller,
> +	.driver		= {
> +		.name	= SPMI_CONTROLLER_NAME,
> +		.of_match_table = spmi_controller_match_table,
> +	},
> +};
> +
> +static int __init spmi_controller_init(void)
> +{
> +	return platform_driver_register(&spmi_controller_driver);
> +}
> +postcore_initcall(spmi_controller_init);
> +
> +static void __exit spmi_controller_exit(void)
> +{
> +	platform_driver_unregister(&spmi_controller_driver);
> +}
> +module_exit(spmi_controller_exit);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_VERSION("1.0");
> +MODULE_ALIAS("platform:spmi_controlller");
> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> index c16b60f645a4..253340e10dab 100644
> --- a/drivers/spmi/spmi.c
> +++ b/drivers/spmi/spmi.c

All the changes in here look to be cleanup.  Drop it from this series
as it just adds noise.
> @@ -23,6 +23,7 @@ static DEFINE_IDA(ctrl_ida);
>  static void spmi_dev_release(struct device *dev)
>  {
>  	struct spmi_device *sdev = to_spmi_device(dev);
> +
>  	kfree(sdev);
>  }
>  
> @@ -33,6 +34,7 @@ static const struct device_type spmi_dev_type = {
>  static void spmi_ctrl_release(struct device *dev)
>  {
>  	struct spmi_controller *ctrl = to_spmi_controller(dev);
> +
>  	ida_simple_remove(&ctrl_ida, ctrl->nr);
>  	kfree(ctrl);
>  }
> @@ -487,7 +489,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
>  			continue;
>  
>  		sdev->dev.of_node = node;
> -		sdev->usid = (u8) reg[0];
> +		sdev->usid = (u8)reg[0];
>  
>  		err = spmi_device_add(sdev);
>  		if (err) {
> @@ -531,6 +533,7 @@ EXPORT_SYMBOL_GPL(spmi_controller_add);
>  static int spmi_ctrl_remove_device(struct device *dev, void *data)
>  {
>  	struct spmi_device *spmidev = to_spmi_device(dev);
> +
>  	if (dev->type == &spmi_dev_type)
>  		spmi_device_remove(spmidev);
>  	return 0;
> @@ -545,13 +548,10 @@ static int spmi_ctrl_remove_device(struct device *dev, void *data)
>   */
>  void spmi_controller_remove(struct spmi_controller *ctrl)
>  {
> -	int dummy;
> -
>  	if (!ctrl)
>  		return;
>  
> -	dummy = device_for_each_child(&ctrl->dev, NULL,
> -				      spmi_ctrl_remove_device);
> +	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
>  	device_del(&ctrl->dev);
>  }
>  EXPORT_SYMBOL_GPL(spmi_controller_remove);



