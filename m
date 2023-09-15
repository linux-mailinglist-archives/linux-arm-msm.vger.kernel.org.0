Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F147A1A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 11:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbjIOJQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 05:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbjIOJQf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 05:16:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8719E69
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 02:16:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-500913779f5so3161352e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769388; x=1695374188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUXWbJ4ry0MjQqU+b2Xypq/860rfFXK7seyaFzZwQFo=;
        b=idxoJk2aK5nAR2PsRLdOPxBlgXkA4F+ADtTuv0SdMijgIG9nkqOFCJ/MrnUgZBU7kB
         vT3d6f5xe4xuViszY+PrYoHCU/nEclwQIXOn4N3RMIAwYXBhRhXyphvdoMA3YlDTWClo
         KR/GDeR7Pr0u6sEA1xigDTAH8s4F9Vs1UGIhsl34IHDlwmd57EDfhHCBJI4m4fP8FvT8
         /03x63/wngN4kJOsYvpEFIYlFqveDqgwmNE+kzOl7+bhdAc7qInbuhYhFRZiro9dHH8D
         MoBMu5vyeZhWnaNumPfTPDCeVeTabcV3dwvZ3KODIOvJIRh63pSolMyyHOnQgVq3IvhB
         /UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769388; x=1695374188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUXWbJ4ry0MjQqU+b2Xypq/860rfFXK7seyaFzZwQFo=;
        b=Mnq7Q9mcQcC2p9D5ZiV8VwhtNh906BFYqszmBzG6bn+qi/fg5mACg7Oa+6G+IAaTEU
         YgFfJlgsIUvoRElQsbhKi7hc9PkrpGMzH0qkNRmPIE0BJo9QxJcLX94h9QxQnJfUsqJY
         yD31WuJOzudAysNU99PEMoHNBlHeOzQdsSNMK/ibdtubABLk82nl4Q+6xIXiry3MaK1V
         2P5DXu7/nbM+LYyvRplMmBT559vhEN2rpIEicMXkjX3c8PxX38hzVfgR4Zk4pIMWjRL9
         2SFqaumVzRWxwGs+VKBgd4TBePvnqT9AeeLr0lLkXHSqMALd3QC9DyzEzWGsvKQfSY45
         mmdw==
X-Gm-Message-State: AOJu0YwOTMqERDDZko783kC2zmQUxuUosGaAoOgo1ldop27ztunYJ7Zp
        iQPg0joBPF1A+1Bj3PyuRObo5A==
X-Google-Smtp-Source: AGHT+IE0fPOgfbwzN3nitu1bZBFLNeMRYlfmhRr9TZwIrF9MGbKkf7r6lClZC0oOg77Z8EEuFoXdSQ==
X-Received: by 2002:a05:6512:3d02:b0:501:bbbb:de1e with SMTP id d2-20020a0565123d0200b00501bbbbde1emr1233195lfv.6.1694769387852;
        Fri, 15 Sep 2023 02:16:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c214d00b003fc16ee2864sm4070589wml.48.2023.09.15.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:16:27 -0700 (PDT)
Message-ID: <0a34dd35-7aea-4655-4cdd-e7196a1ba52b@linaro.org>
Date:   Fri, 15 Sep 2023 11:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 8/8] arm64: defconfig: enable interconnect and pinctrl
 for SM4450
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        catalin.marinas@arm.com
Cc:     geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
        quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, kernel@quicinc.com
References: <20230915021509.25773-1-quic_tengfan@quicinc.com>
 <20230915021509.25773-10-quic_tengfan@quicinc.com>
 <8f2c9664-a2c8-50dc-8a1c-e50a071ebeb2@linaro.org>
 <e9ff05b3-2742-416e-b417-5e2414036008@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9ff05b3-2742-416e-b417-5e2414036008@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2023 11:12, Tengfei Fan wrote:
> 
> 
> 在 9/15/2023 3:21 PM, Krzysztof Kozlowski 写道:
>> On 15/09/2023 04:15, Tengfei Fan wrote:
>>> Add the SM4450 interconnect and pinctrl drivers as built-in for
>>> support the Qualcomm SM4450 platform to boot to uart shell.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index ec59174b14db..e91993de865e 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -598,6 +598,7 @@ CONFIG_PINCTRL_SC8280XP=y
>>>   CONFIG_PINCTRL_SDM660=y
>>>   CONFIG_PINCTRL_SDM670=y
>>>   CONFIG_PINCTRL_SDM845=y
>>> +CONFIG_PINCTRL_SM4450=y
>>>   CONFIG_PINCTRL_SM6115=y
>>>   CONFIG_PINCTRL_SM6125=y
>>>   CONFIG_PINCTRL_SM6350=y
>>> @@ -1500,6 +1501,7 @@ CONFIG_INTERCONNECT_QCOM_SC7280=y
>>>   CONFIG_INTERCONNECT_QCOM_SC8180X=y
>>>   CONFIG_INTERCONNECT_QCOM_SC8280XP=y
>>>   CONFIG_INTERCONNECT_QCOM_SDM845=y
>>> +CONFIG_INTERCONNECT_QCOM_SM4450=y
>>
>> Why it cannot be =m?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> Because system haven't capacity of loading ko files at this time on 
> SM4450 platform, so setting to "Y".

Hm? System has this capability. All systems have. What is so different
on SM4450 comparing to everything else we have here?

No, this should be =m and you need to fix your system.

Best regards,
Krzysztof

