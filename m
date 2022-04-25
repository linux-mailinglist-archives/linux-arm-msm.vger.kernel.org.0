Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A041750EA93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 22:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245525AbiDYUeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 16:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245520AbiDYUeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 16:34:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE072E0B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:31:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id k27so4682519edk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QEWI49DIkFq3xz5aqme4xH1CUQfbVOVg+14bCxnOpwY=;
        b=GWeeMNxiOvZ2MEjV5lJ0JkaarUmpOQmX7WiUt8zCGDFWdzIgsw7tMh4A6keXYfm25C
         9m+pH1W5rBWouBR0SeFnMfXYe0HqJUHklk0SWx3U5m6ChNDAcPDzIzgV2K5Zl6UCGynr
         fZryzeneEkMp9pFKQc+cxftRmyMB7nCuuZzjHDTPWJWIYNOLVZKqOBRLMa0WtaY7R9Wu
         nDXnNtl4NQohg7f4cLe0yOUnKpi4JtTufOEVdg4dlRguHneDx/AqexcU2Xh69pIE9z4/
         XAbPiJW4iA1FjQo9xOEekc8mf+MocAQMZJxpKDQ5G2k/OwpKzUSaO3ix4eNQAQ1Mobu5
         2xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QEWI49DIkFq3xz5aqme4xH1CUQfbVOVg+14bCxnOpwY=;
        b=Uo25eSJC7ei+aDKD1g4wCW0c9iAY0+hGNtM9GD2whJAHatQYP6E/GczOINzXwbZDOn
         Ew/0BhkBv12jG4o45eZuWl4DisBLDzORQhpD8npfewT6PDYOPRXT+wOAtCHITGD5BwmQ
         rjzlQ6154s2tLAT1VYMPFk/7IIOdBm0yuEpG6dIVPX2+Ohowplbo5LELRrNiYjvixS68
         52HpAuh4Elt6JpyFq9jzqR8kbw/zxDIUy33LT38x3wxcim27IV2r9SSDOKvEeBVqLsUY
         wMAgLVIbiayp5bBqpAqpfTcM8RMXaDjCgs0tRAfVxbEnkWv2VGhDfqt8IDowBoyrEBTD
         lNwA==
X-Gm-Message-State: AOAM533/u3uyyd3VtKUHiysinCCIaJEEntM89G+lT7dh+vr7NRqpFiQ7
        dDbMwcWPvSaFkxCWWNKQNzmkaw==
X-Google-Smtp-Source: ABdhPJwBV+KTPEi3we1/z4LAXYT4VxbYRDl2XXgZb+ETedGwoRHTIb6nRCqB3zbKW3Gn13wuQJajjw==
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id n9-20020aa7c789000000b00413605d8d17mr20736598eds.100.1650918665623;
        Mon, 25 Apr 2022 13:31:05 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7db59000000b00415965e9727sm5047739edt.18.2022.04.25.13.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 13:31:05 -0700 (PDT)
Message-ID: <6cbf4b30-0283-1723-212e-5a772c6a7b10@linaro.org>
Date:   Mon, 25 Apr 2022 22:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible string
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220425133527.3723233-1-robh@kernel.org>
 <20220425193253.06828C385A4@smtp.kernel.org>
 <YmcDJw6T7p4dtFYc@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmcDJw6T7p4dtFYc@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 22:23, Rob Herring wrote:
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: qcom,gcc-apq8084
>>> +    const: qcom,gcc-apq8064
>>
>> This file has dt-bindings/clock/qcom,gcc-apq8084.h referenced. Should
>> that be removed? It looks like commit a469bf89a009 ("dt-bindings: clock:
>> simplify qcom,gcc-apq8064 Documentation") took the more than just the
>> compatible for apq8084 from qcom,gcc-other.yaml and put it in here while
>> removing gcc-apq8064. Probably the apq8084 part needs to be a copy of
>> the apq8064 file with the single compatible changed.
> 
> IDK, can someone (Ansuel?) fix this properly?

I'll look at this and fix it.


Best regards,
Krzysztof
