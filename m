Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62924048BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 12:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhIIK6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 06:58:41 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:47237 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbhIIK6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 06:58:41 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 52C173E94E;
        Thu,  9 Sep 2021 12:57:30 +0200 (CEST)
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8998-xperia: Add audio clock and
 its pin
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-7-angelogioacchino.delregno@somainline.org>
 <YTdtjRonJBtJUk9N@ripper>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <30af450e-c98d-5e88-0506-75b1ec43bd42@somainline.org>
Date:   Thu, 9 Sep 2021 12:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YTdtjRonJBtJUk9N@ripper>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 07/09/21 15:47, Bjorn Andersson ha scritto:
> On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> All smartphones of this platform are equipped with a WCD9335 audio
>> codec, getting its MCLK from PM8998 gpio13: add this clock to DT.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> index 5fbe5abf4133..7aeebd3b2e9e 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> @@ -20,6 +20,19 @@ / {
>>   	qcom,msm-id = <0x124 0x20000>, <0x124 0x20001>; /* 8998v2, v2.1 */
>>   	qcom,board-id = <8 0>;
>>   
>> +	clocks {
>> +		compatible = "simple-bus";
>> +
>> +		div1_mclk: divclk1 {
>> +			compatible = "gpio-gate-clock";
>> +			pinctrl-0 = <&audio_mclk_pin>;
>> +			pinctrl-names = "default";
>> +			clocks = <&rpmcc RPM_SMD_DIV_CLK1>;
> 
> What controls the clock rate of divclk1?
> 

That's going to be assigned to WCD9335 (oh btw, I have working audio locally!
it's not great, but I can hear sounds from the internal speakers), but I
haven't added the entire audio configuration in these submitted commits because:
1. It needs two GDSCs in GCC: adding them without enabling the lpass iommu will
    produce a crash, as the iommu would go off when the kernel starts turning off
    unused stuff... and we have secure contexts there, which means that the
    hypervisor will say hello;
2. The lpass iommu needs a commit in the qcom smmu implementation detail driver,
    as we need to select a different context (not the last ctx, but the one before)
    for bypass streams emulation, as the last one seems to be untouchable... small
    preview of the required commit:
    qsmmu->bypass_cbndx = [value from dt], or [default == smmu->num_context_banks-1]
3. We need the lpass iommu to get "the audio stuff" (surely, no need to list it).

So that's the entire picture... I am planning to get this base merged in before
going for a cleanup and submission of the rest of what I have here.


Long story short: WCD9335 will be responsible for controlling this clock.

Cheers,
- Angelo

> Regards,
> Bjorn
> 
>> +			#clock-cells = <0>;
>> +			enable-gpios = <&pm8998_gpio 13 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +
>>   	board_vbat: vbat-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "VBAT";
>> @@ -313,6 +326,12 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
>>   		input-enable;
>>   		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
>>   	};
>> +
>> +	audio_mclk_pin: audio-mclk-pin-active {
>> +		pins = "gpio13";
>> +		function = "func2";
>> +		power-source = <0>;
>> +	};
>>   };
>>   
>>   &pmi8998_gpio {
>> -- 
>> 2.32.0
>>

