Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F473C735
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 09:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjFXHCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 03:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjFXHCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 03:02:00 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D704E26AF
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 00:01:57 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d5569e4d1so371004a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687590116; x=1690182116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rstg4NpttCkFKjk4xPOPy5qzsYOhiiNR5cuB32vmPTU=;
        b=xCetTBRI+jYa1hkw8BFGBLtJgUWF0KulNspNAD2p6n2aAKdWT3J+pzJk4UFWiurGQ1
         XvDFEQcrKWqde35nugJ3hu3vRP/S5lPM9fs23Jav2N/fsF9Ji4AVxmEb1SwfY4kpQAsR
         8UcNVk1xTl/iMcwh0lqjT/IxnZB/2/fL/6kTrYcJE9xi8uhd+z4ijDwUXW6IVyf+1zeJ
         ZCFD4kBl6ofbubatr5AdgaURaA8eJR6AjiefEpHnMT6HASIpA5C4j2DcRS7TtJRzFnkJ
         3nArBiKbR7RRS5Kk2RFYbWOaihX62SJjf9ZLZOvkIOPuSgwzVeYhsUNV744EXvYWW9X9
         OfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687590116; x=1690182116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rstg4NpttCkFKjk4xPOPy5qzsYOhiiNR5cuB32vmPTU=;
        b=OiKrWe8gRph4yyXfF2KGv8sF8Czqja3FUKUm2wdWwNYud7M9Mv2vLbL8XkiD8l/cs/
         1AjC44JA/YrQygcJxNXSYWY5oRY1dgltxriuogxUpP3gh4puvaZLegXwnQ7BZJ8MiOXH
         bKPojtb2cp8vaJ+J4yA3inOKwhF6EBcIaaguYQZ0e6tiq306at2QQXgj6k1RcwmfTeTn
         R61lOICpeyCfCX/e7l0Zeoo7rD3K2VVfFIdlYX+yBJ69v0nQXsZdRiBQ/yx7BYNt5lSX
         vommzZQlx4s1l6hgfhrI9eCUR5p/eLPkauj3ZcHJjyJFGwl2xibA0O4N4mfWETC14N7Y
         x4nw==
X-Gm-Message-State: AC+VfDwmF1/ja2icwCwO5Lw9y/i2cLJ6j/SMJFPrB3TH9f+QJA3ugGHN
        EsD2CSf4aZIQgELUMckD7fnCxA==
X-Google-Smtp-Source: ACHHUZ5QlyQLJpJ+SDCgTV0vCOMYhcaQ7VpHCOj3aJd7W47UVPI8CTRjhYnV64/SRx8cnsrpCDrIVg==
X-Received: by 2002:a17:907:9812:b0:98d:10d:a51c with SMTP id ji18-20020a170907981200b0098d010da51cmr6420472ejc.75.1687590116254;
        Sat, 24 Jun 2023 00:01:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o18-20020a170906289200b00982b204678fsm537134ejd.207.2023.06.24.00.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:01:55 -0700 (PDT)
Message-ID: <8d21467a-83a4-8478-dbf5-edd77461e6dc@linaro.org>
Date:   Sat, 24 Jun 2023 09:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V2 13/13] arm64: dtsi: qcom: ipq9574: Add nodes to bring
 up multipd
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-14-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-14-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Enable nodes required for multipd remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V2:
> 	- Corrected syntax like alignmnet and kept nodes in sorted order.
> 	- Added 'firmware-name' property.
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 118 ++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 0e04549c69a5..ff0da53ba05f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -160,6 +160,11 @@
>  			no-map;
>  		};
> 
> +		q6_region: wcnss@4ab00000 {
> +			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
>  		smem@4aa00000 {
>  			compatible = "qcom,smem";
>  			reg = <0x0 0x4aa00000 0x0 0x00100000>;
> @@ -697,6 +702,95 @@
>  			};
>  		};
> 
> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq9574-q6-mpd";
> +			reg = <0x0cd00000 0x4040>;
> +			firmware-name = "IPQ9574/q6_fw.mdt",
> +					"IPQ9574/m3_fw.mdt";

Here and...

> +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 0>,
> +					      <&wcss_smp2p_in 1 0>,
> +					      <&wcss_smp2p_in 2 0>,
> +					      <&wcss_smp2p_in 3 0>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			qcom,smem-states = <&wcss_smp2p_out 0>,
> +					   <&wcss_smp2p_out 1>;
> +			qcom,smem-state-names = "shutdown",
> +						"stop";
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
> +				label = "rtr";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +			};
> +
> +			pd-1 {
> +				compatible = "qcom,ipq9574-wcss-ahb-mpd";
> +				firmware-name = "IPQ9574/q6_fw.mdt";

... here - why do you have firmware in both places?

> +				interrupts-extended = <&wcss_smp2p_in 8 0>,
> +						      <&wcss_smp2p_in 9 0>,
> +						      <&wcss_smp2p_in 12 0>,
> +						      <&wcss_smp2p_in 11 0>;
> +				interrupt-names = "fatal",
> +						  "ready",
> +						  "spawn-ack",
> +						  "stop-ack";
> +				qcom,smem-states = <&wcss_smp2p_out 8>,
> +						   <&wcss_smp2p_out 9>,
> +						   <&wcss_smp2p_out 10>;
> +				qcom,smem-state-names = "shutdown",
> +							"stop",
> +							"spawn";
> +			};
> +
> +			pd-2 {
> +				compatible = "qcom,ipq5018-wcss-pcie-mpd";

This compatible is confusing for this device.

Best regards,
Krzysztof

