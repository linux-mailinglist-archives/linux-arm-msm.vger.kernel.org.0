Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AF068BD31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 13:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjBFMrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 07:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjBFMrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 07:47:01 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597F32195F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 04:46:55 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p26so33707618ejx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 04:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRx1x4R3ZCNW8PHzWzGk99Kr1Ri4nC4SgujcLpkGYRU=;
        b=JuWGrqbbjwx9BF87VT3l9QlU6FGHIa8PBf7ocrIT9xEzAm4c1NJZpLd0aHn7Kuseg+
         k+wXf0zmdkOhue9g1tsqYVUdvQrmGuEqsWNRL6k9HL181JnBgtAIv8YbN+6nhorz+Tlp
         N4sS1j20gZ0nSvhH5PjoJi6LSdC6PxlqdSB5ssbeCi3nX+5o+pkJPwMc88f9N/ZeNxbp
         eC21KQOB/fzJuZ2X3fFxV/JqFkb9jdSzbvhZSOy715zu0F6yG6nmgSEv6LpmeZordSnj
         hrooUhysad/2EiqWZK77sJasfxHYcfj9ACc6+ysScxV77HBf1ygxydWwNMn67W9RW3v8
         rc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRx1x4R3ZCNW8PHzWzGk99Kr1Ri4nC4SgujcLpkGYRU=;
        b=DWa4yAKrQTQlB8jV4IXHAEetJv9/Amhqqrh3YoaP9VD/sa9YNXKPGx0mdp71xHTD6P
         P9ttfK3yCn4VNBSEQ3DXQpPQAnjnHEjvqtVT176qKSID9ByBpg6X4kPMcNSU5MDYN0F8
         h9Av7wNCIGEY5tfcSQKqGa0kpEstzV9p4vqUqtM+iceE8uUdwuWAKShC6X6QeUgQotOE
         WLYPdC8Y8YPDdIMGEZ/VAhh3AvofaT7gmyiFEvhFfJGsxpyJ39nX/Ahryz9hWSLuaupQ
         MTN0b+ukGWFUasGbeshxZLysJuc95do+Yf2lLkCPg3eBdDAT1GTKoYPMiBRR4yYWT83/
         kGxw==
X-Gm-Message-State: AO0yUKVfSiTmcF/p5a+9bqpfhPemmD6aUThYlIibZ5USLsGhIu35DJ7x
        1TsHS9nw65RbI7zl3s6KzcSEAQ==
X-Google-Smtp-Source: AK7set/dtnTUNxeyVligvd1p437lGQ2KM+5Hf5csI6w742KksWvXp9+BUhBR8go3wL9l3JSEFXBSDQ==
X-Received: by 2002:a17:907:2c63:b0:88d:f13e:cba3 with SMTP id ib3-20020a1709072c6300b0088df13ecba3mr22186994ejc.36.1675687613920;
        Mon, 06 Feb 2023 04:46:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bl11-20020a170906c24b00b0088d0b51f056sm5361176ejb.40.2023.02.06.04.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:46:53 -0800 (PST)
Message-ID: <11baf5db-bc50-8fbc-5725-edd75f319d4b@linaro.org>
Date:   Mon, 6 Feb 2023 14:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
Content-Language: en-GB
To:     neil.armstrong@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
 <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
 <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
 <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 14:36, Neil Armstrong wrote:
> On 06/02/2023 12:20, Dmitry Baryshkov wrote:
>> On 06/02/2023 12:33, Krzysztof Kozlowski wrote:
>>> On 06/02/2023 11:17, Neil Armstrong wrote:
>>>> The SM8450 & SM350 shares the same DT TX IP version, use the
>>>> SM8350 compatible as fallback for SM8450.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 
>>>> 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 0e8d8df686dc..98bae326e655 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -25,6 +25,10 @@ properties:
>>>>         - qcom,sc8280xp-edp
>>>>         - qcom,sdm845-dp
>>>>         - qcom,sm8350-dp
>>>> +      - items:
>>>> +          - enum:
>>>> +            - qcom,sm8450-dp
>>>
>>> Indentation looks wrong here. Testing should fail, did you test it?
>>
>> Moreover it also breaks dt-schema, see 
>> https://github.com/devicetree-org/dt-schema/issues/98
> 
> Yep the change totally broke on rebase, will fix it
> 
> Sorry for the noise.

N/p.

You might want to check the sm8350 GPU patchset. I had to reorder DT nodes.

-- 
With best wishes
Dmitry

