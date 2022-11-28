Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A0363ACC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 16:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiK1Pid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 10:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbiK1Pib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 10:38:31 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1569654B
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 07:38:30 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id t4so8743917wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 07:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5amvz7msIQE/Aa+SDeT9RjytpJTz/H0MFfzRFpbJzU=;
        b=LQziLqGWjTaXkBZAob4Y/r7XrXzAVVTbeG3m3Tn+0JMjAnE4ZXo2oDhV3ZRNpFk2G0
         UdfQ12X2ReGkDIMk1367ji/ovCu0R8v+XwCApr/+y+JGu2nTLqLSpFk6Fi47APqIqA5v
         IlkUoVWDah4pQAj0JwF6gjwWbv9y4/+kUfdld8WvqyZy0CK06Loc4ecPRp6mszQEAwIA
         BqxQOLkbAi862mI8WQqF3QRXeIhOl55Ee2eDZJnnmssV1axdBypDVsGIa1WyKOlqA3G6
         AqDBuJygIq3H04Xx45zwVV0xsK2/2xkA9Mqry9RydqHAp5Jq9sc406IoR6XqriVAuDjW
         STjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5amvz7msIQE/Aa+SDeT9RjytpJTz/H0MFfzRFpbJzU=;
        b=bhAmzap4pE/rSAwGwcq1K4/cLmEpo9/4wTctZJXGrH8suz4LFrIj1YNnW8z8LR41FN
         x8z67x5Rgo/ARTQBIajqd86w01nNlmcQDlS3zdIfYlcATMTL2wdxnL/j3Y/ccmr/SCAg
         vzQpv2aWiuZhWQFHRbzZBwDZJ6+3WhNw/yu7NAiZkF1MfpsOvDTtAwtUtA7/iJrHzQXY
         g4vyQ9otpW5EqZOJhMluzrNqMnskEu89/L4XX+tCsnLzzQiVIMEcRYC0kdQjtyj02/RQ
         eW1Ln8gRpEuOVhS3xalnqsAZPOc3ZOHtxg0nYdhVhpkrcNVzEUgX3LoDULSDqhvBVqll
         zBpQ==
X-Gm-Message-State: ANoB5pkgzJCKLPEWRGyJvNKb+BX4/CAlsx+oKeTowI4WYouy/rSEOq4f
        UM+cTcBulfsbSp45OQJEczzmrw==
X-Google-Smtp-Source: AA0mqf5z4fFiLd0UdHJzUN6cbB9OrKwYlpsWzFxFdd02NQOSp9fP5r617waROunK5rncX2t2s/vUiA==
X-Received: by 2002:a05:600c:298:b0:3d0:2707:ad98 with SMTP id 24-20020a05600c029800b003d02707ad98mr23955074wmk.171.1669649909080;
        Mon, 28 Nov 2022 07:38:29 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id m7-20020a05600c4f4700b003cf37c5ddc0sm16377632wmq.22.2022.11.28.07.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 07:38:28 -0800 (PST)
Message-ID: <c017342d-711a-f10f-4154-3ff17ec100d5@linaro.org>
Date:   Mon, 28 Nov 2022 15:38:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: Add soundcard
 support
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221123104342.26140-1-srinivas.kandagatla@linaro.org>
 <20221123104342.26140-4-srinivas.kandagatla@linaro.org>
 <30be93a3-c57f-d4c9-c154-6f12b9dc5dc5@linaro.org>
 <b647750a-65e1-3cd2-6e66-1b8c2823b354@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b647750a-65e1-3cd2-6e66-1b8c2823b354@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/11/2022 12:58, Krzysztof Kozlowski wrote:
> On 28/11/2022 13:44, Krzysztof Kozlowski wrote:
>> On 23/11/2022 11:43, Srinivas Kandagatla wrote:
>>> +
>>> +&swr1 {
>>> +	status = "okay";
>>> +
>>> +	wcd_rx: wcd9380-rx@0,4 {
>>> +		compatible = "sdw20217010d00";
>>> +		reg = <0 4>;
>>> +		qcom,rx-port-mapping = <1 2 3 4 5>;
>>> +	};
>>> +};
>>> +
>>> +&swr2 {
>>> +	status = "okay";
>>> +
>>> +	wcd_tx: wcd9380-tx@0,3 {
>>> +		compatible = "sdw20217010d00";
>>> +		reg = <0 3>;
>>> +		qcom,tx-port-mapping = <1 1 2 3>;
>>
>> I think I solved my head-phones one-channel problem.
>> This should be <1 2 3> and in DTSI:
>> qcom,din-ports = <3>;

WCD938x TX device has 4 SoundWire ports and LPASS TX macro SoundWire 
Master has 3 ports this mapping qcom,tx-port-mapping = <1 1 2 3>; 
defines how wcd device SoundWire ports are connected to SoundWire Master 
port.


>>
>> The downstream waipio-audio-overlay.dtsi says:
>>
>>   56                         qcom,swr-port-mapping = <1 SWRM_TX1_CH1 0x1>,
>>   57                                 <1 SWRM_TX1_CH2 0x2>,
>>   58                                 <1 SWRM_TX1_CH3 0x4>, <1 SWRM_TX1_CH4 0x8>,
>>   59                                 <2 SWRM_TX2_CH1 0x1>, <2 SWRM_TX2_CH2 0x2>,
>>   60                                 <2 SWRM_TX2_CH3 0x4>, <2 SWRM_TX2_CH4 0x8>,
>>   61                                 <3 SWRM_TX3_CH1 0x1>, <3 SWRM_TX3_CH2 0x2>,
>>   62                                 <3 SWRM_TX3_CH3 0x4>, <3 SWRM_TX3_CH4 0x8>;
>>
>> I just don't know what how to trim the port config properties - we
>> have there four entries, but channels are only three?
>>
>> Where do these come from? The downstream:
>> asoc/waipio-port-config.h / lahaina-port-config.h
>> Do do not have port config for this SWR.

yes, that along with dts is the source for this information.

--srini
> 
> Eh, not sure anymore. My second headphone started to work without these
> changes, so I have no clue.
> 
> Best regards,
> Krzysztof
> 
