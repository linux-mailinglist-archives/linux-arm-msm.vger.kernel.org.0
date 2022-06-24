Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B400559DED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 18:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiFXP5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 11:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiFXP5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 11:57:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD38CA
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:57:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id h23so5533008ejj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0znaSH1nVDQVgpmhIs5rMZ+BhzfTMBgXnaj++3f6TvA=;
        b=UUDhsj7ULQ4PeB1uK/kA0qMYQrQCzC2Q3ohlToCDL7nhXdNBxMnMtVTpAdQLeAc4I1
         +DwPkd5y5zGDJmLek29RAQqVRY7gw9qJyJ2AiSNkC01EpHsdYA5QMenCdBQ8/oOsH+Vs
         zKjYVpEe9FFC14Qanxqs796VdF+iYFfhgJG3+0sPOIOAP5XEklw94uwGN5A9wqOC6evK
         Pxfvw3NCUqiH/qcBLXTGdQPB2AC3zfrvKLOyvcHTaN7tIvG08Gmh4lDS9Wt5laR58Tgl
         bEXkI8OjrvJF63CZj0OIGpEgH+vYn54o/mMBPXUwckT2Sm1MN6970cs4nw0W7AR2J0IA
         lJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0znaSH1nVDQVgpmhIs5rMZ+BhzfTMBgXnaj++3f6TvA=;
        b=WVLCMYnTPt/fkLcEScZ14cAoP7jyOiTQL1sHnj1Nm4ERlHF9eDWXOzfDSvRVBr+UaT
         JMwGDAkCZcxmXVH/vz3upc1gcMaStAW/Gv+IrXMZkmT+fJprF/LwH961aWx7fH/3XTCH
         bJRYoZ+0eFx4dFgFReaahk5+EancChZr4S7uW60us6ai2s186JyGEo+Hi7vITNCBf9kq
         qNriS4li9rjw4pSZ/hCXEfNEYbA8TIZxCCJkDKESMwxUmxLEmojnZBuKaJspIh1J7n6f
         TDA/I/TLO58m8ZRjvqd6DvK9/p3Qn2rec5O703Ol986XjOuNmyikVN8jKCbpaMXh2O2v
         tZBw==
X-Gm-Message-State: AJIora8MiLxMnkNRWV1ehBiqI+LXH8D2bziCk92mW9xT+6pOD39W42eJ
        rEgaQ2mtaXQsds245mI4/j6xEw==
X-Google-Smtp-Source: AGRyM1vjjpp5meQC7xcv51xr6LCMNiZJlsPCBgY2/hKwi7VZpdAAhayWVqXgkaik+O5RtfsZw04bug==
X-Received: by 2002:a17:906:6c82:b0:709:f868:97f6 with SMTP id s2-20020a1709066c8200b00709f86897f6mr14365853ejr.555.1656086271135;
        Fri, 24 Jun 2022 08:57:51 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n3-20020a170906724300b00722e660f16fsm1380209ejk.23.2022.06.24.08.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:57:50 -0700 (PDT)
Message-ID: <21efbf73-74af-8f80-3577-b82f39e161e6@linaro.org>
Date:   Fri, 24 Jun 2022 17:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8960
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
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

On 23/06/2022 14:04, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8960/APQ8064 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> index d02fe6dc79b5..c13243682365 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> @@ -82,6 +82,37 @@ then:
>      - clock-names
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mmcc-apq8064
> +              - qcom,mmcc-msm8960
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board PXO source
> +            - description: PLL 3 clock
> +            - description: PLL 3 Vote clock
> +            - description: DSI phy instance 1 dsi clock
> +            - description: DSI phy instance 1 byte clock
> +            - description: DSI phy instance 2 dsi clock
> +            - description: DSI phy instance 2 byte clock
> +            - description: HDMI phy PLL clock
> +
> +        clock-names:
> +          items:
> +            - const: pxo
> +            - const: pll3
> +            - const: pll8_vote
> +            - const: dsi1pll
> +            - const: dsi1pllbyte
> +            - const: dsi2pll
> +            - const: dsi2pllbyte
> +            - const: hdmipll

The clocks are listed in properties, so they have min/max constraints
set implicitly. Are you sure this now works fine?


Best regards,
Krzysztof
