Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A73550A78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 14:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiFSMCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 08:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbiFSMCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 08:02:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559C312608
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 05:02:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id n20so9512904ejz.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gnMEBo8E/2r0RxcreeVzvdUJTnoTv3L/ZBGLWIasnvY=;
        b=PCcmfZ2UXsyas5h+S+YJ7e8bVGZCjvy4Kw3MTXJXovuJK74EkOG9NcHor/wiIAjpBq
         HFoKQlSFx9TH7qyu9nMb8KpXHOdDxjicINCTNfI3NkxpJW6EwlnoGykgA8fVg7pN4KB3
         TJl+bZrnt4Kl0BqsU5/ke4A3pxysDP6X5Kk6btfc+Pwn0ALp78VbidbHLD61XHoB13Yl
         PeILdhWuwDQWap/PsbaQNXJx/1rRuJ2UIs0XlMjNK8PuUSd03LB3kErvRaw910Z0VP+T
         xC2HkykfhXaGLAevEg8FUgFaAXo968PJdnkkNHW7aWHvieKnZAJXndnjvtqxdeVTo3DG
         PX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gnMEBo8E/2r0RxcreeVzvdUJTnoTv3L/ZBGLWIasnvY=;
        b=nJ/04qauSOjt3RtHGFGiof3MRruaFdWAHJRwlkBgmBfEoarPV84s/aPt82xUNID/fh
         q3os0DueyAtmfk72R/DhKEJf9LYmpxOPzBiMKH/8tpzMPcA3U9gNz8NuNZ9dn033uVqH
         avG4+YAwWkOaTeMqKgPfm/R34xz5y8ZMG+ziig0KXN0E1Qq+pHLtt5bGeaScjfTZ3fK3
         5tXFGtMLhD342z/HrGGTqJ8hBjW3vtzUSBNaD6rtP8r8O1brsWLU/vJgJcbApeK9cCQT
         hQbmBTl40+ea/FKlCTvZkHRdc66FvaFkKa7AQWT6UrDGrKfiuWTLHrdFI/ArnwJJEM//
         CAeg==
X-Gm-Message-State: AJIora8YsS1X94wE/u5i1SDHxVHN/7pfw2sopBjm735/DmuUurr0QDm7
        XK1Dd4EUpwbwuQWYPhyBKkEYfA==
X-Google-Smtp-Source: AGRyM1tThOHHQzHhG4kStaX1uXtl/9l9Q2rfmoYpTL6ZRww/UFC78vwuas+bzy1S2m5Muc3nuPUm2Q==
X-Received: by 2002:a17:907:2d29:b0:70e:8b1c:c3f0 with SMTP id gs41-20020a1709072d2900b0070e8b1cc3f0mr16367652ejc.37.1655640151554;
        Sun, 19 Jun 2022 05:02:31 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gi19-20020a1709070c9300b006febeb51cd5sm4528523ejc.174.2022.06.19.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 05:02:30 -0700 (PDT)
Message-ID: <20c93477-f41d-69c2-5fa5-3640f24fee12@linaro.org>
Date:   Sun, 19 Jun 2022 14:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC
 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
 <4a614c32-35c5-2dfa-3e15-d54c3c3c5836@linaro.org>
 <cd4eaead-4218-2de0-1929-7c8a2aafaff4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cd4eaead-4218-2de0-1929-7c8a2aafaff4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/06/2022 06:35, Dmitry Baryshkov wrote:
> On 18/06/2022 04:40, Krzysztof Kozlowski wrote:
>> On 17/06/2022 07:47, Dmitry Baryshkov wrote:
>>> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
>>> clocks/clock-names properties to be used for clock links.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
>>>   .../bindings/clock/qcom,gcc-other.yaml        |  1 -
>>>   2 files changed, 61 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>> new file mode 100644
>>> index 000000000000..564aa764b17b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>> @@ -0,0 +1,61 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
>>> +
>>> +maintainers:
>>> +  - Stephen Boyd <sboyd@kernel.org>
>>> +  - Taniya Das <quic_tdas@quicinc.com>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on MSM8916.
>>> +
>>> +  See also:
>>> +  - dt-bindings/clock/qcom,gcc-msm8916.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,gcc-msm8916
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: XO source
>>> +      - description: Sleep clock source
>>> +      - description: DSI phy instance 0 dsi clock
>>> +      - description: DSI phy instance 0 byte clock
>>> +      - description: External MCLK clock
>>> +      - description: External Primary I2S clock
>>> +      - description: External Secondary I2S clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xo
>>> +      - const: sleep_clk
>>
>> Just "sleep"
> 
> I was hesitating here as all other gcc drivers use 'sleep_clk'.

Eh, indeed, these are existing bindings and drivers. Let's keep sleep_clk.


Best regards,
Krzysztof
