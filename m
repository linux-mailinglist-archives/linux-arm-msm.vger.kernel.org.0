Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FED03AD13B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhFRRhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236118AbhFRRho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:37:44 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994EDC061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:35:33 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso10427238otj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fx3kAbwEvEOTX6FliobkUrTxK4zPxQiLCSVz1xbbXBA=;
        b=Pb5TiMEuuzfemaRgrnrGCMVQCYbjCK2XpiaE5hhj4CVKa0JMMskLn8os7NeqZZ0ftd
         Zh9/YcAO9yBKWWiocMnz93u9oap1TY4IeTuIS4edU2Br/UA8EXYdi6yhV7gD9wq4xmXv
         q38QpDzadeA5l9yEY3+PB6QjEJAByTLL5jA8aDJ09bl48/0c60fX9g/ZElGXxRQsF8Xe
         DFlsql9jSXzQgTr0+Oc3/O2siOlU0OvIL3eTos8D+DoUyVTVUolsozvVLFRHFsiRqqtD
         Fwlw/CSTsW4gDFJUNpEoGPxvja7bao2xDph9g0y8hNbQs89lm009PXl8oZ9mJGJUGKtO
         Wgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fx3kAbwEvEOTX6FliobkUrTxK4zPxQiLCSVz1xbbXBA=;
        b=hN4CQ4dEHEPenTASwbtgXYkpKqnAJsrWgddODOxuGAQp2b2kic50pO9IB6v1bQD69m
         skI0dMR+db1263OXsnxfGARkwUhxRLWKa4ZSGv0Gfpf69N8F/b8j7VJ9uzq5QV1Nu3x0
         +oQ0MnO6YuvWWkmeQHRK62rTcv/zstUSOPJd+E4XSSZqGV1QEbX3dIWED6eLi3ngCQmF
         x9LCA88mFcuqy6tI8ehILWs7Quaxh2V9SUfLBTltB2Oan1yvQDulkx22grsuqMI17bZM
         hno1OebMacLHAxgEYbBfa9alYcA0EXmkPgQrS8ZkMbj5w6E+WnMFodgzwFtUVq06YCGb
         eloQ==
X-Gm-Message-State: AOAM530dgmiI7GBc1PvqwW1D89G8DZwNZfiswhfRl/xbPE1bAe9DRnIc
        Ca3yHnUpqXaEIlcx4KlIhbQukg==
X-Google-Smtp-Source: ABdhPJyxsUeYYfrTVK0RT0tpr+P5j2eQ+cw+8IBJplE8eigPihuQAn8EKA/fwLFOFULo7Z7Rb1BjEg==
X-Received: by 2002:a9d:1ad:: with SMTP id e42mr10401359ote.115.1624037732809;
        Fri, 18 Jun 2021 10:35:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v20sm1884581ooe.47.2021.06.18.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 10:35:32 -0700 (PDT)
Date:   Fri, 18 Jun 2021 12:35:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: pmm8155au_2: Add base dts file
Message-ID: <YMzZYqb5UL8DIk8a@builder.lan>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
 <20210617054548.353293-5-bhupesh.sharma@linaro.org>
 <6011130d-8ce8-420b-6e55-5d168fef0347@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6011130d-8ce8-420b-6e55-5d168fef0347@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Jun 17:32 CDT 2021, Konrad Dybcio wrote:

> 
> > Add base DTS file for pmm8155au_2 along with GPIOs, power-on, rtc and vadc
> > nodes.
> >
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi | 107 ++++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> > new file mode 100644
> > index 000000000000..0c7d7a66c0b5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> > @@ -0,0 +1,107 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2021, Linaro Limited
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> > +/ {
> > +	thermal-zones {
> > +		pmm8155au-2-thermal {
> > +			polling-delay-passive = <100>;
> > +			polling-delay = <0>;
> > +
> > +			thermal-sensors = <&pmm8155au_2_temp>;
> > +
> > +			trips {
> > +				trip0 {
> > +					temperature = <95000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				trip1 {
> > +					temperature = <115000>;
> > +					hysteresis = <0>;
> > +					type = "hot";
> > +				};
> > +
> > +				trip2 {
> > +					temperature = <145000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&spmi_bus {
> > +	pmic@4 {
> > +		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
> > +		reg = <0x4 SPMI_USID>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		power-on@800 {
> > +			compatible = "qcom,pm8916-pon";
> > +			reg = <0x0800>;
> 
> No common debounce, interrupts, bias- property or pwrkey key code?
> 
> Besides, (as a question to Bjorn and others) do we pad reg to 4 digits in PMIC DTs now?
> 

We want the regs to be padded to the address width to make it easier for
humans to sort the nodes. At least for me it's easy to compare a 3-digit
address with a 4-digit one, so I haven't felt the need to enforce it
here.

But I certainly don't mind.

> 
> 
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		pmm8155au_2_temp: temp-alarm@2400 {
> > +			compatible = "qcom,spmi-temp-alarm";
> > +			reg = <0x2400>;
> > +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +			io-channels = <&pmm8155au_2_adc ADC5_DIE_TEMP>;
> > +			io-channel-names = "thermal";
> > +			#thermal-sensor-cells = <0>;
> > +		};
> > +
> > +		pmm8155au_2_adc: adc@3100 {
> > +			compatible = "qcom,spmi-adc5";
> > +			reg = <0x3100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			#io-channel-cells = <1>;
> > +			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +			ref-gnd@0 {
> > +				reg = <ADC5_REF_GND>;
> > +				qcom,pre-scaling = <1 1>;
> > +				label = "ref_gnd";
> > +			};
> > +
> > +			vref-1p25@1 {
> > +				reg = <ADC5_1P25VREF>;
> > +				qcom,pre-scaling = <1 1>;
> > +				label = "vref_1p25";
> > +			};
> > +
> > +			die-temp@6 {
> > +				reg = <ADC5_DIE_TEMP>;
> > +				qcom,pre-scaling = <1 1>;
> > +				label = "die_temp";
> > +			};
> > +		};
> > +
> > +		pmm8155au_2_gpios: gpio@c000 {
> > +			compatible = "qcom,pmm8155au-gpio";
> > +			reg = <0xc000>;
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +		};
> 
> Don't we do gpio-ranges anymore?
> 

Yes, that is required by the binding.

I added that and picked up the 3 patches. Thanks for reviewing Konrad,
and thanks for the patches Bhupesh.

Regards,
Bjorn

> 
> 
> > +	};
> > +
> > +	pmic@5 {
> > +		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
> > +		reg = <0x5 SPMI_USID>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +	};
> > +};
> 
> 
> Konrad
> 
