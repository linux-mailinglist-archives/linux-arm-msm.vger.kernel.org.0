Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A446B1F85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 10:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjCIJLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 04:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjCIJLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 04:11:23 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C26E78C87
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 01:10:59 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id j11so4237234edq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amegkbQi6JbORUMHlxE9zNZBJkMQDtF4RPiYLujv5uY=;
        b=xVwLLAobtAxiubuKG5NIsMw2SO3OJ/ed8XVLZCX512NFEn+vQP+uiTLfT6PhGp8XF1
         6Aqka0W/Ymig7E+xXQfGba4X0e9hMEqTInrFmSyyt0/UDW3nLWzEoEr2EfJ63JzqpzqC
         UDdW2LhZgLCKsH7/bIPbQN9uLSTMs41extG8Sd+CarF4ZbVhfCkdcdiuihJuTXvO6nWr
         cOtwRcJUIJn/EyAt/hY4KLnY74fcXhmnRschZkYV4i1YHsWcJf7hVr+8zCthtSEcmhA0
         /0xvoT38DXxwY0U420sXy20X9i7enwiefgiqD0un5AR6byEPtSAVb1552JD4ZEu335td
         hUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amegkbQi6JbORUMHlxE9zNZBJkMQDtF4RPiYLujv5uY=;
        b=FjyWeX2ZdTs27Afzb/MGlBNWSOHetokWR4ugbgzT/oSo6YgQMnOy7InBywivW3Vbfo
         4+wmz4XtdJYBDCU4Z87DQVMTkqzlAA3lqZ+Z5TdXYtfyfpbIlblASTg/QTok29z+GGV9
         254ANbwj+SOk04MV34xJ2/zfvPUJLzKBuxnj8CPVWBnN9U+ixnB+clj371VezuDJsh5m
         1jSPkbXJ/vZsJqLWGsI74wMNjDEYaDf+OrJWrUBREg/Sk/3A50mfmuhgmoGgpMfMwke9
         gsnBAo9IlyAwgq7cFaEiHB6EyLvhNVK3DZpJa3Jqz83tBxL7QHTHhoTqd7fbhbACZ+4w
         43sA==
X-Gm-Message-State: AO0yUKXMMdGoNEZQ/VCEekktW4AnKF7sS4D96RvDN6xtAYubgzEDOpK+
        M4Fu4RhRzGM7kS5cSlYsrUjgZg==
X-Google-Smtp-Source: AK7set/kRD7oQCwcNdIk/dQW0Y0UAwn7jdfOe/zN3rg5WTMsuKCSrLL0FW6VZ6v4r8CSBfkp3iGL3A==
X-Received: by 2002:a17:906:398a:b0:88d:d700:fe15 with SMTP id h10-20020a170906398a00b0088dd700fe15mr21445776eje.0.1678353057637;
        Thu, 09 Mar 2023 01:10:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id ga2-20020a170906b84200b00882f9130eafsm8506459ejb.26.2023.03.09.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:10:57 -0800 (PST)
Message-ID: <b40c5cb0-0689-db1b-a1b9-e9b5d8ed838c@linaro.org>
Date:   Thu, 9 Mar 2023 10:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/6] dt-bindings: thermal: qcom-tsens: Drop redundant
 compatibles
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <20230308131041.124482-1-stephan.gerhold@kernkonzept.com>
 <20230308131041.124482-5-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308131041.124482-5-stephan.gerhold@kernkonzept.com>
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

On 08/03/2023 14:10, Stephan Gerhold wrote:
> Since the SoC compatibles must be followed by the IP version compatible
> (e.g. compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";) it is
> redundant to list all the SoC compatibles again in the if statement.
> It will already match the IP-version compatible.
> 
> The list has already become inconsistent since for example
> "qcom,msm8939-tsens" is covered by the if statement but is not listed
> there explicitly like the other SoCs.
> 
> Simplify this by dropping the redundant SoC compatibles. ipq8064 and
> msm8960 are still needed because they do not have an IP-version
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Changes in v2:
>   - Drop new redundant qcom,tsens-v2 compatibles as well (see discussion
>     in https://lore.kernel.org/linux-arm-msm/Y3ZFDRI6ypg18S27@gerhold.net/)



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

