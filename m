Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB93359C6EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 20:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbiHVSrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 14:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236077AbiHVSrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 14:47:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63F43335A
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:46:47 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z20so11481987ljq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=rvqBR+MqWw6osirnvKxuZH0TWTk+3bKndNATN0ZQht0=;
        b=VaFBcoYnBgImf8ma6nDsr2IR4PMJFbP6tYtbYCZuEdxP4cGUCFrY/1dVGfMkBve951
         n4P1mfweqp/mn9HAxjpru9xJNguC7QaNmMjn2GTPKasPSqwVnZJEJ54upg/vBglOShiC
         vCIwGfm0kD63TMLOligYX93P/3+bSHajqR9pq/Nz+wtwhBFnP8foGcGSRoWHxMgZOiq9
         fzUVqc0Erq4uK5vuItooiY8X0sax32csi7zdnBJdVUW6lfjHiPa+fwnlg149ZFjjqU9o
         ck/yWJAp+VG15Ktxr0xHj7BVxRdIsN8korYm/rO+cRGnZZF0FTBqa+prEZpHsF3Rx3hQ
         +41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=rvqBR+MqWw6osirnvKxuZH0TWTk+3bKndNATN0ZQht0=;
        b=K8YkyJJ13LHhrLnH7Rh7aTT3Dt3rFMObDo9DuZDfoqYDurRxB792Sa20zKpbYVrUxK
         J3UtOTYBpQ4Nc0G0UHiTlBgKMCCtrHfomEoLGUTAW2fnyJGSjjqDIaI7q4ud1mEokl6t
         RgscZHpR3jIv9duLsxNfy2kqSBz9bBBtmxZCoPwcj8Fa7wFRI2O1V9i+8J31kGQAKj4m
         ul3XC4sMfyOUDVidUoDig6eedN++l8jTmV1voAvJLlb66w+t9fiY89GX+QOTmSln/jJd
         MTp32wflkJRtigE5xPjGwM4I9lfukWeI+1ZIodQA9zipYUCfxSEYh51wA3Y68gJoh9kU
         nFCQ==
X-Gm-Message-State: ACgBeo1woXWlStdLgIO9tw7mgAOVJbbnWWnpbwjlaqzezaIH8n48rXUK
        miST6XVRjK28xePkANX69C4cLg==
X-Google-Smtp-Source: AA6agR4ZNMRCEOaFZ/wplgkfOzH12OuW0OGUwpNx1C8V+ySdF9HCd/NkFeqZesY0VjTgGBO8Jv08Ew==
X-Received: by 2002:a2e:bf0c:0:b0:260:3df:1bce with SMTP id c12-20020a2ebf0c000000b0026003df1bcemr6648253ljr.117.1661194001003;
        Mon, 22 Aug 2022 11:46:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x43-20020a2ea9ab000000b0025d5eb5dde7sm1863077ljq.104.2022.08.22.11.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:46:40 -0700 (PDT)
Message-ID: <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
Date:   Mon, 22 Aug 2022 21:46:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711231638.GA449827-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2022 02:16, Rob Herring wrote:
> On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
>> Document missing definitions for opp-table (DP controller OPPs), aux-bus
>> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 391910d91e43..52cbf00df0ba 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -70,9 +70,21 @@ properties:
>>     operating-points-v2:
>>       maxItems: 1
>>   
>> +  opp-table: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> +  aux-bus:
>> +    $ref: /schemas/display/dp-aux-bus.yaml#
>> +
>> +  data-lanes:
> 
> But this is the wrong location for 'data-lanes'. It belongs in an
> endpoint node.

I rechecked the existing device trees (sc7280-herobrine.dtsi). The 
data-lanes are already inside the main dp controller node. I'll take a 
glance on fixing the driver to check the dp_out endpoint (and update 
existing DT to move the property to the endpoint node), but to make 
schema compatible with the existing device trees we'd probably still 
need this property (which can be marked as deprecated once the proper 
endpoint property is supported). Does that sound plausible?

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      maximum: 3
>> +
>>     "#sound-dai-cells":
>>       const: 0
>>   
>> -- 
>> 2.35.1
>>
>>

-- 
With best wishes
Dmitry

