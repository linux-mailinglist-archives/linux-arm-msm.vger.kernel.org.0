Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01B674AB7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjGGHCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 03:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjGGHCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 03:02:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC53D1709
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 00:02:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so2433065e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 00:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688713349; x=1691305349;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AO1EV4DB9mmXIuKbzqs+B0XTIHsZhaa6Bi4nPPvJMnI=;
        b=vhwbcG4KqnclCRSzjjpJ1T7h0FDVpSVcOk6oufyhiNo7GNRtea0mBdKbdDmaP6Fapd
         3vB3Nf5zv9fBOGPz33lSrpOUN3E1NIgahBty+zMmLIHl6zdXUfjLwyD5pOoHQqFJvZ7p
         g5OYewMjz5KaGHoluDNnQ18nxJBYFlSp/GbO/he/JPH7Rk4cX3i7zy1XrWXVcn3hANcc
         T0UO3u6rgQQGLQPGSHfe2YDO2z7O/2Tx/CAScRCG14wKVhLLDXVCNi2ZNsxalcC6AHEU
         tGGbToHKIvvCNxOfW+MBNawkEFsMi4Wck38lLK6FilfO4msHdnH8IdAT7khBhpGQaPjI
         9oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688713349; x=1691305349;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AO1EV4DB9mmXIuKbzqs+B0XTIHsZhaa6Bi4nPPvJMnI=;
        b=AL237+4XfMgZQIIUwKNcCmAWiQxUQSm4l/K1MQgrrrWnyTTM+7o9TUQMiMMx6BmZbZ
         QpXhnDBmmj+JvsGvU2VzXsX1EWp5sBQ0zV3tOncYm7rOEeIpIi6Ur8MVDGkBzOEhfBoY
         7RUb5PsiRNDbZxsa6uGFZH2BuEvr3r+ob8P4U/aE4t+m1Wz6J7j29ibULW+evQpN8FVe
         DEE7M3A3cR6ZqONIOaVVCg0XK7VXo/ac5rSarw1BIf9X5ZBLaEYQ/yGX18E+lWtoFmri
         UzgZxjcpsqGxFnsGHGNaaS466TZuEPGj2NqkvvwjGLZ/eiPZ3z9pC18R40Bk0864SXvW
         j+nQ==
X-Gm-Message-State: ABy/qLaRVw7uOHiZH3irFd1BIPYtU1shM8OctjjX3LTLV6NXq4R7YCln
        zWyhp6QdO7Spuem+rcSEqv9cVg==
X-Google-Smtp-Source: APBJJlE9taobwIfrQlPCx9nte3vZZOvtAvcAIAuF7ehQfbCcQfO8v4STi1qLh78PqwLoEOBtTQQ90A==
X-Received: by 2002:a05:6512:3d28:b0:4fb:8802:9554 with SMTP id d40-20020a0565123d2800b004fb88029554mr4116891lfv.6.1688713349008;
        Fri, 07 Jul 2023 00:02:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n6-20020a05640206c600b0051dd4daf13fsm1649065edy.30.2023.07.07.00.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:02:28 -0700 (PDT)
Message-ID: <4cba2af3-e011-bcaa-7ecd-bc35b8f07e72@linaro.org>
Date:   Fri, 7 Jul 2023 09:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: sound: Update maintainer email id
Content-Language: en-US
To:     Rohit kumar <quic_rohkumar@quicinc.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        cychiang@chromium.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230707065259.3099569-1-quic_rohkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230707065259.3099569-1-quic_rohkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2023 08:52, Rohit kumar wrote:
> Updated my mail id to latest quicinc id.
> 
> Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
> ---


The subject prefix should be different for ASoC:

ASoC: dt-bindings: Update....

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

