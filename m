Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6C2619718
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiKDNJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiKDNJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:09:40 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FA22E6BE
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:09:39 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id s4so2963070qtx.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MxzjYKOk4sy5XjCR20EQiICdAfVYjjgrKgPBg79CsE=;
        b=jLQzpldCEcHA/FkI6E2pNXsFnBYFSpZpEi7EGtsN+UbHgHMGt8mblItb2S0sOavdll
         jCcljPGzrU0UgJjpy1YZmGTSPaynqcblExMDGFb0IxZXZ0aGYS+2lgY/D4Wl05GhpFsU
         W/n2UYzXuW8qV7VWdvCYoV5kzxUGQdBdz7c9j8drXSgmQjNL6DT8ydhoS2AiqxZm4XrH
         UK4Ur55PACqY5zSKJxsWVPLYJuBiW7sQl1Tag9msZcuQy24zXWfmBiJLGdn4so83rbEp
         6G1u49bDUYjiO3Av4uCxZyw32PMliCeFBFzU8bvCLokVrw8Qp0SmwF7yuNpSoKrj02/J
         MVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MxzjYKOk4sy5XjCR20EQiICdAfVYjjgrKgPBg79CsE=;
        b=e3G5sdKMbZhwsTn5wl5f1KBD7LGDoMxTXFjHQZdRRwaPeUi4VvxtNRALm/NnU2gyNq
         uN60WYYuXi5w0Qn8Hl97QBDgXcuRkPXg/68rkCKWSdBCS0g1hZu/cxZ44CNM0xbYkfDz
         wAlU0ttj8UXFpsoqM+fawtyuuOylt7101D950yRbSVQFBsaYf2rwE3aLS+Pco/LY2MYF
         Byd5XgpvCRwC3uKojRzi3lPJYRnlGAztzt5n2oPzO6lpU/Zjecv/46oWOSc2oZD7qGSP
         MCWteT1nDxm8TMvxYPfzwd18C5IrUHt8j/5BaWCZYXUEDkA3+40+4YgzTfKMfUv7FPJf
         Ragg==
X-Gm-Message-State: ACrzQf31EszRZ9LhJI5ASEKSZKvJLN8qH36Dib/OAD/avm3y9ARVKZs5
        7/rrdofC71WDEzGXh06o/ulZQg==
X-Google-Smtp-Source: AMsMyM7zigYUVbBE2nPsp2ko6wVBLqpJ2LbhXuLIsukXJXFC98j3sXxmYJGHcIG5kwBfS9W5O41I7g==
X-Received: by 2002:a05:622a:4ac6:b0:3a5:29d8:b683 with SMTP id fx6-20020a05622a4ac600b003a529d8b683mr20780593qtb.386.1667567378867;
        Fri, 04 Nov 2022 06:09:38 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id w15-20020ac857cf000000b0038b684a1642sm2461299qta.32.2022.11.04.06.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:09:38 -0700 (PDT)
Message-ID: <94b9c2c7-a1f8-26e7-0dcf-41b7ef46b23f@linaro.org>
Date:   Fri, 4 Nov 2022 09:09:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
 <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
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

On 04/11/2022 08:45, Dmitry Baryshkov wrote:
> On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
>> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>>> SM8450 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>>   .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>>   2 files changed, 481 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>
> 
> [skipped]
> 
>>> +
>>> +$ref: /schemas/display/msm/mdss-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
> 
> [skipped]
> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +      - const: bus
>>> +      - const: nrt_bus
>>> +      - const: core
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    maxItems: 2
>>
>> You need specific names here.
>>
> 
> The names are described in mdss-common.yaml

Ah, then it is ok. I could not check these :/

Best regards,
Krzysztof

