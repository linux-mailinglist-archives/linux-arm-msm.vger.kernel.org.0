Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D704134458F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 14:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhCVNXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 09:23:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25728 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231919AbhCVNUy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 09:20:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616419254; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PzTiPL1Y0XVo+lf0/i43+hzT1WLDG/KPDYWOx5s2cw4=;
 b=J8q8QfQNsrck6gUYwiTnjLUBjPLOk7/b7QVnLywiEENWCnDv5hTtUkqXP4APYuHNhy4ubEhS
 43tiHYO2OivlbmnzKRqNS9GK96wnkKKquKDumjjrL/w3zf5ctGWKZ1Cinpskb5wdZ/mPNIc0
 R7D0NEORg+oA/iWlGLRV5v4yfYk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 605899b621031618f61653b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Mar 2021 13:20:54
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 980BCC4346F; Mon, 22 Mar 2021 13:20:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED19CC433C6;
        Mon, 22 Mar 2021 13:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Mar 2021 18:50:47 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
In-Reply-To: <YEvR1kDm32tE7mK3@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
 <YEvR1kDm32tE7mK3@google.com>
Message-ID: <4dc784eb3c00a9805141148732476838@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2021-03-13 02:10, Matthias Kaehlcke wrote:
> Hi Satya,
> 
> On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
>> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
>> GPIOs, RTC and other PMIC infra modules for SC7280.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> This patch depends on base DT and board files for SC7280 to merge 
>> first
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
>> 
>>  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 
>> ++++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>>  5 files changed, 292 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> new file mode 100644
>> index 0000000..393b256
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus {
>> +	pm7325: pmic@1 {
>> +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
>> +		reg = <0x1 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pm7325_tz: temp-alarm@a00 {
> 
> The _tz suffix suggests this is a thermal zone, which isn't the case.
> Call it 'pm7325_temp_alarm' or similar.
> 

Okay.

>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pm7325_gpios: gpios@8800 {
>> +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pm7325_gpios 0 0 10>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> +&thermal_zones {
>> +	pm7325_temp_alarm: pm7325_tz {
> 
> The temperature corresponds to the PM7325 on-die temperature, the temp 
> alarm
> is a feature to monitor it. Also many QCA SoCs name the thermal zones
> <whatever>-thermal, so it seems good to follow this convention. My 
> suggestion
> is:
> 	pm7325_thermal: pm7325-thermal {
> 

Okay, will change it.

> 
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
> 
> Are you sure that no polling delay is needed? How does the thermal 
> framework
> detect that the temperatures is >= the passive trip point and that it 
> should
> start polling at 'polling-delay-passive' rate?
> 

As the temp-alarm has interrupt support, whenever preconfigured 
threshold violates it notifies thermal framework, so I think the polling 
delay is not needed here.

>> +		thermal-governor = "step_wise";
> 
> This property is not supported upstream.
> 
> In any case, this thermal zone doesn't have cooling devices, what is
> any thermal governor supposed to do with this thermal zone?
> 
> I understand that the zone is generally useful to configure the
> over-temperature protection of the PMIC and to allow the kernel
> to shut down (or reboot) when a critical trip point is reached,
> but the specific governor is irrelevant as far as I understand.
> 

Yeah, this is not required here will remove it.

>> +		thermal-sensors = <&pm7325_tz>;
>> +
>> +		trips {
>> +			pm7325_trip0: trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			pm7325_trip1: trip1 {
>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
>> +
>> +			pm7325_trip2: trip2 {
>> +				temperature = <145000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
> 
> Why are there two critical trip points? The system should shut down
> when the first trip point is reached, the second one is irrelevant.
> As far as I recall from implementing f1599f9e4cd6 ("thermal:
> qcom-spmi: Use PMIC thermal stage 2 for critical trip points")
> earlier PMIC versions have 3 stages for the over-temperature
> protection. When the stage 3 threshold (trip2) is hit the PMIC
> performs and automated shutdown. Unless this has changed for the
> PM7325 the second critical trip point should not be needed. The
> second critical trip point could even lead to a misconfiguration
> of the PMIC threshold, since the driver interprets the temperature
> of a critical trip point as the stage3 temperature.
> 

yes I agree, the system will shutdown when we hit the 1st critical, 2nd 
critical point is not needed. Probably this got carried from old change 
propagation, will remove it.

>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> new file mode 100644
>> index 0000000..dffa79d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus {
>> +	pm8350: pmic@2 {
> 
> pm8350c ?
> 

Ok.

>> +		compatible = "qcom,pm8350c", "qcom,spmi-pmic";
>> +		reg = <0x2 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pm8350c_tz: temp-alarm@a00 {
> 
> same as for pm7325
> 

Ok.

>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pm8350c_gpios: gpios@8800 {
>> +			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pm8350c_gpios 0 0 9>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> +&thermal_zones {
>> +	pm8350c_temp_alarm: pm8350c_tz {
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
>> +		thermal-governor = "step_wise";
>> +		thermal-sensors = <&pm8350c_tz>;
> 
> 
> same as for pm7325
> 
>> +
>> +		trips {
>> +			pm8350c_trip0: trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			pm8350c_trip1: trip1 {
>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
>> +
>> +			pm8350c_trip2: trip2 {
>> +				temperature = <145000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
> 
> same as for pm7325
> 
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi 
>> b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> new file mode 100644
>> index 0000000..9749484
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/input/linux-event-codes.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
>> +
>> +&spmi_bus {
>> +	pmk8350: pmic@0 {
>> +		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
>> +		reg = <0x0 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmk8350_pon: pon_hlos@1300 {
> 
> just pon@1300 for consistency? That's also the namingMK8350 Channel 
> nodes */

ok.

>> +			pmk8350_die_temp {
>> +				reg = <PMK8350_ADC7_DIE_TEMP>;
>> +				label = "pmk8350_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			/* PM8350 Channel nodes */
> 
> This comment and the ones below don't seem particularly useful,
> the naming of the nodes should provide enough context.
> 

Ok, will remove.

>> +			pm8350_die_temp {
>> +				reg = <PM8350_ADC7_DIE_TEMP>;
>> +				label = "pm8350_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			/* PMR735a Channel nodes */
>> +			pmr735a_die_temp {
>> +				reg = <PMR735A_ADC7_DIE_TEMP>;
>> +				label = "pmr735a_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			/* PMR735b Channel nodes */
>> +			pmr735b_die_temp {
>> +				reg = <PMR735B_ADC7_DIE_TEMP>;
>> +				label = "pmr735b_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +		};
>> +
>> +		pmk8350_adc_tm: adc_tm@3400 {
>> +			compatible = "qcom,adc-tm7";
>> +			reg = <0x3400>;
>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "threshold";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#thermal-sensor-cells = <1>;
>> +			status = "disabled";
>> +		};
>> +
>> +		pmk8350_gpios: gpios@b000 {
>> +			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
>> +			reg = <0xb000>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pmk8350_gpios 0 0 4>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		pmk8350_rtc: rtc@6100 {
>> +			compatible = "qcom,pmk8350-rtc";
>> +			reg = <0x6100>, <0x6200>;
>> +			reg-names = "rtc", "alarm";
>> +			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi 
>> b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> new file mode 100644
>> index 0000000..e1d2356
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus {
>> +	pmr735a: pmic@4 {
>> +		compatible = "qcom,pmr735a", "qcom,spmi-pmic";
>> +		reg = <0x4 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmr735a_tz: temp-alarm@a00 {
> 
> same as for pm7325
> 

Ok.

>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pmr735a_gpios: gpios@8800 {
>> +			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pmr735a_gpios 0 0 4>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> +&thermal_zones {
>> +	pmr735a_temp_alarm: pmr735a_tz {
> 
> same as for pm7325
> 
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
>> +		thermal-governor = "step_wise";
>> +		thermal-sensors = <&pmr735a_tz>;
> 
> same as for pm7325
> 
>> +
>> +		trips {
>> +			pmr735a_trip0: trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			pmr735a_trip1: trip1 {
>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
>> +
>> +			pmr735a_trip2: trip2 {
>> +				temperature = <145000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
> 
> same as for pm7325
> 
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 8af6d77..25402d4 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -606,4 +606,12 @@
>>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>  	};
>> +
>> +	thermal_zones: thermal-zones {
>> +	};
>>  };
>> +
>> +#include "pm7325.dtsi"
>> +#include "pm8350c.dtsi"
>> +#include "pmk8350.dtsi"
>> +#include "pmr735a.dtsi"

Thanks,
Satya Priya
