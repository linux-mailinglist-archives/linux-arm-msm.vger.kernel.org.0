Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF56452D021
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 12:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbiESKG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 06:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiESKG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 06:06:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F67748E69
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 03:06:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id l13so1575577lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 03:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=uaojA8gc9fmqhI2ah6QzFTDdrXY4gOt7t9+SDIt671c=;
        b=k88z215EXQcq/UJNw6C3Y3DfxZLEPCMEIczW3JGRasYCoQPxNnNMFx2QdAUCIvMTVT
         6RU3KYFdnH2sA+9Bwrp+OyhIv4gjZU2aE37oJTP0MJX/nzFl3rR0rzXyaytUW4m7bFA+
         7WJE57agfvFA19XCjCuhl4D2ojjApiKbm3IUK0esIsGEJnS8QaBo3vrsQkO8/LwQyGVE
         AOFYb7AGZTy68ZplRcbkTtmjsBuUPUq1TNISp1BCruhMAqLt4zntpq41xsGvxbno0KLa
         OeTIfuG9kr8OpU+5WjwUqNhkwSGnLnQxFaSUT9lR4BmO4Mct6FHSLj2Tl3NPpijrIPgR
         GlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=uaojA8gc9fmqhI2ah6QzFTDdrXY4gOt7t9+SDIt671c=;
        b=3GnamTsPHLBzy3Fk5/ktyhy94gEAxvPt5/ZXK77Y9voNImbQryQJsRfrLTbHFFlHcE
         7fLNLnt4YodXNMXNieJNpQYykXb8cqCSG7qHA0vRsPnQQF4PSpALaKr8dUV3B/kbKNU5
         7q4tfrGhY2ndKy8bQumcONE9KU/0m1NlsKbBrHg/i/BmminLCboes7CFhWWlBpeagrFM
         M0AwaofVfQEceZS34ID57gaZ3LAT2G4AIOCmXJK6zKHRSkdtoYDmc9y/XCX8I606jGRt
         1WbTmb8sFmvE12w9+HNAiyyvEvYQQdfteL7O5eCazRAu5vxXoSyQATn19++d+hTEn3OZ
         x/bw==
X-Gm-Message-State: AOAM533MeVNt3qoGx16tbPMBbm1HsGHfgZl6EaamGpA80LhSdmxUdAiM
        y9erjC4fALcXS/AzKHFnwxTp50wxwXEuSdQM
X-Google-Smtp-Source: ABdhPJyIqdgloaGNgSjBzQ5k/W2rYAe4m/i9WKsaHJhkW3eMeRP2NS/2lKI/B+DONpHGEQaj9hGoUw==
X-Received: by 2002:ac2:42d1:0:b0:474:68f:2e48 with SMTP id n17-20020ac242d1000000b00474068f2e48mr2713755lfl.215.1652954814929;
        Thu, 19 May 2022 03:06:54 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x8-20020a2e9c88000000b0024f3d1dae92sm538027lji.26.2022.05.19.03.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 03:06:54 -0700 (PDT)
Message-ID: <b459bbd2-26c6-1af1-b1ee-d4cf5f49cdaa@linaro.org>
Date:   Thu, 19 May 2022 12:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8996-xiaomi-natrium: Add support
 for Xiaomi Mi 5s Plus
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>
Cc:     Alec Su <ae40515@yahoo.com.tw>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220519074112.25600-1-ae40515@yahoo.com.tw>
 <20220519074112.25600-2-ae40515@yahoo.com.tw>
 <3644ad8a-d5d8-8ea2-b659-029619c64f1f@linaro.org>
 <NqQY5WA6i6jOhK8lZ-YD4kWA57qJCSIGJE6_xAQmOiFJ4a-msHcn7oakouduiLhODYlfWVvgr-E5S6m43Ab6EUFa0ZPYV0kPGeYbVV7zpUI=@protonmail.com>
 <3bb95350-01cc-b15b-3589-16019e3e9105@linaro.org>
In-Reply-To: <3bb95350-01cc-b15b-3589-16019e3e9105@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 12:01, Krzysztof Kozlowski wrote:
> On 19/05/2022 11:57, Yassine Oudjana wrote:
>>>
>>> There is no such property documented. Either add bindings, or drop.
>>>
>>>> + qcom,board-id = <47 0>;
>>>
>>>
>>> The same.
>>
>> These properties are already used in many device trees; they are
>> needed to let the bootloader pick a DTB, but yes they aren't
>> documented currently. devicetree/bindings/arm/qcom.yaml would
>> probably be a good place to put them.
> 
> Which means each person is using them and not caring about
> documenting... they need to be documented. I am not even sure if they
> should be accepted.
> 
> The DTS describes hardware, not bootloader specific details. The
> hardware - board - is defined by compatible and bootloader should use
> it. Adding new properties because someone decided "I don't like
> compatibles" is not appropriate.

There is prior art:
https://lkml.org/lkml/2015/10/26/651
https://lore.kernel.org/all/CAL_JsqJAOEvs08Jydn9wWtM7-Oxd=MmmDER48VRF7z3Gkzt0CQ@mail.gmail.com/


Best regards,
Krzysztof
