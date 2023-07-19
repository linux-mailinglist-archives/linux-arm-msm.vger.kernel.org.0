Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678C5759970
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 17:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjGSPVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 11:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjGSPVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 11:21:42 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4681110D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 08:21:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31454996e06so6594578f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689780095; x=1692372095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi2bMiiHu0hNddI+n5SAEb4NvrLYq2PUYLhIfyaiWGk=;
        b=pTLis9lqJs+iAe0SRxqARJnQjwbsVRLHNuG4+51tNwQvKFmdw9c96JlNVz3cMStwsa
         Ev6znBEP6dGK99QUSLBmJo3BZf7BU8YPUml+hRDlwaD0Up/GQoTPMcKzgi7zpIj8T9FO
         mw5l4Wx52y1sLjGawCoj4lVCSP4Ca/Ujn60ZPXRsle4dL81fcry6/0kBgMRMqSci1npa
         xwaZEsU/Q91dFvMKWXNXuvjjENNLrOy3gUy7TiRs3AHEEEowVPAcMbEeltllXCzAfVmO
         Mkcg7ldvRbzEWK8f7hl5trv76mwnih/by1bAUrrgYWfUyPpiKqjg7AdGp283r6MVga14
         IQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689780095; x=1692372095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hi2bMiiHu0hNddI+n5SAEb4NvrLYq2PUYLhIfyaiWGk=;
        b=jTXT0a2hHf4YuFGfK2k9PQw01cYbOY2hv9lgzuyHh9B4DylJDpvZj/+ep7SWxRRS3f
         Qcvg5Z7wkuKuG7wyAFuVlBXBIm5CFD/oRerNiWBP1wRdX/KLwq9pp6IfTL3Qi+KoYS/q
         HnWE4H5XHDC/dYd4vGoRZ9ZkUSNY46xXBiK5q/uQSyV6NE7F3OYkJFt3NsMPaSI3Tltg
         NSQxt10s0w5/HRD7HU6LKgKnOQ6DniXU1mk2zuKq+PIWdMil4Kv7g1HBPqpuYVs+I07V
         xPJFX+bcgV4lPHclLaRQh/vW87oR4jJkodMUK2JiJzrYZuxXzqBpqolGPRky/CYJc5jJ
         3RMA==
X-Gm-Message-State: ABy/qLbfMKlKT3Y4dT0kSHERtEyrUCMPHgibwXM+8qM7Tt0Re3cNFzdL
        FF0Utc3i82A5S/V2NjeWM6Jenw==
X-Google-Smtp-Source: APBJJlEgP/yqZ5gLlCBunwtBeJhwM/ez/4Grf9PK4Rt1MaQtriT/zXSXpM9X6wsIs+Zq3kyUQgIV/A==
X-Received: by 2002:adf:cc86:0:b0:314:11ea:480d with SMTP id p6-20020adfcc86000000b0031411ea480dmr166543wrj.9.1689780095615;
        Wed, 19 Jul 2023 08:21:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm5570241wrr.58.2023.07.19.08.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 08:21:35 -0700 (PDT)
Message-ID: <07e376b1-f3df-7dd1-db08-99c26a7da93c@linaro.org>
Date:   Wed, 19 Jul 2023 17:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,02/11] dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring
 up clock macros
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
 <20230718120501.3205661-3-quic_mmanikan@quicinc.com>
 <9d473f0b-bd6b-f426-3bd2-2890e8a79431@linaro.org>
 <9c540e3b-d8d1-0807-a21e-d01a301c1972@linaro.org>
 <ed817ba3-a424-1247-0ba8-88f1a9c23fee@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ed817ba3-a424-1247-0ba8-88f1a9c23fee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 17:11, Manikanta Mylavarapu wrote:
> 
> 
> On 7/19/2023 12:45 PM, Krzysztof Kozlowski wrote:
>> On 19/07/2023 09:14, Krzysztof Kozlowski wrote:
>>> On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
>>>> In multipd model Q6 firmware takes care of bringup clocks,
>>>> so remove them.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in V3:
>>>> 	- Rebased on TOT
>>>
>>> No clue what is TOT. We have TIP, but you should not use it as a base.
>>> Other used names are mainline and linux-next.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Un-acked. I said last time that this does not compile and I do not see
>> any improvements here.
>>
> 
> My bad, i missed.
> 
> Is it fine to move gcc driver patch to first and then dt-bindings
> patch ?
> 
> With this way dt-bindings patch will compile.
> 
> Current patch order:
> -------------------
> 1) Removing clock macros from dt-bindigs
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230718120501.3205661-3-quic_mmanikan@quicinc.com/
> 
> 2) Removing clocks from gcc driver
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230718120501.3205661-5-quic_mmanikan@quicinc.com/
> 
> 
> Proposed patch order:
> ---------------------
> 1) Removing clocks from gcc driver
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230718120501.3205661-5-quic_mmanikan@quicinc.com/
> 
> 2) Removing clock macros from dt-bindigs
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230718120501.3205661-3-quic_mmanikan@quicinc.com/
> 

Yes, assuming there are no DTS users.

Best regards,
Krzysztof

