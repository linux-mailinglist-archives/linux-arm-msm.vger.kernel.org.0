Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99386F9FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 08:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjEHG2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 02:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbjEHG2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 02:28:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4A717DFD
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 23:28:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-965e4be7541so566452166b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 23:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683527312; x=1686119312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQjnNOO8BB5bP1FBeXaARhBVIx0Gxl1xygzkHI4CtA4=;
        b=mxikMzT3JpDYt02scuY8Hx+p1fR78YfEnEuuEHgeXf7uPrn2HFYT7pwz7zNGaX5zF1
         XPuvhOwDtgoRFBa94BSLHKc6Q6Q21Src9F7N5NI2y96v35EHCBx1P83lRgJVSu60Ojwb
         uuuwkS7Lhd9J14mvI/IJ5z5MzE9ixn1j7NqEgrOKoZPQ+yB97eZwfbadH6GDq9tWTeIP
         NbDb57FJA5y/7uREE7aTdEluBWIbH+bkDwQoLQE/PtFR4XuadBlukE3mvdRgnLKjq+bi
         EFiyzFYXS7SkNKTBqUY9jSLPuc/wJfz1I2QzPUuLzT9cGpV/M5BprRhGjIRyt0XZmQVB
         iO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683527312; x=1686119312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQjnNOO8BB5bP1FBeXaARhBVIx0Gxl1xygzkHI4CtA4=;
        b=bplm8UCjdn/vd/e0LZUPkTs3HS2R+ZkrloyL0ncau1tR9f31aG0u3v5iLF2ObhjXxm
         8K9yy/sE4tyYjKpWrMhMZaAn1Kz9YxvbrZms201+Sp64HksJNN6Ql8pJAbCzuQbBNhYN
         m71VEwNUlnJ7a7ejNScIVSI+lryGoarj78h8k7KSZCI4qtJe9lSMSGj4UvYjTCDmIqOX
         X+twsKjzwNerWV9w9RU6jy+YQUSTxJBJEAVb2Te5N7wsrT7KBG8bVphEuoRp4sUXqXCx
         /q+ldxAzGb/j9ua9K1Jagh48QM3SiOMHOX/ogk+AhyqlP4NC7ZMEeWBaR92VrilaQBW9
         UZhA==
X-Gm-Message-State: AC+VfDzwuJWl4XpG+WxNHWLdjU+9uK1MJzARMtmvgTjNcomSLct0ASaf
        0wV8n4P8Di56FuBhyyIxSgN5ZyR1lhF/vX2fIERB+g==
X-Google-Smtp-Source: ACHHUZ4p8mpjVy0cqAqWdS/0JPsaDIUuGYt7YCGkityC0XXPE9PJ8U0Lblf3KFwE1nKxqbLriWs6Cw==
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id gs12-20020a1709072d0c00b009665c042c5amr2289584ejc.69.1683527312460;
        Sun, 07 May 2023 23:28:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906301600b00965b416585bsm4593498ejz.118.2023.05.07.23.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 23:28:31 -0700 (PDT)
Message-ID: <cdf26b5b-79d3-3818-1676-4e2be204a0ee@linaro.org>
Date:   Mon, 8 May 2023 08:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: tsens: Add ipq9574
 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Praveenkumar I <quic_ipkumar@quicinc.com>
References: <cover.1683523370.git.quic_varada@quicinc.com>
 <345a61f6cd56e504e1f82ac2328ffa6d89e2d510.1683523370.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <345a61f6cd56e504e1f82ac2328ffa6d89e2d510.1683523370.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 07:32, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Qualcomm IPQ9574 has tsens v2.3.1 block, which is similar to IPQ8074 tsens.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Drop the ack, it's a bigger change.

> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> [v2]:
> 	Thanks to Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 	for the tip to make qcom,ipq8074-tsens as fallback.
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index d1ec963..ea67cf9 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -64,8 +64,11 @@ properties:
>            - const: qcom,tsens-v2
>  
>        - description: v2 of TSENS with combined interrupt
> -        enum:
> -          - qcom,ipq8074-tsens
> +        - const: qcom,ipq8074-tsens
> +        - items:
> +          - enum:

Please test the patch after changes and before sending. Missing indent
which test would point out.

Best regards,
Krzysztof

