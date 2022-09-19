Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD915BCFB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 16:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiISOyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 10:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiISOyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 10:54:03 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAA53340B
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 07:54:01 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4F2A21F4F5;
        Mon, 19 Sep 2022 16:53:58 +0200 (CEST)
Message-ID: <bbd12b92-3f3f-12f2-7693-54dd1f762e23@somainline.org>
Date:   Mon, 19 Sep 2022 16:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 5/7] arm64: qcom: dts: sagami: correct firmware paths
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
 <20220915152630.133528-6-dmitry.baryshkov@linaro.org>
 <5c701a7f-14cb-a11c-d822-6a89c4ca903c@somainline.org>
 <710F2BE9-F2A6-4931-9856-FE81293D1929@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <710F2BE9-F2A6-4931-9856-FE81293D1929@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.09.2022 22:33, Dmitry Baryshkov wrote:
> 
> 
> On 17 September 2022 16:07:13 GMT+03:00, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>>
>>
>> On 15.09.2022 17:26, Dmitry Baryshkov wrote:
>>> Correct firmware paths for the Sony Xperia Sagami devices to include the
>>> SoC name.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  .../arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>>> index b3c9952ac173..e0940cb58681 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>>> @@ -77,12 +77,12 @@ ramoops@ffc00000 {
>>>  
>>>  &adsp {
>>>  	status = "okay";
>>> -	firmware-name = "qcom/adsp.mbn";
>>> +	firmware-name = "qcom/sdm8350/sagami/adsp.mbn";
>> sm8350 ;)
>>
>> I think it would be cleaner to follow with what's currently in linux-firmware [1],
>> so "qcom/socname/vendor/platform-or-device". Xperias have a single key per SoC, so
>> per-platform is fine here. Should be the same for other vendors, but no guarantees.
>>
>> In this particular case, I think qcom/sm8350/SOMC/sagami would be appropriate, as
>> it seems like SONY is still internally using that name [2] (SOny Mobile Communications)
>> (sidenote: they are still using the legacy SEMC / Sony Ericsson Mobile
>> Communications in some places if you dig deep enough :D), buuuut they can't seem
>> to decide, might as well make it PlayStation at this point haha
> 
> I'd vote for plain Sony. Both SOMC and SEMC are non-obvious and too cryptic.
Let's go with that then.

Konrad
> 
>>
>>
>> Konrad
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/sc8280xp/LENOVO
>> [2] https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/64.0.A.2.xxx/devicetree/qcom/waipio-nagara-pdx223_generic.dts#L10
>>>  };
>>>  
>>>  &cdsp {
>>>  	status = "okay";
>>> -	firmware-name = "qcom/cdsp.mbn";
>>> +	firmware-name = "qcom/sdm8350/sagami/cdsp.mbn";
>>>  };
>>>  
>>>  &i2c1 {
>>> @@ -175,12 +175,12 @@ &i2c17 {
>>>  &ipa {
>>>  	status = "okay";
>>>  	memory-region = <&pil_ipa_fw_mem>;
>>> -	firmware-name = "qcom/ipa_fws.mbn";
>>> +	firmware-name = "qcom/sdm8350/sagami/ipa_fws.mbn";
>>>  };
>>>  
>>>  &mpss {
>>>  	status = "okay";
>>> -	firmware-name = "qcom/modem.mbn";
>>> +	firmware-name = "qcom/sdm8350/sagami/modem.mbn";
>>>  };
>>>  
>>>  &pmk8350_rtc {
>>> @@ -210,7 +210,7 @@ &qupv3_id_2 {
>>>  
>>>  &slpi {
>>>  	status = "okay";
>>> -	firmware-name = "qcom/slpi.mbn";
>>> +	firmware-name = "qcom/sdm8350/sagami/slpi.mbn";
>>>  };
>>>  
>>>  &spi14 {
> 
