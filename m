Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934186F6113
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 00:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjECWKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 18:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjECWKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 18:10:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126BF83D7
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 15:10:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so5577087f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683151815; x=1685743815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KM+Eoku8OZr2C+7sz7eqGQokSgHhVju2rzB5GkXKvSs=;
        b=iEqzXQ9iP1TcfpM5M0R7xpX9VPkf6KLlTxi9g54G6kOeXU9aEb95q9v6gpQoWPY4/X
         ElJV8nWnZzUQ0JiD7qY3wxyjbRygmOxCS/OxnZchSo62oy73tWW51/fY2QX1nyLs/WMZ
         LTDrFj9UxUbF22c9jQKyoQmt40w6nT5ft2f3BNzD6Lim35mnFdRzQX2snnjo668Lxxrc
         XsuAsSMR6B5gyO4zGwjvAv6v01gqjOVwAiAykNfp0H1Ldx3LzjvmDUcPCcE2T9kZpavX
         Txo67OqyjkYgK8i+yJqDj/6c4bpVsiulbLYUJzd5Jm6NmMQurM25390RNvVFcVRo+YaR
         JL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683151815; x=1685743815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KM+Eoku8OZr2C+7sz7eqGQokSgHhVju2rzB5GkXKvSs=;
        b=EpuBrF3cBQzNVcZj/cOieOoWevLYqGihYr+K7m/cuRRUWz+p9DGad6Xn9U5CdWxNdx
         9HkW9I9sA5BW+UDDTHKYpTh8y0ZqkXjXgZ4GxZhmWQ7L17RwTkzIySnU+U64LsQlTuoL
         5vpYIvutXLonvQrKBwFgTUt7fVVzzHYjFzqQzY8+oXnYqb/v98k3Qen68V9rXfNMJgQb
         vmh1y4VQBRhTZfOy2LYRxflMXjFoDQ/WhrHUxZSGmUDCiSJ+FXBsY4lh6Iwp2KK1yMqv
         0X6nATqXEp+BdKl6Wa3n4Dhmsuf2wJcpYsSZd9YIVBV0yFSpAD3sEtYkyfT1rAqDvY6w
         YICw==
X-Gm-Message-State: AC+VfDzvwvoAGRS+ci2i65z/KN964yqYZTKwJHSglu2rT21zZ+nx5rC6
        Dlkc66ume+e/2iKirx5ls7pvnA==
X-Google-Smtp-Source: ACHHUZ5OzpINizXldHsUOvhbQNgkg897DXT56Mb6xqEoyEq8YnPtxaCSPdNRDd6ZzMHawkqMmoyA1A==
X-Received: by 2002:a05:6000:1a4f:b0:2ff:613c:af5d with SMTP id t15-20020a0560001a4f00b002ff613caf5dmr966542wry.36.1683151815562;
        Wed, 03 May 2023 15:10:15 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5712000000b003062675d4c9sm11934563wrv.39.2023.05.03.15.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 15:10:15 -0700 (PDT)
Message-ID: <9da030c6-6a9f-6766-7120-94aaa8fcd8ab@linaro.org>
Date:   Wed, 3 May 2023 23:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V4 1/3] dt-bindings: sram: qcom,imem: Add Boot Stat region
 within IMEM
Content-Language: en-US
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
References: <cover.1681742910.git.quic_schowdhu@quicinc.com>
 <NO2MhqhxQqjQ33CVOtaXXxo2iBfl6Ugz1lE5oJAl-mjUyrRu4l9vCBWV8AVJZoCrVF0Cw0j49t44Bn5yEAv3mA==@protonmail.internalid>
 <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681742910.git.quic_schowdhu@quicinc.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681742910.git.quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/04/2023 16:08, Souradeep Chowdhury wrote:
> All Qualcomm bootloaders log useful timestamp information related
> to bootloader stats in the IMEM region. Add the child node within
> IMEM for the boot stat region containing register address and
> compatible string.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index ba694ce..d028bed 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -49,6 +49,28 @@ patternProperties:
>      $ref: /schemas/remoteproc/qcom,pil-info.yaml#
>      description: Peripheral image loader relocation region
> 
> +  "^stats@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Imem region dedicated for storing timestamps related
> +      information regarding bootstats.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - qcom,sm8450-bootstats

This region isn't exclusive to sm8450, it exists also on sdm845 and
presumably other platforms. Is there any need for an SoC specific
compatible?

> +          - const: qcom,imem-bootstats
> +
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
>  required:
>    - compatible
>    - reg
> --
> 2.7.4
> 

-- 
Kind Regards,
Caleb (they/them)
