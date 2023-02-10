Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04079691ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 13:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjBJMDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 07:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjBJMDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 07:03:49 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1F96EAD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 04:03:43 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so3906521wmb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djG58yZ8ScjKHTlb7u/JoT5mgJ3cYOqQ0+1uFZGl2kw=;
        b=jtG+cnbrCmXiVys1MVnAHSJpWaN20CVamSfTfr8kqYVmgnZK6hI92opOecPqZnPCLi
         VFsdUY87mVzopicC6zXd8Ygti7pwnmnAsHdYq/vpTxvdHBjHsv1PJjylNVPkMzApGDkQ
         lpfT/ozSf83B9J7iZ/nu9oK6qG2qrVdJ79RW7/jWdwkb4emSxSubwHJozc3bi0+yM1cz
         6crv237q6OoTdPnNuGP8gmIE0jJF3KpNkzUW20N5ROxj5LIlQLMnFH6bTbOjkUN0cD3d
         vPaPWfr5eLohlI00O9Qb5DKrzIGT3ZxG+LYjwxtnusxY7aFJQAcpGzOvjdDQyQu68dSL
         SKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djG58yZ8ScjKHTlb7u/JoT5mgJ3cYOqQ0+1uFZGl2kw=;
        b=XEpIV8D8i8yMRGbyQ+ZNogBRaxq83lDxZvqnG9KAlNDpSuQwtoxqBrpwrv+S47XcA/
         yDVmyOah8oA86aoZzRKkokAz1fWbpZ/zMecbfXxoj4bt5wbHLqCtQT2ETpAmLX2JdkA4
         ijN3gIh5eT7Gcb++58ozHTxL9rD09GohdX7OOhi5s7tUVLiaNkzq1AUJFbOakTUyo3fw
         dEUgssCK56WSt6Mv6202J4fMrY6CHOis5e85iMqOVb0M+IKgxFquf4ckwr1b7LCwRGQe
         0aTYdOtC3DpvhncuAgMYiI0gdQSks/FIvi0iCRIumIlReI+jc0qMh3AVw/PAqDfWgLaC
         eK+Q==
X-Gm-Message-State: AO0yUKUsYC7Da1DvrPupy9Gvg52Zws585Arga0mlUMUvxo0Ui0rSeL9/
        x38PksPiqZXYChoknkEal/EsGA==
X-Google-Smtp-Source: AK7set95CyHNnHgFHkCsOwk6ljUFnwGj/zdy3lXiLvk6plweszWGQktL4oujiqYdo6rSN2AgFtSXbg==
X-Received: by 2002:a05:600c:164a:b0:3dc:5009:bc74 with SMTP id o10-20020a05600c164a00b003dc5009bc74mr12483798wmn.7.1676030622170;
        Fri, 10 Feb 2023 04:03:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003de664d4c14sm5430432wmq.36.2023.02.10.04.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:03:41 -0800 (PST)
Message-ID: <49bc1ba1-1aa5-4c87-3b9c-783da202f7b4@linaro.org>
Date:   Fri, 10 Feb 2023 13:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
 <4fdd5618-fc35-00a8-7a6b-2dd231700686@linaro.org>
 <4dd74e75-9412-b6e6-4077-719ef28d4b35@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4dd74e75-9412-b6e6-4077-719ef28d4b35@linaro.org>
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

On 10/02/2023 12:12, Vladimir Zapolskiy wrote:
> On 2/7/23 01:45, Dmitry Baryshkov wrote:
>> On 02/02/2023 18:16, Vladimir Zapolskiy wrote:
>>> On 2/2/23 16:21, Neil Armstrong wrote:
>>>> On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>>>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>
>>>>>>> On certain Snapdragon processors, the crypto engine clocks are
>>>>>>> enabled by
>>>>>>> default by security firmware.
>>>>>>
>>>>>> Then probably we should not require them only on these variants.
>>>>>
>>>>> I don't have the exact list of the affected SoCs, I believe Neil can
>>>>> provide
>>>>> such a list, if you find it crucial.
>>>>
>>>> It's the case for SM8350, SM8450 & SM8550.
>>>>
>>>
>>> On SM8250 there is no QCE clocks also, so I'll add it to the list, and I
>>> hope
>>> that now the list is complete.
>>>
>>> It could be that the relevant platforms are the ones with
>>> 'qcom,no-clock-support'
>>> property of QCE in the downstream.
>>>
>>
>> Then, sc7180, sc8180x, sdx55, sm6150, sm7150, sm8150 also have this
>> property in QCE device. And, I think, it should also be applicable to
>> sc7280 and sc8280xp.
> 
> So maybe do you have a better candidate among the SoCs for a QCE IP family
> name than SM8150 based? Likely it could be the first released SoC among
> mentioned above.

If you have access to the docs, you will see clear mapping of version to
the SoCs. Just choose the oldest SoC from the list (or something looking
as the oldest - there is no need to be very accurate).


Best regards,
Krzysztof

