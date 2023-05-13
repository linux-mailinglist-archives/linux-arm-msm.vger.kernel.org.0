Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0581270158C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 11:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237424AbjEMJTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 05:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbjEMJTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 05:19:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD1E3AB5
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:19:05 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965e93f915aso1874340466b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683969544; x=1686561544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pwslOp1fAGewqJeOjahYE75gGMp1KhOblxxR4rZ8Rg=;
        b=Rt78OHZ7Pe/GbuBHucM4WxbAdD9tqFQYhEWe/bio9wfsVMMVvczlTF8zehIUQlX+X9
         HzLuqNJWTAIGGMF7ZJf3S+Q9a4zVGlUIiisk6/+yL+Krxn+uiAjVGskO813sAJwm5HaE
         eSD3T6uhi4yKh9swvF0S/FWk1d/BfRNmLl+NDiQNU/TWKlhC2P4b3A2t+s95l6PlIobc
         djOVtctx/Og1r4Jyb18rFfAKpivQAwNki2uHn2TNyvXLQ7exBxnvE514wbyGtDNgxLsN
         vTW2UdBaKh4iyLToFUeVjWlnbqxxCIabfGba89x2DaYOVkNLk4GJQL1Oc57MgpJjqN6E
         8yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683969544; x=1686561544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pwslOp1fAGewqJeOjahYE75gGMp1KhOblxxR4rZ8Rg=;
        b=PK1m4HE0yWT4Vw+YZCGWnMQ3FdmtJX0SszArV/vrClZ54IiosUB6n7U+bPOU/VJtse
         0wgHB4ndAv6EKYXQJHHicq8Z1qdXzFciiC6Ac84cR52mfdR4lFfKH0oApNRQu3Nv1vdF
         BgqN6ttqqr+5g4Oqnv9PxhaNpTTbX9pAz+03008mNarN9Lmw8iLq6ViTHsoNmVRJq85U
         +KlvS78rDDzUv1ABbfsfR3IAbXeb7kzw2ycV/3mlmMQviaYTQ3ytKW6TneS1a2Q42Nud
         lOF2ffOPL97exe7IOIglXXeWNoVtLq5DTP5pSmAg+REj66H62AdvDgmSojj4TW00KPrR
         0Geg==
X-Gm-Message-State: AC+VfDxiSiByKzvFGXh+0ICrYdwwL73dDM3dwiUoX5XdVjSCmAlRYGu8
        Vteyc8ZYbmLdhsxehxo+tq8Yug==
X-Google-Smtp-Source: ACHHUZ50SbvUnQQSK4asT+Ddop4n2StwVuTmWGDjFEKe1e3typUUWFWcTe5rvtNXa9yqOpmHnnuTmA==
X-Received: by 2002:a17:906:db02:b0:94f:128d:63db with SMTP id xj2-20020a170906db0200b0094f128d63dbmr25211619ejb.17.1683969543948;
        Sat, 13 May 2023 02:19:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1d0:810a:586c:c5ba? ([2a02:810d:15c0:828:1d0:810a:586c:c5ba])
        by smtp.gmail.com with ESMTPSA id ov17-20020a170906fc1100b0096aa0ca9b5fsm2009519ejb.106.2023.05.13.02.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:19:03 -0700 (PDT)
Message-ID: <15ac2e1e-819d-9f73-11ab-6e7953913b83@linaro.org>
Date:   Sat, 13 May 2023 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Fxtec Pro1X
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230505-fxtec-pro1x-support-v3-0-0c9c7f58b205@riseup.net>
 <20230505-fxtec-pro1x-support-v3-1-0c9c7f58b205@riseup.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505-fxtec-pro1x-support-v3-1-0c9c7f58b205@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2023 03:05, Dang Huynh wrote:
> Document F(x)tec Pro1X as a SM6115 device.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

