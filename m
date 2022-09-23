Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2531B5E842D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 22:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbiIWUi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 16:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbiIWUh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 16:37:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E9C86FC5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 13:32:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w8so1957263lft.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 13:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nBM+qi7ZEJ79MaRiQNuFb4KCQxuABqaRCCx+mb2oxBg=;
        b=o3OHHM/T+yReW4NfXa27nKO8K+4nryGOnb1wE+L9S/UfvloEESITwMAB1wcImMrHR2
         I7UswL4qx/NwsvUNcVKNFu8Gjv9iLlBMjlyahuHAty143DTuh2GHlMR7LYWusM4zZDeX
         gf8oqH68bp/44bZhX5aBiMU78uyltyU0U49t8zj7sbidsN5COcIdH0+NJfFH/nffMsmd
         kJFc1FapVDm5MIh5e9j1ebQblIXWvxSranbYEp6z9ES/TJR8IeHTtU1QBlsTvsSKyfgw
         d+FiHLZEFI59C+9cXso+ojwzhoV8Wti0G1bbjGJPkkL20w/N70pQsVp1SkkxoMc8nChO
         PKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nBM+qi7ZEJ79MaRiQNuFb4KCQxuABqaRCCx+mb2oxBg=;
        b=j0E9zU1FRogKSb5c6nLAuDll3l7kCqQOnBC9Dd9b9tXp/U4SFoN2lAQz7htzg+MuX8
         Mi/NZv0+fkPPBTjVWhTPSXzO2DgkCMOjzKUmO7E/bqys5MTBRHYHFEOMdv42nsS9CVVL
         GVxXYTX3z6eua+Vv486IKjkYacGS//N4Q16LXhwZurGCu6Ca/RpL02zkpgvGzv+pbzIk
         9jFO/GkcmOlS+yo/Ulv6CEI9cSrqIka6tZfoqdHsEd0CUiDz1ftNePfN/ZHna+bXh+Jl
         uP5pWJ5k3FcwH4W2gQaT5zjqTDYObkksNBefQMdZgCH+AgsHqJJ7KjGg1w3UnmCeF872
         /0aw==
X-Gm-Message-State: ACrzQf1eE0qGiIWfmniZ+e1bepOoSU6T96u2vUpp9DcrMhJyj5NUdKd9
        Zxi0GQzeC21lyybqaBqTsrHHxw==
X-Google-Smtp-Source: AMsMyM7YTtVO77quMiW6KFmjaY2ziWHoZFQBBzaOp2QWJF5Pd4KQtydKOHQr1S++G+N5wTYhKpJHig==
X-Received: by 2002:ac2:5623:0:b0:49a:d7b9:c06d with SMTP id b3-20020ac25623000000b0049ad7b9c06dmr4251708lff.511.1663965172046;
        Fri, 23 Sep 2022 13:32:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e5c02000000b0025e4c49969fsm1520756ljb.98.2022.09.23.13.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 13:32:51 -0700 (PDT)
Message-ID: <aeae567c-ccf7-de73-61eb-1f04772d3bba@linaro.org>
Date:   Fri, 23 Sep 2022 23:32:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
 <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
 <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 15:28, Krzysztof Kozlowski wrote:
> On 22/09/2022 13:46, Dmitry Baryshkov wrote:
>>>> -  ranges: true
>>>> +    maxItems: 2
>>>>    
>>>>      interconnects:
>>>> -    items:
>>>> -      - description: Interconnect path from mdp0 port to the data bus
>>>> -      - description: Interconnect path from mdp1 port to the data bus
>>>> +    maxItems: 2
>>>
>>> I think this is not equivalent now, because you have in total minItems:1
>>> and maxItems:2, while in past minItems was 2.
>>
>> This means that I should have minItems:2, maxItems:2, which, if I got it
>> right, is frowned upon. Let me doublecheck though if it works as expected.
> 
> It is frowned upon only if it is alone, because for missing minItems,
> maxItems implies minItems. Here you have minItems in other schema, so
> there is no such case

Well, I just checked, the schema will throw an error if I put a single 
interconnects or iommus entry. If I understand correctly these two 
clauses are evaluated separately. So, the dpu-common's clause tells 
minItems:1, maxItems:2. The platform schema file contains just 
maxItems:2, which implicitly adds minItems:2 to _this_ clause.

Thus I think I'll leave this part as is.

For the reference (with single-entry iommus and interconnects properties):

/home/lumag/Projects/Qcomm/build-64/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dtb: 
display-subsystem@ae00000: iommus: [[4294967295, 2176, 8]] is too short
	From schema: 
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
/home/lumag/Projects/Qcomm/build-64/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dtb: 
display-subsystem@ae00000: interconnects: [[4294967295, 1, 0, 
4294967295, 1, 0]] is too short
	From schema: 
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml


-- 
With best wishes
Dmitry

