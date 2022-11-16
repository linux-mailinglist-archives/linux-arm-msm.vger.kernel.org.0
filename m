Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9763962C591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbiKPQ4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbiKPQ4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:56:21 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C562610B1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:56:19 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h12so22595592ljg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkLNVvHASHqZcTebyy5tVyUYdsKotfecdoBFq+Dtmdo=;
        b=p1Lt5LCrAsBUK5rj+wnqR0c0u0kRvaSb6Z31UgEuf6Ub3C+nml/n2NxZrQauhQDAEy
         wXN5+bxHkViQ1B8hVGLMVZX5jHVDHtgzOCj24odPkiPf4u0vrNtzWIySUqi6JVqvuWyZ
         bKXE4JMUkjH0jbJ1m7VWVDTSTSxCIn1UFOq+qzZRmKyNwzPuSc8TdlW98GBUjfcyuM7T
         Uh7728zM286BWlsqcKyL10S/HYw7PrAs/50cI7rTsKo8kLrgJL2bOWn0Pz8JcHKL/9Qz
         Xs4vjyPQrSYIPT0Il3KA+spF+54VTQ+t6NH9tFZbtxj2Q0wngO4sRnHsnGTgBmfxqxCI
         WoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkLNVvHASHqZcTebyy5tVyUYdsKotfecdoBFq+Dtmdo=;
        b=BH6BTyFqwMNI6P8HX3ytBvEWRQjIWzJpcdZ8s3aGQ3cJzEBE6Bg9KfrBvpPUssP2b+
         85Aimom7sKIYO6i2SDmqx5ZHoceWEQQnWbX85JTj8Dfvg3dC96y4R2qjqsreTkg0g6+/
         kFhHE8MwlBWF1JhxuKIZiD9yCxV+LGzW7vJuKZ+Ji62CA71NQFXWJXytUYtSbj6kPeuM
         tD7tTEgQGBbGOPac2jhg/IBdDOPurLnFtz1t9xQSqsTgqQl5VH35L2g73nAhT3jVAgw8
         twT8+VUWFwSJ37zElSqlxxaXp5N1ldDvGJsfH0vwXm0KqDnAqVBGdKaM6QbT4a/dFt9d
         1roA==
X-Gm-Message-State: ANoB5plQTjjGPfyXbkCeey7vh+LmVNPUOXofWjpfBO+yVtltBhQ53pR/
        nui9aN8PHuE0T0KAQE0CkuCPFg==
X-Google-Smtp-Source: AA0mqf4qz0wdd3bH3kS6HyvslILNr0JyLbduilo1AzB2JCo8My2WYZZziGDMHsS6aT7Ie3dGKWlvKw==
X-Received: by 2002:a2e:8711:0:b0:277:92e:976c with SMTP id m17-20020a2e8711000000b00277092e976cmr7572747lji.306.1668617778192;
        Wed, 16 Nov 2022 08:56:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q23-20020a056512211700b0049e9122bd1bsm2675766lfr.164.2022.11.16.08.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:56:17 -0800 (PST)
Message-ID: <65a00619-93e2-05f4-990e-0d335878627a@linaro.org>
Date:   Wed, 16 Nov 2022 17:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: firmware: document Qualcomm SM8550 SCM
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116124038.2769028-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116124038.2769028-1-abel.vesa@linaro.org>
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

On 16/11/2022 13:40, Abel Vesa wrote:
> Document the compatible for Qualcomm SM8550 SCM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +

Missing allOf:if:then entry.

Best regards,
Krzysztof

