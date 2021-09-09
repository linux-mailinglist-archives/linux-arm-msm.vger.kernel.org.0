Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051FE404946
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 13:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbhIIL1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 07:27:08 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:48473 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234962AbhIIL1I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 07:27:08 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F0413EEA8;
        Thu,  9 Sep 2021 13:25:58 +0200 (CEST)
Subject: Re: [PATCH 2/7] arm64: dts: qcom: msm8998-xperia: Add RMI4
 touchscreen support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-2-angelogioacchino.delregno@somainline.org>
 <YTdsBg78ErgxqFXy@ripper>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <8c817fed-ebc3-c269-ee00-bdef12f707af@somainline.org>
Date:   Thu, 9 Sep 2021 13:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YTdsBg78ErgxqFXy@ripper>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 07/09/21 15:41, Bjorn Andersson ha scritto:
> On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> All of the devices in the Sony Yoshino platform are using a Synaptics
>> RMI4-compatible touch IC with identical pins and supplies: enable the
>> I2C-5 bus and add the rmi4-i2c node along with the required pin
>> configurations.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 60 +++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> index b07cbc759807..2fe53e4675d5 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> @@ -30,6 +30,15 @@ board_vbat: vbat-regulator {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	touch_vddio_vreg: touch-vddio-vreg {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "touch_vddio_vreg";
>> +		startup-delay-us = <10000>;
>> +		gpio = <&tlmm 133 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ts_vddio_en>;
>> +	};
>> +
>>   	vph_pwr: vph-pwr-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vph_pwr";
>> @@ -134,6 +143,42 @@ ramoops@ffc00000 {
>>   	};
>>   };
>>   
>> +&blsp1_i2c5 {
>> +	status = "okay";
>> +	clock-frequency = <355000>;
>> +
>> +	touchscreen: synaptics-rmi4-i2c@2c {
> 
> "touchscreen" sounds like a better "generic name" for the node.
> 
> Haven't checked the following patches yet, do you need the label?
> 

Thank you, I forgot to remove the label after a cleanup.
Also, node name changed.

Cheers,
- Angelo

> Regards,
> Bjorn
> 
>> +		compatible = "syna,rmi4-i2c";
>> +		reg = <0x2c>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ts_int_n>;
>> +
>> +		vdd-supply = <&vreg_l28_3p0>;
>> +		vio-supply = <&touch_vddio_vreg>;
>> +
>> +		syna,reset-delay-ms = <220>;
>> +		syna,startup-delay-ms = <1000>;
>> +
>> +		rmi4-f01@1 {
>> +			reg = <0x01>;
>> +			syna,nosleep-mode = <1>;
>> +		};
>> +
>> +		rmi4-f11@11 {
>> +			reg = <0x11>;
>> +			syna,sensor-type = <1>;
>> +		};
>> +	};
>> +};
>> +
>> +&blsp1_i2c5_sleep {
>> +	bias-disable;
>> +};
>> +
>>   &blsp2_uart1 {
>>   	status = "okay";
>>   };
>> @@ -448,6 +493,21 @@ hall_sensor0_default: acc-cover-open {
>>   		drive-strength = <2>;
>>   		input-enable;
>>   	};
>> +
>> +	ts_int_n: ts-int-n {
>> +		pins = "gpio125";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	ts_vddio_en: ts-vddio-en-default {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		bias-disable;
>> +		drive-strength = <2>;
>> +		output-low;
>> +	};
>>   };
>>   
>>   /*
>> -- 
>> 2.32.0
>>

