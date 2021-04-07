Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CFD35703A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353589AbhDGP3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:29:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35324 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353547AbhDGP3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:29:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809339; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F7RjGzHLnOe0x2KX4TmumeGbgFQFa61KbFmmuF6pD7k=;
 b=Wjy45oP/mjrkRP+37Y6t45PHjXf6eZXvjBYWHvCEATnKZHL3BPLHocfxNJuNTrAl8unVcBVv
 Bi1EPMzXHGYzFWNApkJjAgPqjYzmZ8AYKDfg/9wVjJ9RY/UXk3dlGy6TD+4YSMp379PnNKzZ
 lE43o5bFKuzMCVE1yc55OxyJjWw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 606dcfb887ce1fbb5689d977 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:28:56
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 726C5C433ED; Wed,  7 Apr 2021 15:28:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8FC1C433C6;
        Wed,  7 Apr 2021 15:28:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 20:58:54 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: pmk8350: Add PMIC peripherals
 for pmk8350
In-Reply-To: <YGdmS8Ih5TGGMbdE@google.com>
References: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
 <1617268396-1837-4-git-send-email-skakit@codeaurora.org>
 <YGdmS8Ih5TGGMbdE@google.com>
Message-ID: <ee0a5b81ab66870b7e13c9af7ce5b29f@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-03 00:15, Matthias Kaehlcke wrote:
> On Thu, Apr 01, 2021 at 02:43:14PM +0530, satya priya wrote:
>> subject: arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
> 
> same nit as for 1/5: maybe just 'arm64: dts: qcom: Add pml7350 
> support/.dtsi'
> or similar since this adds the initial .dtsi for the pmk8350?
> 
>> Add PON, GPIO, RTC and other PMIC infra modules support for pmk8350.
> 

I see that pmk8350 DT file is already added in linux-next.
Only GPIO node has been added, will add remaining nodes and change 
commit text accordingly.

> nit: also mention that it adds the pmk8350 .dtsi in the first place.
> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 100 
>> ++++++++++++++++++++++++++++++++++
>>  1 file changed, 100 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi 
>> b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> new file mode 100644
>> index 0000000..13631f2
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> @@ -0,0 +1,100 @@
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
> 
> Please provide a link to the binding if it has been sent.
> 
>> +		reg = <0x0 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmk8350_pon: pon@1300 {
>> +			compatible = "qcom,pm8998-pon";
>> +			reg = <0x1300>;
>> +
>> +			pwrkey {
>> +				compatible = "qcom,pmk8350-pwrkey";
>> +				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
>> +				linux,code = <KEY_POWER>;
>> +			};
>> +
>> +			resin {
>> +				compatible = "qcom,pmk8350-resin";
>> +				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
>> +				linux,code = <KEY_VOLUMEDOWN>;
>> +			};
> 
> Is the usage of this keys really universal across different boards?
> 

Yes, It is universal across different boards.

> At least for the volume down key for most PMICs the config is in the
> board file, which seems to make more sense.
> 
>> +		};
>> +
>> +		pmk8350_vadc: adc@3100 {
>> +			compatible = "qcom,spmi-adc7";
>> +			reg = <0x3100>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "eoc-int-en-set";
>> +			#io-channel-cells = <1>;
>> +			io-channel-ranges;
>> +
>> +			pmk8350_die_temp {
>> +				reg = <PMK8350_ADC7_DIE_TEMP>;
>> +				label = "pmk8350_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			pm8350_die_temp {
>> +				reg = <PM8350_ADC7_DIE_TEMP>;
>> +				label = "pm8350_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
> 
> nit: I think this should be 'alphabetical' order, so 'pm8350_die_temp' 
> should
> be before 'pmk8350_die_temp'.
> 

Ok.

>> +
>> +			pmr735a_die_temp {
>> +				reg = <PMR735A_ADC7_DIE_TEMP>;
>> +				label = "pmr735a_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			pmr735b_die_temp {
>> +				reg = <PMR735B_ADC7_DIE_TEMP>;
>> +				label = "pmr735b_die_temp";
>> +				qcom,pre-scaling = <1 1>;
>> +			};
> 
> Is it guaranteed that a board with the pmk8350 will always have the
> other 3 PMICs?
> 

No.
Ok, will move this to idp board dts file.

>> +		};
>> +
>> +		pmk8350_adc_tm: adc-tm@3400 {
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
> 
> nit: nodes should be ordered by address, hence 'rtc@6100' should be 
> before
> 'gpios@b000'.
> 

Ok.

>> +			compatible = "qcom,pmk8350-rtc";
>> +			reg = <0x6100>, <0x6200>;
>> +			reg-names = "rtc", "alarm";
>> +			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +	};
>> +};
