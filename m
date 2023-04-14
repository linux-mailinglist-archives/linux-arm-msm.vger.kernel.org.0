Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BFC6E2B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 22:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjDNU6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 16:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjDNU6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 16:58:32 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7685676AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 13:58:22 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gc14so3631035ejc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681505901; x=1684097901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUyDRWdW4/T9LZmqkwqHBULPvN8LvBPM7VEGve+sN8g=;
        b=OdJSsd/FdJ7uw4V93teLUlao9crPOo+y95Ky2Gvxq3OzuUS3+tcSSCmTujQAokps5+
         zEnfIEMkDrLcIogRreJ/zFE0mjgnHJ3c51IZwj1v6Qm9KFp+z4yg4FTXZkrlh3ruRDv1
         59c4SLQze2J/cjBLpRsDm0wv7f2oUJHg9HG+TO+IyPOWyjlUCKOl6PF/fnbUp01iRDg8
         oogkunsK3phR1tOwxJofMGpnfzmWHfzG8t35tMkrep1Fmv+HB492LHrY71q4AHIFpN1K
         m8VYPlkmlsSI+OkS+wAXzkpEnyb8C456rd+VuD5cMcmAEt47XAw9ertsCnzrX8WhVTiu
         vqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681505901; x=1684097901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUyDRWdW4/T9LZmqkwqHBULPvN8LvBPM7VEGve+sN8g=;
        b=I5X7AZSkwXxbZOQ2j1tn6cqewxywcm32L2owuOMIqdSN1iJ/WkDuaRiqfEflg23vhX
         56c9axGDi6ea1FOzzWAb7mX6yy4hY9cVp06El2i4YRtxZZfDyTfoAKC9C57TXQZYtM6A
         dRE1qprNdK9Ikluc08ft5jklA5bA3nkOc7yf7SYwyoZuyDSuxdJZBPlFSS4ODAV2jorR
         xj7DIhO2/KNN8Y5egfUwTzDWTeUxvpirMbRVmwx/YBi7PYlaCA8c0lWJ6Ozp5SPFPIrb
         kI28tnoqskRV+ScLccxUeEKAojnAaCI5kJxp8aj2XqTyHROfm6RfoTFxXRaJC5KIKvNe
         w2tw==
X-Gm-Message-State: AAQBX9cMtbVlzjbD1s44dHKHgj1LVuBrx8/F67uC+IM39EAhB7FhiC1o
        UCL0p/lTyIKN/Vdebq4IQeCZQg==
X-Google-Smtp-Source: AKy350bHG+Tjne2i7DGoav1XsNtf8dsquEfcTHErwlmyWJd6LW+OSBvc9vPc2bv0IkfaaPPCx+HkSg==
X-Received: by 2002:a17:906:179a:b0:94a:74b8:7b85 with SMTP id t26-20020a170906179a00b0094a74b87b85mr378586eje.6.1681505900834;
        Fri, 14 Apr 2023 13:58:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id ia20-20020a170907a07400b0094a671c2298sm2910089ejc.62.2023.04.14.13.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 13:58:20 -0700 (PDT)
Message-ID: <ff8c9220-369d-332c-1cf0-dca8be8f8241@linaro.org>
Date:   Fri, 14 Apr 2023 22:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
 <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
 <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
 <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2023 18:45, Dmitry Baryshkov wrote:
> On Fri, 14 Apr 2023 at 18:18, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/04/2023 13:26, Konrad Dybcio wrote:
>>> SM8350, like most recent higher-end chips has a separate clock
>>> controller block just for the Venus IP. Document it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Krzysztof, Konrad, would it make sense to split it into separate
> bindings? After all, previous videocc bindings used clock-names, while
> this one doesn't.

Yes, makes sense. Otherwise I am afraid allOf:if:then will keep growing...

Best regards,
Krzysztof

