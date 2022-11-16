Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D240F62BC85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiKPLvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbiKPLvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:51:04 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6054091D
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:39:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id k19so21468557lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuDk3uayJsUQmjNivfTwqNfLWo3eGnkeyCw1DYnRSDU=;
        b=CslyYCQE2wiAo9GyLrwhJ9bGWE8n+jVfTw2Sn0fa8AQbRV7V/6zoLLUC7urptmfPGu
         0boRqq4Bz33Jlvk+zex1LuWOA+HL8lsDqD9WNXbR9E0C8Vqn8gIeweboC3yHE99ux/Wz
         BJ1D/evTuhh9cBQk9Ddw41T6fy8Fjygb9Al24VbCQSOngFxj18Vdo04US0L2v35juxxV
         4Tc7oKCbOuAEUA4pmFLtFi8rAEEYxyQ9dnXnHoWlJKb7uprPCFaxD7HIiXJJEnW8Wuvz
         X5Vsm8Gkoac5QUwtvvPiLrfjiFErp3CeG602euqrdpHt37Orf2AqycZIYfm+pMjm0J1x
         KDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuDk3uayJsUQmjNivfTwqNfLWo3eGnkeyCw1DYnRSDU=;
        b=w54wqFifblwnd6n1s+nWeO3vBU14TceazfJuhcrvXmFwhgg8+oDPvPxd79F0dmcR3U
         sIaP/rdeDumWbRNzYiPTNRJlzw0GgnKk0czdHj0w9ieJwneRQErRxKw6sbegZA3t+wg3
         Ga0/QFDqvAQE2t2LRoh1Pg0/sgN5mzclt5a2t+pTQF/RtUGY5ktlWubw9q5RIbBena0n
         xM191JMS2EfkXnIa+F4mt9PxIp5YMWRwmMBSpOtxSZ7EPVBN7F4gVL1jIbdQVQREbL4D
         +5x9BofkK/GdHJYs1aNDrW0dWO30bDsbHHY5RN9AVBTY33nZYB7RQ+4cxOBKQchgdMCD
         UTpQ==
X-Gm-Message-State: ANoB5pkufKSp4y3e0vzq6Y9I/1svXie5hf1GduJqr0FQw9UDqrTQoBga
        /DTg5fAzyRy4hhx8Rs1Ac8osxw==
X-Google-Smtp-Source: AA0mqf7Jka5a5oRFwcRobu1AevTg74KYwSmfH5mJh8kPZCTHoh55RuRIQH7yhi4nZ2/JWnBSU5rlBQ==
X-Received: by 2002:a2e:9bc2:0:b0:277:5059:82c8 with SMTP id w2-20020a2e9bc2000000b00277505982c8mr7853504ljj.315.1668598749294;
        Wed, 16 Nov 2022 03:39:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b0026dfbdfc1ddsm2959187ljo.11.2022.11.16.03.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:39:08 -0800 (PST)
Message-ID: <566412cb-928c-d6fb-425c-b1c5140a71c9@linaro.org>
Date:   Wed, 16 Nov 2022 12:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: arm: msm: Add LLCC compatible for SM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116113005.2653284-1-abel.vesa@linaro.org>
 <20221116113005.2653284-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116113005.2653284-3-abel.vesa@linaro.org>
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

On 16/11/2022 12:30, Abel Vesa wrote:
> Add LLCC compatible for SM8550 SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

