Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D04634457B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 14:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbhCVNVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 09:21:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52979 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhCVNTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 09:19:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616419140; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Q/r41fIqJ2Y9Toafnn95hP48WRb+YnexiUA7BrVZA/o=;
 b=Izz9YzxYCpeX8jg2qIMMEWerpSjM6tHnTbVIsXEqUIZi5yO7Wa0/GfScomU+9gYH8BwN//lQ
 TER3NDpI3PlgN2+ivcDUP3eWjujL+dEsR/Mdoqkl4w2hsDmBXkQ6CF6P25MingnsR+qThGgp
 +HGJ5IWfwHmr2HUt/GZvIYAuAJg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 605899354db3bb6801285cb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Mar 2021 13:18:45
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D44EEC4347C; Mon, 22 Mar 2021 13:18:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66DEEC4347C;
        Mon, 22 Mar 2021 13:18:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Mar 2021 18:48:43 +0530
From:   skakit@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
In-Reply-To: <YEumre0+KKxZ0p6Z@builder.lan>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
 <YEumre0+KKxZ0p6Z@builder.lan>
Message-ID: <d1b8925da8197424d73cb9ac0a60b6ac@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-03-12 23:06, Bjorn Andersson wrote:
> On Thu 11 Mar 04:40 CST 2021, satya priya wrote:
> 
>> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
>> GPIOs, RTC and other PMIC infra modules for SC7280.
>> 
> 
> Overall this looks good, just two small things below.
> 
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
> '_' is not allowed to be used in node names, there's a few of these
> sprinkled through the patch. Please replace them with '-'.
> 

Okay, will replace them.

>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
>> +		thermal-governor = "step_wise";
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
>> +		};
>> +	};
>> +};
> [..]
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
> 
> Is there any particular reason for you including these at the end of
> sc7270.dtsi, rather than the top like we do in other platforms?
> 
> Also, are all SC7280 devices always coming with this quartet? We've 
> seen
> variations of this in the past and therefor typically include them from
> the board dts instead.
> 

No specific reason, will add them in board dts file.

> Regards,
> Bjorn

Thanks,
Satya Priya
