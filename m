Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3139688478
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjBBQdH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBBQdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:33:06 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829DE12596
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:33:03 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t18so2253053wro.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x+y+o/Wjd2NwudZ2nm6ZyEg3Aj1gsA3hyrscQ3Yxhh0=;
        b=NhqLwXJennmkEBzy7M5keLNElRd6jggbjgsfzEfw36x+ET93hlQpIqBvHCvEPYKdcf
         9ESdhznNjkO+4cNAoK5096MXEmxDjpRlItE/LlK99RMgUq1i5LK2GIPGHvQXr5WqJv/6
         +UQ2YGDMXiEEA3iyEwVnR1k0y6VsP+kIXFMHweE26aCZIIXrD36YI/oukh4ze+RmNltv
         XbPss7nPpZtL3OWRmKxWGn2o7mjM4dAE4kJbtGJrEfA1Gutf/9NEOe1Yj2OqFKVStNGv
         yG+VwzrFQJRLJJAzKZszMmpKvy2Z8nY4vWnjbxKHPzbXzE+ogczeBgzqbWAr3F2NblQy
         y2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+y+o/Wjd2NwudZ2nm6ZyEg3Aj1gsA3hyrscQ3Yxhh0=;
        b=IwyBsoO+a6IgrQuz1CCiJKA96hXvH0jrCweViOSlzsm6tgdyN3hUvC0oCCAXg0y11M
         UmOl3tazAQNi/I2/nDaijL1mROaCLLHVytLeLfdXAzxzVea/KG7wLr7mGUUD+8jM4yw6
         40a2wEFLiTIHdqyhPal1hvSsKdv4a4cjSehASKWImchtE+oWQsItPWkziV8XRgwoxKnh
         PkwikjjPMjU7sIoOfH9bfVrv07uyAFrlq1Ud6jjfJNi5vtEBw/DE61q61hc5b/mghFgB
         jUH7zkf/PQdaJBYnhyq/sgHRlEI0AiRMxxorabzsL43AEXiJMIw759/F8l1zc66Rfdal
         e5dg==
X-Gm-Message-State: AO0yUKW3F89e/PnAvyrGH7BbyiptMFXATZe6V419sHHTZP0YEYK6vGFO
        /Ub7R2O7yHel4jyWKgi4oyK9hQ==
X-Google-Smtp-Source: AK7set8eRf4Ge+qR3bh/ypq9RkQrO+GZz7CPDskr/v1RpP9diYU0jhW3yp8mu4JWchabCjgN3LvfyA==
X-Received: by 2002:a05:6000:110d:b0:2bf:c0f2:4b0 with SMTP id z13-20020a056000110d00b002bfc0f204b0mr6402311wrw.19.1675355581548;
        Thu, 02 Feb 2023 08:33:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce5b:78ab:f662:ef0d? ([2a01:e0a:982:cbb0:ce5b:78ab:f662:ef0d])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002bfc0558ecdsm19941965wrs.113.2023.02.02.08.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 08:33:00 -0800 (PST)
Message-ID: <5363960d-8ca1-aaf0-3721-f5d3a1575da2@linaro.org>
Date:   Thu, 2 Feb 2023 17:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
 <a2e4dff0-af8f-dccb-9074-8244b054c448@linaro.org>
 <61eb2a01-762e-b83b-16b7-2c9b178407da@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <61eb2a01-762e-b83b-16b7-2c9b178407da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 17:16, Vladimir Zapolskiy wrote:
> On 2/2/23 16:21, Neil Armstrong wrote:
>> On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
>>> Hi Krzysztof,
>>>
>>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>>>>> default by security firmware.
>>>>
>>>> Then probably we should not require them only on these variants.
>>>
>>> I don't have the exact list of the affected SoCs, I believe Neil can provide
>>> such a list, if you find it crucial.
>>
>> It's the case for SM8350, SM8450 & SM8550.
>>
> 
> On SM8250 there is no QCE clocks also, so I'll add it to the list, and I hope
> that now the list is complete.
> 
> It could be that the relevant platforms are the ones with 'qcom,no-clock-support'
> property of QCE in the downstream.
> 

Yes this is what I figured out with the 5.10 device-trees I have checkouted.

Neil

