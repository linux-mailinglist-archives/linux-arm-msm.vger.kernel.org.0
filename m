Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4840D632002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 12:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiKULNq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 06:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiKULNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 06:13:23 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB094BEAC3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:08:52 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso8768550wmo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldIw3qE7TcfeO+CMNZSZzhqJXxqw8uTyqxjG7TVKHRA=;
        b=a1X2OKkvQNOYrg2Ho4tHtXzbCVjjPjCnUbH2he6Lu/0a/dCxUbCFQkuAi+REPRzjZz
         vew6pHKduwMkWoIO0JFU/eotkrhuRQxO8RvUdmBEVw0/WoucoCNxVQzaQOcy+BZvY8C8
         GRXQvw3iqKXinlhtPt5/9ltQQ/0PUY7scXsvM8uqGRZH042S/gLyz+3gVZlo3U85Pe7Q
         i49pKaEMahMQ4i5dqU8ErKx69bt0GMoWN77LXNtlSYWfYChkgCpTk1FhUPJlU1VToP/m
         ETVt06vLHRXdNlEG6t2QPZWo2cw0QSiIORrkjxqTuoGXdFjZoeUFWeFkVtHZvRMmGqQR
         LLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldIw3qE7TcfeO+CMNZSZzhqJXxqw8uTyqxjG7TVKHRA=;
        b=mTB+XfsX/afiSQuDUzLnSPaDUT9A1q6fWMhxlNvxS7ovyorHrsdg3Ky95HY/pioXLA
         dWYE1Jwiz9YSEt4nAEYq/Ems1STHm/rJN8kmkGAhdRa1eaWxbe3IS4KaR0IwbmVEk050
         C5Wkd3dokOf3br9Suxh7w/I4qfKXPn9j0ajb+Ygb0BkGql+6s4TvOR+TPNAUCP4dG1mt
         9p6MkQBnGdKQZKbK6kUdZh59J719QC51gosZZIsnBeFk5doK8lkCqiSHql1AMKqkHYVc
         t2tJ8fZ3YxzYiTVnvLARcZb7jWboxoRdVvbGr9F3Eyku8hF96CXgnU/EXG+jZrRkDdcU
         8ECw==
X-Gm-Message-State: ANoB5pmbMsEsCLUXPt8FG8GN4pBsTQN+2k4XuRSuHUFWEOjDtCS8qbej
        hgi0CO1IJj0KSU3cvKiEGU7ZuHBsIlqiXQ==
X-Google-Smtp-Source: AA0mqf4890BbDvUAZKyzdiBlp8Yumr3tgn5xlZULQw9eYNuxY4HTyXVcYs/0E8kBvE+LhjlPgDChug==
X-Received: by 2002:a05:600c:4c21:b0:3b4:8fd4:293e with SMTP id d33-20020a05600c4c2100b003b48fd4293emr15856331wmp.46.1669028924530;
        Mon, 21 Nov 2022 03:08:44 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm19606724wmb.19.2022.11.21.03.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:08:43 -0800 (PST)
Message-ID: <74e3582e-ac89-b81d-fe0e-c3f63d3e7985@linaro.org>
Date:   Mon, 21 Nov 2022 11:08:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add soundcard support
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221119164425.86014-1-srinivas.kandagatla@linaro.org>
 <20221119164425.86014-4-srinivas.kandagatla@linaro.org>
 <1353266c-2d95-6c68-5288-c405231a37f1@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1353266c-2d95-6c68-5288-c405231a37f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Krzysztof,

On 21/11/2022 08:34, Krzysztof Kozlowski wrote:
> On 19/11/2022 17:44, Srinivas Kandagatla wrote:
>> Add support for SoundCard on X13s. This patch adds support for Headset
>> Playback, record and 2 DMICs on the Panel along with the regulators
>> required for powering up the LPASS codecs.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +	right_spkr: wsa8830-right@0,2{
>> +		compatible = "sdw10217020200";
>> +		reg = <0 2>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&spkr_2_sd_n_default>;
>> +		powerdown-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
>> +		#thermal-sensor-cells = <0>;
>> +		sound-name-prefix = "SpkrRight";
>> +		#sound-dai-cells = <0>;
>> +		vdd-supply = <&vreg_s10b>;
>> +	};
>> +};
>> +
>> +
> 
> Only one blank line.
> 
>> +&swr1 {
>> +	status = "okay";
>> +
>> +	wcd_rx: wcd9380-rx@0,4 {
>> +		compatible = "sdw20217010d00";
>> +		reg = <0 4>;
>> +		qcom,rx-port-mapping = <1 2 3 4 5 6>;
> 
> No improvements: Still looks too long.
Yep we only have 5 out ports.

> 
>> +
> 
> Drop empty line.

Looks like I had to many stray lines :-)

will fix this in next spin.

>> +	};
>> +};
>> +
>> +&swr2 {
>> +	status = "okay";
>> +
>> +	wcd_tx: wcd9380-tx@0,3 {
>> +		compatible = "sdw20217010d00";
>> +		reg = <0 3>;
>> +		qcom,tx-port-mapping = <1 1 2 3>;
>> +	};
>> +};
>> +
>> +&vamacro {
>> +	pinctrl-0 = <&dmic01_default>, <&dmic02_default>;
>> +	pinctrl-names = "default";
>> +	vdd-micb-supply = <&vreg_s10b>;
>> +	qcom,dmic-sample-rate = <600000>;
>> +};
>> +
>>   &tlmm {
>>   	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>>   
>> @@ -369,6 +558,14 @@ reset {
>>   		};
>>   	};
>>   
>> +	wcd_default: wcd-default-state {
>> +		reset-pins {
>> +			pins = "gpio106";
>> +			function = "gpio";
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>   	qup0_i2c4_default: qup0-i2c4-default-state {
>>   		pins = "gpio171", "gpio172";
>>   		function = "qup4";
>> @@ -383,6 +580,26 @@ qup2_i2c5_default: qup2-i2c5-default-state {
>>   		drive-strength = <16>;
>>   	};
>>   
>> +	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
>> +		perst-n-pins {
>> +			pins = "gpio178";
>> +			function = "gpio";
>> +			drive-strength = <16>;
>> +			bias-disable;
>> +			output-high;
>> +		};
>> +	};
>> +
>> +	spkr_2_sd_n_default: spkr-2-sd-n-default-state {
>> +		perst-n-pins {
>> +			pins = "gpio179";
>> +			function = "gpio";
>> +			drive-strength = <16>;
>> +			bias-disable;
>> +			output-high;
>> +		};
>> +	};
>> +
>>   	tpad_default: tpad-default-state {
>>   		int-n {
> 
> This won't apply cleanly. You need to base your patches on recent trees.

Yes, I will rebase this on top of 
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-6.2

--srini
> 
> Best regards,
> Krzysztof
> 
