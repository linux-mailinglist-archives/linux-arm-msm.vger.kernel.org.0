Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E52556B529
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 11:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbiGHJOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 05:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbiGHJOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 05:14:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74F322B2C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 02:14:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t19so34702713lfl.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SHTvpmESn76bjS5b3QfhxAC0LvT7ZTcK/A9d/vWMLAw=;
        b=g9DwsYT2A2JJlwvpYrkv6uNxvCH2uDbYs6yMHTuxsCgf+Z3Hz3Hj3ty7wIUQLFEAEY
         k8iI+IXTfkJ/Pd2lOfnJGd+T2jus6XtWyb52mTBvSmiYiaBrJN8KAzBqicN1MqOqqW0v
         9NswK2sdfkQVdCmJtNxqZJZWttE/jC0f4vRCu0GG5EpAyd0H+4NmfXDZeGY+KA+RaBIc
         /sofIKcHm66WWcYVLYxBqzmL25c/2kGF/bPMJIvPn26lIBAKV93608XpqBJeEg46s7OV
         7NGoyQYeSxz5Cq4cEuoPmPj7HEM/1Alz/kbvMaVZ+EF6pfm8pRSvAIGMx8mUKI5xeerc
         d/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SHTvpmESn76bjS5b3QfhxAC0LvT7ZTcK/A9d/vWMLAw=;
        b=eYEvrdr6wqD4BziNZXkohyHV3GlusUng+IM1C+DIHfZeS8hVBzsPLloEK1FIv3HP9n
         KxxCw02TC9Jutta3HX7+ZGEyigBBfHVXGswXUO+C4haKEGWfGviT/eH9q8mAb2yuv+0Z
         I0CHt/ocFSuyyFSOoz+iuyJjvzOSgpLsrvUZvv4mmOL/LfiM5/iV099QvH7l0woYxIZ4
         SqufnuCpMkdR/0rq5208ErHXSOWz9QFm34Tsdmxh3nB+WJ3xn1o1BzkQKnAoygxkdF3K
         vCXceFgc4M7ltTCQJthH2huMBpKU6E+Fqxw54XJfNz5K/eWayEcqn74FnuxlRsXEYCSC
         RikA==
X-Gm-Message-State: AJIora89E0oUFB6JeVtwfg+rxTFf6OC01+2bQUNZEsdRKCeAp1Xq6cR6
        oS68A5rf0Il331BYOQhXcTuwPJbTURLeIg==
X-Google-Smtp-Source: AGRyM1uLlnlUdhuQXUD8hsavNV/4JN88hKCaU/imVeFNQUzYDJPWmLnx3unSrxSQbXMy8+ER076l8Q==
X-Received: by 2002:a05:6512:ba7:b0:47f:657c:95e5 with SMTP id b39-20020a0565120ba700b0047f657c95e5mr1685988lfv.184.1657271686090;
        Fri, 08 Jul 2022 02:14:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b0047fac765f39sm7300477lfr.219.2022.07.08.02.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 02:14:45 -0700 (PDT)
Message-ID: <3cc60a06-6bdf-e9f4-ba8a-7aa83f57fd43@linaro.org>
Date:   Fri, 8 Jul 2022 12:14:45 +0300
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220630231159.GA3497845-robh@kernel.org>
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

On 01/07/2022 02:11, Rob Herring wrote:
> On Sun, Jun 26, 2022 at 02:25:13AM +0300, Dmitry Baryshkov wrote:
>> Move properties common to all DPU DT nodes to the dpu-common.yaml
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml      | 47 +++++++++++++++++++
>>   .../bindings/display/msm/dpu-msm8998.yaml     | 28 ++---------
>>   .../bindings/display/msm/dpu-qcm2290.yaml     | 29 ++----------
>>   .../bindings/display/msm/dpu-sc7180.yaml      | 32 ++-----------
>>   .../bindings/display/msm/dpu-sc7280.yaml      | 32 ++-----------
>>   .../bindings/display/msm/dpu-sdm845.yaml      | 32 ++-----------
>>   6 files changed, 67 insertions(+), 133 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> new file mode 100644
>> index 000000000000..f3465ee3a4ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -0,0 +1,47 @@
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DPU dt properties (common properties)
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>> +  - Rob Clark <robdclark@gmail.com>
>> +
>> +description: |
>> +  Device tree bindings for the DPU display controller, common properties.
> 
> Common properties for QCom DPU display controller
> 
>> +
>> +properties:
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
> Now this schema is applied twice.
> 
>> +    description: |
>> +      Contains the list of output ports from DPU device. These ports
>> +      connect to interfaces that are external to the DPU hardware,
>> +      such as DSI, DP etc. Each output port contains an endpoint that
>> +      describes how it is connected to an external interface.
> 
> This description is marginally useful. Each port will say it is an
> output to X. So you could just remove.

I think I will go the other way around. It is not really useful to 
describe individual ports, so I will leave just this piece, slightly 
rephrased and drop individual /ports, /ports/port@N from dpu-foo.yaml.

This will also remove the duplicate application of ports schema.

> 
>> +
>> +patternProperties:
>> +  (mdp-)?opp-table:
>> +    $ref: /schemas/opp/opp-v2.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - interrupts
>> +  - power-domains
>> +  - operating-points-v2
>> +  - ports
>> +
>> +additionalProperties: true


-- 
With best wishes
Dmitry
