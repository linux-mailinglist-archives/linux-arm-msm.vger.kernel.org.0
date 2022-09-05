Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465D95AC9DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 07:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbiIEFsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 01:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbiIEFsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 01:48:04 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695242F39D
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Sep 2022 22:48:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c24so7197336pgg.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Sep 2022 22:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/MSOkfzcFDVOwb+RS/ivu6q81kMf5WeXuE6nXo0vYzw=;
        b=z3ENzGxwfrHKOJ5hIrRFfQWdK9HQXJE5wEl8yca9odjvcVDKEcwYNuUQ3saqPr7miW
         mF1QpmiMkHGRlte9vIKhtmyw2Sy/HYPnEB5l0DmukbwwXSe65i0rP4myTJdEuHIc8eew
         eg4Pp3shVhpYya+HcE4TMqeHHN2YkxsnnQyE1vCdRqRHKk/IZPAgjYQk89zKrYpsOgPr
         T5f+vNtYlsyArA59WQpUBxxxduffw2jFMe5SJht4yBkvdRTU6ERnGc4kb1cY7ltXE7ez
         FcxSkF4tbvV3aOJoPepuFApEU/5nyYdY6p1jX6nPvao9IYNwByFu4lTIFjDyxueR/5mp
         p67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/MSOkfzcFDVOwb+RS/ivu6q81kMf5WeXuE6nXo0vYzw=;
        b=5zIba5fJujOgUggW5aFBsh/XnnubBHpj4NLiWns/H1g4Siz2nTh00TAzOiDborT48W
         xyBWNTAfn+u3xChMsKkj84PGPLmm6VRrPIj9wksPQKQQxTaQMBDtcuf8zclLCBcIdW+Q
         ijX7/W0972HtJEncGMVFlIModI/HUNF1NnNIdmcaz0GxHiIp4jPFEeMOgslpdt9wbc9A
         NjfN3pKUUVXMS7BQW3EcA/dKdp/KB5ItTbdJMDTMhzaTFdh7dppdPj36ddCRHp2BJoUy
         72Isc7LpnkC8dBpNcGVNOc9lQX6V5FB9qooF2hsDodr3oI3w7KFD1x1rUMsIu2ekYq6n
         zvmQ==
X-Gm-Message-State: ACgBeo3OIPlVXDuHOLsNzMCbLPzeMvUDN+teZwpYTkHhaqJWJ2RHz+wH
        qCRJEIL1WAtGIcR2AiCAdhd9gA==
X-Google-Smtp-Source: AA6agR5F/Rwe8lQfPR84iEIKaj/8EdP4mhMjo5k43tg2ef1dm6TqvKoSPlvY/+MuNlwrFUeNHpymPg==
X-Received: by 2002:a05:6a00:1c90:b0:537:e144:4481 with SMTP id y16-20020a056a001c9000b00537e1444481mr43747206pfw.24.1662356881806;
        Sun, 04 Sep 2022 22:48:01 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:5362:9d7f:2354:1d0a:78e3? ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709027d8600b00176b63535ccsm636924plm.193.2022.09.04.22.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 22:48:01 -0700 (PDT)
Message-ID: <66eaf16e-cb7c-a0b4-9ce5-02611308b0e6@linaro.org>
Date:   Mon, 5 Sep 2022 11:17:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-pmics: Remove reg entry for
 pmc8280c_lpg node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20220903084440.1509562-1-bhupesh.sharma@linaro.org>
 <42790a40-458a-55ff-7e4b-796e72f474ac@kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <42790a40-458a-55ff-7e4b-796e72f474ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 9/5/22 12:52 AM, Krzysztof Kozlowski wrote:
> On 03/09/2022 11:44, Bhupesh Sharma wrote:
>> Commit eeca7d46217c ("arm64: dts: qcom: pm8350c: Drop PWM reg declaration")
>> dropped PWM reg declaration for pm8350c pwm(s), but there is a leftover
>> 'reg' entry inside the lpg/pwm node in sc8280xp dts file. Remove the same.
>>
>> While at it, also remove the unused unit address in the node
>> label.
>>
>> Fixes: eeca7d46217c ("arm64: dts: qcom: pm8350c: Drop PWM reg declaration")
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
>> index ae90b97aecb8..2e5cf55afdd5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
>> @@ -60,9 +60,8 @@ pmc8280c_gpios: gpio@8800 {
>>   			#interrupt-cells = <2>;
>>   		};
>>   
>> -		pmc8280c_lpg: lpg@e800 {
>> +		pmc8280c_lpg: lpg {
> 
> I wonder why I did not see the errors when testing all DTSes for
> https://lore.kernel.org/all/20220828084341.112146-9-krzysztof.kozlowski@linaro.org/

I did not see the error while running the 'make dtbs_check' locally, so 
may be something to improve in 'make dtbs_check' infrastructure there.

> Anyway, it cannot be lpg - binding requires "pwm".

I think that should be a separate patch. It does not seem related to 
this change anyways - which fixes eeca7d46217c . I will send a v2 soon.

Thanks,
Bhupesh
