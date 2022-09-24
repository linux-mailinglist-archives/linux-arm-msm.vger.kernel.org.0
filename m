Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5165D5E8A9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiIXJPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbiIXJPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:15:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A17A205CC
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:15:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so3618347lft.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4mnI565TuxegE5VseMU3JwVMU12fPo+/PxgNA7jWQQQ=;
        b=fMyRTbN35ZzvmScJd/LmTt95QI7QO4AXCRJmwLoR2MnUbAo+wvuY/jefsRbDNIgeyC
         uO6CxSs4aTXOrM2QmYPqIADkDjPCJ/Fy81FBumUHABklu6fjko4uSkMMkUcEA5Po3wFB
         hRwsxy4KB3gvqNdqjT4zHpIz5/1vsoanjrzswvFIz6IpX4XBOAPJ1gfVq8HJ7HnRvcbH
         mu6pTVADJqdRGc7stWW0k7CtFLMUdlkaDeuE6N5N+exhYnWJOrrtrzfS6eplWpTnAWgF
         ieQBuXDTBy8m6tuOVsxuTnFSScI63Vslcjmj+RRx15V/ut38iTT2bWcElgw1gBzZj1HM
         TWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4mnI565TuxegE5VseMU3JwVMU12fPo+/PxgNA7jWQQQ=;
        b=X6ML9JW1SmQ4FiG30uEVlnn/hpNdarsk3yDnttQ9dT11mNDKkKU1VycjVJf2XwcmaK
         XX9RWEu3RFds12AWaCPhumI4EMrmYqUJG2l+7CX2vTJMX4mUWqcj+2PQa1aZO71iiVCX
         S/Op2i2X3pDHOiK7p5LwAzUncS1KwhklarfjNSTyfV4xqknHmxdGuiXYX2INw/c/wei+
         0LJQIkqG0KoL/a68KWqx6nX+MGprvbI2HtxOgUCe7QBV8cvCHNU6gYp2gCpSBCazZ0Gt
         N47kaalJ46Ow5OePa/5FKlnRWegsthZ/sBYP3bCEGK0OwH4uLcKzmcBTc/2WwVpnFHlM
         cRjw==
X-Gm-Message-State: ACrzQf3nRHjQm7XknA6aYLZdcMHE2zs+oDMiwv0hLoHR9lhY1Nm1hfU1
        QsklehRnET4gQi9N78Eak3pofQ==
X-Google-Smtp-Source: AMsMyM5dfRAZ8UKZu8Bcv93uzMEtc9dO1/QxfUGmnIv5IMIYlUi7Y3m35WVUeNL/cv8CTbGBAAO2qg==
X-Received: by 2002:a05:6512:11e9:b0:49d:7909:ff9b with SMTP id p9-20020a05651211e900b0049d7909ff9bmr4570042lfs.568.1664010936884;
        Sat, 24 Sep 2022 02:15:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w5-20020a05651234c500b0049f54c5f2a4sm1829258lfr.229.2022.09.24.02.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:15:36 -0700 (PDT)
Message-ID: <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
Date:   Sat, 24 Sep 2022 12:15:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
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
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
 <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
 <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 12:12, Krzysztof Kozlowski wrote:
> On 24/09/2022 10:51, Dmitry Baryshkov wrote:
>> From: Loic Poulain <loic.poulain@linaro.org>
>>
>> QCM2290 platform uses the 14nm DSI PHY driver.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> [DB: changed compat to follow the agreed scheme]
> 
> Bjorn asked to keep consistency in other case:
> https://lore.kernel.org/all/20220829210408.gxbv6szxfwiiwrbv@builder.lan/

Ack. Should I use qcom,dsi-phy-14nm-2290 or qcom,dsi-phy-14nm-qcm2290?

Note we already have "qcom,sc7280-dsi-phy-10nm".

> 
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index bc3d0b4063c7..088a03ed5f80 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -17,6 +17,7 @@ properties:
>>         - qcom,dsi-phy-14nm
>>         - qcom,dsi-phy-14nm-660
>>         - qcom,dsi-phy-14nm-8953
>> +      - qcom,qcm2290-dsi-phy-14nm
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

