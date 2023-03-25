Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759776C8DDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 13:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjCYMKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 08:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjCYMKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 08:10:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FD81422D
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:10:16 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x3so17688660edb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679746215;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7si/ZJFAkJPtUlygz/YFbyUbM93Lkzp8yuiVmxuElns=;
        b=EJY4z47bYfYSrkXPwyd5Pd/ZGcQHNDAyYEkGZXA4s4ruRGL/tD5Rrxsj0HQfrrWDZr
         3R9njLkK6XxxWe46851Hx4Nr0KDkj4kjBq6LO29pEqpIfqefmWX4yzCLnOnzqr5dj2Bo
         VUtub/j0yRDp/9oGnWOjmX5uMxxx6+FCwot6em5lRwr0b7823V5nHI9ltYUciUMNlUCk
         hSSTzv0zOLgLegFbVeqGK3swO9lcSZAFHnXxt39MHIQyb+r2oJgpsgrXX+Uo2pAYRNc7
         z9tbLdfWfKFRKgv7TygPMUvtQixxnnEI91T2sWlcK4TQ4zFnHu3t+FO8l+7f00i6ErAP
         d+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746215;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7si/ZJFAkJPtUlygz/YFbyUbM93Lkzp8yuiVmxuElns=;
        b=eYcvpHyRPpJjgdrHETbfo+jGz9P79OUa897/scFlqHS94MxJfCsxN2czGFrl3Phobs
         iqHzz40B9+knj8/IbeYodnkdWzjaxe1ks11BWg3vspkMjd4jmySdhXGr4ci1ZtUpLXcB
         mScjcThmFA0s1KVhQHSWXNuyQ5/87luzxmxLhqJV1znK/OJ/bYmQpD1W1QQk6oMCrg9m
         q/PUDV4ZPoMf/0UFTzff9OjGLe27RoPwZqEVa/p9zi9sO1btFQGNm55oRDCGyv/pwozb
         RSLlrxtBrqaYjJq3L5LfXSBgyE5imooyalf5WpNn8bP0W/ZhdJI3k/GSmieq/uyTmN/l
         uvxg==
X-Gm-Message-State: AAQBX9doszJblrAmO35uFnGm34ISEjLDCBpheekJGENZKtXB4OBe77h+
        +SULkEObAQOz/s5KcUrfoJVWLQQ1It05kHsaqv8=
X-Google-Smtp-Source: AKy350bi7SSadNvBluHVbpMkZAQDmKiYJabmu4ayqj15712VndgleYHQyBbOAWh535yWMKrbmMS6pg==
X-Received: by 2002:a17:906:3f89:b0:877:a9d2:e5e9 with SMTP id b9-20020a1709063f8900b00877a9d2e5e9mr6097351ejj.42.1679746215068;
        Sat, 25 Mar 2023 05:10:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id h27-20020a17090634db00b00933f31034f2sm8917839ejb.38.2023.03.25.05.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:10:14 -0700 (PDT)
Message-ID: <0cd34c19-d24f-04b1-6e93-b6131ca1612e@linaro.org>
Date:   Sat, 25 Mar 2023 13:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm630: move DSI opp-table into DSI
 node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
 <20230324202244.744271-5-krzysztof.kozlowski@linaro.org>
 <5cf37779-49fe-ad06-d357-582129995771@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5cf37779-49fe-ad06-d357-582129995771@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/03/2023 13:04, Konrad Dybcio wrote:
> 
> 
> On 24.03.2023 21:22, Krzysztof Kozlowski wrote:
>> The soc node is supposed to have only device nodes with MMIO addresses,
>> so move the DSI OPP into the DSI controller node to fix:
>>
>>   sda660-inforce-ifc6560.dtb: soc: opp-table-dsi: {'compatible': ['operating-points-v2'], ... should not be valid under {'type': 'object'}
>>     From schema: dtschema/schemas/simple-bus.yaml
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Nit: you also changed its node name and didn't mention that, but I
> don't see that as anything major so it's gtg as-is

Because the binding expect a child named "opp-table", so I assumed it is
obvious when you move the table into the device's node.

Best regards,
Krzysztof

