Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FD062F03A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 09:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbiKRI5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 03:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241462AbiKRI5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 03:57:02 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B363263CC9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 00:57:00 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso6080468wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 00:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1kOW8Zv0Np4otaz9P31FD9vjazCm0/Q7hJnXznvk8U=;
        b=G0t14pfZ6HAEJjoZQjg8wIOPAedDJ+YgOr0BU68ZXxHM8ybVXaOd8SbBTcY+wtIPb+
         JFSla7CSJ0icoNmtiPN+sxubusDxlueoHtUzTotsucJdUVF/Stp03TJoQ2+giPdIF098
         I0QMLp2N/s/bnMWMu3WtQ91YGHcdq26coHdL69loeWf0H+nCYJi6+DjJfMRPdh+iPVxv
         D6UwgcMBz+XmOnitK+rVeWG8t3JZWf08qBjUb7N4+k/I4VWGggaBgpqLKPbuz4tP/asX
         Tsb36Now+A+t5VljTLdCBqON2DsySMKmqOf2EjTgF9rEMLdsF8eZMeX5/GgO2AB3ihuK
         umzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1kOW8Zv0Np4otaz9P31FD9vjazCm0/Q7hJnXznvk8U=;
        b=0wj7xSUfQK3oLuKNbzPDAshsLMOJNK6dsv4BfjNfuoBaERSCbYNQ7hicDfGo+zkj13
         td1o2GOZctHKw6CI9pBL1Ks0VIkdZT/0PXVlZ1W3/pILrEhZ9ppka62MHhKNcKvFkdnv
         I5wT+jcjYmGzvx36jnnD19bE7cvGyXcRm40Fn4vGPK+HnBKEG5bZyZTQjgIXkomt6/3q
         NsQ7OA0GxocMjjfepcL36wdA9o3/03YnWwB4v3ThNjY84GaFzaQ8Qy+vNNHiNT0sij2M
         J3cJ/hlEA41cDwfx5ncYYbBUipBv/LYQ2k+0abNLRIjORn88tgm7dnAnZPfiC1teCPzA
         eACA==
X-Gm-Message-State: ANoB5pmNWU8zus+RR3adrE7WVETia9sY13GGR/ODZ59azinP2TCmWUiO
        y0yf79lsrVNsaP0F2jgXYgvXMw==
X-Google-Smtp-Source: AA0mqf7aU3sYbBqKcTbkgAjuGCOJkCx5lVhg5h8ag0Pb++K/j5PtquzcyBt2t1XqTMWFzmQyiBzkRQ==
X-Received: by 2002:a05:600c:4a9a:b0:3c6:d811:6cff with SMTP id b26-20020a05600c4a9a00b003c6d8116cffmr7923234wmp.43.1668761819090;
        Fri, 18 Nov 2022 00:56:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f7cc:460c:56ae:45a? ([2a01:e0a:982:cbb0:f7cc:460c:56ae:45a])
        by smtp.gmail.com with ESMTPSA id z5-20020a056000110500b0022cc3e67fc5sm2994295wrw.65.2022.11.18.00.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:56:58 -0800 (PST)
Message-ID: <2c1f2d88-99ed-c0a2-02f9-02b4bc4429ea@linaro.org>
Date:   Fri, 18 Nov 2022 09:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: qcom,spmi-pmic: document pm8550,
 pm8550b, pm8550ve, pm8550vs, pmk8550, pm8010 & pmr735d
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v2-1-b839bf2d558a@linaro.org>
 <f20a8dff-fb51-4000-dbb6-29cb8b0d223d@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <f20a8dff-fb51-4000-dbb6-29cb8b0d223d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/11/2022 09:52, Konrad Dybcio wrote:
> 
> 
> On 18/11/2022 09:24, Neil Armstrong wrote:
>> Document compatible for the pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550.
>> pm8010 & pmr735d SPMI PMICs
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Didn't checkpatch complain about the length of this patch's subject?

No, not even with --strict

> I propose:
> 
> dt-bindings: mfd: qcom,spmi-pmic: document SM8550 PMICs
> 
> or
> 
> dt-bindings: mfd: qcom,spmi-pmic: document PMICs bundled with SM8550

I'll change to of these if I need to resend,

Thanks,
Neil

> 
> 
> Konrad
>>   Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index c8362efd4345..8c9b042b4f30 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -43,6 +43,7 @@ properties:
>>             - qcom,pm8004
>>             - qcom,pm8005
>>             - qcom,pm8009
>> +          - qcom,pm8010
>>             - qcom,pm8019
>>             - qcom,pm8028
>>             - qcom,pm8110
>> @@ -54,6 +55,10 @@ properties:
>>             - qcom,pm8350
>>             - qcom,pm8350b
>>             - qcom,pm8350c
>> +          - qcom,pm8550
>> +          - qcom,pm8550b
>> +          - qcom,pm8550ve
>> +          - qcom,pm8550vs
>>             - qcom,pm8841
>>             - qcom,pm8909
>>             - qcom,pm8916
>> @@ -70,10 +75,12 @@ properties:
>>             - qcom,pmi8998
>>             - qcom,pmk8002
>>             - qcom,pmk8350
>> +          - qcom,pmk8550
>>             - qcom,pmm8155au
>>             - qcom,pmp8074
>>             - qcom,pmr735a
>>             - qcom,pmr735b
>> +          - qcom,pmr735d
>>             - qcom,pms405
>>             - qcom,pmx55
>>             - qcom,pmx65
>>

