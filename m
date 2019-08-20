Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0000695E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729807AbfHTM1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:27:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41037 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTM1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:27:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id m24so4923411ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2019 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4pudM/U28TkD+Cplhyadu/0Y1S2/AG2UmAoM0FO5E6U=;
        b=O3fNM/Ywra6GUCEF2BtttmGzEkVcaa4PdkIsYB0GG+fy5bvRjvCQ2Xf9bIgB0EzMX2
         3r0r4DZ98LQbR23LKwYA4eCVAzvYQ7q/GRtLqErvCpV2TXMmtm+K0WCtN1jPwIKXRA0t
         skrtkc0U3YdpI0PBJtRW7+c06sAQdaknyg/kbexUPis7lMVRIJYSmQAoL0K4oRH3+xGh
         9KCxlZUMgrhOcojwMOSGQkH74VomlVrmk4SRE1jxAn4VBWnFnxtwxmafJN7RtgQR9Q8/
         r/MrUrWyfV5FBR4vruF9AugwLUDAmj8P2DsBAC2KOb9q1AMatfE0C7J+fnRO0KS0Td1S
         5jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4pudM/U28TkD+Cplhyadu/0Y1S2/AG2UmAoM0FO5E6U=;
        b=UxRxaArr4p3Lfou5A9pnRbFGi7juhXpmr4tIJ2UAW0oXsuzLuRoJBKeDxHd1T3Yoyl
         bJc2iMWSkoWcaxzWsHqmnemVC57mzjiiF3fd+tdi00zfAKaGC8keydFviUrTNcRut2ya
         q9xdUwg5i3QTRlfCvXH2788zp8uZJA2IICCfY1F7DQMnivvfcyMjxYC+jzT/5+yDNVw7
         wJOVdzNDvM5/aONMr0SuvkA2NMKJYAdVdx/RvWXDLuZd+V+wPfU6ElFCpHG2jcoqpYwa
         jJ0jcEYpH1qBPUYZt1vlhi8nGJ+Pl9JnK4+6UN94ECk+RZOgTiEyyfQgJt+1eaCwnlLU
         GdUw==
X-Gm-Message-State: APjAAAVXqlQlSveDxIBRTg0lsm0HRtFF3O3MEMWGOc4ElVeRwAIa486b
        KRLQJHutV18NWd6PK/G2AqsXbg==
X-Google-Smtp-Source: APXvYqyJhfb24JenwXZeH8VAc4TxIwOIRmF6Ii787zSit+Zy3cTcCa5gQDWZ+KvUVxZ9SqldBwkpAg==
X-Received: by 2002:a2e:55db:: with SMTP id g88mr15568187lje.27.1566304023751;
        Tue, 20 Aug 2019 05:27:03 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id i123sm3144627lfi.72.2019.08.20.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 05:27:03 -0700 (PDT)
Date:   Tue, 20 Aug 2019 14:27:01 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: pm8150b: Add Base DTS file
Message-ID: <20190820122701.GC31261@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-4-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:11PM +0530, Vinod Koul wrote:
> PMIC pm8150b is a slave pmic and this adds base DTS file for pm8150b
> with pon, adc, and gpio nodes

All of your other commit messages refers to it as power-on
instead of pon, be consistent.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 84 +++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> new file mode 100644
> index 000000000000..dfb71fb8c90a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@2 {
> +		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
> +		reg = <0x2 SPMI_USID>;
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
> +		adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +
> +			status = "disabled";
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
> +		pm8150b_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150b-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0x2 0xc0 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc1 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc2 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc3 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc4 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc5 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc6 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc7 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc8 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc9 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xca 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xcb 0 IRQ_TYPE_NONE>;
> +		};
> +	};
> +
> +	pmic@3 {
> +		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
> +		reg = <0x3 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.20.1
> 
