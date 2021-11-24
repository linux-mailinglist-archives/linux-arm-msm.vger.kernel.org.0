Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8687F45B97A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 12:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241764AbhKXLwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 06:52:25 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:26307 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241766AbhKXLwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 06:52:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637754543; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=QyOurOsREviPQ9JNA+8Z0Dpd8ffElEDjACrA+D9jJ20=; b=OMc64f7fOffSK4numb2DHf91w8BwylAKSXfZ0eDRKbxpJ5ldlgrjkk8MfUYbPt2U46U5fIQu
 E7ACG/9ExAsnyhik+7LZ8FS6UPmfKQxhafDJSngj4qCRm0JH3OQsxOPHWKBxaBN04uxqvzPf
 vrrctrIzPfvTKfsMlyAZ8XkVMIw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 619e26a9e7d68470af8aef09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 11:48:57
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D1D9C4360C; Wed, 24 Nov 2021 11:48:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1EEBC43616;
        Wed, 24 Nov 2021 11:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D1EEBC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <3b89ed5e-52b6-f450-7504-4bf33a42c9b6@codeaurora.org>
Date:   Wed, 24 Nov 2021 17:18:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7280: Define EC and H1 nodes
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, kgodara@codeaurora.org
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
 <1637650813-16654-4-git-send-email-rnayak@codeaurora.org>
 <YZ0nmrGHwIMdN2v6@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
In-Reply-To: <YZ0nmrGHwIMdN2v6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/23/2021 11:10 PM, Matthias Kaehlcke wrote:
> On Tue, Nov 23, 2021 at 12:30:12PM +0530, Rajendra Nayak wrote:
> 
>> Subject: arm64: dts: qcom: sc7280: Define EC and H1 nodes
> 
> that seems to suggest that EC and H1 nodes are something generic of the
> sc7280, however these two chips are only present on systems that target
> Chrome OS, and the specific nodes are added are only used by the QCA
> sc7280 IDP and CRD, not other sc7280 boards using Chrome OS, like
> herobrine. I suggest to change it to "arm64: dts: qcom: sc7280: Define
> EC and H1 nodes for IDP/CRD".

sure makes sense

> 
>> From: Kshitiz Godara <kgodara@codeaurora.org>
>>
>> The IDP2 and CRD boards share the EC and H1 parts, so define
>> all related device nodes into a common file and include them
>> in the idp2 and crd dts files to avoid duplication.
>>
>> Signed-off-by: Kshitiz Godara <kgodara@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280-crd.dts    |   1 +
>>   arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi | 110 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280-idp2.dts   |   1 +
>>   3 files changed, 112 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> index 09d02c2..8c2aee6 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> @@ -8,6 +8,7 @@
>>   /dts-v1/;
>>   
>>   #include "sc7280-idp.dtsi"
>> +#include "sc7280-ec-h1.dtsi"
>>   
>>   / {
>>   	model = "Qualcomm Technologies, Inc. sc7280 CRD platform";
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
>> new file mode 100644
>> index 0000000..78fb5eb
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
> 
> Similar comment as for the subject, the file name seems to imply
> that the include could be useful for any board with an EC and H1,
> however it will be only used by the IDP and CRD. Maybe name it
> 'sc7280-idp-ec-h1.dtsi', from the CRD DT file it is alreay clear
> that it is related with the IDP, so it shouldn't be too confusing
> that the file name only says IDP.
> 
> Also a birdie told me that the EC and H1 configuration is going to
> change in future revisions of the CRD, which is another reason for
> being more specific with the file name (a sc7280-crd-ec-h1.dtsi
> might be needed at that point, or the new not-any-longer-shared
> config goes directly into the sc7280-crd-revN.dts.

right I will rename it to sc7280-idp-ec-h1.dtsi

> 
>> @@ -0,0 +1,110 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * sc7280 EC/H1 over SPI (common between IDP2 and CRD)
>> + *
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +ap_ec_spi: &spi10 {
>> +	status = "okay";
>> +
>> +	pinctrl-0 = <&qup_spi10_cs_gpio_init_high>, <&qup_spi10_cs_gpio>;
> 
> Shouldn't this also have <&qup_spi10_data_clk>?

looks like it does, I'll add

> 
>> +	cs-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
>> +
>> +	cros_ec: ec@0 {
>> +		compatible = "google,cros-ec-spi";
>> +		reg = <0>;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ap_ec_int_l>;
>> +		spi-max-frequency = <3000000>;
>> +
>> +		cros_ec_pwm: ec-pwm {
>> +			compatible = "google,cros-ec-pwm";
>> +			#pwm-cells = <1>;
>> +		};
>> +
>> +		i2c_tunnel: i2c-tunnel {
>> +			compatible = "google,cros-ec-i2c-tunnel";
>> +			google,remote-bus = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +		typec {
>> +			compatible = "google,cros-ec-typec";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			usb_c0: connector@0 {
>> +				compatible = "usb-c-connector";
>> +				reg = <0>;
>> +				label = "left";
>> +				power-role = "dual";
>> +				data-role = "host";
>> +				try-power-role = "source";
>> +			};
>> +
>> +			usb_c1: connector@1 {
>> +				compatible = "usb-c-connector";
>> +				reg = <1>;
>> +				label = "right";
>> +				power-role = "dual";
>> +				data-role = "host";
>> +				try-power-role = "source";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +#include <arm/cros-ec-keyboard.dtsi>
>> +#include <arm/cros-ec-sbs.dtsi>
>> +
>> +ap_h1_spi: &spi14 {
>> +	status = "okay";
>> +
>> +	pinctrl-0 = <&qup_spi14_cs_gpio_init_high>, <&qup_spi14_cs_gpio>;
> 
> <&qup_spi14_data_clk> missing?
> 
>> +	cs-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
>> +
>> +	cr50: tpm@0 {
>> +		compatible = "google,cr50";
>> +		reg = <0>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&h1_ap_int_odl>;
>> +		spi-max-frequency = <800000>;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <104 IRQ_TYPE_EDGE_RISING>;
>> +	};
>> +};
>> +
>> +&tlmm {
>> +	ap_ec_int_l: ap-ec-int-l {
>> +		pins = "gpio18";
>> +		function = "gpio";
>> +		input-enable;
>> +		bias-pull-up;
>> +		drive-strength = <2>;
> 
> Is the explicit drive-strength setting actually needed?
> 
> Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml:
> 
>    drive-strength:
>      enum: [2, 4, 6, 8, 10, 12, 14, 16]
>      default: 2 <=
>      description:
>        Selects the drive strength for the specified pins, in mA.
> 
> The default is 2, hence it shouldn't be necessary it set it explicitly.

right, will remove when i respin
thanks for the review

> 
>> +	};
>> +
>> +	h1_ap_int_odl: h1-ap-int-odl {
>> +		pins = "gpio104";
>> +		function = "gpio";
>> +		input-enable;
>> +		bias-pull-up;
>> +		drive-strength = <2>;
> 
> see above
> 
>> +	};
>> +
>> +	qup_spi10_cs_gpio_init_high: qup-spi10-cs-gpio-init-high {
>> +		pins = "gpio43";
>> +		output-high;
>> +		drive-strength = <2>;
> 
> see above
> 
>> +	};
>> +
>> +	qup_spi14_cs_gpio_init_high: qup-spi14-cs-gpio-init-high {
>> +		pins = "gpio59";
>> +		output-high;
>> +		drive-strength = <2>;
> 
> see above
> 
>> +	};
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> index 3ae9969..208ca69 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> @@ -8,6 +8,7 @@
>>   /dts-v1/;
>>   
>>   #include "sc7280-idp.dtsi"
>> +#include "sc7280-ec-h1.dtsi"
>>   
>>   / {
>>   	model = "Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform";

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
