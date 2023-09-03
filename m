Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB7B790D31
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 19:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240583AbjICRP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 13:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239054AbjICRPz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 13:15:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D118A4
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 10:15:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007616b756so1266252e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 10:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693761350; x=1694366150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJwefvRRezzyOJuabSLTNd0jvQ1IGShoVUuCvnVRcjQ=;
        b=DxLKzcTnJehykwpAy7DP/ubp/dHB1TJwOZEPaKkX7J9At7u7RzqG5oqc1Ko3BVBMbL
         ffW2jz9BdHCl9UiUh3Ar2pyQ9YDpdxd9BoyrHRctGP/Q/V3V2s/pG3worHY06TiYAk8v
         dct6t5mMuDn4QfD64S9Ww7n4LqAh/QhZGSyuHSF/7mhu0/8rTvUph9rLfIX7J6PGACEO
         idT6OmrwkMrs6tLU4KHZdk190nE3S9xIW4ie1zTb0E1ZYEcGfhEZ3CVbcSzHyRMTLw4R
         RXv7CEytAwh6O9Xh35cS7bo2J6yOe/YWfq2yk+JwCHguPIYBHiYql2/qXprMT9K1381W
         mp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693761350; x=1694366150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJwefvRRezzyOJuabSLTNd0jvQ1IGShoVUuCvnVRcjQ=;
        b=PoXNt5ROW1XkPJHDvXikFciQz08ISz9k1Q5wjk3u2GzpV92Pm0ym1olWkk3QvAzApa
         k1hoBh0NdSYAbxKIzw5oDDjSVAVHt7dRMwD2GP7KuqIwCKwjoI07GCtN3QWhoCy0h6He
         L5NwbXF+pu+jmJ9SuAWjV7xiKuu5pq4+5qYBAQDH1t67I9FyU1whKipdXhT8OptqSOx0
         SMn6GuN0XA/jbHMHETAEB80IUjkAI7P7PVYpumDtMpGdrhrFfGqccwAvCWt7rOTsT5Sm
         cv18gkgevD2ACutiXP2yI6aKx1t6SFfUZHp9FIx7W3DmgOvqMW07Tvn3d6AQtd+0cTWf
         c8rA==
X-Gm-Message-State: AOJu0YzWwb19UzH5Afq7Kbz+Bo/PI8p9gsiarrleLPwMxRqhPdb5PN7h
        rmHrMQNdVrm2tIbbTH78NqxljQ==
X-Google-Smtp-Source: AGHT+IEl4Pt/A/Yz3HLJlboBX5hQjv7er3r94xFxqs7kVUIaYkZf4gwzU1lWcDGQ/z/Sbq3jTfLKTg==
X-Received: by 2002:a05:6512:1282:b0:4fb:9f93:365f with SMTP id u2-20020a056512128200b004fb9f93365fmr6751822lfs.38.1693761350106;
        Sun, 03 Sep 2023 10:15:50 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id rn1-20020a170906d92100b00992665694f7sm4971043ejb.107.2023.09.03.10.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 10:15:49 -0700 (PDT)
Message-ID: <60af38bd-88a0-4586-f729-ced907492b22@linaro.org>
Date:   Sun, 3 Sep 2023 19:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3] arm64: dts: ipq5018: Correct uart1_pins pinconf
To:     Ziyang Huang <hzyitc@outlook.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        quic_gokulsri@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB5556D24A77DAFA013F93B551C9E4A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR01MB5556D24A77DAFA013F93B551C9E4A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2023 16:10, Ziyang Huang wrote:
> In pinctrl, the pinconfigs for uart are named "blspX_uartY".
>   X is the UART ID. Starts from 1.
>     1-6 are in BLSP Block 1.
>     7-12 are in BLSP Block 2.
>   Y is the index of mux config. Starts from 0.
> 
> In dts, the serials are also named "blspX_uartY", but with different logic.
>   X is the BLSP Block ID. Starts from 1.
>   Y is the uart id inside block.
>     In "ipq6018.dtsi" and "ipq8074.dtsi", it starts from 1.
>     But in "ipq5332.dtsi" and "ipq9574.dtsi", it starts from 0.
> 
> +-----------------+-----------------+-------------+-----------------+
> |     Block ID    | ID inside Block |  dts name   | pinconfig name  |
> | (Starts from 1) | (Starts from 1) |             |                 |
> +-----------------+-----------------+-------------+-----------------+
> |        1        |        1        | blsp1_uart1 |   blsp0_uartY   |
> |        1        |        2        | blsp1_uart2 |   blsp1_uartY   |
> |        1        |        6        | blsp1_uart6 |   blsp5_uartY   |
> |        2        |        1        | blsp2_uart1 |   blsp6_uartY   |
> |        2        |        6        | blsp2_uart6 |   blsp12_uartY  |
> +-----------------+-----------------+-------------+-----------------+
> 
> In "ipq5018.dts", "blsp1_uart1" (dts name) is the first serial (confimed
> by the address), So its pinconfig should be "blsp0_uart0" (pinconfig name,
> use GPIO 20 and 21) or "blsp0_uart1" (pinconfig name, use GPIO 28 and 29).
> 
> Fixes: 570006756a16 ("arm64: dts: Add ipq5018 SoC and rdp432-c2 board support")
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> ---
> Changes since v1:
> - Use corrent name in From
> 
> Changes since v2:
> - Define 2 pinconfs for uart1 in ipq5018.dtsi
> - rdp432-c2 use uart1_pins_a
> 
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  2 +-
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index e636a1cb9b77..e83d1863e89c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -23,7 +23,7 @@ chosen {
>  };
>  
>  &blsp1_uart1 {
> -	pinctrl-0 = <&uart1_pins>;
> +	pinctrl-0 = <&uart1_pins_a>;
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..50b4a2bd6fd3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -103,11 +103,18 @@ tlmm: pinctrl@1000000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> -			uart1_pins: uart1-state {
> -				pins = "gpio31", "gpio32", "gpio33", "gpio34";
> -				function = "blsp1_uart1";
> +			uart1_pins_a: uart1@0 {

Regardless of other topics, change to @0 is neither correct, nor
explained in commit msg.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

