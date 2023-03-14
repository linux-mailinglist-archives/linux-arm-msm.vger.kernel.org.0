Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35006B9076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 11:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCNKpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjCNKpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 06:45:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C89017143
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:45:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x17so3259469lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678790711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ShxiHC0Rhg1UPin7KQtsZbyHHx1N7ivCqUU6bNrksTs=;
        b=Jkqeao4FAapprb9b8Jx4gpZzOfC9C3LrN4mW6W69carg034590yXJoJK16BepmeL46
         AJvHBM1DJ9dwsVNE/2achVtlwZV/i1llD8cbScSqS7pU/4ilD/UFodBdCvkyXFClidGR
         Q/Xsd3dTYULVzyvQYcOw88Z1Q1V/aebiGjfgd9bf5tDXEryZUzjE6YzELSXOKb1ZfHRZ
         gpoVas/GZvZPv7KBx5ya/+rdeB2KRO/bYc0RjyChNxlv6Xx0NBybrz4dakHexisknrMU
         luTtwwZxyVCbFG0Bxk6NjIGKM23PRFWHPAft4kz0OkLVsSPiaXy57rir/6K9VaWMFHNZ
         LAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678790711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShxiHC0Rhg1UPin7KQtsZbyHHx1N7ivCqUU6bNrksTs=;
        b=ckX6Dy/PouI9IBTZJi48Q20+xhWpguo+eiaNBV654MZN1Ouf+Eh2ucUfaa4FP1M68y
         pzLddSo0nZu7aWs9A/GJCIy/Oq2HKXIeqjomdWJ/sOOGyoB80UnjoTaUFMIinJI9WjAa
         cb/WGMVgl6tKliDYuI6j0S1SsbTx73MSzxw/4VQBApWiQn95w1z9wsQkHNm+6RKhKJo5
         W8LWeAJEzyjFbph4AnVP8wKtGy9+OfqA+ZdaJPZcMDeXvRGYBcW0EEB9PlI/7sPNtzcN
         s/lyOKpzixuUhEz+R9uMLcVetCF2zKGsagoM+1pnpQmI24LOshtchhkm+D0FUglRyFyo
         jQwg==
X-Gm-Message-State: AO0yUKUg0RYQjcF+HeSOu+dHe01hnvF0v87d/SwjXostj5CO6vXxr+OZ
        8nhyTUNDVIF4hjkeWOcNPM89lA==
X-Google-Smtp-Source: AK7set8v4npFYo9eTHAmk8y6U1yWqLP1Y79WNkD45A4aiBzidm2Tl4qoX9bIz+Xpvn/GFeX17rl+Ew==
X-Received: by 2002:a05:6512:3743:b0:4dd:afad:8afe with SMTP id a3-20020a056512374300b004ddafad8afemr710968lfs.27.1678790711545;
        Tue, 14 Mar 2023 03:45:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i8-20020ac25d28000000b004cf07a0051csm347916lfb.228.2023.03.14.03.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:45:10 -0700 (PDT)
Message-ID: <91df0342-428e-562c-56dc-172588ad6954@linaro.org>
Date:   Tue, 14 Mar 2023 11:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-9-8bd7e1add38a@linaro.org>
 <167830146346.3587111.3542934829511061872.robh@kernel.org>
 <20230314001829.dzkxkqgrrbfiu2lq@SoMainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314001829.dzkxkqgrrbfiu2lq@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.03.2023 01:18, Marijn Suijten wrote:
> On 2023-03-08 12:51:03, Rob Herring wrote:
>>
>> On Tue, 07 Mar 2023 14:01:47 +0100, Konrad Dybcio wrote:
>>> Add a compatible for the DSI on SM6115.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 2 ++
>>>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Shouldn't the examples in qcom,sm6115-mdss.yaml be updated below to
> reflect the binding changes?
Yes it should, willfix

Konrad
