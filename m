Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95D153EDF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 20:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbiFFSg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 14:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiFFSg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 14:36:26 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E39116D
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 11:36:21 -0700 (PDT)
Received: from [10.1.250.9] (unknown [194.29.137.21])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 89C262006B;
        Mon,  6 Jun 2022 20:36:18 +0200 (CEST)
Message-ID: <26271fb3-7992-7ad0-e3dd-6b69a70f3127@somainline.org>
Date:   Mon, 6 Jun 2022 20:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
 <20220606132029.2221257-5-bryan.odonoghue@linaro.org>
 <1622739f-0cac-5b9f-325f-6a7b7eeb0606@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <1622739f-0cac-5b9f-325f-6a7b7eeb0606@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 06/06/2022 18:03, Dmitry Baryshkov wrote:
> On 06/06/2022 16:20, Bryan O'Donoghue wrote:
>> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 
>> populated.
>> Other sensors and components may be added or stacked with additional
>> mezzanines.
>>
>> In this drop we enable the Sony imx577 main camera sensor.
>>
>> The IMX577 is on CCI1/CSI2 provides four lanes of camera data.
>>
>> An example media-ctl pipeline is:
>>
>> media-ctl --reset
>> media-ctl -v -d /dev/media0 -V '"imx412 
>> '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>> /dev/video0
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>   .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 68 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 +++++++++
>>   3 files changed, 102 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index 2f8aec2cc6db..86e6801a9c29 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += 
>> msm8998-sony-xperia-yoshino-poplar.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qrb5165-rb5.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += qrb5165-rb5-vision-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sa8155p-adp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sc7180-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sc7180-trogdor-coachz-r1.dtb
>> diff --git 
>> a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts 
>> b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>> new file mode 100644
>> index 000000000000..c8bed02243f8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2022, Linaro Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "qrb5165-rb5.dts"
>> +
>> +&camcc {
>> +    status = "okay";
>> +};
>> +
>> +&camss {
>> +    status = "okay";
>> +    vdda-phy-supply = <&vreg_l5a_0p88>;
>> +    vdda-pll-supply = <&vreg_l9a_1p2>;
>> +
>> +    ports {
>> +        /* The port index denotes CSIPHY id i.e. csiphy2 */
>> +        port@2 {
>> +            reg = <2>;
>> +            csiphy2_ep: endpoint {
>> +                clock-lanes = <7>;
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx412_ep>;
>> +            };
>> +
>> +        };
>> +    };
>> +};
>> +
>> +&cci1 {
>> +    status = "okay";
>> +};
>> +
>> +&cci1_i2c0 {
>> +    camera@1a {
>> +        /*
>> +         * rb5 ships with an imx577. camx code from qcom treats imx412
>> +         * and imx577 the same way. Absent better data do the same 
>> here.
>> +         */
>> +        compatible = "sony,imx412";
>
> I'd prefer to list "sony,imx577", "sony,imx412" here or even just 
> imx577 here and extend imx412 driver to support imx577 compat.

I like this approach as well. Even if they technically *should* be the 
same, this would allow for introducing per-sensor quirks should there be 
any.


Konrad

>
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names = "default", "suspend";
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-1 = <&cam2_suspend>;
>> +
>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply  = <&vreg_l7f_1p8>;
>> +        avdd-supply = <&vdc_5v>;
>> +        dvdd-supply = <&vdc_5v>;
>> +
>> +        port {
>> +            imx412_ep: endpoint {
>
> I'd call this the imx577_ep. It's still the imx577 sensor, despite the 
> kernel using imx412 compat
>
>> +                clock-lanes = <1>;
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy2_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index aa9a13364865..2b65ec2806d0 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -3788,6 +3788,39 @@ tlmm: pinctrl@f100000 {
>>               gpio-ranges = <&tlmm 0 0 181>;
>>               wakeup-parent = <&pdc>;
>>   +            cam2_default: cam2-default {
>> +                rst {
>> +                    pins = "gpio78";
>> +                    function = "gpio";
>> +                    drive-strength = <2>;
>> +                    bias-disable;
>> +                };
>> +
>> +                mclk {
>> +                    pins = "gpio96";
>> +                    function = "cam_mclk";
>> +                    drive-strength = <16>;
>> +                    bias-disable;
>> +                };
>> +            };
>> +
>> +            cam2_suspend: cam2-suspend {
>> +                rst {
>> +                    pins = "gpio78";
>> +                    function = "gpio";
>> +                    drive-strength = <2>;
>> +                    bias-pull-down;
>> +                    output-low;
>> +                };
>> +
>> +                mclk {
>> +                    pins = "gpio96";
>> +                    function = "cam_mclk";
>> +                    drive-strength = <2>;
>> +                    bias-disable;
>> +                };
>> +            };
>> +
>>               cci0_default: cci0-default {
>>                   cci0_i2c0_default: cci0-i2c0-default {
>>                       /* SDA, SCL */
>
>
