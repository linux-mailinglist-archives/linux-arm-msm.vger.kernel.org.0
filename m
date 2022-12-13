Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460CF64B5E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 14:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbiLMNQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 08:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235414AbiLMNQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 08:16:42 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8741EADE
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:16:41 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id cf42so4863252lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nk7V67NqkfhxlcRmYR5VUsDrUp2sRqPhIHzRz51wY0o=;
        b=AlOOTh8Qy6Ibe6LMNjR2UIBnCLOjDuBZCV7ZQG5MhgayawVo4/L7jvh4xWcw/yLhFS
         zQCq6NTiF3gKL8yq+rvcx+nRnHXT9y0GHN2C5bCbybTdvRtQbE+vuKDaDVNyoGNxwGuy
         3xcZuXJGeCv6NI0YycsK+1kIFVLCFnRTZ8goT5AjiYdJ9rHxSn93fwaA4YXrXsnBInzk
         YDEleSAONkGMx/I5M2vs95nuXpKX/9Ijguyj8twG6jNJN76yyYuNt2hTtWVSR5/rQ/qP
         Z60uqtGcm9V6PqKdzn/SYw2UVm4v7LR/mh5mcqkdrUwkohSxhOLJDYK9I9/ZtHOYmVJP
         gbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk7V67NqkfhxlcRmYR5VUsDrUp2sRqPhIHzRz51wY0o=;
        b=PtbF19eamFoFpY3j0C2FMOEnuTfVmqf6BHbeTfzJHOZFPCAhshtpBhmEawehlNi13A
         nk5BzGBPUiwFsqoMAYMciB1qeyoBHgtbZiXIBOlRQVjyeSgfnW9yiEeO9X0hIkLd8s4Z
         4KHXzSA6nlesg8zw5VfaHHBFX+r4KRwf/4j3jinKwowm2UnYK3By83Vh6i7d5KJMW6lF
         yWuICRviFy/YD/WLwFLGvipcv6Sb7DXDJECYmVZ6bq7hEnzdKXG0eodVAc7jMbUUVdym
         qneyk6yD8gwrhwwlQm7tBQcohVp0u3WjwO3hLO759YnfrJLPpVrGkIpvlujPuSmxjFOp
         aDsw==
X-Gm-Message-State: ANoB5pno+8wgzzODoN/nSsx6D5tdfGdQFoxF4kTB+hcPcV19EKthRrU3
        VSoiOIxcf2B8/OVfG87C+tJ92Q==
X-Google-Smtp-Source: AA0mqf7nh1NXqJ9pwWgyNupyDLA6nwnbddNcBVje5w5zxZJmUktBr88K+LRM5LiMhEU6xzNg3Vp1kg==
X-Received: by 2002:a05:6512:12c3:b0:4b4:bec4:9d5e with SMTP id p3-20020a05651212c300b004b4bec49d5emr7202453lfg.8.1670937400157;
        Tue, 13 Dec 2022 05:16:40 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s25-20020a195e19000000b004b55cebdbd7sm365311lfb.120.2022.12.13.05.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:16:39 -0800 (PST)
Message-ID: <3958f93a-474f-b18d-385a-3ed163558c84@linaro.org>
Date:   Tue, 13 Dec 2022 14:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/7] dt-bindings: nvmem: Add compatible for SM8150
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213002423.259039-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2022 01:24, Konrad Dybcio wrote:
> Docuemnt the QFPROM on SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

