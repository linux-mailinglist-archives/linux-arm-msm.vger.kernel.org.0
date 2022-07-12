Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBED75728AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 23:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbiGLVlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 17:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiGLVlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 17:41:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEE6CE380
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 14:41:12 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a39so11403235ljq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=she1seoiq+a+dJ96WQSzchxq98Bjp465dPctwMAzpg0=;
        b=u1fO0xryy2jM2Lpj8sShNv83wwrV0k9HMgZqBak5fVAFgXcfGpo3CnZk0iRK/ePERC
         ICgQj+Bi+pYniRTBn8ynbj+9YqPO8bpfcIOUhu9nVpeqCyolSpGmUixgub1TGxSwnLxK
         JIEd6o+14f4K0uon0tPSPzz3aJ/rzsZZUHYd++MaK29xkXWz3GGCsoFeGFwny0vD6Sa4
         mg42Uv1gc5EoPUfFAKPE5vrJ78GbZ2S+1GoBNlIwDfjjLb0xPffUXDoxA53PxDdUVlZ8
         C0GxXb0zep4GrMOu3B8Z8RN7X5U+JO3yy+bRRHNWsKmFLrSaYqpMq9ngMJ0qDP7Eu+EE
         5NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=she1seoiq+a+dJ96WQSzchxq98Bjp465dPctwMAzpg0=;
        b=Pi201EGsPRmSsolOdsMmSYc7DY9n7BI/LoFV9az1Tm9JoUHvSSfGPHjiTM25Op2y4X
         LYmLq11FDgGIge4/d3/HKAnEWWofWecZgB13gVAJzkK3SLnJWMjp6Djddm6XRj3wJO7M
         Jbh7aEs9153nnyKen8Vas+gxDiWdJwvxT1h/61N4cfg8GYMSHxpodF9xD8mFLzK9s2ze
         3QxiHnQ74rJ1evLdiFNVypvX/nBF94C0z0T8Scqp2dzdq2LzRWTeEDnzenlPmcpibbsp
         /kGc/owOXcCigZTjLa5dDapNfpQ/wrawN0pzD5mX1POz2SE0rOYIpjFaF0IUHzu/vv2+
         +Vdg==
X-Gm-Message-State: AJIora+MdXx5GmEe9fNFzPUkdGjyQPc0ZZKENED28nEzcy/hz062FE7v
        4Ar2TIPf4sjKHWs0tENK0WoADA==
X-Google-Smtp-Source: AGRyM1u0QH8JSSnsKLz13O26TZWPbY+gE8wNGhEL13Ky1MTtr4gqBLPup5WeetA6v6ctaQPxyCWZfA==
X-Received: by 2002:a2e:bf27:0:b0:246:7ed6:33b0 with SMTP id c39-20020a2ebf27000000b002467ed633b0mr28341ljr.167.1657662070335;
        Tue, 12 Jul 2022 14:41:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v12-20020ac258ec000000b00489dfb5d622sm1406068lfo.257.2022.07.12.14.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:41:09 -0700 (PDT)
Message-ID: <e9a5f2de-27ff-59f3-d91e-4391afef0704@linaro.org>
Date:   Wed, 13 Jul 2022 00:41:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 11/11] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-12-dmitry.baryshkov@linaro.org>
 <20220630231159.GA3497845-robh@kernel.org>
 <3cc60a06-6bdf-e9f4-ba8a-7aa83f57fd43@linaro.org>
 <20220712204718.GO1823936-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220712204718.GO1823936-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2022 23:47, Rob Herring wrote:
> On Fri, Jul 08, 2022 at 12:14:45PM +0300, Dmitry Baryshkov wrote:
>> On 01/07/2022 02:11, Rob Herring wrote:
>>> On Sun, Jun 26, 2022 at 02:25:13AM +0300, Dmitry Baryshkov wrote:
>>>> Move properties common to all DPU DT nodes to the dpu-common.yaml
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    .../bindings/display/msm/dpu-common.yaml      | 47 +++++++++++++++++++
>>>>    .../bindings/display/msm/dpu-msm8998.yaml     | 28 ++---------
>>>>    .../bindings/display/msm/dpu-qcm2290.yaml     | 29 ++----------
>>>>    .../bindings/display/msm/dpu-sc7180.yaml      | 32 ++-----------
>>>>    .../bindings/display/msm/dpu-sc7280.yaml      | 32 ++-----------
>>>>    .../bindings/display/msm/dpu-sdm845.yaml      | 32 ++-----------
>>>>    6 files changed, 67 insertions(+), 133 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>>> new file mode 100644
>>>> index 000000000000..f3465ee3a4ab
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>>> @@ -0,0 +1,47 @@
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Display DPU dt properties (common properties)
>>>> +
>>>> +maintainers:
>>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>>> +  - Rob Clark <robdclark@gmail.com>
>>>> +
>>>> +description: |
>>>> +  Device tree bindings for the DPU display controller, common properties.
>>>
>>> Common properties for QCom DPU display controller
>>>
>>>> +
>>>> +properties:
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  operating-points-v2: true
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>
>>> Now this schema is applied twice.
>>>
>>>> +    description: |
>>>> +      Contains the list of output ports from DPU device. These ports
>>>> +      connect to interfaces that are external to the DPU hardware,
>>>> +      such as DSI, DP etc. Each output port contains an endpoint that
>>>> +      describes how it is connected to an external interface.
>>>
>>> This description is marginally useful. Each port will say it is an
>>> output to X. So you could just remove.
>>
>> I think I will go the other way around. It is not really useful to describe
>> individual ports, so I will leave just this piece, slightly rephrased and
>> drop individual /ports, /ports/port@N from dpu-foo.yaml.
> 
> How is describing individual port not useful? You must define what each
> port is. Input or output. Type of data. Are they all the same?

In case of MDSS all ports are output, they are connected to the external 
interfaces (DSI, DP, HDMI, etc). The driver uses them to bind available 
interfaces (using components framework). The reg property of the port is 
completely ignored.


-- 
With best wishes
Dmitry
