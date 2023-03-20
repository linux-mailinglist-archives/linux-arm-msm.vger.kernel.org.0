Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5FE6C1022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 12:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCTLEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 07:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjCTLDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 07:03:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44951CAE1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:59:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l22so11599104ljc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679309969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMafAQR5nWMLiGtaukSZZZu7jK92DhZD+Rx8RPl4ke8=;
        b=lH+dmLdqTcjbATsWhV1W/NLv7e0v/ocqBTO9RaXFMKxnufdFHRQbMAMIC3oMoU5AsE
         6a2WWQIdV5nw2iyUh91/thm6Rez9Lut33AMgr4fzgMdp3DQf5l8fZQLOe7i7A+QcEyyQ
         ve6eU7fmYYQrzxR0i+X2+KGZmOK0bCMFwfEW61okIP6bTPyGRr3Y1YTnElCbHDowUhQw
         dYGpfwDx8bMKCQt/n7d6HR71sjPnWa2qAyjdrSbuLD1o8eGu4zGiq7gQsJZ0u4f6NylN
         WbeAOW92iwc/EIoNsVmDJKSX2NxYj1a/PxB7YVJjrD1xckuR+RHSsqsPzcJ1osmjSlqz
         rgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMafAQR5nWMLiGtaukSZZZu7jK92DhZD+Rx8RPl4ke8=;
        b=3ouemnprwsOyXJIJTixPuvqH6pp+kL3lb0OJ1aP1UJBVbZCBQz9FhIu6uN9xuuv8JB
         kCh93z2wbIp2H1aTfz7Xw8NKgG/DFj38mR6JkeENsXj9+KjRWGaDoI1H5XK6tIAtOuee
         VLtG0qHNx1Q+HKvkEBdl61QfYlopunLBbXlN/65uXhUszoEAQjM6Cb1EgHryzZNlORcq
         YpebLhYXtO1YuiRdLVqymBuDiuHwtcf8GLH42+/Os+fIDb3oT2ir3dEEdDb1SzchFtKE
         sUumoGKjKJg0oxYiqxzJqkSQKQGqvKYd1MCbOZ6I3ydG63c+ys084p80YT+KAZ+hGudo
         g9Fg==
X-Gm-Message-State: AO0yUKVR29TJ6ufVF7863RFgSEoxf2oLMUpK31S5EauJsj5+dcxaqph1
        3aXBmcvcppMZuYIbGlaewlw/Xw==
X-Google-Smtp-Source: AK7set8ezrhHT6qL4Nfd0LuRVUpty1T62Wuj7JG8jLAAP0sf3mwvSNWExC3WXUge1EA9qtDFQ1ujRg==
X-Received: by 2002:a05:651c:50a:b0:298:aa75:e7a1 with SMTP id o10-20020a05651c050a00b00298aa75e7a1mr7710114ljp.26.1679309968796;
        Mon, 20 Mar 2023 03:59:28 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id n12-20020a2e904c000000b00299f0194108sm1689434ljg.31.2023.03.20.03.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:59:28 -0700 (PDT)
Message-ID: <88208739-9838-4cfe-79de-c2558f604510@linaro.org>
Date:   Mon, 20 Mar 2023 11:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp-crd: add wifi calibration
 variant
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Kalle Valo <kvalo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230320104658.22186-1-johan+linaro@kernel.org>
 <20230320104658.22186-4-johan+linaro@kernel.org>
 <244a59c6-2dc0-83c7-07d2-6bae04022605@linaro.org>
 <ZBg7tA8NLDnjPp+k@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZBg7tA8NLDnjPp+k@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
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



On 20.03.2023 11:55, Johan Hovold wrote:
> On Mon, Mar 20, 2023 at 11:50:30AM +0100, Konrad Dybcio wrote:
>>
>>
>> On 20.03.2023 11:46, Johan Hovold wrote:
>>> Describe the bus topology for PCIe domain 6 and add the ath11k
>>> calibration variant so that the board file (calibration data) can be
>>> loaded.
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216036
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>> index 90a5df9c7a24..5dfda12f669b 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>
>>
>> Was mixing
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>
>> this /\
>>
>> [...]
>>
>> and this \/
>>> +			qcom,ath11k-calibration-variant = "LE_X13S";
>> Intentional? Especially given Kalle's comment on bugzilla?
> 
> Yes, it is intentional. The corresponding calibration data allows the
> wifi to be used on the CRD. I measure 150 MBits/s which may a bit lower
> than expected, but it's better than having no wifi at all.
OK, sounds great!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Johan
