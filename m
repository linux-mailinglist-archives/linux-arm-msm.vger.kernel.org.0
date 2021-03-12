Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A6B339888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 21:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhCLUlA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 15:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbhCLUk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 15:40:57 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD42C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 12:40:57 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id t37so5821882pga.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 12:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wg9KztPbwr23b5MaLH0ecVmFQeWIxPEdqJKVKosBsnA=;
        b=MOTtavXTPx++S0jXh0cBBUt6w0WDms/a3+Kd3QSrah5lWj5ntFcMGT7hQV1VuCcVeb
         1kPWTDG2XjZbAikGCJSQP89IMCzjs8SIjMFQpuhscptwkwGjp5svbvE5Xjzjk7mAkceM
         gJbZpWbwNooZ2gYRjaZJZRoB4UmVhVWzx/sn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wg9KztPbwr23b5MaLH0ecVmFQeWIxPEdqJKVKosBsnA=;
        b=aGBR0oiU0wl4af2wsFVXACW3oF28dBEDPGeYtZsVeJXDH3zHppWS2nPR4cukR1Bjdn
         O9ka68a13wazWOOnIKes5p4vhgTJ6gsfzY56w09OhQ2vvEl7gcjN9nrw2wMvTMH2PiqG
         uLrxWs5lVE6tnz+a6V0ABHsMW8J5uj5vokLmXMNpuqqsKfKnuw0FgvpNdiUun3/WOYav
         r8Otz8YMKAQwjpDqu7dLL24+hfzID2JBRMrt3ZZzuLsdBEkNoIHS3TLtkLDQDLkC8sa0
         /HzxbKIAY20Ko2dRk78hiXjHcpskbRLr2KTNoAsyaV0l1rxY2MZKsJ2+PMIZZxDzH9Tt
         wKkg==
X-Gm-Message-State: AOAM530JbPnduk8zc58wxlfyiqN/l690MUmQD8/4EHeKuHslWUfrFRbn
        z9MkvAho2AwvZOtm5w98pHcOcA==
X-Google-Smtp-Source: ABdhPJxDx1vXmzAvSeoPLU+Bc3ubV6wOOah7GUV8UJ8CK3FqtRCS8sP03sLuhiZKXkHdu812kf1PUA==
X-Received: by 2002:a05:6a00:8d4:b029:1b7:7ad9:4864 with SMTP id s20-20020a056a0008d4b02901b77ad94864mr13647307pfu.34.1615581657010;
        Fri, 12 Mar 2021 12:40:57 -0800 (PST)
Received: from localhost ([2620:15c:202:1:914f:6483:1dc:1bba])
        by smtp.gmail.com with UTF8SMTPSA id w18sm2840217pjh.19.2021.03.12.12.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 12:40:56 -0800 (PST)
Date:   Fri, 12 Mar 2021 12:40:54 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
Message-ID: <YEvR1kDm32tE7mK3@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Satya,

On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
> GPIOs, RTC and other PMIC infra modules for SC7280.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> This patch depends on base DT and board files for SC7280 to merge first
> https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
> 
>  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>  5 files changed, 292 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> new file mode 100644
> index 0000000..393b256
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm7325: pmic@1 {
> +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm7325_tz: temp-alarm@a00 {

The _tz suffix suggests this is a thermal zone, which isn't the case.
Call it 'pm7325_temp_alarm' or similar.

> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm7325_gpios: gpios@8800 {
> +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm7325_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +&thermal_zones {
> +	pm7325_temp_alarm: pm7325_tz {

The temperature corresponds to the PM7325 on-die temperature, the temp alarm
is a feature to monitor it. Also many QCA SoCs name the thermal zones
<whatever>-thermal, so it seems good to follow this convention. My suggestion
is:
	pm7325_thermal: pm7325-thermal {


> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;

Are you sure that no polling delay is needed? How does the thermal framework
detect that the temperatures is >= the passive trip point and that it should
start polling at 'polling-delay-passive' rate?

> +		thermal-governor = "step_wise";

This property is not supported upstream.

In any case, this thermal zone doesn't have cooling devices, what is
any thermal governor supposed to do with this thermal zone?

I understand that the zone is generally useful to configure the
over-temperature protection of the PMIC and to allow the kernel
to shut down (or reboot) when a critical trip point is reached,
but the specific governor is irrelevant as far as I understand.

> +		thermal-sensors = <&pm7325_tz>;
> +
> +		trips {
> +			pm7325_trip0: trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			pm7325_trip1: trip1 {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +
> +			pm7325_trip2: trip2 {
> +				temperature = <145000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};

Why are there two critical trip points? The system should shut down
when the first trip point is reached, the second one is irrelevant.
As far as I recall from implementing f1599f9e4cd6 ("thermal:
qcom-spmi: Use PMIC thermal stage 2 for critical trip points")
earlier PMIC versions have 3 stages for the over-temperature
protection. When the stage 3 threshold (trip2) is hit the PMIC
performs and automated shutdown. Unless this has changed for the
PM7325 the second critical trip point should not be needed. The
second critical trip point could even lead to a misconfiguration
of the PMIC threshold, since the driver interprets the temperature
of a critical trip point as the stage3 temperature.

> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> new file mode 100644
> index 0000000..dffa79d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm8350: pmic@2 {

pm8350c ?

> +		compatible = "qcom,pm8350c", "qcom,spmi-pmic";
> +		reg = <0x2 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8350c_tz: temp-alarm@a00 {

same as for pm7325

> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm8350c_gpios: gpios@8800 {
> +			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8350c_gpios 0 0 9>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +&thermal_zones {
> +	pm8350c_temp_alarm: pm8350c_tz {
> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-governor = "step_wise";
> +		thermal-sensors = <&pm8350c_tz>;


same as for pm7325

> +
> +		trips {
> +			pm8350c_trip0: trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			pm8350c_trip1: trip1 {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +
> +			pm8350c_trip2: trip2 {
> +				temperature = <145000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};

same as for pm7325

> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> new file mode 100644
> index 0000000..9749484
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
> +
> +&spmi_bus {
> +	pmk8350: pmic@0 {
> +		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmk8350_pon: pon_hlos@1300 {

just pon@1300 for consistency? That's also the namingMK8350 Channel nodes */
> +			pmk8350_die_temp {
> +				reg = <PMK8350_ADC7_DIE_TEMP>;
> +				label = "pmk8350_die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			/* PM8350 Channel nodes */

This comment and the ones below don't seem particularly useful,
the naming of the nodes should provide enough context.

> +			pm8350_die_temp {
> +				reg = <PM8350_ADC7_DIE_TEMP>;
> +				label = "pm8350_die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			/* PMR735a Channel nodes */
> +			pmr735a_die_temp {
> +				reg = <PMR735A_ADC7_DIE_TEMP>;
> +				label = "pmr735a_die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			/* PMR735b Channel nodes */
> +			pmr735b_die_temp {
> +				reg = <PMR735B_ADC7_DIE_TEMP>;
> +				label = "pmr735b_die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +		};
> +
> +		pmk8350_adc_tm: adc_tm@3400 {
> +			compatible = "qcom,adc-tm7";
> +			reg = <0x3400>;
> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "threshold";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#thermal-sensor-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		pmk8350_gpios: gpios@b000 {
> +			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
> +			reg = <0xb000>;
> +			gpio-controller;
> +			gpio-ranges = <&pmk8350_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmk8350_rtc: rtc@6100 {
> +			compatible = "qcom,pmk8350-rtc";
> +			reg = <0x6100>, <0x6200>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
> new file mode 100644
> index 0000000..e1d2356
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmr735a: pmic@4 {
> +		compatible = "qcom,pmr735a", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmr735a_tz: temp-alarm@a00 {

same as for pm7325

> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmr735a_gpios: gpios@8800 {
> +			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmr735a_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +&thermal_zones {
> +	pmr735a_temp_alarm: pmr735a_tz {

same as for pm7325

> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-governor = "step_wise";
> +		thermal-sensors = <&pmr735a_tz>;

same as for pm7325

> +
> +		trips {
> +			pmr735a_trip0: trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			pmr735a_trip1: trip1 {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +
> +			pmr735a_trip2: trip2 {
> +				temperature = <145000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};

same as for pm7325

> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8af6d77..25402d4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -606,4 +606,12 @@
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	thermal_zones: thermal-zones {
> +	};
>  };
> +
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
