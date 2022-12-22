Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF165413F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 13:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiLVMqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 07:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiLVMqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 07:46:03 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5322E281
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 04:46:02 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id y8so1482885wrl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
        b=KOROV8lX7w89xX5ufKygg/XiKOHbwq+ahSq/EFXdClSz6A6PPIASH93vwSblhvyfvP
         z065xKqyID4B23C5FKRtCNBRT7EZeHKqBaXWbTm25nv5NSIM4YVpd6sapwFwIVxhDl9W
         vgS1DDELxOfO9UFeHBkuF3kXiBeX2Z9lJnUFB7VxxeWgDG2J9dKD9d4mhaDEElya+7OC
         J/Ifu+V/cIVhsVdOkWv9imdoqJp91AmZx3BU1lsgG0BAioTGznMGTy/nSQNLUBVfUTbu
         59/w/iEnZzmu8sYKq1kwC+RZvZABDeTzNELZU1mol/HdAZezfgpti3m/1ZYHUj2Ma+AJ
         OpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
        b=ejsTjvpJ2Zwql+Ai8PcukBtK0ne4CtWJzIi+QTEmMugrmlY6Iu8ezhxCtgUcdnm5rO
         NchZvJiyoK88LDoQKxvOBhPsw0JvrSDSvPZ4CnHkTDcnMeSLyJhywGFcVnT7IGFCNmj9
         nRF0sKg+lOO8btqaxGZ2wZQ4xSwlJDvjYm3qwBzO62SmWolsJyMlyASSGHCPjb6K/jjQ
         gaTbsd7ord5wX6Z67lbXN2/XBDIXBEig2AV1MCgdRMjWUfiiHVTaR9g12AUCywKB/rwD
         oznc8rmY7AxoDZBcyjAojHjvzi1P0i3PeVjGl7iSVQGkKOgD9v6XjfmY5UGjPjhWETlk
         aGVQ==
X-Gm-Message-State: AFqh2kp2NGfFeXvfvrimCJ2FwNs7GDhMLzqQASBup8YcKLp5EVnaFPLl
        qOGoUICOHBYVnpCPUJBftf6bnw==
X-Google-Smtp-Source: AMrXdXv2CMOs1kyvXBletImJqlJC+DtSfV8o0e7xTIWzSkmMqSaL7v/keKysbviY3GcBchUTo4+AIw==
X-Received: by 2002:adf:fd4a:0:b0:242:593e:ee08 with SMTP id h10-20020adffd4a000000b00242593eee08mr3616514wrs.36.1671713160841;
        Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b0026a4bb75477sm456705wrf.28.2022.12.22.04.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Message-ID: <b1f9dd11-b626-26d8-c6bd-7b5af7340dbb@linaro.org>
Date:   Thu, 22 Dec 2022 12:45:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 05/21] dt-bindings: msm: dsi-controller-main: Deprecate
 qcom,dsi-ctrl-6g-qcm2290 in favour of qcom,qcm2290-dsi-ctrl
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-6-bryan.odonoghue@linaro.org>
 <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 11:50, Krzysztof Kozlowski wrote:
> On 20/12/2022 13:36, Bryan O'Donoghue wrote:
>> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format
>> qcom,qcm2290-dsi-ctrl.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../display/msm/dsi-controller-main.yaml      | 36 +++++++++++--------
>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 01afa9e9c4b3c..98d54a7ee28d4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -14,21 +14,27 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - qcom,apq8064-dsi-ctrl
>> -          - qcom,msm8916-dsi-ctrl
>> -          - qcom,msm8953-dsi-ctrl
>> -          - qcom,msm8974-dsi-ctrl
>> -          - qcom,msm8996-dsi-ctrl
>> -          - qcom,msm8998-dsi-ctrl
>> -          - qcom,dsi-ctrl-6g-qcm2290
>> -          - qcom,sc7180-dsi-ctrl
>> -          - qcom,sc7280-dsi-ctrl
>> -          - qcom,sdm660-dsi-ctrl
>> -          - qcom,sdm845-dsi-ctrl
>> -          - qcom,sm8250-dsi-ctrl
>> -      - const: qcom,mdss-dsi-ctrl
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,apq8064-dsi-ctrl
>> +              - qcom,msm8916-dsi-ctrl
>> +              - qcom,msm8953-dsi-ctrl
>> +              - qcom,msm8974-dsi-ctrl
>> +              - qcom,msm8996-dsi-ctrl
>> +              - qcom,msm8998-dsi-ctrl
>> +              - qcom,qcm2290-dsi-ctrl
>> +              - qcom,sc7180-dsi-ctrl
>> +              - qcom,sc7280-dsi-ctrl
>> +              - qcom,sdm660-dsi-ctrl
>> +              - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm8250-dsi-ctrl
>> +          - const: qcom,mdss-dsi-ctrl
>> +      - items:
> 
> I would just squash it with previous. You are adding some code and in
> next patch immediately:
> 1. re-indent it,
> 2. remove it (qcom,dsi-ctrl-6g-qcm2290)
> 
> 
> Best regards,
> Krzysztof
> 

Just to make sure.

I'll squash this patch down in the previous and include your RB.
