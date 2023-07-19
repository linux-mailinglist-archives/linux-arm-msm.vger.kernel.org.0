Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690C3758E48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 09:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjGSHBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 03:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjGSHB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 03:01:27 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77751FED
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 00:01:24 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992ca792065so892596166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750083; x=1692342083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSZrt9jeszEZGu/mKauiyWiY1HTeSRHVXWkl0PsyR+c=;
        b=BgrP9HbHLulKJqAh3a90fRdgO4sjNLYjWboQJenzmWIzqTETCKSTkJHOpYBFwF4qQB
         bel2zi8jpzzRW3dQgrJfvkauUOmb7SUrbmqW3vJ0B4pe+mFKjD4bWIwstIzNydVSsstR
         2bbQc4sz1ggaszirvJ+zXsbpAtLnWPtKgofL/oAasUQ6VgRM7Y/DU3hSsY496X8gxd1d
         nQUJxAu6Xddw1Zj4tYagBOu8vipwkKoPD3231wfqwdAIQmNU169JPK/+nopUP6nZDy5y
         RVlbSYICm/mVexr+x6rJuJSbqnhoi9LG5r9/ScVUEKSxjBublwhXyPzh59a/z1XGj0wH
         Em5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750083; x=1692342083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSZrt9jeszEZGu/mKauiyWiY1HTeSRHVXWkl0PsyR+c=;
        b=C3oXbsxVwAVXTqp7HHg9aElDgSdSzr4knnWv8k+xIPX+T+u/7KqCrqmxMYsczhRatA
         2LyMK30R3o+/IdqaIDqK0L4o0UjYa3v3XuD6xn29fYdwRtotZS21cLZWjQ89pu6vZ2dl
         CC8xRZZtnoiayA+0L/W3UJ3OwY3xaeAB3nlZqJlxnkl/9ehsx0tWw72DPCS5/hbLtbmJ
         SdgX8ildemZHupU8IuQosZfIDUI8Hq8loRST85tgidtoFqQFTFHUwxl1zewGpxRp7KGA
         AkyQVKd06d1hu7E4HIKCOossLZcw0824x2qA2rgAfIR4jczyGLts0b6emWnCls1b0v+0
         M+EQ==
X-Gm-Message-State: ABy/qLbpKtdeyUklq4QT4x2fffMuyvak+nYOZaPqHulMYW8EcW9fn6pb
        79rSI4Nv39z7zStqI3Q0UkWVqw==
X-Google-Smtp-Source: APBJJlGX7cx1vVoHNi6pwROqc+qSgYNgqVavnXFuzLoHzyAPHaI3G/MLulDPjwxxVA6/dpRfkZ/Ugw==
X-Received: by 2002:a17:906:95:b0:978:928:3b99 with SMTP id 21-20020a170906009500b0097809283b99mr1479059ejc.46.1689750083436;
        Wed, 19 Jul 2023 00:01:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qn24-20020a170907211800b00993470682e5sm1920268ejb.32.2023.07.19.00.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:01:22 -0700 (PDT)
Message-ID: <bf6c7433-7773-9b4d-1141-b5ceccae77ee@linaro.org>
Date:   Wed, 19 Jul 2023 09:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,00/11] Add multipd remoteproc support
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
> APSS brings Q6 out of reset and then Q6 brings
> WCSS block (wifi radio's) out of reset.
> 
> 				   ---------------
> 			      -->  |WiFi 2G radio|
> 			      |	   --------------
> 			      |
> --------	-------	      |
> | APSS | --->   |QDSP6|  -----|
> ---------	-------       |
>                               |
>       			      |
> 			      |   --------------
> 			      --> |WiFi 5G radio|
> 				  --------------
> 
> Problem here is if any radio crashes, subsequently other
> radio also should crash because Q6 crashed. Let's say
> 2G radio crashed, Q6 should pass this info to APSS. Only
> Q6 processor interrupts registered with APSS. Obviously
> Q6 should crash and raise fatal interrupt to APSS. Due
> to this 5G radio also crashed. But no issue in 5G radio,
> because of 2G radio crash 5G radio also impacted.

Your patches and cover letter is unnecessarily more difficult to parse
and filter:
1. Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch` helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

2. Please wrap message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
This is wrapped way too early.
> 

Best regards,
Krzysztof

