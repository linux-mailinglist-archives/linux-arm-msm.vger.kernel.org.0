Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857ED57BBBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 18:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiGTQqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 12:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbiGTQqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 12:46:35 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBED4D171
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:46:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id k19so3686812lji.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eW32Y7kHOoyCzchouD8dBLTcqgbgXS4BmFC/O4Lg30M=;
        b=nyqku3a3HLHK+70E+Y8GEosypIROvWnmFa/2I+30KlBVuuce+jbXYBdjw1HU1XIQYo
         IASGUJ/GmK9MfrIUqi2Oh5EQ/YEDzyYpX908dTmykKAamIkU3klTz2s2TFVdqR2IT3YN
         /KJzjooCKdFzBCrI8VTgCbCnkHc1VRMVVG75oZbZnR5scYqfChufd0b2rdf+wlEVUZFK
         JhjQVarnP0hpatl07I5UhhBwKnn7bI69wb+IzXsdaE9M1Nz5gtKhHBlK9XShN9r/ofrj
         YnppJW+jXsoT58Jw1VLWlxyIfbVQ64Wfvo8ik+zs6lX86yaaUpwltp5KtzpHaD6hmMas
         EdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eW32Y7kHOoyCzchouD8dBLTcqgbgXS4BmFC/O4Lg30M=;
        b=WwcFxfpC7F2QFZpyMF49q2mrenZ6n2UOvXBCM/RDXWkK6xPRmOprxjYSz626GOuQnr
         C/vcTSsQgRdWVr8kClogpzE2MqQOb0zhfJDUye+IGKdiuIrQfZoCuOGDai4AUmnH/7IU
         iW4DmJdqpw660cZ0fID1ZJSm1BgS020D3/P5t0DSbtoc5EGUVaiTygiVtI0apKF/t2Jh
         9re6m/LJoewUfa9gYI+bqzGlh0o0sA2n8wvdHBZj1h6TyU6I/rhIQcfdycDqoeS5BqiD
         DHT/Va4LpBqtEv2qqc59IXzaUqaLGw11OjApBGg3GkFCQfIpYqHId5C5cn87miSXPjhQ
         21PQ==
X-Gm-Message-State: AJIora+DzK63vcA3XHH/M+/ODNEmXuiLfOdW+p2tJlO405//Z1JHQV7r
        PounGBeNMr7hDHfck9VOI/sy7Q==
X-Google-Smtp-Source: AGRyM1urk9m4eQiadowgrMKnFWZPaGdClLxR5kV7tNRV7fT6yqR9omQX/92QK4itmaBnZ/RRFFCbKQ==
X-Received: by 2002:a05:651c:1207:b0:25d:4eba:e247 with SMTP id i7-20020a05651c120700b0025d4ebae247mr16601237lja.100.1658335591868;
        Wed, 20 Jul 2022 09:46:31 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id h28-20020a0565123c9c00b00489da512f5asm3915996lfv.86.2022.07.20.09.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 09:46:31 -0700 (PDT)
Message-ID: <e0f6eede-9f6d-48d2-3a0a-e294cbe55eca@linaro.org>
Date:   Wed, 20 Jul 2022 18:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document additional sku6 for
 sc7180 pazquel
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220720073755.1.Ifab936517646b3876dd31b6e9b1b58a858529e57@changeid>
 <4cc6a276-4cbe-506a-6425-677c56469645@linaro.org>
 <CAD=FV=WP22g2ZhyeGeYJcGtQTBeKjinxQRCXicHxeVh-ziC8iA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WP22g2ZhyeGeYJcGtQTBeKjinxQRCXicHxeVh-ziC8iA@mail.gmail.com>
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

On 20/07/2022 17:07, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 20, 2022 at 12:46 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/07/2022 09:38, Yunlong Jia wrote:
>>> The difference between sku6 and sku4 is that there is no esim
>>>
>>> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 4dd18fbf20b6..aebeefdab27f 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -410,6 +410,7 @@ properties:
>>>        - description: Google Pazquel with LTE and Parade (newest rev)
>>>          items:
>>>            - const: google,pazquel-sku4
>>> +          - const: google,pazquel-sku6
>>
>> This looks wrong, did you test it?
> 
> Why do you think it's wrong? This patch is adding a second compatible
> string to an existing dts. 

Because it was sent after a patch adding sku6+sku4+sc7180, but the order
here is different.

However for some reason it was not part of a patchset which makes it
total mess and even less possible to understand.

> The only difference between SKU4 and SKU6
> is that one of them has the eSIM component stuffed and the other one
> doesn't. This need not be represented in the dts since the eSIM is
> automatically detected, but it was still stuffed as a SKU strapping so
> the factory could tell whether the missing eSIM was an error or
> intentional.
> 
> This is just like the SKU0 vs. SKU2 difference.
> 
> Other than the fact that this should be together in one series with
> the dts patch:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I don't agree. With last DTS patch this is a wrong binding (or wrong
DTS) therefore I must NAK it.

Please do not upstream stuff in some different way, like sending
bindings and DTS separate.

Best regards,
Krzysztof
