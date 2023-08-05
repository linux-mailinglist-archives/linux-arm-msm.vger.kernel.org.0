Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A84D771250
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 23:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjHEVVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 17:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjHEVV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 17:21:29 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30769134
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 14:21:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31751d7d96eso2553356f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691270484; x=1691875284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5OV4A0TE5pSUE8JdsBkgIy9vd1kBceO43pYJb+lKBY=;
        b=FosvnB/7ZkxfYGRk/vYdq7jFTkOkfQOYzREjAtfRniifOq/ULeByTcWPcNwkN0Mbmw
         jVp9jYq0PaU3u8gG/mfEuSGaoFH8uLgiXUCDqmBVjjRt+Vi9hM1QE5kZ074Bqup2FZZk
         OrOnFkSNoQThHepiL8sOLryNFQ7qF1yYgrkHeRXF0yXKesfAyL83AfzWc4n+TNcWY33C
         WeOVXsAgMlwwXz3y9fstzlcJNfIyZlm71NCqBSQT1h0F/xQhriN77/qRtKRKI2J2XeNR
         hFHj3mA9y4EUE+fShijdg8Ntxi5K4wWrjK2zex5O9xVvMlS5nI2QnhxU4U+2eOCuMmLA
         DrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691270484; x=1691875284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5OV4A0TE5pSUE8JdsBkgIy9vd1kBceO43pYJb+lKBY=;
        b=GnNiYOl7IIRqXmdt0eLDifj9fnd0d8dAVf7bi0AJZZHdfTnwoIKfk4oskQ3GGKzA4N
         XPDtOrwmhuVec1lpVBq/HcJqco33viggXK9z3F1zAUKGFSk1woLvy+KNnykuh2tIZUj/
         JKXB8/Kkw39TqVno2j0BDs4qsGStrabKiuYu4vLzbjiwTJWhXIuz9uf1Fx0BanJg2EgT
         c87ZJqJdhbgAxm7Uk4P3S5ZCNt9T+Qq09MpM44NthroXZEGK+1jyQZfEhlaxDs4Dn/iR
         57LvPwbfEo/nT1aTfIWrdKtoYGaQyU0OoDA8J8jotV3TNL4A2RDvVo5MNL1WpNd0Afqb
         i3Xw==
X-Gm-Message-State: AOJu0Yx0007A0C/UqUYuHvuFpRx8HVevMhDOYqmSwPspJBoDWFrtw595
        4pIGmXtKexvYEhmhJF10JAUmlw==
X-Google-Smtp-Source: AGHT+IGEX+lWU7YpFJLDiDTlbjFw7Vuah6n3IfZzSqIWBu3WRt6vlyJaUmhCzE06T2xfFRERL9QCiQ==
X-Received: by 2002:adf:ff87:0:b0:30f:cf93:4bb8 with SMTP id j7-20020adfff87000000b0030fcf934bb8mr3039582wrr.57.1691270484066;
        Sat, 05 Aug 2023 14:21:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0031417fd473csm6009607wrw.78.2023.08.05.14.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 14:21:23 -0700 (PDT)
Message-ID: <f393324f-c9ec-1572-fb15-1856cef9d846@linaro.org>
Date:   Sat, 5 Aug 2023 23:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 02/53] dt-bindings: interconnect: qcom,bcm-voter: Add
 qcom,bcm-voter-idx
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
 <20230708-topic-rpmh_icc_rsc-v1-2-b223bd2ac8dd@linaro.org>
 <68fb8e22-dd23-d4bf-eda0-444039fd8e26@linaro.org>
 <9201cb8d-845a-b5dc-02a5-9633572b5877@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9201cb8d-845a-b5dc-02a5-9633572b5877@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/07/2023 17:09, Konrad Dybcio wrote:
> On 12.07.2023 22:43, Krzysztof Kozlowski wrote:
>> On 11/07/2023 14:18, Konrad Dybcio wrote:
>>> In order to (at least partially) untangle the global BCM voter lookup
>>> (as again, they are shared throughout the entire system and not bound to
>>> individual buses/providers), introduce a new required property to assign
>>> a unique identifier to each BCM voter.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/interconnect/qcom,bcm-voter.yaml       | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
>>> index eec987640b37..09321c1918bf 100644
>>> --- a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
>>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
>>> @@ -38,8 +38,14 @@ properties:
>>>  
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>  
>>> +  qcom,bcm-voter-idx:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description:
>>> +      A globally unique predefined discrimnator, identifying each BCM voter.
>>
>> s/each/this/ ?
> Right, this makes more sense
> 
>> If I understand correctly, there might be more than one instance. The
>> problem is that I cannot find such case in upstream sources.
> I don't think there can be more than one per RSC.
> 
> SM8550 splits some RSCs into "channels" and these channels have their
> individual voters, however they would still be attached to these
> channel subnodes/subdevices and no, we don't support that yet.

Then shouldn't this be one number, not an array?

> 
>>
>>
>>> +
>>>  required:
>>>    - compatible
>>> +  - qcom,bcm-voter-idx
>>
>> This should not be really required, because it affects the ABI.
> Hm.. can I deprecate lack of it somehow?

In general: no. Anyway, it depends how much you need it. Breaking ABI
might be justified, but I just did not get such need from the commit
msg. Your commit msg looks to me closer to a cleanup.

Best regards,
Krzysztof

