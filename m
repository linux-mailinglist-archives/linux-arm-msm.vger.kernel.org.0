Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E817574AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238394AbiGNKmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238429AbiGNKmS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:42:18 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BCE54C99
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:42:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w17so1674542ljh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s8VpnwHhFZWAVYlNIpH9kdWPTbLI6uI4nckrgHC8pmM=;
        b=w/T9awmLctnifdlcq+QcujLO7NnFl5WH8vXOpLTcy4qrV5vlHZnKOR1CMzdQcuaPgQ
         HBNJFHC7ZV4d9G3OVwfea+iRJf1w0kWXl93CD0JyTwukccUZiFkgBkdzc0ae6gfWFV6P
         A/E+Leq2hzYRI9/3vg2gWrmAhRoDRxMxLI5f1FonpBWVeVR8+Wqi323+boh/VD06g9Jo
         pMBw3mYS33cAygwv9iKCsymMQ7jhOrgY5anq3GrH5CBqAonr8SoRUm6syMTN2OMAj7Ti
         tOLkmLcwPFgpEfy6zdwhs0jzCl3TGJvV2Emgv/ZT5DwSDg75YoXnyVwqqE2syaIBVpTj
         WPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s8VpnwHhFZWAVYlNIpH9kdWPTbLI6uI4nckrgHC8pmM=;
        b=cnGmF42lh3uITItYPabH5oU/pTPB4VK5OhOkBFLFJugL52j+9bxkwDwq2osHU4eWq1
         4ojeXWBPmAHCbNuqMX1Sv4ScGdKk+c/jNjMLZ8A02FXV4B3xJbEwz83m7E6nMu9ukotF
         AHxIOCv1k58Ljm4GgSjtm4z9E3gQcQrlyRdVrf+egtInYQkEsBfcHgLDYfXc2hBRwysA
         sDo1mEmZkfhXIF/Z0CMAGDvxF8/PfSRYez49Rkf8kh+yX8cp6dqE4U0BtPPsfJkZ14uV
         w/Nq0M+hq376ZKy81D+qcuMguH8acj8CTO1RhT72SwEvTaLGCkbBHIBlUUiApwTC5Jnz
         6M1w==
X-Gm-Message-State: AJIora9q/htZTlYGLNlt4tG4CaqTlwNNRp/tI7PHbusRXRXds3d+JDtg
        Bza4BbcBX+44gHQVwjuMhRnuoQ==
X-Google-Smtp-Source: AGRyM1vDS7gTXDdroBeSqdLza2aD+ghoINa7WVmkHLbyGd09X2av2JkhdGocs3fMe6JT2umowMWNuw==
X-Received: by 2002:a2e:8719:0:b0:25d:7650:6c06 with SMTP id m25-20020a2e8719000000b0025d76506c06mr4159705lji.330.1657795333568;
        Thu, 14 Jul 2022 03:42:13 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eba16000000b0025d87966100sm209373lja.140.2022.07.14.03.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:42:13 -0700 (PDT)
Message-ID: <f7d544eb-4e7f-29a9-815c-693d2369761f@linaro.org>
Date:   Thu, 14 Jul 2022 12:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/30] dt-bindings: phy: qcom,qmp: drop redundant
 descriptions
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-4-johan+linaro@kernel.org>
 <26916d41-f398-8527-96f4-9a28f4f4e789@linaro.org>
 <Ys/pQw3e0HPhLZUg@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/pQw3e0HPhLZUg@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
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

On 14/07/2022 12:00, Johan Hovold wrote:
> On Thu, Jul 14, 2022 at 11:07:21AM +0200, Krzysztof Kozlowski wrote:
>> On 07/07/2022 15:46, Johan Hovold wrote:
>>> Drop the redundant supply and clock descriptions which did not add much
>>> information beyond what can be inferred from the corresponding resource
>>> names.
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>>
>> (...)
>>
>>>              - const: ref
>>>              - const: refgen
>>>          resets:
>>> -          items:
>>> -            - description: reset of phy block.
>>> +          maxItems: 1
>>>          reset-names:
>>>            items:
>>>              - const: phy
>>> @@ -376,11 +334,7 @@ allOf:
>>>      then:
>>>        properties:
>>>          clocks:
>>> -          items:
>>> -            - description: Phy aux clock.
>>> -            - description: 19.2 MHz ref clk source.
>>> -            - description: 19.2 MHz ref clk.
>>
>> Here and in other places - I think you loose information, because the
>> frequency is not mentioned in clock name.
> 
> Right, but it is also arguable redundant information for the binding
> (similar for the vdda-pll voltage).

True.

> 
> I can add a comment after the name if you prefer that?

Ah, skip it.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
