Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7297569AA8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 12:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjBQLgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 06:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjBQLgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 06:36:51 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC6B66673
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:36:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id t4so404207lfr.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZ1ZgDuA3P/7xbAGGx5EOYOqmYAV/laB2blIXJcdyKQ=;
        b=TW3uATxonKY5J86lyjHy1JXMRi3EzdAokUzTtBT1nLQ6eXuk8Dz7+jdhRTghChHQVj
         3ujR8QtM7gz6Fy5LfYHUBomsJkAl4JGe9I1ovRFX522GIidHZfvzoUqmNjov8AGPrAqK
         ujFT8T4+pOuSCYr18aps0rY6sbM/4+JXUb7OZ/cpwPXCBWdXz6meDEoqGoQ1TUy8usdM
         ZoMvqRO66qQkybYIAnkbLWAnQ0pbJp2WCec1LEJxdJcGFYb0BFnqo7lRcjb5vDl3OMLj
         JqYpryFCZInO4iDA1i8t+DQ79Pc59HXVO+FWe5jDPK7IDqOa/2K9iyz0FJCwQ/GlhShV
         DO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ1ZgDuA3P/7xbAGGx5EOYOqmYAV/laB2blIXJcdyKQ=;
        b=cprGpzhoBSUGBrHl9MpsgrTbwwQkhox4iNxLt/BcHpszWV3G5eOANnaQSY0EoTuoHx
         VoAVhLVEVFHeR7LolXlPjgGdBQaqbr4+4CVDrJXLiQKYId1rhSnppQkHHk+/U+MWyGIG
         mgt33DqEuj6g/eJtzVD6UdX068oQJ+EMDzmvrXJ9DfwCXqgzO7bwnnEnfFVNnlRHOuKe
         C+Xvipb2bWDmyFLKVogQhqkyKy0nQ0jbmVbW7UxAFXhfVPeEqlUJ4jOuEbyZvTa/XCaS
         NpkHBYGSOHFbUNNmfnL7IvEv0EmllLMVlH1QW46FDKT6vS9+zjOpsxhnqC5iipQdI0I5
         HjGA==
X-Gm-Message-State: AO0yUKWFwRNu+w2vOfQ4tpM9m48G/dzCsUgZrvjdpTx5KjZgTP4Tv8bY
        clXZit7rLetG6flO++abHWOyBQ==
X-Google-Smtp-Source: AK7set9JXpy1zNlhq7Kt+wDBf9jBmCKvkt/1DfrrqWm6Gm3fV/rslVunYO58LlW1TvHtcyCA+CmnWg==
X-Received: by 2002:a19:f513:0:b0:4a4:68b7:e71c with SMTP id j19-20020a19f513000000b004a468b7e71cmr367256lfb.6.1676633807219;
        Fri, 17 Feb 2023 03:36:47 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2550b000000b004dbebb3a6fasm653907lfk.175.2023.02.17.03.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 03:36:46 -0800 (PST)
Message-ID: <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
Date:   Fri, 17 Feb 2023 12:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 12:35, Krzysztof Kozlowski wrote:
> On 17/02/2023 12:32, Konrad Dybcio wrote:
>>
>>
>> On 17.02.2023 12:30, Krzysztof Kozlowski wrote:
>>> On 17/02/2023 12:13, Konrad Dybcio wrote:
>>>> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
>>>> without the generic fallback. Fix the deprecated binding to reflect
>>>> that.
>>>>
>>>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>> Depends on (and should have been a part of):
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
>>>>
>>>> v1 -> v2:
>>>> New patch
>>>>
>>>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>> index 41cdb631d305..ee19d780dea8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>> @@ -37,7 +37,6 @@ properties:
>>>>        - items:
>>>
>>> If this way stays, drop the items as it is just an enum.
>>>
>>>>            - enum:
>>>>                - qcom,dsi-ctrl-6g-qcm2290
>>>> -          - const: qcom,mdss-dsi-ctrl
>>>
>>> Wasn't then intention to deprecate both - qcm2290 and mdss - when used
>>> alone?
>> "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"
>>
>> was never used. The only upstream usage of the 2290 compat
>> is in sm6115.dtsi:
>>
>> compatible = "qcom,dsi-ctrl-6g-qcm2290";
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221
> 
> I meant, that original commit wanted to deprecate:
> compatible="qcom,dsi-ctrl-6g-qcm2290";
> compatible="qcom,mdss-dsi-ctrl";
> 
Okay, so what would be the correct resolution?
Drop this patch and keep 2/2?

Konrad
> Best regards,
> Krzysztof
> 
