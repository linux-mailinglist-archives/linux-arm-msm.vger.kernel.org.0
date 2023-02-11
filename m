Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF63693068
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 12:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjBKLjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 06:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBKLjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 06:39:13 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D963420D34
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:39:12 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bu23so7637723wrb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHksC8aldTOfrkGAmhLfZZdllJiwk6QYezLUdsrQsRU=;
        b=NST79s+Mlw1kQbPPlzxr/yxO6n3oHVz8AIDTnZw/f/YD4RB3n7QJxoySGCyg/A8++a
         gzFOcsTQ3jiP74p4/V2s1TDp5fRn+kyoFx3zSiS21+aRfLiJ3ndacTlBRNsMzoHjkGMw
         rW9n71uA2zksneEOgjHUleweGN3EmDQ6FtLuGoUWYOAd0laR68d4f/CrG/48sU3Q5ueS
         szIpJzLtwQ8RcCK6VTUT8Y4gLfxZYv8uddaOrwL+yEGeBbxf8bsl5w7dRfS8mbu/oHbY
         kK5nITFhNdMiK/4y3qFbDqAB44flyU2hHJeHb/ID0a93lemmdeeSDF/JwxQfZXdoaTLl
         f+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHksC8aldTOfrkGAmhLfZZdllJiwk6QYezLUdsrQsRU=;
        b=JABu6r62wh3r6YZvLEudngFhR/gZz+0DZgQuX09pR6dH+1F1uZ6sLrbdzNgUE6B9X2
         Jla/+9u948/ObjZqUhXHr/jOzUvGPZRMCO/82z02wSmNo9Uuf1B5W6tv9kmBEP8Ah/50
         UkNX8rhx6dYrcDpeYWcdJwiAJQSHrzIi1wnYSnMn04NDRDi6Zj/9heIe6tX941eh7+bZ
         e6AINKEO92GkifA0PfgnOJX6CCiZkzW+IJZ9bKxnHPFKi1v0SJcxExLTk2QxQrWULQ7D
         dY07zplXm/Lp1C+0YLZrybaWNAl2N/syqDQ/qqV0plbnmxw0JqbsKsH6k7GrIvVUXSnv
         JG3A==
X-Gm-Message-State: AO0yUKUGICzWibJitGqwZw7KBwpCAjteLCNfcYU2TUQ30wSB8BcPowZX
        1MpCaWGlv0NtfacS2sVMpcws4Q==
X-Google-Smtp-Source: AK7set888agpYTgTbFiIYciNWlLibcSFw/rg0PVvx9GripUaSlqxkLGcK2fn8Y2FSZrdLTOOjPJCZA==
X-Received: by 2002:a5d:4107:0:b0:2c5:4add:9e46 with SMTP id l7-20020a5d4107000000b002c54add9e46mr3578612wrp.28.1676115551440;
        Sat, 11 Feb 2023 03:39:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b003db1ca20170sm8643739wmq.37.2023.02.11.03.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:39:11 -0800 (PST)
Message-ID: <2746d301-3f8b-e61c-b2c8-088d25f94d47@linaro.org>
Date:   Sat, 11 Feb 2023 12:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: add the SoC ID for SA8775P
Content-Language: en-US
To:     Eric Chanudet <echanude@redhat.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230209095753.447347-1-brgl@bgdev.pl>
 <20230209095753.447347-3-brgl@bgdev.pl>
 <20230209175515.xrebz5edmsi4xkzv@echanude>
 <d1d1bd4e-0205-24d1-9589-6d6b57b6d477@linaro.org>
 <20230210145245.jyqir6odnkyr5zdl@echanude>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210145245.jyqir6odnkyr5zdl@echanude>
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

On 10/02/2023 15:52, Eric Chanudet wrote:
> On Fri, Feb 10, 2023 at 09:58:29AM +0100, Krzysztof Kozlowski wrote:
>> On 09/02/2023 18:55, Eric Chanudet wrote:
>>> On Thu, Feb 09, 2023 at 10:57:52AM +0100, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> Add the SoC ID entry for SA8775P.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>  include/dt-bindings/arm/qcom,ids.h | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>
>>> Reviewed-by: Eric Chanudet <echanude@redhat.com>
>>> Tested-by: Eric Chanudet <echanude@redhat.com>
>>
>> How can you test a header? What type of testing Redhat does on the headers?
> 
> IIUC that ID is compared against the one read from SMEM by the socinfo
> driver. I meant to confirm it matched the number the board I have
> returned. My apologies in advance if that was inappropriate.

OK... I would say it is a review then, but can be also this way.

Best regards,
Krzysztof

