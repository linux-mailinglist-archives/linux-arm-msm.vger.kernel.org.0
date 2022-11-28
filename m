Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC4F63B43B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 22:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbiK1V3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 16:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbiK1V3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 16:29:52 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D162329832
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:29:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j16so19449006lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgUJEUWiFBjFkvCREQ2uT+SLGIPmc2Hf0VU5w0JvR/c=;
        b=UxdkaeUBRqNiusYvr8YGGByVN8wZQaeL+N2kwb1H/9tef5Gr7NxxbKPRYzejFNcFDQ
         nqNw4hxyANkK4+PlfuU2yzI9X7KD8xe9/+DbqC3LDPGQsQDN2PBpFHfVYYVkY+kqlTRn
         bT6V+ydv3mytISXW83ip9xBJ3tPLMVpdO2Xa267Jne7pDvBWCIC1rSvQuRVS0ek92fS6
         Ih9J3XtDktayhen5WNhA0sQt1H+mckSF7LV35dsG8hW9jawmAHKTYuRbpxGo00fEsD7R
         FrhgNtGRhPAN+4OKiApn/omyUD+AwiO0xsoceTteBVPZZ0hzLzeKXgMMJwUlJxVuDKAO
         eQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgUJEUWiFBjFkvCREQ2uT+SLGIPmc2Hf0VU5w0JvR/c=;
        b=vG1l6mve4glFTEtHoD6WVXTUu4xobJ2yzarKa9mmnxEPctMeaoKNOlQ7EmKA9k5CcW
         p8TbztrXHSwabWW6w74I3KKUYQ1t/QNizYckPvgjgOOy9etk4nhuFiBwJWTK/fGHG4vW
         nIfj68/3H0j7Sp8kGIbKY1Esww4IfExOyN/ZvBrelIkSHR6ZIFJmglaUkp8d44/L9h/6
         i/aR+nVfpnsEWK/y7ziUgTmE+Znr1uwp6xWNiYpWidpURJt+KoB6WH0jwg6a4Q94zka6
         JZ87bTR0Mn1OMJxqefxf+HhAk1WRXarxD5KrtRxEQ6rsC9dzXHT4G7AwWQoRRtDHoT2Q
         jcxQ==
X-Gm-Message-State: ANoB5pnuuGJTlKpaPJcevfrC+zfkMKksCTziRxsw9YQ8b65v2vMLTnxE
        5xlkkXb2mNhoCrTjbVLnQ/JB1g==
X-Google-Smtp-Source: AA0mqf5nk5f8aNwCyLodbExVLjLO5u1/kM7i/o+msvxhfe7KlSUOzlXTmEh8o6NEcKD7N/c/nF7LIg==
X-Received: by 2002:ac2:52a2:0:b0:4ac:d6e4:41d4 with SMTP id r2-20020ac252a2000000b004acd6e441d4mr17007602lfm.253.1669670989231;
        Mon, 28 Nov 2022 13:29:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a13-20020a056512374d00b004a05767bc07sm1877127lfs.28.2022.11.28.13.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 13:29:48 -0800 (PST)
Message-ID: <febec5b7-d379-f0db-93ce-b5e180aef6ba@linaro.org>
Date:   Mon, 28 Nov 2022 22:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-wingtech-wt88047: Add flash LED
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Pavel Machek <pavel@ucw.cz>
References: <20221128051512.125148-1-linmengbo0689@protonmail.com>
 <43c24e7e-49b6-ff46-2f40-9413af7ac252@linaro.org>
 <Y4T+Mv+uIx7jQwky@gerhold.net>
 <a373f1bc-3d7c-0c79-6e20-d459d5608814@linaro.org>
In-Reply-To: <a373f1bc-3d7c-0c79-6e20-d459d5608814@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 22:23, Krzysztof Kozlowski wrote:
> On 28/11/2022 19:30, Stephan Gerhold wrote:
>> Hi Krzysztof,
>>
>> On Mon, Nov 28, 2022 at 09:56:47AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/11/2022 06:16, Lin, Meng-Bo wrote:
>>>> WT88047 uses OCP 8110 Flash LED driver. Add it to the device tree.
>>>>
>>>> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
>>>> ---
>>>>  .../dts/qcom/msm8916-wingtech-wt88047.dts     | 22 +++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
>>>> index 166bed05996f..a87be1d95b14 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
>>>> @@ -23,6 +23,20 @@ chosen {
>>>>  		stdout-path = "serial0";
>>>>  	};
>>>>  
>>>> +	flash-led-controller {
>>>> +		compatible = "ocs,ocp8110";
>>>
>>> The compatible is not documented. Checkpatch warns about it. You need to
>>> document devices before using them.
>>>
>>
>> Unfortunately Pavel never applied the dt-bindings patch for this - only
>> the driver patch was applied. André already sent a kind reminder [1] and
>> two resends [2, 3] without success. Since it's a documentation-only
>> patch, maybe you could take it through the dt-bindings tree?
>>
> 
> I'll ping Rob. Other way is to resend. You need to keep resending (maybe
> together with DTS in such case) before this can go in.

Applied by Rob:
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=for-next&id=876c881f9f416f1a9071a80fb7daefe19c51186e

Best regards,
Krzysztof

