Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4095E1D8FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 08:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgESGKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 02:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgESGKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 02:10:12 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB194C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 23:10:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q9so893242pjm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CP9XCQfG2ZSOCOyU28y4kw4vgrG8+y1NqeqZ3rzvM4g=;
        b=hZkkkcYr7TCepnvL55P/6J8dHRjg8REJE3ncFrbAt/ZVpo8361WTK9qQxzMdecrWF9
         RBFtUujixVKrbkiRapSgr7z9gswuo2So2PknEonPYqsXnwJ/twjD5M56KBOc/dp8gvkt
         ZsWUn8l57ZiaUouxLK07hfkQE/4wtT7sraROJVua7dJ607aPyGHJLqtv7EGEbDKSopYN
         dGS1MmaPY0m58MSjwU3fuy1/r1Vse7xZpW2LXzRNW3YkVaMvIwEUl2OxQDJFVuDQfVr/
         tv2/lHX365YykcVE5S8hp7jbx/jXO3ZwIHojI8JWajIE+LgG/sYgbvTJV0s7yx19ThAN
         i+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CP9XCQfG2ZSOCOyU28y4kw4vgrG8+y1NqeqZ3rzvM4g=;
        b=p+MOgRluOk6KxT45qzrJ14ev47iA7L4LozAu2KiQBmrAKS0vdkZZ3rTTEJwE/wwdSU
         8/J0WhlxMZYZMptnvrdsyFQw/XyfY9twgC+/cY2j06zFA5nRiWnwsgGH2p9Zo9MJzo5v
         CmCMDwngiBA5YHkPs7WgUGKYuhJubePPBHNPSR1mRZSMHMjXIgsUgqsw8/NSx19paAwN
         O/CvudN0y1nyT6JPR5XoGuDJAo67Hz+3444WofyFlVRY+fnyfTj3EDB7e9QozzLuCW4I
         SN2U40SeSusXuiuSjKzrI1OeC2m/7vM85y2sLUqR5IxecwzLdajyxjVM3MSTH6MV2Y6T
         JblA==
X-Gm-Message-State: AOAM530r1MmDAfzyGRI8cAVXT9Pqe1GSW1qk0gr/LODjENxOEvzsd/73
        Pg071d2nCyw5J0/qqcExtcjr/g==
X-Google-Smtp-Source: ABdhPJxbG0yuA+R347TJnZVfPH4vBAWdEp+84InhnBnw+gWgnk4cX8ff7f9TbNmp1nlrQvZlVFFjOQ==
X-Received: by 2002:a17:90a:8b:: with SMTP id a11mr3227727pja.163.1589868611200;
        Mon, 18 May 2020 23:10:11 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cv21sm1187567pjb.23.2020.05.18.23.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 23:10:10 -0700 (PDT)
Date:   Mon, 18 May 2020 23:08:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Eli Riggs <eli@rje.li>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add initial sm6125 SoC support
Message-ID: <20200519060848.GB2165@builder.lan>
References: <20200517115410.3374-1-eli@rje.li>
 <20200517115410.3374-2-eli@rje.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517115410.3374-2-eli@rje.li>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 17 May 04:54 PDT 2020, Eli Riggs wrote:

> Initial support for SM6125 SoC. CPUs, fixed clocks,
> interrupt controller, and UART.
> 
> This DTSI is ported from the forked vendor version from
> XiaoMi which can be found at [0]. It seems internally
> this board is referred to as "Trinket".
> 
> Since GCC isn't upstreamed yet, we use dummy clocks for GENI.
> 
> [0]: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/arch/arm64/boot/dts/qcom/trinket.dtsi
> 
> Signed-off-by: Eli Riggs <eli@rje.li>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 201 +++++++++++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> new file mode 100644
> index 0000000000000..4931402d20c9d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Please use dual GPL/BSD license for dts files, if you can.

> +// Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> +// Copyright (C) 2019 XiaoMi, Inc.
> +// Copyright (C) 2020 Eli Riggs <eli@rje.li>
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";
> +		};
> +		sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;
> +			clock-output-names = "sleep_clk";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +		CPU0: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1638>;
> +			d-cache-size = <0x10000>;
> +			i-cache-size = <0x10000>;
> +		};
> +		CPU1: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1638>;
> +			d-cache-size = <0x10000>;
> +			i-cache-size = <0x10000>;
> +		};
> +		CPU2: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1638>;
> +			d-cache-size = <0x10000>;
> +			i-cache-size = <0x10000>;
> +		};
> +		CPU3: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x103>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1638>;
> +			d-cache-size = <0x10000>;
> +			i-cache-size = <0x10000>;
> +		};
> +		CPU4: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-size = <0x8000>;
> +			i-cache-size = <0x8000>;
> +		};
> +		CPU5: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-size = <0x8000>;
> +			i-cache-size = <0x8000>;
> +		};
> +		CPU6: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-size = <0x8000>;
> +			i-cache-size = <0x8000>;
> +		};
> +		CPU7: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-size = <0x8000>;
> +			i-cache-size = <0x8000>;
> +		};
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&CPU4>;
> +				};
> +				core1 {
> +					cpu = <&CPU5>;
> +				};
> +				core2 {
> +					cpu = <&CPU6>;
> +				};
> +				core3 {
> +					cpu = <&CPU7>;
> +				};
> +			};
> +			cluster1 {
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +				core1 {
> +					cpu = <&CPU1>;
> +				};
> +				core2 {
> +					cpu = <&CPU2>;
> +				};
> +				core3 {
> +					cpu = <&CPU3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill this in */
> +		reg = <0 0 0 0>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency = <19200000>;
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;

In order to describe the dma-ranges properly the address-cells needs to
be 2, so please make both of these 2 from the start.

> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		intc: interrupt-controller@f200000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0xf200000 0x10000>,	/* GICD */
> +			      <0xf300000 0x100000>;	/* GICR * 8 */

Please pad addresses to 8 digits and please sort nodes under /soc by
address.

> +			#interrupt-cells = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		/* This GENI and its children actually use GCC clocks,
> +		 * but the bootloader has already set them up for us.
> +		 * xo_board is used as a dummy here so the driver doesn't
> +		 * give up.
> +		 */

Given that you won't get very far without GCC and e.g.  pinctrl driver I
would prefer to see some patches for those as well, to ensure that this
will be able to go beyond basic UART.

Regards,
Bjorn

> +		qupv3_0: geniqup@4ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x4ac0000 0x2000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&xo_board>, <&xo_board>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			qupv3_se4_2uart: serial@4a90000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x4a90000 0x4000>;
> +				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "se";
> +				clocks = <&xo_board>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
