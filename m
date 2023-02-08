Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDC0D68EC2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjBHJwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjBHJv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:51:58 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794856A4C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:51:56 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id h15so11284289plk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYh8M6vevokJI+V4Ro+h9g2Pga1iRRG9fqvOPZ7TegI=;
        b=rDmhaa2dHGY/YHfc6hjEOCWwmwTImMBrknStws9b9Bj6E12Afhx4geSDu8maV4Enug
         ycqRa3M0K5c2JqrjKJsGIJgpk5LcJhVGj47IFnL7EHV8QDPkX4/pRTe+MS4miOhkz9pd
         IHw/cliwr7eVrZJplHByFgWRs3SHF3PnnhtMApKG0QKmwmZFY2A7yq9R93I9qPKZutEj
         FQJLOHuYxRdT58L1pclxYYktJh+fBh+gV8bvUvbpF7OHNA00aXGZcj5Xx18DJLjkTkg4
         bnBo5f1/rcv9rQFxxKA2U9SX7n2f8z4XctK7JH2YbjHgY8rZxUMpgHv86IK/hN7D092f
         jl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYh8M6vevokJI+V4Ro+h9g2Pga1iRRG9fqvOPZ7TegI=;
        b=Lwx8KE67bet603LwJ7tHrjW/0iwP3/c4RuN1fssu0zfwZKf4GWDAICNPJ/z26w0kyT
         k3v0CAHoc21pIWie8bhWb4nXv+/NwgDFxjpN5ddP4rWplmgVKlKJyr1klB/q8f/qtvf8
         5fDXc6KQjXI0S+DNek3m9nId2TwyV7nRKuXTFPxaIHCKmQTqlEpd9aJiHv1KjFcrj/ae
         +W9VDQdQIckJQx5plYKvCZKz7Y/7JdTi02pW5Tqj3gHyTKRXJeCa29vNiA2IKPHbOyDp
         eihxUeTPbtPqM7MB5XzJ+sTpg2dVQDqXghebKvJZpsMFF+snjekBasMUYZaxaE5HyiXH
         XV5g==
X-Gm-Message-State: AO0yUKWxGW+QipldRRuzwCR/tgzRhAiddGzHVfe8z3TBtA04FU5amX3l
        2ogIKAczbOtT2dLc6ya7SmEqCA==
X-Google-Smtp-Source: AK7set8bW2B8iUUW5m7PL4+mcbaaAm5oHge5Ef4FjgZJzpTejve/M9YjlMfbLTKDRe1j1kT5ItAZeg==
X-Received: by 2002:a17:903:2352:b0:192:4f85:b91d with SMTP id c18-20020a170903235200b001924f85b91dmr7783961plh.46.1675849915915;
        Wed, 08 Feb 2023 01:51:55 -0800 (PST)
Received: from ?IPV6:2401:4900:1c5f:7a7d:9c44:b2ee:ae34:5374? ([2401:4900:1c5f:7a7d:9c44:b2ee:ae34:5374])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b00194caf3e975sm10471321ply.208.2023.02.08.01.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:51:54 -0800 (PST)
Message-ID: <48607619-3a7b-a9d7-1e6a-c24f52539671@linaro.org>
Date:   Wed, 8 Feb 2023 15:21:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Move SDHC node(s)'s 'pinctrl'
 properties to dts
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, konrad.dybcio@linaro.org
References: <20221220113616.1556097-1-bhupesh.sharma@linaro.org>
 <20221221221000.mmahq3nsmyy2bowi@SoMainline.org>
Content-Language: en-US
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20221221221000.mmahq3nsmyy2bowi@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Marjin for the review. Sorry for the delay in replying to your 
comments.

On 12/22/22 3:40 AM, Marijn Suijten wrote:
> On 2022-12-20 17:06:16, Bhupesh Sharma wrote:
>> Normally the 'pinctrl' properties of a SDHC controller and the
>> chip detect pin settings are dependent on the type of the slots
>> (for e.g uSD card slot), regulators and GPIO(s) available on the
>> board(s).
> 
> I always thought it was okay to give the `sdcX_*` pins to the sdhc_X
> node unconditionally in SoC DTSI, and leave board-dependent card-detect
> (if this SDHCI slot is even used for removable cards) pins to the board
> DTS.
> 
>> So, move the same from the sm6115 dtsi file to the respective
>> board file(s).
>>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Thanks for cleaning this up, we're already using this pattern in quite a
> few SoCs now.

Sure. But since they are being used in other SoC DTSIs doesn't guarantee 
the correct demarcation between SoC DTSI and Board DTS :)

> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Though...
> 
>> ---
>>   .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 10 +++++++++
>>   arch/arm64/boot/dts/qcom/sm6115.dtsi          | 22 -------------------
>>   2 files changed, 10 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>> index a3f1c7c41fd73..329eb496bbc5f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>> @@ -202,12 +202,22 @@ &sdhc_2 {
>>   	vqmmc-supply = <&vreg_l5a>;
>>   
>>   	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
>> +	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
>>   
>>   	status = "okay";
>>   };
>>   
>>   &tlmm {
>>   	gpio-reserved-ranges = <14 4>;
>> +
>> +	sdc2_card_det_n: sd-card-det-n-state {
>> +		pins = "gpio88";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
> 
> Note that SoC DTSI uses bias-disable in the off state.

The downstream uses bias-pull-up instead, as is the case with other 
upstream qcom dtsi (see [1] and [2]).

[1]. 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts#L1242

[2]. 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/sdm845-mtp.dts#L783

>> +	};
>>   };
>>   
>>   &ufs_mem_hc {
>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> index 572bf04adf906..6be763d39870d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> @@ -518,13 +518,6 @@ data-pins {
>>   					bias-pull-up;
>>   					drive-strength = <10>;
>>   				};
>> -
>> -				sd-cd-pins {
>> -					pins = "gpio88";
>> -					function = "gpio";
>> -					bias-pull-up;
>> -					drive-strength = <2>;
>> -				};
>>   			};
>>   
>>   			sdc2_state_off: sdc2-off-state {
>> @@ -545,13 +538,6 @@ data-pins {
>>   					bias-pull-up;
>>   					drive-strength = <2>;
>>   				};
>> -
>> -				sd-cd-pins {
>> -					pins = "gpio88";
>> -					function = "gpio";
>> -					bias-disable;
>> -					drive-strength = <2>;
>> -				};
>>   			};
>>   		};
>>   
>> @@ -652,10 +638,6 @@ sdhc_1: mmc@4744000 {
>>   				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>>   			clock-names = "iface", "core", "xo", "ice";
>>   
>> -			pinctrl-0 = <&sdc1_state_on>;
>> -			pinctrl-1 = <&sdc1_state_off>;
>> -			pinctrl-names = "default", "sleep";
>> -
> 
> You can probably leave these and below?  Only boards needing to extend
> pinctrl with board-specific SDCard pins would have to update/override
> these properties that way?

I disagree on this. But let's defer to @Bjorn for further inputs on the 
same.

Thanks,
Bhupesh

>>   			bus-width = <8>;
>>   			status = "disabled";
>>   		};
>> @@ -672,10 +654,6 @@ sdhc_2: mmc@4784000 {
>>   			clocks = <&gcc GCC_SDCC2_AHB_CLK>, <&gcc GCC_SDCC2_APPS_CLK>, <&xo_board>;
>>   			clock-names = "iface", "core", "xo";
>>   
>> -			pinctrl-0 = <&sdc2_state_on>;
>> -			pinctrl-1 = <&sdc2_state_off>;
>> -			pinctrl-names = "default", "sleep";
>> -
>>   			power-domains = <&rpmpd SM6115_VDDCX>;
>>   			operating-points-v2 = <&sdhc2_opp_table>;
>>   			iommus = <&apps_smmu 0x00a0 0x0>;
>> -- 
>> 2.38.1
>>
