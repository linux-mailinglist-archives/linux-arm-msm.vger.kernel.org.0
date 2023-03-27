Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B056CA3F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbjC0MX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjC0MXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:23:08 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07E565A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:22:22 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id i5so35569831eda.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679919741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzcyCIFG4peg2Ww15uJJ3yrB4ucDFkS9kgu5aS0qaCA=;
        b=OeLzruwP9GLcp39m617tUG87vVomI1TznaxtZiaTiuU6a0rqWHMFmN95zDJkYYGb6r
         AEDRoSB69YYCzQCwbgk1q3CrbkMH2S+vwUqI2g281YZf2vQ4Zjqg3QmE7SG7D5i0yzFP
         fjCQwrxiBezH3qX7aMIK4pHtj2SLuVhRA6x6k+sjStVjwUxASkP7Mqw3pUoU6/oS5BoI
         vAItJh0NKmgKr8RE+CritAAmsa4Hrv2T9mHT+b+IwMCYyVXmLi4Wz4FeoGkeGSDjHESA
         q5kSUOImgCh25bpPbCZQwvCFf+SiogH3ryfGFKW+6dr+g4zmLFAGauLUTdtBC/KPFc5w
         Vjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzcyCIFG4peg2Ww15uJJ3yrB4ucDFkS9kgu5aS0qaCA=;
        b=L8N6RaA4IH/emVA7HTEPbygtOM54nRqmQlw1yZ+0x1/dSwU4E+UXuNmLLmOsNvBaYL
         vrjOuWYGpLtLP68XkDpPtkBmbw1BhzzjQ4T12GlttptIjzx74zpxZAYHx6XjZknOHXwv
         S6M2iWmRWo+ArJxDc0K9ftvwkErZ8pvE7LwvPFVxh/TDXyQXR1IMGnOshv7e1/a/QoFf
         hM3X4Cu2YapHbqlZhm5YJNLwQANIVMkOwQvhLs2Kld+Q/2AA99qWSBEHd5rtJs4ZY+/I
         1679VZqxPSeFmrn991nDFLkexCkSog/xPIFEe2sXxcHIl5zllxmTTY7atrnDDaCk7HWZ
         zTzw==
X-Gm-Message-State: AAQBX9crAhjBaD0LgYXoDd9uVsCP6TZJjZv2sbisgXC3kVbi82PrtHPB
        xqqCaMC8jvSPt7qhSBe5KpBofg==
X-Google-Smtp-Source: AKy350b5C4pJiIvUzsrA9B/KVMoGz4SHnz6GuLSmUzJvLb+RSOf6DPNrMtcyeFZKWBqPQbO5n22qeQ==
X-Received: by 2002:a05:6402:d7:b0:501:c4e3:9914 with SMTP id i23-20020a05640200d700b00501c4e39914mr11017861edu.33.1679919741277;
        Mon, 27 Mar 2023 05:22:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b005023ddb37eesm2312482eda.8.2023.03.27.05.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:22:20 -0700 (PDT)
Message-ID: <44904ffc-83d4-1137-3479-737a81b31d16@linaro.org>
Date:   Mon, 27 Mar 2023 14:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: add
 qcom,assign-all-memory property
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230325134410.21092-1-me@dylanvanassche.be>
 <20230325134410.21092-2-me@dylanvanassche.be>
 <883c3c48-c6e5-556d-431f-e92592b9106a@linaro.org>
 <b75b92bf64b55ba0ace0fbff65955c838a294dec.camel@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b75b92bf64b55ba0ace0fbff65955c838a294dec.camel@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 13:37, Dylan Van Assche wrote:
> Hi Krzysztof,
> 
> On Sun, 2023-03-26 at 10:55 +0200, Krzysztof Kozlowski wrote:
>> On 25/03/2023 14:44, Dylan Van Assche wrote:
>>> Document the added qcom,assign-all-memory in devicetree bindings.
>>>
>>> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
>>> ---
>>>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6
>>> ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>> b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>> index 1ab9588cdd89..fa5b00534b30 100644
>>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>> @@ -57,6 +57,12 @@ properties:
>>>        Virtual machine IDs for remote processor.
>>>      $ref: "/schemas/types.yaml#/definitions/uint32-array"
>>>  
>>> +  qcom,assign-all-mem:
>>> +    description:
>>> +      Assign memory to all Virtual machines defined by qcom,vmids.
>>
>> This (neither commit msg) does not explain why this is needed and
>> actually does not sound like hardware-related property.
> 
> This is made a separate property to toggle different behavior in the
> driver if it is needed for some FastRPC nodes. 

Bindings are not for driver behavior.

> Downstream does guard
> this with a property 'restrict-access' as well, see [1] for a random
> SDM845 downstream kernel. On SDM845, this property is not present, thus
> the IF block runs. On SDM670, this property is present, then the IF
> block is skipped. That's why I opt for this property to have this
> behaviour conditionally. I'm not sure how to explain it better though.

Still you described driver... Please come with something more hardware
related.

Best regards,
Krzysztof

