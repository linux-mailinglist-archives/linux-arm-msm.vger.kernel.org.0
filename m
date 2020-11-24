Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6309F2C2ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389470AbgKXPDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389469AbgKXPDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:03:46 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D17C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 07:03:43 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id o3so19600694ota.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 07:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=an7lmYlQ2JOBofNnOublbiqlb6XjUqYjFJm3j5tP9c4=;
        b=GmAYX7vII0ePxodJCg38pWV6sId5pXuZMg77ftgMNd1NN+Zju91rOujGo3Roy5IOfF
         6zvfJXZgG8L82lvo6J6tFAGdhBkdD+PyklJG2Dr5McD6ffQ/PW0WLSoAvTDCMe9s3xEw
         vTeGW5zQRezviR7wJGl2yvHn5WE1gk3RXhtmiV6IVv5gV3Zi4RbfWstvX9iEi/bwTzXa
         hA5SuiUBDJpO01TpkSzBeEu+ANwB1ZA0McRkE6V63AM3Khp4FLipwqgVikynlFCMN3bE
         Z1dOU2gz02j7Iw1V8wOx5D+HiYzM+6Dnn92SXVyEkfCDpZhhD7jW7w4LPm2plFrTp8wK
         Y9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=an7lmYlQ2JOBofNnOublbiqlb6XjUqYjFJm3j5tP9c4=;
        b=UKJLOvHxNFdLPIwqKFcGWCvYKghq796SAjxeqlwSCV/C4AMeVBkxJOFolFBnaeSc1R
         5tFfH2MYIZYh4/cCGDcikzpMF6UKoOZ2QZLFnGCXH9YSrqBzAF0+bnQ9egkDkU4AG5Ih
         Uv/kI4Oixw40xopjKr9CcSdCAqPk0/OUQLIDCd4toZEyk5bfaXPG3UwLGq4/eD+5urmA
         8/W5ktYM/SZj+m+Oh8K1KHKGIyIqdkwea1CdDShEbLkbPtkERJK+LjsDDtUkmLXzf+aJ
         3A8W5il6wEsTZpUv++atVDml40gCL3uJOLHSoHbLUKRB94LZ6SUbC9qHskDb5L1ezY2W
         0p+g==
X-Gm-Message-State: AOAM533p9jdXWNgXEHWYeeBsNVHTQc78gmsmqYec482TaX9BLCypPsXI
        YetwjKBoYEhAYoa+2qvsgvnuLA==
X-Google-Smtp-Source: ABdhPJwKTQsL5UzaB6j6I0uaoQsdFoaC1oc3lIpTQeMKg6W10ccfDr26MrpEVMALa5JNXtrEpqYnPw==
X-Received: by 2002:a9d:7392:: with SMTP id j18mr3722795otk.288.1606230223018;
        Tue, 24 Nov 2020 07:03:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z19sm8683974otm.58.2020.11.24.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:03:42 -0800 (PST)
Date:   Tue, 24 Nov 2020 09:03:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Add SDX55 Modem and MTP board support
Message-ID: <20201124150340.GK95182@builder.lan>
References: <20201124140011.134751-1-manivannan.sadhasivam@linaro.org>
 <20201124140011.134751-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124140011.134751-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Nov 08:00 CST 2020, Manivannan Sadhasivam wrote:

> Add basic devicetree support for SDX55 Modem and MTP board from

Again, let's call is "SDX55 platform".

> Qualcomm. The SDX55 modem features an ARM Cortex A7 CPU which forms the
> Application Processor Sub System (APSS) along with standard Qualcomm
> peripherals like GCC, TLMM, BLSP, QPIC, BAM etc... Along with these,
> there exists the networking parts such as IPA, MHI, PCIE-EP, EMAC
> etc..

And here you can mention that there's a modem.

> 
> Currently, this basic devicetree support includes GCC, RPMh clock, INTC
> and Debug UART.
> 
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/Makefile           |   3 +-
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts |  27 ++++
>  arch/arm/boot/dts/qcom-sdx55.dtsi    | 205 +++++++++++++++++++++++++++
>  3 files changed, 234 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
>  create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ce66ffd5a1bb..1505c6cdc5ca 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -917,7 +917,8 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8974-sony-xperia-amami.dtb \
>  	qcom-msm8974-sony-xperia-castor.dtb \
>  	qcom-msm8974-sony-xperia-honami.dtb \
> -	qcom-mdm9615-wp8548-mangoh-green.dtb
> +	qcom-mdm9615-wp8548-mangoh-green.dtb \
> +	qcom-sdx55-mtp.dtb
>  dtb-$(CONFIG_ARCH_RDA) += \
>  	rda8810pl-orangepi-2g-iot.dtb \
>  	rda8810pl-orangepi-i96.dtb
> diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> new file mode 100644
> index 000000000000..8c39db4ae792
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-sdx55.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SDX55 MTP";
> +	compatible = "qcom,sdx55-mtp", "qcom,sdx55", "qcom,mtp";

Do we need "qcom,mtp"?

> +	qcom,board-id = <0x5010008 0x0>;
> +
> +	aliases {
> +		serial0 = &blsp1_uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&blsp1_uart3 {
> +	status = "ok";
> +};
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> new file mode 100644
> index 000000000000..9e0b964e4c57
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SDX55 SoC device tree source
> + *
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +/dts-v1/;

We seem to mix a little bit in the arm/qcom dts files, but the general
pattern is to put this only in the dts files.

> +
> +#include <dt-bindings/clock/qcom,gcc-sdx55.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	model = "Qualcomm Technologies, Inc. SDX55";
> +	compatible = "qcom,sdx55";

model and compatible should always be specified in the including .dts
(as you do), so I would prefer if you omit these.

> +	qcom,msm-id = <357 0x10000>, <368 0x10000>, <418 0x10000>;
> +	interrupt-parent = <&intc>;
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0 0>;
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <38400000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;
> +		};
> +
> +		pll_test_clk: pll-test-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <400000000>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +
> +		timer {

If timer doesn't have a reg, it should go outside soc {}

Regards,
Bjorn
