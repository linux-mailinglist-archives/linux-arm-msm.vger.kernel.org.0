Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E162EB22B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 19:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbhAESLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 13:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbhAESLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 13:11:12 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1576BC061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 10:10:18 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id d20so566469otl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ChxLExLWVt+4oIqEbZryBNyc23+uw95BAKSDa6CCwHY=;
        b=g03PUSF1AQTEeEna9/1Fsd6hp+l7cmEBGnOoeFWIQDU5z0w2879vusNpE5UcSPG0Fp
         TUmIUjRNHbBay3NSfQDI56m57kN3ae9Z4cr7q2zU1tCNTPfOVher0HuVgxi130qiTJoh
         PpWwzCMWWa2VUT2/SEzU7EUUlowMVIKbdSTbOCPIFDOcFVxMizd/U7sBhmSfVGkmpwqR
         fUGHw+/sqfAfUuGIPA93tm2gTgP9DP4xn5opDtbcgFL+NCUWo2xDtV/SPE4S80EpqV0D
         s7FZrFgqZbepwBKhygbmRMn901XL6zRtg+sK289K94jcV0l7f9ErC/7sSkVHvBtBQYIf
         irRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ChxLExLWVt+4oIqEbZryBNyc23+uw95BAKSDa6CCwHY=;
        b=YKqsarq4gK146gmSFfTty4CjjzpeUutg9kCgf99flUUsy/s1iXyuAV4Y6im5u/3YLm
         XXGPTZFMNHtjcbMBPxF5E4K6LisRiZ+uLQeLTY3WJnID8Q/88rhETrDe3x1gjUj8/BQr
         J/xI/gJXVqEdO/w2YA9PV9j/haQ/7gxCrgYlSvGht562/EHthOTCWA3EgXqOT6SkUkcA
         gVdf3Wix7ElFrZJIHVPd3rMXbCH4OZnJJxslDcgG107ImCRGB4hSsDpiMD838o2E2PiA
         ODtgTTdMgf5n35n8G6/4QLQs0BytZ1PLjEeCH6TaZUqH3pUGmJJCBEHXFV/fX5YHTCag
         0dqQ==
X-Gm-Message-State: AOAM530014h55AfuQQ/8FHEbokXqE6U4REjhZllWb2prSrI3Z8nF+uYG
        TpIXncFN3PmvlxRUILLaYflYjAtaSLinhA==
X-Google-Smtp-Source: ABdhPJxnpf1w3cbKdhVS26iYtgVJ5hjsdFUs0TVCcQlAxhGj3Yd2RskFmZUjPVUBd3DQdlTk37dEXg==
X-Received: by 2002:a05:6830:118b:: with SMTP id u11mr543336otq.130.1609870218397;
        Tue, 05 Jan 2021 10:10:18 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j126sm33949oib.13.2021.01.05.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 10:10:17 -0800 (PST)
Date:   Tue, 5 Jan 2021 12:10:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 17/18] ARM: dts: qcom: Add PMIC pmx55 dts
Message-ID: <X/Srh/YFblOyYBgi@builder.lan>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-18-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-18-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:

> From: Vinod Koul <vkoul@kernel.org>
> 
> This adds DTS for PMIC PMX55 found in Qualcomm platforms.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-pmx55.dtsi | 91 +++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi
> 
> diff --git a/arch/arm/boot/dts/qcom-pmx55.dtsi b/arch/arm/boot/dts/qcom-pmx55.dtsi
> new file mode 100644
> index 000000000000..05f033334716
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-pmx55.dtsi
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Limited
> + */
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@8 {
> +		compatible = "qcom,pmx55", "qcom,spmi-pmic";
> +		reg = <0x8 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +
> +			status = "disabled";
> +		};
> +
> +		pmx55_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x8 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pmx55_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmx55_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x8 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +
> +			ref-gnd@0 {
> +				reg = <ADC5_REF_GND>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_gnd";
> +			};
> +
> +			vref-1p25@1 {
> +				reg = <ADC5_1P25VREF>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vref_1p25";
> +			};
> +
> +			die-temp@6 {
> +				reg = <ADC5_DIE_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "die_temp";
> +			};
> +
> +			chg-temp@9 {
> +				reg = <ADC5_CHG_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "chg_temp";
> +			};
> +		};
> +
> +		pmx55_gpios: gpio@c000 {
> +			compatible = "qcom,pmx55-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <0x8 0xc0 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc1 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc3 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc4 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc5 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc7 0x0 IRQ_TYPE_NONE>,
> +				     <0x8 0xc8 0x0 IRQ_TYPE_NONE>;

Brian reworked the spmi-gpio driver a while back to use hierarchical
irqdomains instead of this, so please drop the "interrupts" property.

For reference see e.g.:
f14a5e6da4a5 ("arm64: dts: qcom: pmi8998: add interrupt controller properties")

Regards,
Bjorn

> +		};
> +	};
> +
> +	pmic@9 {
> +		compatible = "qcom,pmx55", "qcom,spmi-pmic";
> +		reg = <0x9 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.25.1
> 
