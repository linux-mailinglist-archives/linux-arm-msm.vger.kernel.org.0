Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EFF389DD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 08:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhETG0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 02:26:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53397 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229953AbhETG0Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 02:26:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621491903; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=scwzDElaxzWWoWbTHGwqnJCdL3UYqFstfV4+c/snyVA=;
 b=CHi2KGKnTwhZQJzR+bP9YQGXdA/3ql4hcTXspN5Y2cET8HNSh7auXt6YiBDxOzZu0CsaMIfE
 peKRdhUYeL9kiZqYX13KrT0GRlDrRVTrOUI+UdagH4SemEm2bbKgjHeuQ0T7kqBWHgpfVcaA
 sliBQzg/APsiRjvw403OkqrJ2RE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a600be7b5af81b5cdc9922 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 06:25:02
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1970CC43460; Thu, 20 May 2021 06:25:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0FBDC433F1;
        Thu, 20 May 2021 06:25:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 11:55:01 +0530
From:   skakit@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 4/8] arm64: dts: qcom: pm8350c: Add temp-alarm
 support
In-Reply-To: <YKOpc+mi9fxVRMbI@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-5-git-send-email-skakit@codeaurora.org>
 <YKOpc+mi9fxVRMbI@vkoul-mobl.Dlink>
Message-ID: <dab01d12ae52026a1b05e85604bff972@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-18 17:18, Vinod Koul wrote:
> On 18-05-21, 11:50, satya priya wrote:
>> Add temp-alarm node for PM8350C pmic and also modify gpio
>> node to add gpio ranges and "qcom,spmi-gpio" compatible.
> 
> These should be two patches explaining why things are done like that
> 

Okay, will split them.

>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changes in RESEND V4:
>>  - No Changes.
>> 
>>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 32 
>> +++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index 2b9b75e..e1b75ae 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -13,13 +13,43 @@
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>> 
>> +		pm8350c_temp_alarm: temp-alarm@a00 {
>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>>  		pm8350c_gpios: gpio@8800 {
>> -			compatible = "qcom,pm8350c-gpio";
>> +			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
> 
> why is this changed?

As per the Documentation[1], either "qcom,spmi-gpio" or "qcom,ssbi-gpio" 
must be added based on whether the device is on an spmi bus or an ssbi 
bus respectively.

[1] 
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/pinctrl/qcom%2Cpmic-gpio.txt#L41

> 
>>  			reg = <0x8800>;
>>  			gpio-controller;
>> +			gpio-ranges = <&pm8350c_gpios 0 0 9>;
>>  			#gpio-cells = <2>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>>  		};
>>  	};
>>  };
>> +
>> +&thermal_zones {
>> +	pm8350c_thermal: pm8350c-thermal {
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
>> +		thermal-sensors = <&pm8350c_temp_alarm>;
>> +
>> +		trips {
>> +			pm8350c_trip0: trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			pm8350c_crit: pm8350c-crit {
>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
>> +		};
>> +	};
>> +};
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
