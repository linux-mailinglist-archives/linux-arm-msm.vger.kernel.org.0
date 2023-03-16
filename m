Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDF96BC7D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 08:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjCPHyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 03:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjCPHy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 03:54:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7713DAB0A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 00:54:22 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eg48so3931791edb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678953261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N02M+a2kTE3JjbB1vKJlAR3DvW9jYOfPwGPBh9ASs+Q=;
        b=SWSVd6ySZdhrva/u5nGRqpZhyDkJ06XCrgRVKv58H9y0OIYoLg8/UkCHXfSbcWQWzO
         v3NYh3owdES5B3VkxthZnh4Z3eD+C5SwdtHy2f0TsF+FHha0hHtGo3lJ6BbDF9nWS6+I
         Nm/BaNzzXyJjkDlcnDJ6eX/vb8KfobSoObNrtVCBn7pBx053k1fMoIdN4kw7xmm21dlK
         rv+ZUjhmitsYAPS9cXdI+j5ubzEMm9obkk5ojTgwgzQZF5gvzpMXs2GJ9oppVYx/JZY0
         OiR1Mbg1MCzpsGr1BfK0wOpUDRU6TOuHZ7CNcQokydS6P7XbucK8CpOGNvgt1kjBseyO
         TdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678953261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N02M+a2kTE3JjbB1vKJlAR3DvW9jYOfPwGPBh9ASs+Q=;
        b=SXkcZsp0cKRWt9fYmSHdri8iYxOTZUg5lR2Jq67NPnxOy8Q/v2qHPd85NO2jATk4Vo
         BaWUQXKyiQU0JIhaAx3tV1P4ofIY9W2IF2cn08dRAjBW3A7+dK36pAqj1QoqplL6OMXA
         duGWHHDn1MP2eSQMl72loDggJwOt1UUauHyL0zl4lb/e7raDwQxKIDuilSsOi3aYX/wv
         Act92LlbxjcrpW0dDuWUojiRGpdZsQJsPK4ubbJUoYCTbIqy79nmRwHy5HXpZuOAkAri
         RwM4ToQ7f9eY/721KjrchZ/jkK8/vHONCj5ImeangwgQEjy9fM1y+2npqM1bTZeQ6k11
         Lf2g==
X-Gm-Message-State: AO0yUKWlRxgpIyVhRnRhK4Z4DbdkVikyGPA2Ks65YAeOoC2y1M5Wwcjc
        JEcfTaltY+yHBiwHcf+mn67m7A==
X-Google-Smtp-Source: AK7set/EFFCpeXuICHSKn98C4EGdOoLaorJK1gOh5sdWDsbs9zFMCDjWCkUn6JCF+ly3akI/kJJU5A==
X-Received: by 2002:a17:906:16c5:b0:8f7:d5c0:c71d with SMTP id t5-20020a17090616c500b008f7d5c0c71dmr7712893ejd.60.1678953260916;
        Thu, 16 Mar 2023 00:54:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906701200b00927f6c799e6sm3484762ejj.132.2023.03.16.00.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:54:20 -0700 (PDT)
Message-ID: <95b3c16e-b888-9fec-7f6f-633021289642@linaro.org>
Date:   Thu, 16 Mar 2023 08:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add PM2250
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230315183819.3563704-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315183819.3563704-1-konrad.dybcio@linaro.org>
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

On 15/03/2023 19:38, Konrad Dybcio wrote:
> Add a compatible for PM2250, commonly found with QCM2290.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

