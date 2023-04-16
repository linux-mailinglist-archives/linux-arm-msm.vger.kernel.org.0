Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027E36E3AD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 19:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjDPRrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 13:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjDPRrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 13:47:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AF41BC8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 10:47:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id vc20so3505107ejc.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667224; x=1684259224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLokfzlNojMHP5RULpm0PPlfSFmkgAd8KtMBzjye2kA=;
        b=DXQ0+QBy+uD+Kaw0R09e/BaqsSD2+OEoCFaXIN0VbBXYg3VvrC9PXpXtTa1z+1ybZq
         6NDSU6e+CrspUNrdkGEAsOPx3hAp37ZVv4TgLXQF7fnM9lvX5AzeLduiouTXrHggLsnB
         KH4VZ0NICEVLSyWqS509rtEUUz80hLMXs6wUJbB0m6Hj6Zi3J8YTNWXEqbBwJK2FWa8i
         n04EZOBFpU41BDgJ4dxEJiktMgYItmvJNuvFCU0+yDlCDj0rBAr+69j9qCtgRcGpFuHU
         j+l+Q4cTkVviAsQnpA0jNlAY4h5G4d1syzE2V7f2pNWVqZic1kHbdqVL5nuVtcb2hh0e
         8NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667224; x=1684259224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLokfzlNojMHP5RULpm0PPlfSFmkgAd8KtMBzjye2kA=;
        b=HAGKP3H3F2RuPRh3TIApM/IrQygdsR6CwvtWKV2zDVWqED+NbHhmcJYq5K6o9wemuS
         zEMdlrTSsNXcBM3lPNYszqJ1oTwFBVVMIdHpWlIXn438qXG1LwBWhp7uZ12hYHrxzPpq
         aYwLK1VDfoU80yznNMwsEq5rcELyvx1hx4KCAyewjaSnnE0Q8IaQFyLxJlgkjKo9pW+b
         hLNBRhvi3IZnWBJTB5u7Oe5AAMYvTELa/JRNTzditz9G4WTRF6ZTJ2jABq4X88PETBRC
         BvqCNUFU7rdk7hVALBFuq0u/10jrRU7+daSrI4Yhsg7Sw8vdA3wkCX0XQ6knQ7aO8Lsd
         k4vQ==
X-Gm-Message-State: AAQBX9dxMhgjLyrvkPVZhnNBbFaYecBv8Vx9IyNM7yM9Ii0H1a4LyvcR
        PKYIBgYXMA5v4DDpnXDLp2peSg==
X-Google-Smtp-Source: AKy350ZMWhDwk3nFL97E7KcgzIasIqK7TunNBqwCG63g6aTwvwEdUTxMEOlv5D4OJ+Aa9pcKzyR5YQ==
X-Received: by 2002:a17:906:d8ad:b0:94f:2c22:a7a2 with SMTP id qc13-20020a170906d8ad00b0094f2c22a7a2mr4077384ejb.68.1681667224631;
        Sun, 16 Apr 2023 10:47:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090606c300b0094f698073e0sm678388ejb.123.2023.04.16.10.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:47:04 -0700 (PDT)
Message-ID: <6ec55a3d-8b9a-2a44-6a0c-0dfc0100e88a@linaro.org>
Date:   Sun, 16 Apr 2023 19:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add ports as an optional
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 13:34, Bryan O'Donoghue wrote:
> Add ports as an optional
> 
> port@0 to receive an orientation-switch message from the Type-C port or
> redriver
> 
> port@1 to subsequently transmit the orientation-switch on once the PHY has
> finished doing its orientation turn-around.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> index d307343388888..9ef69ad12b74a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> @@ -65,6 +65,22 @@ properties:
>      description: Flag the port as possible handler of orientation switching
>      type: boolean
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings that model incoming orientation-switch and
> +      outgoing orientation-switch messages. An example of an incoming
> +      orientation-switch message might come form a Type-C connector or a USB
> +      redriver. An example of an output would be a DisplayPort controller.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Type-C mux orientation-switch input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PHY orientation-siwtch output.

typo: switch

I assume both ports are required? Could it work without input or output?

Best regards,
Krzysztof

