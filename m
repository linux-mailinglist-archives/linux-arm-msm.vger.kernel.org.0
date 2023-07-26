Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEA0762D2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 09:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbjGZHYO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 03:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjGZHXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 03:23:24 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0D54201
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:21:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so2432511a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690356104; x=1690960904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrTqErO65WLHrYUraJkdfgcweJjKzl2A3sDrYCY0pMs=;
        b=GDBBvZGm09WoDOPISnjfiJwbT+bPfauPoIxRMeiuCUlS0CKzY5Agh0lcmF957c5zSP
         8AL1cGTF3TCIqcYl1dRwzB6gjKk4urdulkwM/i/uTM+UVLqVLG8h49jUtiTHAunxPZLU
         wZhuxNaLI8tBXcjlBExFy49gnQvPzLa3o1SQpHZB/29pS11jrLy8mQesQb5AB5S6jk/9
         9YCajLJ22k3KXOKGxvY1sjVEqy+0uTzBWybAeICqTWGozfS7FTrrNgbtIjkkigc/mXk4
         pP7w+zLWE7IHW/KMQ0y3JfG9JswRKcBHYPs7AvaMhKmv+JcVVqnUNhV+wquBJvZKseuU
         LzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690356104; x=1690960904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrTqErO65WLHrYUraJkdfgcweJjKzl2A3sDrYCY0pMs=;
        b=fkXsS6koGOuSYksMvTspWMm0DkjjYoDsVRTJTr0yDR/YgPM+gWnFVz3M/g0igVAG6Y
         9QyMeZoxK2Itsz/vhzpM5F8wR7YDi3rT2B5oI+Vaog2d0femRaeD5ERBqg8gl0oxX0qJ
         XDDhkCk4njIyjyTEBbAMB0Rma3+HzlAF4qj2uMtPEm3jgszJHKu+bY+2ZU3zTfQ9ZS1r
         WwnoHwznGN4aRseLpm9bRmGUTzHZgTwaWeHB2u9rEwKOKUCSYvlnDX6huYgmfCEBgWzH
         iZAo7HY6zOzbzEnwb4BmcvmxZwbABzpNq2uB85v5hyI1Pfnthpaa04Ebl6D3c80n8ZbK
         6+kw==
X-Gm-Message-State: ABy/qLZNl5IIDnKzIYod/ivpi47NN15MaEIyLyWdPxHT55VHsMFmwIWv
        7PKrCGQ8FHve9YLVVXGzwEonSQ==
X-Google-Smtp-Source: APBJJlHED6CFwSf1C2CIxq2MUjNUPgXXqBV7hLcoaMIh1GpTlJNo0udbQBixolhBapdmsueQoxfcEA==
X-Received: by 2002:aa7:cf8e:0:b0:522:30d5:6065 with SMTP id z14-20020aa7cf8e000000b0052230d56065mr755052edx.21.1690356104092;
        Wed, 26 Jul 2023 00:21:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l27-20020a056402345b00b0052279f773e3sm109247edc.32.2023.07.26.00.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 00:21:43 -0700 (PDT)
Message-ID: <b57e0199-141f-2a37-4d5a-b98da5276b89@linaro.org>
Date:   Wed, 26 Jul 2023 09:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document AL02-Cx and AL03-C2
 boards based on IPQ9574 family
To:     Sridharan S N <quic_sridsn@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230720084534.6461-1-quic_sridsn@quicinc.com>
 <20230720084534.6461-2-quic_sridsn@quicinc.com>
 <87c3a3db-d172-bc98-cf83-89b874c9fee7@linaro.org>
 <9e401641-1334-c0bc-c49a-481a8a9af2de@linaro.org>
 <c1903d09-f307-8e80-0482-2040c7af7a2c@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c1903d09-f307-8e80-0482-2040c7af7a2c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2023 07:03, Sridharan S N wrote:
> 
> On 7/20/2023 3:18 PM, Konrad Dybcio wrote:
>> On 20.07.2023 10:49, Krzysztof Kozlowski wrote:
>>> On 20/07/2023 10:45, Sridharan S N wrote:
>>>> Document the below listed (Reference Design Platform) RDP boards based on IPQ9574
>>>> family of SoCs.
>>>>
>>>> AL02-C3  - rdp437
>>>> AL02-C7  - rdp433-mht-phy
>>>> AL02-C10 - rdp433-mht-switch
>>>> AL02-C11 - rdp467
>>>> AL02-C12 - rdp455
>>>> AL02-C13 - rdp459
>>>> AL02-C15 - rdp457
>>>> AL02-C16 - rdp456
>>>> AL02-C17 - rdp469
>>>> AL02-C19 - rdp461
>>>> AL03-C2  - rdp458
>>>>
>>>> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
>>>> ---
>>>>   .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index dd66fd872c31..d992261da691 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -89,10 +89,20 @@ description: |
>>>>           adp
>>>>           ap-al01-c1
>>>>           ap-al02-c2
>>>> +        ap-al02-c3
>>>>           ap-al02-c6
>>>>           ap-al02-c7
>>>>           ap-al02-c8
>>>>           ap-al02-c9
>>>> +        ap-al02-c10
>>>> +        ap-al02-c11
>>>> +        ap-al02-c12
>>>> +        ap-al02-c13
>>>> +        ap-al02-c15
>>>> +        ap-al02-c16
>>>> +        ap-al02-c17
>>>> +        ap-al02-c19
>>> Why? I asked once, but there was no feedback from Qualcomm.
>>>
>>> Why do we need to do this? What's the point?
>> Another question would be, whether these boards are just one-off test
>> prototypes of which there exist like 5-10 units, or are they actually
>> going to be supported and useful.
>>
>> If it's the former, I don't think it makes sense to keep the device
>> trees upstream.
>>
>> Konrad
> 
> These are all not test rdps and each rdps has its own configurations. 
> IPQ9574 has four pcie instances and one QDSP processor. Not all rdps use 
> all of the interfaces and it will vary for each rdp. In next version , 
> will post with each rdp's configuration explicitly


So still no answer why do we need to list it as possible boards.
Especially that it messes with compatible style, because c[1-9] looks
like board version.

I suggest don't add these board types and drop existing ones.


Best regards,
Krzysztof

