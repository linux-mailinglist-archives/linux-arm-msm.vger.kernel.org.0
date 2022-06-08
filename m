Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9495542E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 12:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237791AbiFHK6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 06:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237724AbiFHK6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 06:58:36 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2CB1F1BE7
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 03:58:34 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id s12so33466228ejx.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=gd7ElMzuea/7WFuTveFKUDfWtUvONcRLR/cPLStaT6k=;
        b=ImyH37uZmroZDm8Ibmf/gwlQtzRGgCAjvAHZ9R19uYBVO37QwDEpJpKHAUY19Er8hv
         xf8NeuAiMgptI7pjnlTqNkHKOlHDmFqdoTyjy9pwcrjZJNjbnGnvX4+5h/UqsLckfb0w
         hAIKchwZWJvpufh67WSy2nZZ8oTsWLv6+yxv8nkR6N3b1JN/Vo6FyV7Cp+NZUM8pfNu4
         I8/WM4l9BArNKXGqPjACdz9Nv9hGjV2PpYTu/asfEzy07iiaDGv/Oh8nHgjb1tYxGVBt
         gaDgFQ4XxqmZnj35L07tPRS9nUov2cEgA0YsGvZDytiZysJqTrTpkJN9v5R77DWi7MjE
         IRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=gd7ElMzuea/7WFuTveFKUDfWtUvONcRLR/cPLStaT6k=;
        b=H8ynxpxTUZn8W0mVdttpOp+1rDwNebFHbQaGtC41V98zVhAxUvN2yWgKj5vfC7f5ht
         JTDjDlmTIWttQCCR9ZTgjUmOAVMFLmywPOExtDZocS41TB40CEFE9CAi0N6ppfn0bxHH
         yyPQ24xlzVzcheRRvP1fxrKhlJ1GvNQtb38pP8cBJKx9Y8ISFsqJafkbdecwl0GY9Fil
         t8hiQXVAKFDMTlB7n6hWKph1lJL1kKw/T7DWcbVGWkgWXSlq9feYQE1wHqxjKLrdoimE
         8jR7WaZR3SQF1pJHF6vyxj4jrTUksVpwHhhKIvONLfQeMTIw4wYpJtwH0q6M6AmjLvfb
         X2vQ==
X-Gm-Message-State: AOAM530S+YDtizqLeq2Lzuu6q6jP/Zoqjm6ssPoqPg+GgN5fAJfGqvbJ
        v4QW9uk1VShhwEX4qTg2NJE+sg==
X-Google-Smtp-Source: ABdhPJwDxpg4GB4ylDf87fh2wwlHAOiYNc8gpqBa20Av+fJoAUsf0So0Lr4u5yX1ZYdZrJHzw1UUqw==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id nc1-20020a1709071c0100b006f426920e23mr30864951ejc.243.1654685913423;
        Wed, 08 Jun 2022 03:58:33 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ft29-20020a170907801d00b0071145c2f494sm5246407ejc.27.2022.06.08.03.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:58:33 -0700 (PDT)
Message-ID: <07398b52-cd1f-c53a-ace0-6baf81ed8455@linaro.org>
Date:   Wed, 8 Jun 2022 12:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add sdm845 compatibles
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stefan Hansson <newbie13xd@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20220603201341.94137-1-newbie13xd@gmail.com>
 <3930eabd-4ca8-d644-e27a-588b189cf1ae@linaro.org>
In-Reply-To: <3930eabd-4ca8-d644-e27a-588b189cf1ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/06/2022 12:55, Krzysztof Kozlowski wrote:
> On 03/06/2022 22:13, Stefan Hansson wrote:
>> Add compatible for SDM845 and all supported devices that use it.
>> ---
>>  .../devicetree/bindings/arm/qcom.yaml          | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 129cdd246223..6436b79dc60a 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -235,6 +235,24 @@ properties:
>>                - xiaomi,lavender
>>            - const: qcom,sdm660
>>  
>> +      - items:
>> +          - enum:
>> +              - google,cheza-rev1
>> +              - google,cheza-rev2
>> +              - google,cheza
> 
> All these were already sent:
> Google by Doug, other by me:
> 
> https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/

Just to be clear - please rebase on top of it.

Best regards,
Krzysztof
