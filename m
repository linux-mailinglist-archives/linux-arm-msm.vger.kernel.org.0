Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642B36DB445
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjDGTdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjDGTdt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:33:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81129C165
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:33:46 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k37so55654897lfv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680896025;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AChqIZPu5zIXtxq6IuSpeQ9+gNcw1j25CeQVyf5pSTo=;
        b=mrUP1IGbZDBIk6rqj/QPWb5CtJcaIR1d+ALz6OQ2pVeST//07ElEavHi9xF1Z+/zAW
         5H0DApG3475Mi5OM0G0f6QSSw8G6PhR8S8/VNqfkTIJQnI2y12qKaGrwCl9+u2q7L8TN
         dlUxB2kvpUqz348i5wwirOCeaIwwHSd+QyCE4kHur/zZOFbKItsTaD7rI3Sn20seE7Cg
         MFjERtsdJPSVS/4RGk7m5hewwWjvdi0i0veYAq6+RXr7LomrSEw5X5mMyKuPhU23KTOf
         GJ82guzwz7JeY0RfAKPUUpnK2QmvA0slKz88RNIY5e9ipHfiop7uPUTFiiEGtGgyJlZ8
         LZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680896025;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AChqIZPu5zIXtxq6IuSpeQ9+gNcw1j25CeQVyf5pSTo=;
        b=Mxt7WVWfSAyzhpUe6HnPOY73RJ/FOp0wwSfOGY/QTjk4tlKDiyOzxnx+J7Q7T0m4jx
         BHDoRMRv8kv6Lih+wVWC3MKnjCUv0sH7gviQjiTlWrH+lS7flm4Sbzv76gUpAVxXIVL6
         H2jU12g0ZNSWERzIDswLLslZx9IiG5B422b9TGE3jXtjOCLVYY1D5Yi2jI/px6e3ygKB
         qxMU0XIWBUFLuCzUypPxeQThEr3O1CrvaZrAcEOugYCtz/a9hxdgz9XuBNxh8uwlINNU
         3VLr+OY105U2XDLaopLEbq+LbQ1N+M8C5IYks4hOQWuyRJ9hKlBJ1eymU2WWyiO8A7LR
         s7xA==
X-Gm-Message-State: AAQBX9dkqEIULfmXzDxCwKTZJdwlid5b8j3TD+T0HW5idDM5q/Hn0NGL
        KOM8fPjP6XEs8Bj8EhMkqyi45g==
X-Google-Smtp-Source: AKy350b02pcZauxxys7qCmWgdH2MI8xlPuOqXTYabkBJVmG9ebI4W2Yo4Of1RWqWFD04nIB0rsVlRw==
X-Received: by 2002:ac2:560c:0:b0:4cb:280b:33c9 with SMTP id v12-20020ac2560c000000b004cb280b33c9mr1004410lfd.24.1680896024649;
        Fri, 07 Apr 2023 12:33:44 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id v30-20020a056512049e00b004e8508899basm835169lfq.86.2023.04.07.12.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 12:33:44 -0700 (PDT)
Message-ID: <fc51155e-9538-3a81-98ca-da8722462b71@linaro.org>
Date:   Fri, 7 Apr 2023 21:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: move DSI opp-table out of DSI
 node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230407192605.168666-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230407192605.168666-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.04.2023 21:26, Krzysztof Kozlowski wrote:
> The DSI OPP table on SDM630 is used by one DSI0, but on SDM660 is shared
> by two nodes (DSI0 and DSI1), thus it should be rather in top-level, not
> in DSI0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> A cleanup patch to commit a2e5260d0755 ("arm64: dts: qcom: sdm630: move
> DSI opp-table into DSI node").
> 
> Follow-up to:
> https://lore.kernel.org/all/20230407163442.ckbd4vxa5b2xu3eu@ripper/
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 38 ++++++++++++++--------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8bdb36a63474..b91e423a3cfc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -328,6 +328,25 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x0>;
>  	};
>  
> +	dsi_opp_table: opp-table-dsi {
> +		compatible = "operating-points-v2";
> +
> +		opp-131250000 {
> +			opp-hz = /bits/ 64 <131250000>;
> +			required-opps = <&rpmpd_opp_svs>;
> +		};
> +
> +		opp-210000000 {
> +			opp-hz = /bits/ 64 <210000000>;
> +			required-opps = <&rpmpd_opp_svs_plus>;
> +		};
> +
> +		opp-262500000 {
> +			opp-hz = /bits/ 64 <262500000>;
> +			required-opps = <&rpmpd_opp_nom>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible = "arm,armv8-pmuv3";
>  		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1591,25 +1610,6 @@ dsi0: dsi@c994000 {
>  
>  				status = "disabled";
>  
> -				dsi_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> -
> -					opp-131250000 {
> -						opp-hz = /bits/ 64 <131250000>;
> -						required-opps = <&rpmpd_opp_svs>;
> -					};
> -
> -					opp-210000000 {
> -						opp-hz = /bits/ 64 <210000000>;
> -						required-opps = <&rpmpd_opp_svs_plus>;
> -					};
> -
> -					opp-262500000 {
> -						opp-hz = /bits/ 64 <262500000>;
> -						required-opps = <&rpmpd_opp_nom>;
> -					};
> -				};
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
