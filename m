Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777066B001C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 08:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCHHpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 02:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCHHpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 02:45:49 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F4F9BA48
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 23:45:48 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j11so20142874lfg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 23:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678261546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFL3ZUb7HpahLDE8FfXA001OsdRV/Xs92oVS76+8kYw=;
        b=zXKgDeV1enxfpTyMsDWf+08lPxrZhVG52NgFQopDBhqMWtn4uhlFcMMBHLrSVPGLrT
         Ee+2i19gF62b3yc1tdEvwElZu2rSUQbRZE/LFyyVgibXnBuP81fKh54xMRfhY1QrlFyf
         XtzNBmI5BwpSfR2KX925lNUlLLHBWewHsV5+fjHx8ILojDp0JXuEpWxEvP6lGPicPpFM
         E2mV+uBWZ9/05ExW38foIvbmSu6vQTeFZwoxAJcYNHfdI80wIKUts22q7UdPmj0PaAMQ
         f+Hutel/Wb9i7Lcvgw/opIG/Pm+CLKhyJ/V+AOXoX9rUir/r0oKRSzX2DlVqpzOhtRdY
         BpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678261546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFL3ZUb7HpahLDE8FfXA001OsdRV/Xs92oVS76+8kYw=;
        b=4340u+HvPGxN0kofjwfZPwRGeRfPlKk/ydPIQj1ETDahQ8J6r7OVvfLcLP4/Pw+e6q
         dou9QCKlpF+gvC0qswQ7RIYOB+TR3QvCeKCFJaWr0xC/yGwNw2ao/3pMdWaVOzjw4zhM
         EhywxmxMyfeIJW9Etvq2A98pQH96Us5GYD0qUC7sPE2IcNF+kVuLBsaP6FNFRCgRRedx
         kOKwjWfx7q35qdB5rGyDfbuvgH3JlChZ01oQzmrS2PUukDXRDFf9pGDnTl3mjMF0oJjD
         eqsn8HCeLnZX9d5qRbWU9VDeQP1YRr08m40wn7PdPAHq4WiR15R5gbKjElF7XSpvJ8t4
         e3Qw==
X-Gm-Message-State: AO0yUKWxI4i7xyI1tH1RownmAvr6CC2TM5X2AOP2V6dupeKvhurAe1bK
        nCBXDTY1mQyzNjg8e4u9QwUnxYbIzUFDAeAl5YU=
X-Google-Smtp-Source: AK7set9fueMt93wtX8Sf+Pq3yfiV3O1MMRZAIydubcT3yM73j94cXzxjjri0Y+Qvya+N8kAqSLEt5g==
X-Received: by 2002:ac2:5317:0:b0:4b5:61e8:8934 with SMTP id c23-20020ac25317000000b004b561e88934mr4724659lfh.64.1678261546608;
        Tue, 07 Mar 2023 23:45:46 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w25-20020ac24439000000b004d86808fd33sm2287696lfl.15.2023.03.07.23.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 23:45:46 -0800 (PST)
Message-ID: <9858ecfc-6a51-71a9-70e7-dd1e3eb9ba65@linaro.org>
Date:   Wed, 8 Mar 2023 08:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Allow
 #power-domain-cells
Content-Language: en-US
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230308011705.291337-1-konrad.dybcio@linaro.org>
 <CAAQ0ZWSXP59cgyHNkR8UfXRHqRrJGLxuNwMBh2N6=W_x18-BTg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAAQ0ZWSXP59cgyHNkR8UfXRHqRrJGLxuNwMBh2N6=W_x18-BTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 08:24, Shawn Guo wrote:
> On Wed, Mar 8, 2023 at 9:17 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> MPM provides a single genpd. Allow #power-domain-cells = <0>.
> 
> Indeed! It was missing from the initial submission.  Thanks for fixing it up!
> 
>>
>> Fixes: 54fc9851c0e0 ("dt-bindings: interrupt-controller: Add Qualcomm MPM support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml     | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> index 509d20c091af..4c470dc143e5 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> @@ -62,6 +62,9 @@ properties:
>>          - description: MPM pin number
>>          - description: GIC SPI number for the MPM pin
>>
>> +  '#power-domain-cells':
> 
> Should we add it to the "required" list and examples?
I was debating it.. it's definitely not *required*, as the
irqchip part works even without it and then on SoCs with MPM
but without PSCI the setup may be tricky..

About the example, both yes/no are okay for me

Konrad
> 
> Shawn
> 
>> +    const: 0
>> +
>>  required:
>>    - compatible
>>    - reg
>> --
>> 2.39.2
>>
