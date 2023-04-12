Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D299D6DFB0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 18:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjDLQQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 12:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjDLQQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 12:16:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E212F7A98
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 09:16:03 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id j17so20573111ejs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681316162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKz2CfdmkyWEUAUCRBGTeQXDG/9nQXron/CwZa9Nm00=;
        b=g7jiaNa/w7rvSAY10RFzRhPYx6wX3SzW9Ltp47xv27yKDwNXQ8wwQshMGu1UwZBDnP
         nIoBoAzWw9eAyBnL5DQdKWgKntxvoQIFaEWI3xGsCqDukrJo9+ybXsuRl1On4LJbWSUJ
         Md8iI+45YnPbziICs08oDOd+jDcFsHhc6Vc+ESQUqAnauTaXLTnS5oab5edjyN4Kir+j
         1d71UXvEFipu+X9znuLgywbDpYEeANh+IyLOrDyESFwQ3IJnAP73JNvFiqdkvfmdtP0k
         tpgP+Ln/0OJW0PPvCjTmfjy8HcmYk/A44noUGcPZnR1PoP/iAyo8OdZgXB9zJmK3kzTz
         6jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681316162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKz2CfdmkyWEUAUCRBGTeQXDG/9nQXron/CwZa9Nm00=;
        b=NJDm15fzZVygDIq7+YEQf1nGDI7WTkpoWpqbQPHWL9FHMViQNuLZ5iD9nvdLokCjlS
         JO+Eb5MBVM3brDf5Erf6oBmCvA/2eIWdJwQ49XGhKciTQ5KBgFAFM83wkB4oGjMWy9cF
         YrCU3pkvYGqzt1oDZJYkPEJYg4uwIT5k3QKNqvlO1qNLlpvM7YYcM4EBKPaiWDID5tJ0
         MnKI+GhwJCbRXVUnL1cBKUdcrqQVoD8r1RAaIR+N5PSR7AZXQ1pS6uz9fYBF5fW54bYy
         BniwIuoEIN1bda+4EAMkXD7USe2H0PG29iD5Y1WbNIM1jf6FqTVodA0CcOUCRkT0NGFa
         yGhQ==
X-Gm-Message-State: AAQBX9d9i4Kg9Y554z2JqtHdZZ083g65KF9OgQubVPmmztr8YZxllhLK
        a9zlUrW1tRl3CKj4NAUZlO6gQQ==
X-Google-Smtp-Source: AKy350Yl7iVyPSmeKdJ9g9LAu8gPmo81pX9ruC7lLLt8C82rDZNRUAlOPGbHNe3gHcL/ST8gYVF1ew==
X-Received: by 2002:a17:906:3b8f:b0:94a:6fc2:75b7 with SMTP id u15-20020a1709063b8f00b0094a6fc275b7mr10639381ejf.33.1681316162374;
        Wed, 12 Apr 2023 09:16:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:938a:b3db:7c59:795e? ([2a02:810d:15c0:828:938a:b3db:7c59:795e])
        by smtp.gmail.com with ESMTPSA id sa3-20020a1709076d0300b0094e4b8816e0sm1153036ejc.217.2023.04.12.09.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 09:16:01 -0700 (PDT)
Message-ID: <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
Date:   Wed, 12 Apr 2023 18:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2023 17:28, Srinivas Kandagatla wrote:
> 
> 
> On 03/04/2023 14:24, Krzysztof Kozlowski wrote:
>> The port sample interval was always 16-bit, split into low and high
>> bytes.  This split was unnecessary, although harmless for older devices
>> because all of them used only lower byte (so values < 0xff).  With
>> support for Soundwire controller on Qualcomm SM8550 and its devices,
>> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
>> to allow 16-bit sample intervals.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index c283c594fb5c..883b8be9be1b 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -86,7 +86,7 @@ properties:
>>     qcom,ports-sinterval-low:
>>       $ref: /schemas/types.yaml#/definitions/uint8-array
>>       description:
>> -      Sample interval low of each data port.
>> +      Sample interval (only lowest byte) of each data port.
>>         Out ports followed by In ports. Used for Sample Interval calculation.
>>         Value of 0xff indicates that this option is not implemented
>>         or applicable for the respective data port.
>> @@ -94,6 +94,19 @@ properties:
>>       minItems: 3
>>       maxItems: 16
>>   
>> +  qcom,ports-sinterval:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?

Same answer as for Rob:

Because I am afraid it will grow in next version to 24 or 32 bits. I can
change easily maximum, but if I put here uint16-array, all DTS will have
/bytes 16/ annotation.

Best regards,
Krzysztof

