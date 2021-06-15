Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FED33A8AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 23:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFOVLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 17:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbhFOVLL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 17:11:11 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A00C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 14:09:06 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id p5-20020a9d45450000b029043ee61dce6bso291076oti.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 14:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kzMEmz2OXCW/1o+aXglOTozC0nF/ZSVAupo9ucWR4vU=;
        b=T990jFP+IwijkukoKSXyXlrXshyADa1CX10/HukXVERcLJDgAWmFeXrzX8UizkxWbS
         DW9v3xWipSVA7fbVoQ1KksK3JZuHqDw5Acyrhm8Sr9Rl4gqfWldFiPXLsGWI3JCTNZrG
         pXD28wo8OyGXUxDbVpt9uP2Y52QNUjMLO6ih+GIZzQmxWMrzQe0D26V9D3aBUB7VA7AH
         HG44+XQliWFTV6/Vl8618p5ZVEEzwd/JsNkNsyztStA50AzoUbUvmXc38sCLVXWx1syk
         oG31ddpBvCWxwyaGZSzU5HoY3g5FSQaG3we12IY7ztgrtzyiRLuj3yyXAE8o+beWaSfo
         CFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kzMEmz2OXCW/1o+aXglOTozC0nF/ZSVAupo9ucWR4vU=;
        b=f3UWEp1Aw+sECfpKJjaXKn7HVfGZJPelc+fcSGlOV6psCcDKjtEborGfDKYbcyeY6M
         v2FpV3RPS65SpDqx5rhlttmqqDjZoSj4vfMgNiiJSPpbjvv1Ock/ZUmgy44oQ7l/Nmdi
         XYDRo1ZvC1WEgST9cZxPR0ud3mMjdFBX3O+GomQEH1gkbxzi/KC1ija3BOGZbmR43dw5
         pu+mSwwkiHgPY/sh139BLa82KFz/LHznpSRg6KxXRUOTQ0Rcjf8bHuXEoGXF2SID8MXM
         3CUbTcpWUFCS3ZtoHtEcEYji+4WP7AvHaoWeHlyffcNmak9EB9WDc7hoRFbyo7VIAj5S
         HNgA==
X-Gm-Message-State: AOAM531qGqle7t5jsOlvXGDKTDdtlVV0nx23vf1TwLv2IgVy9/CBa6Vz
        ENzVsNkR+z3iLT0yTqm6+wHz2w==
X-Google-Smtp-Source: ABdhPJykEXexN/P95Qyl3OwaOoGgkRtyFJa8KjUcymogwEnqNlaEQp9MYNXDaaAgBxm41YjbqTa4GA==
X-Received: by 2002:a9d:29:: with SMTP id 38mr1019535ota.30.1623791345507;
        Tue, 15 Jun 2021 14:09:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m10sm15552oig.9.2021.06.15.14.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:09:05 -0700 (PDT)
Date:   Tue, 15 Jun 2021 16:09:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: pmm8155au_2: Add base dts file
Message-ID: <YMkW720UIjG9aqhI@builder.lan>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-10-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-10-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:

> Add base DTS file for pmm8155au_2 along with GPIOs, power-on, rtc and vadc
> nodes.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi | 107 ++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> new file mode 100644
> index 000000000000..0c7d7a66c0b5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmm8155au-2-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&pmm8155au_2_temp>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmic@4 {
> +		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
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
> +		pmm8155au_2_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pmm8155au_2_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmm8155au_2_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
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
> +		};
> +
> +		pmm8155au_2_gpios: gpio@c000 {
> +			compatible = "qcom,pmm8155au-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@5 {
> +		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
> +		reg = <0x5 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.31.1
> 
