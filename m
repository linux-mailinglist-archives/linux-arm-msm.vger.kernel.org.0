Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C625655D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 14:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbiGDMq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 08:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbiGDMqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 08:46:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799B3FD0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 05:46:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a4so15695661lfm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 05:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=5wtFuTaS8KE0IcCSRk+gq53BW2FehRqwlDRedJ4vBWQ=;
        b=HZouYF/orEq5DjDc4Ls8oEDSA9WO1c/kk1LHGUv7wGmeqie8vWvaw07X1yTflRxX/5
         i60UsgaZ1WZFo7mSsaMgIXuvzZ4oLfOCgJgOHze2KvVY2TOMHQQa/9jIxFy30+iXt7jw
         n9p0zMcb/9iLFMWB+mXLEkbumcKkDegCe1mCrFtpY9kcR4jSfayGG+iMBFaXv7p5hzFC
         VJJGo4G9hOyb/aAJMZ8urtBL+zULWtrbmyYFLvValnYBpxRqoeUiPQ59ytwM2Ue9xo7l
         7Q0Qurfa/pXk8axxOyHKbCHRnkRpDgICLRCi032e7T8JgG6LBWbW6b1urqdLvLAVjxcs
         E8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5wtFuTaS8KE0IcCSRk+gq53BW2FehRqwlDRedJ4vBWQ=;
        b=N99ncbgKOQEuZGiSVsVhiX9apAxiVeDE13V334KntNrpt3Ce7A2d/+Lk++0J0gm7nx
         +wsyNUwgBYeiwBn7kE/kv16iArgZ0GvCszAXgfHazZkHUrKCpg4r2mNpTKZQjW7jVKPi
         QOzoQhIuuax22uQOLZ5gtt1W6xX2hb5h0V7Jtse7Kl8Iv661vJ1fLV9cQKZ/MzWxP5Vg
         55p2+QM9IqknrIsWKI7gYIERnbupV7XZqylMV0A0VLVWIFv4grDR17KD8GrTChTJspJc
         7EuH2s2mhjmJA5StZw4GbbGpIEkTEqmMUmC0w0L4pzXdTy392ERo3mhmVPrA8KRKSI58
         APuw==
X-Gm-Message-State: AJIora94mcdMR7AsfHUvIg6VpODxaHO49jOIOLhDK74Nm/usva2O+3dx
        DvPxC/Z6FRUiNXuALhXebunBlA==
X-Google-Smtp-Source: AGRyM1uJYkHzQ5bI4TQ7t5Gj/aeAslrZYqIu3CepUV9ZG9ZOZXZ6t5MHN9kobYE2O3vnp2JNFRC5nw==
X-Received: by 2002:a05:6512:234e:b0:47f:8c9c:dfd with SMTP id p14-20020a056512234e00b0047f8c9c0dfdmr19125071lfu.438.1656938799837;
        Mon, 04 Jul 2022 05:46:39 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id c2-20020ac25f62000000b00478f3fe716asm5115449lfc.200.2022.07.04.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:46:39 -0700 (PDT)
Message-ID: <0c5ac567-a279-cb95-ac04-729040436091@linaro.org>
Date:   Mon, 4 Jul 2022 14:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/5] dt-bindings: interconnect: Update property for
 icc-rpm path tag
Content-Language: en-US
To:     Leo Yan <leo.yan@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20220704093029.1126609-1-leo.yan@linaro.org>
 <20220704093029.1126609-2-leo.yan@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704093029.1126609-2-leo.yan@linaro.org>
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

On 04/07/2022 11:30, Leo Yan wrote:
> To support path tag in icc-rpm driver, the "#interconnect-cells"
> property is updated as enumerate values: 1 or 2.  Setting to 1 means
> it is compatible with old DT binding that interconnect path only
> contains node id; if set to 2 for "#interconnect-cells" property, then
> the second specifier is used as a tag (e.g. vote for which buckets).
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../devicetree/bindings/interconnect/qcom,rpm.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> index 8a676fef8c1d..cdfe419e7339 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> @@ -45,7 +45,12 @@ properties:
>        - qcom,sdm660-snoc
>  
>    '#interconnect-cells':
> -    const: 1
> +    description: |
> +      Number of interconnect specifier. 

Isn't this sentence obvious (common for every bindings)? Just skip it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> Value: <1> is one cell in a
> +      interconnect specifier for the interconnect node id, <2> requires
> +      the interconnect node id and an extra path tag.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 2 ]
>  
>    clocks:
>      minItems: 2


Best regards,
Krzysztof
