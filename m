Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F34C67774F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 10:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjAWJV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 04:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjAWJVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 04:21:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850EF13D67
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:21:24 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o17-20020a05600c511100b003db021ef437so8000773wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dfmvo5oeZS2mw9rYPDjdKBRJW58vjaeN+zBDMH5ZCpk=;
        b=vB8o+1Ngxx65FLNG5N5XaT1T7oTp+DfMd3rA3AnVU3Rks2jxBLZN6NYYrcqia+VweW
         lL7CUrvLvnIZElmtoH6Fqlw58jTOchGm+eOwkWQ/GGciIhOacCg743n96qEIWuQDyObf
         n/Jr+eninp2o+WysIuS+6Zf4AubtFOV3KeAmZy2b1BJbIXCdQfID8NK4/inDKrRSgbT7
         s5F6tZpT7dRgDqGYUSeVUmey8IHOmqfy2G6M02g9sUa2ZuPZrROFwaIof82Fvx3dTpLK
         j2Qz5PPbw7JA9QNbh7r1ENz6/lxZAx1wnpFRg/cwmMF+/dgmqQ/lB2ChI3bzgHsaKq/X
         tA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfmvo5oeZS2mw9rYPDjdKBRJW58vjaeN+zBDMH5ZCpk=;
        b=Q+3v8W51ai73EYH/rhb6tVzkiFTJSsZA6078/7+rdx3PoscMWN3EhjUOEGDuiJ/xu3
         FZVGT/3Fp/9bN2j/tks9nSVBGf99+Ce4zgv8bqLLOzS851RnqndTMf1aCx+Vc7L/nwdT
         Y+/rWJDx6Dt9gFA2DyZ5vu/b/+xF9/7Q14Bd2NL4PUA+uV7Nk76Ok4DGdMC/p1B0prN3
         ykAL79CIO7xvsrCzJazqoGEJazkhuf+Dudq2iPx0uEAi71OuaXuYAGHeDdbEHndGaqPb
         u4KRbB/EwOowV5y7PRVgXzSsBCqDdX0tieTGkcOeQbpCmzZk2+h/Un/fnw8I/VQBht4V
         N0SA==
X-Gm-Message-State: AFqh2kqQpaLEDduvD9f3fIeZW5eJ4J1vFgog9TkMKigJeazx5jOX+FkP
        2IN7w758SMz+1Wzs++CzZB5NHg==
X-Google-Smtp-Source: AMrXdXuqO6PMOyE0fxvWczF3BcWFU4eORgAdVy2kpa3ur1lCmv/eM+I7btGwcb/5Cv/Q1BtX6wUajg==
X-Received: by 2002:a05:600c:1d85:b0:3db:1bc5:bbe7 with SMTP id p5-20020a05600c1d8500b003db1bc5bbe7mr16855715wms.0.1674465683132;
        Mon, 23 Jan 2023 01:21:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hg8-20020a05600c538800b003d974076f13sm10011878wmb.3.2023.01.23.01.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:21:22 -0800 (PST)
Message-ID: <c6ef28cf-74cc-5912-d73f-822f57642038@linaro.org>
Date:   Mon, 23 Jan 2023 10:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add SM7150 GCC clocks
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230122192924.119636-1-danila@jiaxyga.com>
 <20230122192924.119636-2-danila@jiaxyga.com>
 <5f778c47-a1a3-70f2-78b8-107a11e31eeb@linaro.org>
In-Reply-To: <5f778c47-a1a3-70f2-78b8-107a11e31eeb@linaro.org>
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

On 23/01/2023 10:11, Krzysztof Kozlowski wrote:
> On 22/01/2023 20:29, Danila Tikhonov wrote:
>> Add device tree bindings for global clock subsystem clock
>> controller for Qualcomm Technology Inc's SM7150 SoCs.
>>
>> Co-developed-by: David Wronek <davidwronek@gmail.com>
>> Signed-off-by: David Wronek <davidwronek@gmail.com>
>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>> ---
>>  .../bindings/clock/qcom,sm7150-gcc.yaml       |  69 +++++++
>>  include/dt-bindings/clock/qcom,sm7150-gcc.h   | 193 ++++++++++++++++++
>>  2 files changed, 262 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>>  create mode 100644 include/dt-bindings/clock/qcom,sm7150-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>> new file mode 100644
>> index 000000000000..a0105e11fdb8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sm7150-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on SM7150
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Danila Tikhonov <danila@jiaxyga.com>
>> +  - David Wronek <davidwronek@gmail.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on SM7150
>> +
>> +  See also:: include/dt-bindings/clock/qcom,sm7150-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm7150-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board XO Active-Only source
>> +      - description: Sleep clock source
>> +
> 
> If you started your work from the most recent bindings (e.g. sm8550) you
> would have saved one iteration and one set of review...
> 
>> +  '#clock-cells':
>> +    const: 1
> 
> Drop entire property, it's coming from gcc.yaml.
> 
> 
>> +  '#reset-cells':
>> +    const: 1
> 
> Ditto
> 
>> +
>> +  '#power-domain-cells':
>> +    const: 1
> 
> Ditto
> 
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Ditto
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Drop reg
> 
>> +  - clocks
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
> 
> Drop these three.

BTW, all these changes above were not in your v1 so it is weird to see
them here now...

Best regards,
Krzysztof

