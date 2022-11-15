Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0E629314
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiKOIP1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 03:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbiKOIP0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 03:15:26 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFC91EAE6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 00:15:25 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j16so23202058lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 00:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enMJEB6RE4BXUjUBUVifULdEDFjDH1GCyA7BarCBlQQ=;
        b=VGV9FPacsX/KecYXujtFsg3MpccDS7AWbW3UoaR3FeYx/jVsj3+ImRxAOCrOgKwTbI
         DGvvZFERmQZR6cb8KNOTFimba+YBzrwapVNLu4c8KhZJS1mt0iAcLaKhCbRFM6aSKEqj
         E6YTbH5F13N4bL+0ZseZ8kRBKrIE+O8kXDwt4nCRlJMViq14fR65ZgvNL13pgs08LDwj
         UtbU0ATmbZxb51P6yrod/ciZqWxyNXYtjI1TKKKPJwE4tE3XyRYAJupf0oTla25Bd8zw
         POHkf01v5DbbVMw2m8ev6RkYeD26oo7qISNEBunWKdnFYbCkPHjCpKa1PPAAj2bzqCVY
         s8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enMJEB6RE4BXUjUBUVifULdEDFjDH1GCyA7BarCBlQQ=;
        b=w6tYbPIDQpsLZPgC/zS4HqEb5YWqKC0GqSHkP0YG96Xw2ZSmiixqJykKdUAbV0o/80
         U+f5SnFRKfqJ7MLo+1H42HG4dUpdHYCbSmprwIglnKS7OnvEo3CycUBw30Z246QMJmB6
         vZOkIsiE7S4YhzyzvHuKrTjsVhhrT+X+3uhlFqeMZj3leQFyHD/ip5hYeBBiyksgIQhD
         qa6fnhzF2Oibk5SvBwUz+X3hnSML6AaCUD6HTXJIFhl9uyeDnzqpzmsr+ZWPGW44Sxil
         YyCW8soOP9jYQdMJyMgRo4hQ698upwTZu+ja2Ho3f26mn1rjwwrJ3XbtHjhNQMZ9yhpF
         N3lg==
X-Gm-Message-State: ANoB5pluHWQtgKywRbeQH+t2hy2N5V31UEajaUbSyK9Ri84uqWO6K6YW
        Pxb5RYkyG36l282ZWHVJzLjv/g==
X-Google-Smtp-Source: AA0mqf6W82OuHIEKY8hHMTm5amPDDvKoKhZTgo7QjbD0d20a3Mvds/Zs6do8IILNDIGWLo83qvk1+w==
X-Received: by 2002:a05:6512:52e:b0:4b1:753b:e677 with SMTP id o14-20020a056512052e00b004b1753be677mr4790614lfc.407.1668500123544;
        Tue, 15 Nov 2022 00:15:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a27-20020a2eb55b000000b0026e8b82eba6sm2393602ljn.34.2022.11.15.00.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 00:15:23 -0800 (PST)
Message-ID: <6f3a8e24-ab1a-afe3-e907-22d1096a9f53@linaro.org>
Date:   Tue, 15 Nov 2022 09:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/5] dt-bindings: net: ipq4019-mdio: require and
 validate clocks
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221114194734.3287854-1-robimarko@gmail.com>
 <20221114194734.3287854-3-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114194734.3287854-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 20:47, Robert Marko wrote:
> Now that we can match the platforms requiring clocks by compatible start
> using those to allow clocks per compatible and make them required.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Keep clocks under properties and disallow per compatible
> ---
>  .../bindings/net/qcom,ipq4019-mdio.yaml       | 27 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> index f4918c9e6fd2..72561e3aeee3 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm IPQ40xx MDIO Controller
>  maintainers:
>    - Robert Marko <robert.marko@sartura.hr>
>  
> -allOf:
> -  - $ref: "mdio.yaml#"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -40,10 +37,8 @@ properties:
>        address range is only required by the platform IPQ50xx.
>  
>    clocks:
> -    maxItems: 1
> -    description: |
> -      MDIO clock source frequency fixed to 100MHZ, this clock should be specified
> -      by the platform IPQ807x, IPQ60xx and IPQ50xx.
> +    items:
> +      - description: MDIO clock source frequency fixed to 100MHZ
>  
>  required:
>    - compatible
> @@ -51,6 +46,24 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>  
> +allOf:
> +  - $ref: "mdio.yaml#"

If there is going to be resend, drop the quotes from above during the move.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

