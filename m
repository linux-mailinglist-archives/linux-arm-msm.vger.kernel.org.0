Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9DC658BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiL2K6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiL2K6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:58:02 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5849665F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:58:01 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so10386122lfb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfIpZeybmiTXSCTrfCMEUJqrNv84QBe465sGsNxFGUU=;
        b=ZP2IDJ6NBFhWnSdLhWKsB0VhP8lSxXn+KWaPKyH5+iUWKLI98+vuyFhG2k9bbuutoX
         AXZB8biU5wSagbBk8/yBi864c2cfaZLaeByDG8i0tE2QUSt8LAgyylRUCEM9UWCthrIy
         1/EZcnzWHkm98Hg+tskczggF/X/ie/4hOhhAiu22w+XxnB6FGI7Lpkus27RyrNUx+jhz
         MRZjhRi0X20QG2l+GNYcqHfKf70OuPsqBgK65gsipuRKUtuPo4sSDTjF1YTuHB9ABOp7
         wVHMWRoDFJ7b82zUKoI5C4g2XlSeJ1LZU/o9EaAx8Y+rufGjpt+TALcpLQjWq/HkD5D4
         B7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfIpZeybmiTXSCTrfCMEUJqrNv84QBe465sGsNxFGUU=;
        b=BKFzF2b6ympRCz4NEtdP3yGhfSJQQFNu9EpnCEdqEnjOYF3I2XWq2/anoUFCZHVUEx
         TBT6KXNzezA/ePmWDJEYerPJYtVvbMXyNN5mEMXFhKWlvv6ByoeqisEXlJu2ZVLow3SB
         3iIVR82xVulqtrDdhqVK3tyjKkpXivYsMyFUKr+5oXSuqs6lloOrt22VuLD95GvTOa3V
         wzpldQgwRJdxZMGJM1MlkB69G8c2YNa9Blri2dJghhCBzA3pdRwlTA5FT6txT5YB22CL
         /GUrGO8MD73E4GXblIAj+Hfc0CBFPhIlQnvzivWUtb4QWxzpYsCbVWEdGUOX6+eOIAfX
         H1FA==
X-Gm-Message-State: AFqh2kriBzFMUnRX9PZ2AQ4p3Ibe3Lb7Frcg5KVLi8iSjmv5aKMMvpMB
        JgU5zKNcRUkgZ6kN4f1EaeEHUA==
X-Google-Smtp-Source: AMrXdXvkzxOlUdpBAw57XiBPPqCO/gw/o2BkN3GgIRVbn07WOme0rLgjoR4JmWvz9j/WuM8Xu+fhIQ==
X-Received: by 2002:a05:6512:1688:b0:4ca:fa75:a64a with SMTP id bu8-20020a056512168800b004cafa75a64amr6519282lfb.0.1672311479697;
        Thu, 29 Dec 2022 02:57:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p11-20020a19f00b000000b004b6e157d326sm3007498lfc.168.2022.12.29.02.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:57:59 -0800 (PST)
Message-ID: <ee24809b-cf9b-c555-9c30-956949be25a4@linaro.org>
Date:   Thu, 29 Dec 2022 11:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: sm8450: add spmi node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221229103212.984324-1-konrad.dybcio@linaro.org>
 <7b32e414-96a9-7265-efee-f872badb32b2@linaro.org>
 <71d7a162-569d-1443-9e53-3ba374d06ccd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <71d7a162-569d-1443-9e53-3ba374d06ccd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 11:45, Konrad Dybcio wrote:
> 
> 
> On 29.12.2022 11:42, Krzysztof Kozlowski wrote:
>> On 29/12/2022 11:32, Konrad Dybcio wrote:
>>> From: Vinod Koul <vkoul@kernel.org>
>>>
>>> Add the spmi bus as found in the SM8450 SoC
>>>
>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> [Konrad: 0x0 -> 0, move #cells down, make reg-names a vertical list]
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>> v1 -> v2:
>>> No changes
>>>
>>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> index 570475040d95..b9b59c5223eb 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> @@ -2715,6 +2715,28 @@ aoss_qmp: power-controller@c300000 {
>>>  			#clock-cells = <0>;
>>>  		};
>>>  
>>> +		spmi_bus: spmi@c42d000 {
>>
>> Hmm looks different than reg.
>>
>>> +			compatible = "qcom,spmi-pmic-arb";
>>> +			reg = <0 0x0c400000 0 0x00003000>,
>>> +			      <0 0x0c500000 0 0x00400000>,
>>> +			      <0 0x0c440000 0 0x00080000>,
>>> +			      <0 0x0c4c0000 0 0x00010000>,
>>> +			      <0 0x0c42d000 0 0x00010000>;
>> x
> Hm, my guess would be that Vinod chose to put the "cnfg" reg
> instead of "core" in the unit address, as 8450 has 2 SPMI bus
> hosts and they both share the core reg, so it would have been
> impossible to have two spmi@core nodes..

Eh? SM8450 has 2 SPMI hosts both using 0x0c400000? How does that work?
Usually address can be mapped only once.

Where is the second SPMI? I cannot find it in linux-next.


Best regards,
Krzysztof

