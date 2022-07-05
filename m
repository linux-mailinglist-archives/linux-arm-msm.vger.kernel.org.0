Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3501E56672C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiGEJ7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbiGEJ7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:59:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B0B140A0
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:58:15 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a4so19740043lfm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aqCErOclwnaUB3R2DYegdLobULwiQuC5u+/iWzlnxXg=;
        b=hTssDPvaOh1/TIL6KDkiw+NknUd5kDzjfR67GiU0E0TM3XJOTJABFbIyspK69w7vBr
         NEl4kRkD6TI4vRA0kGTcMxHIQ81vvVe0cEhNZEU6jC3fD8Nqq5g2iwcAe0tCj6U+KjxI
         JZJ1AleY4ew5bQxmOWkoRoAZk8epn1NKoXNymptuduIQwnn1iiVSGDpVBw18kq1ucqBK
         DSR2W4w8xW9jY243v1C6jnhjgHnB9yjMPUdSUkhbJJUtwPziIxYQ6OquUAqkaqKVNOiJ
         Hlh9CP6x7CRN+VCLnFbW90JH+sRjEo4fArFM07oTxPYGpxt4da9GhoZXN9RnmaqMD4pO
         Bfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aqCErOclwnaUB3R2DYegdLobULwiQuC5u+/iWzlnxXg=;
        b=F26xawFcKJhdTnx+ieS2OH6LHLqJVHzShJuCvW3NUsIRQkK6PRq2zCkd0dgGNCT9Ks
         3CNlZ79mXphCs3XUruj/lExXxEVzJpCgZ6jSAuHkTlDYaVg/IOjKJpTuLYGMEprAPhGQ
         ucOtd6d7M5IOwmJf4R3ZsN8ZFGP6nsuwbxBpE1PU/dUlU9JHtv+7QAHdZcHdGBsDJY8P
         Rk5IrytW86WPfocJbLIwrDMWQcp4Y3KLHstRrGP102mohnZ/3La2l84w2QFV2U1gZDry
         Wj+TDj6oTEe0Sgr1be/ujTNPWhuuQBHGNlkkydnGgX3pLWMmm5cfKcFTYduD6aXYZkXP
         xThw==
X-Gm-Message-State: AJIora+4Zw91C7ldDTMrmCDot9lG7WPJP3jevLIRqO2dQphQsyaK4k/O
        mbCxp9XRc7w3W+F0HoaIxu3NTQ==
X-Google-Smtp-Source: AGRyM1vL0+yQhSiBAFzDtWWSFRAhWNk52TBhw6+7pvN+cgsSvVuRa+ssnAXO1BNY28KJPvE9m11ZVg==
X-Received: by 2002:ac2:4f02:0:b0:481:43a8:e368 with SMTP id k2-20020ac24f02000000b0048143a8e368mr20451422lfr.65.1657015093796;
        Tue, 05 Jul 2022 02:58:13 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a9-20020a19ca09000000b00477a6c86f17sm5608533lfg.8.2022.07.05.02.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:58:12 -0700 (PDT)
Message-ID: <5b663071-5864-b148-8f79-b60a631be895@linaro.org>
Date:   Tue, 5 Jul 2022 11:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
 <20220704155350.812319-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704155350.812319-2-dmitry.baryshkov@linaro.org>
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

On 04/07/2022 17:53, Dmitry Baryshkov wrote:
> Rather than defining (incorrect) global clocks and clock-names lists,
> define them per platform using conditionals. Also, while we are at it,
> mark these properties as required for all platforms for which DT files
> contained clocks/clock-names for the MMCC nodes from the beginning (in
> addition to existing MSM8998 this adds MSM8994, SDM630 and SDM660).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 133 ++++++++++++++----
>  1 file changed, 109 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> index 32e87014bb55..d02fe6dc79b5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> @@ -31,30 +31,12 @@ properties:
>        - qcom,mmcc-sdm660
>  
>    clocks:
> -    items:
> -      - description: Board XO source
> -      - description: Board sleep source
> -      - description: Global PLL 0 clock
> -      - description: DSI phy instance 0 dsi clock
> -      - description: DSI phy instance 0 byte clock
> -      - description: DSI phy instance 1 dsi clock
> -      - description: DSI phy instance 1 byte clock
> -      - description: HDMI phy PLL clock
> -      - description: DisplayPort phy PLL vco clock
> -      - description: DisplayPort phy PLL link clock
> +    minItems: 9
> +    maxItems: 10
>  
>    clock-names:
> -    items:
> -      - const: xo
> -      - const: sleep
> -      - const: gpll0
> -      - const: dsi0dsi
> -      - const: dsi0byte
> -      - const: dsi1dsi
> -      - const: dsi1byte
> -      - const: hdmipll
> -      - const: dpvco
> -      - const: dplink
> +    minItems: 9
> +    maxItems: 10
>  
>    '#clock-cells':
>      const: 1
> @@ -89,13 +71,116 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: qcom,mmcc-msm8998
> -
> +        enum:
> +          - qcom,mmcc-msm8994
> +          - qcom,mmcc-msm8998
> +          - qcom,mmcc-sdm630
> +          - qcom,mmcc-sdm660
>  then:
>    required:
>      - clocks
>      - clock-names
>  
> +allOf:

Earlier if should be put under allOf as well.



Best regards,
Krzysztof
