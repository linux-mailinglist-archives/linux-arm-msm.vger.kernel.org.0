Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C286BA98D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 08:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjCOHlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 03:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjCOHld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 03:41:33 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8849CC0B
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:41:24 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id fd5so37971244edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0KhlGWXaQvnZJhV1oSsNdPCBAKJbouheIOtj7npGYk=;
        b=YBBTDpvNzHs/0H49YlerltAikbw/Jmf3Nd/So97eSTLWxTvmgz/onV2Vd5EbQcED+9
         0XUxEHoucWRhtsidJpj6Xog8jBDvGxyPEXhd3ABMfjq5BqmwqEMEcX3lCf6VCnX8vVxa
         fkQTlsVdClzxFyJGiiX1t1+fWSeqk/huvGy3wQZmxhD7p7jvP9bn83dC7YinT31jEfGf
         z+ShZ+ti9xT61VJoMsfYmk76Mlep/cukGCvR5mrL2DXt5JAbU5Nw7ZbQqLlDjD3un88N
         Yu9WQr/u2Jonl+SG91lOwzxG5lt9wFSLYw8ExW26UMWpljO5AemlUWezJrU732i+ECft
         1okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0KhlGWXaQvnZJhV1oSsNdPCBAKJbouheIOtj7npGYk=;
        b=SsuapoPxxRrs+u+dijIOqqSpFJea4Fl3d1b4WVvoWdN0kfU7wf231bj5fN1c78+5aH
         k4taY8qos0RSKaYg1Sejyee/4EJf6jzGLOid5TgZ9Ho2KZ++4xqG/l6aws+dlTyaJov9
         81sU7AWLfAQgexoB5fGX053vUm+/8bHAxvfzwrltDgA2r4SwFKLdU7Yd7/vrfhnCuseS
         +GSE+kEFIw0+JS31CmIzlqfTqFZXx2BaRBh0nIE8Joh9xwGujvx8WtIrlvFyOrNDj7N0
         ukMXLjUC4QWyFBdFM6pdrmg9lVKORj06kgvXWHz2/0JV+0Xu3FonkiYfw/0KhQ/K1ErR
         GlPw==
X-Gm-Message-State: AO0yUKXzxPE3o4lS4LyqdsF2vJsL2Qcvb030LQMx7KvE/s4Lg2q7SVq9
        eRrPLN8yM53PPxuYatjSA7yEVg==
X-Google-Smtp-Source: AK7set9Rrx9ge1r9G4dbyMIZf+2ce8Es0KpH7l15XaniS+dAetrOiLVGW+bUv4hTSdzjnjE7120OZA==
X-Received: by 2002:aa7:cc83:0:b0:4fe:f19f:ac46 with SMTP id p3-20020aa7cc83000000b004fef19fac46mr1652409edt.6.1678866083130;
        Wed, 15 Mar 2023 00:41:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id d7-20020a50f687000000b004fe9386b259sm1416507edn.41.2023.03.15.00.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:41:22 -0700 (PDT)
Message-ID: <2b3e39b9-ea70-db9b-89f7-09054df363c3@linaro.org>
Date:   Wed, 15 Mar 2023 08:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: msm: Add bindings for multi
 channel DDR in LLCC
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230313124040.9463-1-quic_kbajaj@quicinc.com>
 <20230313124040.9463-3-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313124040.9463-3-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/03/2023 13:40, Komal Bajaj wrote:
> Add description for additional nodes needed to support
> mulitple channel DDR configurations in LLCC.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>

+Cc Mani,

This will conflict with:
https://lore.kernel.org/all/20230314080443.64635-3-manivannan.sadhasivam@linaro.org/

Please rebase on top of Mani's patches (assuming they are not
conflicting in principle)

> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
> index 38efcad56dbd..9a4a76caf490 100644
> --- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
> @@ -37,15 +37,24 @@ properties:
>      items:

minItems: 2

>        - description: LLCC base register region
>        - description: LLCC broadcast base register region
> +      - description: Feature register to decide which LLCC configuration
> +                     to use, this is optional
>  
>    reg-names:

minItems: 2

>      items:
>        - const: llcc_base
>        - const: llcc_broadcast_base
> +      - const: multi_channel_register
>  
>    interrupts:
>      maxItems: 1
>  
> +  multi-ch-bit-off:
> +    items:
> +      - description: Specifies the offset in bits into the multi_channel_register
> +                     and the number of bits used to decide which LLCC configuration
> +                     to use

There are here few issues.
First, I don't fully understand the property. What is an LLCC
configuration? Like some fused values?

Second, don't make it a register specific, it will not scale easily to
any new version of this interface. Although how this should look like
depends on what is it.

Third, you need vendor prefix and type (unless this is a generic
property, but does not look like). Then "items" is probably wrong. Line
break after "description: "

Best regards,
Krzysztof

