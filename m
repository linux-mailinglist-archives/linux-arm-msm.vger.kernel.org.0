Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E991065CFCB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 10:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbjADJiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 04:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239083AbjADJiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 04:38:05 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166B71A3A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 01:38:00 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu8so566037lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LStRUu9LwhR/TLTpxI+ph/EG2JmByBMx76WWbcsIEGQ=;
        b=n1EKwCfP30SS7eMuLGG5SZWDkdxiFLj4uBKPHOJMBY/IRxyxNzc6vTJT05hyYTLHiz
         RD+YYw5zt5wuKnPh8Wso6oavgDC/Izy9JHdlTaotQGIUDxxOzn6HQbJ6VKCaYrxT0IbT
         rbdtdh8s6Zq8gaHPDCcb1rMOLluqMMePsJy5jFLrtSiFtf1GIcZgTph03anmF+5lX4tD
         jvWb+D58ATK9y+bOcDUcSFM4hReWn6+Lqw/XiLYW3ZWHGuSQwvAXieilpqrLnzYEQ/dB
         nZu8yb4PNqWNRaNv3mVfyxu68xoLhMcWPTK0bKn6k0cGur0pKOLTriytieWMdV1QJbiA
         jAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LStRUu9LwhR/TLTpxI+ph/EG2JmByBMx76WWbcsIEGQ=;
        b=EIO7J+7jH0oBBRsaR80pzBaRcMuvBL5vSDRuR2KCIB80vnpnGUN9jH3prdTN+BmmqR
         EJl5IV0dGmygNWuPVU3spCLDpwrGAe2PvKOZn/nEnZvz9vNK6S1KJ5duJwyBxO+aVX+g
         HLOBriQso+jiZm3+3CBuZ3Qx4BOQXTRD59iG/psJALka6ZfSaBxbyt9n0Sr2NyneNyMh
         jTU+bVh92UlrkpIRxGKhtYrQkwSbjE8qbbQjNrL6YyWCDBfTQCz1KfLtfsoSVAxD8b+Q
         5V58incknvKRoont/dH/xhWax12oJ8XbHQb7fn8lEWKpAoewfkCDXOTTr/JyChsV876V
         NRig==
X-Gm-Message-State: AFqh2kpJg7QebdLokljimRWRNJlvqoiunz5c9md7mQbhkaWh1QyA3Ijx
        QOiOOkK2kPKuJoVZ7xwBm85bxQ==
X-Google-Smtp-Source: AMrXdXt5+ZnAW0pVabAyBzRs7eYzNqgxPSx9qoK3UOe6tmlJo0GsVQUuCGGk/1nlGNDSgAf06ZIYbw==
X-Received: by 2002:ac2:5503:0:b0:4b5:9845:c8a9 with SMTP id j3-20020ac25503000000b004b59845c8a9mr12497800lfk.47.1672825078391;
        Wed, 04 Jan 2023 01:37:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bu20-20020a056512169400b004cb02ed464esm3991641lfb.196.2023.01.04.01.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 01:37:57 -0800 (PST)
Message-ID: <8a68bb5c-6006-c852-227d-d68751258a61@linaro.org>
Date:   Wed, 4 Jan 2023 11:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 07/18] dt-bindings: display/msm: Add list of
 mdss-dsi-ctrl compats
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
 <20221223021025.1646636-8-bryan.odonoghue@linaro.org>
 <20230104002905.GA134092-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104002905.GA134092-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2023 02:29, Rob Herring wrote:
> On Fri, Dec 23, 2022 at 02:10:14AM +0000, Bryan O'Donoghue wrote:
>> Add the list of current compats absent the deprecated qcm2290 to the list
>> of dsi compats listed here.
>>
>> Several MDSS yaml files exist which document the dsi sub-node.
>> For each existing SoC MDSS yaml, provide the right dsi compat string.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
>>   .../bindings/display/msm/qcom,msm8998-mdss.yaml  |  8 +++++---
>>   .../bindings/display/msm/qcom,sc7180-mdss.yaml   |  6 ++++--
>>   .../bindings/display/msm/qcom,sc7280-mdss.yaml   |  6 ++++--
>>   .../bindings/display/msm/qcom,sdm845-mdss.yaml   |  8 +++++---
>>   .../bindings/display/msm/qcom,sm8250-mdss.yaml   |  8 +++++---
>>   6 files changed, 38 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> index ba0460268731b..86bb43489bf4a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> @@ -94,7 +94,21 @@ patternProperties:
>>       type: object
>>       properties:
>>         compatible:
>> -        const: qcom,mdss-dsi-ctrl
>> +        items:
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
> 
> No need to have an exact match here. Just this is enough:
> 
> compatible:
>    contains:
>      const: qcom,mdss-dsi-ctrl
> 
> Then the DSI schema will check the rest.

I think the intent here should have been to list DSI variants usable 
with the qcom,mdss device. But then the list should be shortened a bit. 
E.g. apq8064 is pre-MDSS  and sc7180/7280 and sm8250 are used with 
qcom,SoC-mdss devices rather than just qcom,mdss.

> Same for the rest.
> 
> Rob

-- 
With best wishes
Dmitry

