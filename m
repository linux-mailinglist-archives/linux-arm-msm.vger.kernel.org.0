Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1596D6B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbjDDSSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 14:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235855AbjDDSSN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 14:18:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01DE40EC
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 11:18:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i5so134405564eda.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680632290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8YBxidmyDjL43kqs3HcIAsaJ4PKAEaZFGmGkOZQXg=;
        b=RQDpIhiUlw2Y9lmNTIPdcM7xe4l9Dps6+qTrp/9ViFNP8QnQo2FijSxlG1hENEX5Xs
         acL5CSJjeXPn67PV37G3MBVbxTIgf8Gs8cz1jlbMgNLLeGDfR5BoWHDcVMtsGXlL2ERx
         C71+sOz9RqE7YXUfDZ8VoHFQa5IcV8YsxlHbQ0Y+sdLCoDGKebETZl1gWiwllaF77z3J
         k05+fAr7959COxq5K20OpDlOI1/vR/cnxqxO3TQldUiAhSwwUQIAdXRTp3XgGgKaB8Bb
         hZejIAMAFjAXZ2ZtdYNMyjLxHG7xJoghF+50qfAvawxz5xvZ5Q1W+jKCyoGlav35iOjD
         bUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8YBxidmyDjL43kqs3HcIAsaJ4PKAEaZFGmGkOZQXg=;
        b=HgkQ92lPMVhpf9TAS3cWOpkhUEzPYODSne4/DpySdqMFtdAD2ahql1BZStQwtAJCdh
         ku6wK10qt5NKhQrpzaL/eaj00JNp3LkMQC29jWbN2c6C47rYYAhfhyavKTzxWAkQIdFz
         7QJ9rYsdcP+edi/+oiGY1hxRojgKQgisNT7x2esYtEBzonrajMSGhO5FdjfEhPNewP4P
         hTzyRhqclUkz0sVTACNbkmYEVOM5vETUpvECwog+rxZ3D90TJ+lma3a5LyestyzUMiQz
         Gq+WLz7/qOrZAWTRoR1ilzXKqTJNqgG8rKKoDb0tQ9BN31w8bxCsJ0rBOp8GRByvbkYp
         JPtw==
X-Gm-Message-State: AAQBX9cYwRvG4T2KetajkJL7KoBxW1hp4axcs++lTsl0Lpr0L9XvnXm9
        N3ey6iZxXCJVr0VdlhWlneCBmQ==
X-Google-Smtp-Source: AKy350bkUvS0cmR9W0/1DcwvNmjXy5ym8hk9TIiBhGi2hxcvCv/oMpUcbFc1uyOzsvXDN8o+6zOVQg==
X-Received: by 2002:aa7:cb47:0:b0:4fc:c7c8:e78d with SMTP id w7-20020aa7cb47000000b004fcc7c8e78dmr333454edt.31.1680632290425;
        Tue, 04 Apr 2023 11:18:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7467:56f4:40b7:cba8? ([2a02:810d:15c0:828:7467:56f4:40b7:cba8])
        by smtp.gmail.com with ESMTPSA id o1-20020a50c281000000b00502b0b0d75csm2190606edf.46.2023.04.04.11.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 11:18:10 -0700 (PDT)
Message-ID: <76a524a8-f87a-0147-32cd-5ef6cc55d2bc@linaro.org>
Date:   Tue, 4 Apr 2023 20:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Patrick Lai <quic_plai@quicinc.com>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <20230404142159.GA3827653-robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404142159.GA3827653-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/04/2023 16:21, Rob Herring wrote:
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index c283c594fb5c..883b8be9be1b 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -86,7 +86,7 @@ properties:
>>    qcom,ports-sinterval-low:
>>      $ref: /schemas/types.yaml#/definitions/uint8-array
>>      description:
>> -      Sample interval low of each data port.
>> +      Sample interval (only lowest byte) of each data port.
>>        Out ports followed by In ports. Used for Sample Interval calculation.
>>        Value of 0xff indicates that this option is not implemented
>>        or applicable for the respective data port.
>> @@ -94,6 +94,19 @@ properties:
>>      minItems: 3
>>      maxItems: 16
>>  
>> +  qcom,ports-sinterval:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      Sample interval of each data port.
>> +      Out ports followed by In ports. Used for Sample Interval calculation.
>> +      Value of 0xffff indicates that this option is not implemented
>> +      or applicable for the respective data port.
>> +      More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +    minItems: 3
>> +    maxItems: 16
>> +    items:
>> +      maximum: 0xffff
> 
> Why not use uint16-array?

Because I am afraid it will grow in next version to 24 or 32 bits. I can
change easily maximum, but if I put here uint16-array, all DTS will have
/bytes 16/ annotation.


Best regards,
Krzysztof

