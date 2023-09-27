Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821247B0295
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 13:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjI0LQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 07:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjI0LQM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 07:16:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6951B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:16:09 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4054f790190so96453635e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695813368; x=1696418168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7mEG755J6mA7UKW3osl1F7PnRsnYr6Mei3mYlrdVt/c=;
        b=XxO/tgFKBAK03VLSCtsN3WLByxXnELBKcTW/1QU9f3P9g+xYgldyKYy//XlkNChplX
         GTYCvc+K1XRM9ivLpJuCkwQQ2ho+INa+VEIwKSGV5piW5UnZwVGpFrwODbDztVzTVwva
         aODucYgBSHKIMzS2cev57MDfhtaeOB7xmzPMkB/TAxx2oJRMXA/vW3gXTjeNnWnqZMIR
         rydXFybmETz3zmnW5oTJNz/97aELiPXNPmTiFKAzMghdnSjs2J8fDuDSEIf49AlsDjxr
         QTc734Ep7Dn0nr/FyW7eIXa94xugTmYy61xzdht3EbPevi5B1wgKqHGQEtkFCJUiIaeb
         b5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813368; x=1696418168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mEG755J6mA7UKW3osl1F7PnRsnYr6Mei3mYlrdVt/c=;
        b=Q1zxpYyVHVeXnCHesDQRHT+NoS1th21jFxTgWyE0VsIi6a+c0ZdwEkw7D7bKvH6QLS
         LISRv6v0onGp0oyyns8kwRbEBYShq21+QswcHUDMFIPbhwMefu9nCSTy0RSTHUriYdet
         RXwZ0SbFFCv9PJC3BPAvfF7Ku5PEPhGLZi9THlo7AzoHt1PzU8Gkw2Djn5/+EMZs1yrx
         NYzc1AxdiWvcsXzoxtOTOzpNRAZSG8a2b0PQdk4wgk7d/NKShx87TM798Ersdp2krIna
         E6u0wQNgXdSYeQQ9gZV2Qu0DK7JRLaQW6v+Ogj9OXS0TR9AOwYN4KbD9JGSnvPsMxch9
         vlYg==
X-Gm-Message-State: AOJu0YxckPmsV3sD4sNgPaST5W90MjFeVFEkOSodq7twMSj6vmZv8hE+
        qJD3eoFhlnsAnyOORjDKvrCwew==
X-Google-Smtp-Source: AGHT+IHJJe5Jd54mOEoX3twENw0wNV3ryf0EENKQ1NcOMhVp0LkOGXOlDDAF3YkbdjSBAQNzUAyfig==
X-Received: by 2002:a05:6000:1106:b0:31f:a16a:aecd with SMTP id z6-20020a056000110600b0031fa16aaecdmr1459762wrw.68.1695813367872;
        Wed, 27 Sep 2023 04:16:07 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d46c7000000b0031fbbe347e1sm16896539wrs.65.2023.09.27.04.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:16:07 -0700 (PDT)
Message-ID: <2bd16a5b-260d-457d-98c5-bee030f05f00@linaro.org>
Date:   Wed, 27 Sep 2023 12:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6375-pdx225: Add USBPHY
 regulators
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230927-topic-6375_stuff-v1-0-12243e36b45c@linaro.org>
 <20230927-topic-6375_stuff-v1-4-12243e36b45c@linaro.org>
 <8bbdf132-a007-4cb7-b842-a81de7c1629a@linaro.org>
 <354e5b45-468e-4fe6-9646-6b4d9596393a@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <354e5b45-468e-4fe6-9646-6b4d9596393a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2023 12:05, Konrad Dybcio wrote:
> On 27.09.2023 13:01, Bryan O'Donoghue wrote:
>> On 27/09/2023 10:21, Konrad Dybcio wrote:
>>> To make dtbs_check happy and the software more aware of what's going
>>> on, describe the HSUSB PHY's regulators and tighten up VDDA_PLL to match.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
>>> index bbec7aee60be..0ce4fa8de8b0 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
>>> @@ -243,8 +243,8 @@ pm6125_l6: l6 {
>>>            };
>>>              pm6125_l7: l7 {
>>> -            regulator-min-microvolt = <720000>;
>>> -            regulator-max-microvolt = <1050000>;
>>> +            regulator-min-microvolt = <880000>;
>>> +            regulator-max-microvolt = <880000>;
>>
>> Where did the old values come from and why are the new values better ?
>>
>> Consider enumerating that in the commit log.
> That's the pretty standard situation where:
> 
> - downstream defines very loose ranges
> - developer uses these very loose ranges as a guideline
> - some hardware (often the exclusive user of that regulator)
>    has a hidden-ish request of a tighter range
> - the developer realizes that and has to fix up the ranges
> 
> Konrad

If you got 72 and 105 from downstream, where did you get 88 from ?

---
bod
