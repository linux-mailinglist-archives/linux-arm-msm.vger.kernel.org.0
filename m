Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1705B1AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 13:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiIHLHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 07:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiIHLHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 07:07:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5163198766
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 04:07:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u18so14819862lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=k9hmPZ4TQ475Q+zHQ4uSjdPfa/1uPRyyVAGnJUmO4cU=;
        b=rVkTN2u/N0LsO4YLogfNF38S77kmesLtL5JEAE0RQLQUjfIMTPFKXIymmaaHnnPDab
         MCU4ewSO/5TSOlHYwhtx9CapBb7BwcTtAkeC8xvSHlPC4H1bBYokbqvGoa0rkLJZNEnL
         oj3UJbVFEGqq36Tw50MEl7u2sobrGhDreeIKUA9r3uhxJjl0NOOGkxU2mHGVYEppnhi9
         lGl8x4/IEdCapkFtSv0EFPR9TO/2aHaR9tq7tszrUSur2MaD6+49nurAfi6PvUyf2OOK
         DmU/W+VZAZYyrGDjeosvPkbtSNb3hMYRsUilV16ES7kYLlO05UM70ILBI0hxa22TP0XN
         hnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=k9hmPZ4TQ475Q+zHQ4uSjdPfa/1uPRyyVAGnJUmO4cU=;
        b=VA9hW8Q6HD/0QqrRNvc21P7/rax1iB/y6XEziaarMsxVkYP0syksqBCRfLEg+F5uer
         RVSaBdCv7j7RYsooBcuWJJghgr6VAQ9iwbcPXqjIXpStQuRnptE0jhL2lfCA7x7TFnbT
         gRyx0NJdYO2LnFaZ7NJkzXKjOy5Om1ucFCx9iIVT3X5UWm8YX0K3NDSYonD1C41PM7Y0
         Pb8p8LGU3EgeHPO3C62zBRfT9FkkopAaqUOYviPq/Mj5zeTWvEU1FW3u8fTh/yznpsfg
         Bzt6FAw5FsyT63HwPlSBTHdzwsV7hlRRyxUqwxSkraghLjxqqxUb8l+VEz+3P/Fb6m5s
         P5WQ==
X-Gm-Message-State: ACgBeo38ubcaVMUBAyFv4KUfL9WuAmW7vonFPUW/k58b6H9uT7KP1Ree
        g/OS6Xl+zYs01TkLTb5nIQnDww==
X-Google-Smtp-Source: AA6agR6XRYejb3ho7CGR7DjdwL9+WyGL+/6iuvpKqUWcwtkfNv04/j8KklLvf4TfUNGVw79gS28Hgw==
X-Received: by 2002:ac2:4c4d:0:b0:497:a420:fe25 with SMTP id o13-20020ac24c4d000000b00497a420fe25mr2783444lfk.647.1662635254656;
        Thu, 08 Sep 2022 04:07:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512200800b00497a0ea92desm1421722lfb.135.2022.09.08.04.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:07:33 -0700 (PDT)
Message-ID: <2d4de63a-c536-669d-b90d-21f60bc6b6fb@linaro.org>
Date:   Thu, 8 Sep 2022 13:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gcc-sdm845: add sdm670 global
 clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tdas@codeaurora.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, caleb@connolly.tech,
        jo@jsfamily.in
References: <20220907223927.139858-1-mailingradian@gmail.com>
 <20220907223927.139858-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907223927.139858-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 00:39, Richard Acayan wrote:
> The Snapdragon 670 clocks will be added into the sdm845 gcc driver. Most
> of the new clocks, GDSCs, and resets already have reserved IDs but there
> are some resources that don't. Add the new clock and extra BCR from
> Snapdragon 670 and document the differences between the SoC parent clocks.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Thank you for your patch. There is something to discuss/improve.

>    '#clock-cells':
>      const: 1
> @@ -63,6 +57,46 @@ required:
>    - '#reset-cells'
>    - '#power-domain-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,gcc-sdm845
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board active XO source
> +            - description: Sleep clock source
> +            - description: PCIE 0 Pipe clock source
> +            - description: PCIE 1 Pipe clock source
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: bi_tcxo_ao
> +            - const: sleep_clk
> +            - const: pcie_0_pipe_clk
> +            - const: pcie_1_pipe_clk

Blank line here.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
