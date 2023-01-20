Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFC167533E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 12:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjATLOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 06:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjATLOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 06:14:32 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E702D45
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:14:27 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id rl14so9740773ejb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2X4s4BtpK/aJlH6LhfyKD6YkP3AiRfVscHdOk053Ic=;
        b=vjmUzd684UTNTFfBD6QCvS7yvGk6EDhT1p3tYE7wbGgEu5GiUVB+ovpOdfK1UtAR9M
         X9a5Y3G+iCMeMiX4iJ2sbKcMY/URztUrVK/21T3qNssiKBzTakBPnGD1/U7ILgu8YpIg
         VVj2E7rCyUzf56Qn8XZIxDjxgQWfw9aFKtrcjtdGIaMoUp0WQuJlrF+4EeqcW0ytnG8g
         zuri/9Y1cDLF7FROPiGo6d6rV7y3roRVOdJ/NrBT+m1Av+nmM7pzxl5YE+S2mjX/1BJ9
         d1TdJR7aRQiBMhH8aZmLCTQcCDL7gJzH84yk373PhOkZxhBnemh5AFzYFx2fHJC6mGco
         ZMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2X4s4BtpK/aJlH6LhfyKD6YkP3AiRfVscHdOk053Ic=;
        b=hlOyEfH3Vox5WeSKZHB5x4HeqvxrBUH/LTJm4Qa9P2fcyxrhyyp/3ZMmvnvIRusH91
         7isuNgTMbA3EEZzYffULfdcK4F/N3RHWPDGKx398xe61Q2L/iQy7i8ibC9Zt0V/n9s9U
         7s5xW9Han+piHzBgJr8TckVhR19xXdnDEj+TKFrzZ1qKxCp3LiumPVal18tYjf2QfmI8
         9l9sly9QlUUWC8eDrtm0gJ1s9vnNwv5ZszLo5OS5ZHcrhgVvtc3whkNUm5vfTMz89VpI
         Brn1ChjbSQtBvyVfmgxmQYpH9G5K+G+bM4DXXHthG7BPO21/0Pej09/6HYth6eFqkyrs
         dXfA==
X-Gm-Message-State: AFqh2kojTlsE+9W+K97fx3WxqpO7WGw63V0IsHmbat0AY38A1hZ0EP/O
        Ftdd7Sve5aFgLTs09oSUmGl21g==
X-Google-Smtp-Source: AMrXdXvknQ0f7UQ0UYNxv8FK4qT+LCFtsjtVVHNCvOtv0KsLw++TkHUNbKKRJ+1WApT7aQniVff0wQ==
X-Received: by 2002:a17:907:a2c6:b0:7c1:92b2:fa9e with SMTP id re6-20020a170907a2c600b007c192b2fa9emr15504854ejc.59.1674213266512;
        Fri, 20 Jan 2023 03:14:26 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b0073d796a1043sm17512602eju.123.2023.01.20.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:14:26 -0800 (PST)
Message-ID: <64e32ee3-404e-3832-c451-a758db12158e@linaro.org>
Date:   Fri, 20 Jan 2023 12:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230120061417.2623751-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.01.2023 07:14, Dmitry Baryshkov wrote:
> Add device tree node for the CBF clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4427305f8a94..6f180a8efe77 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3572,6 +3572,13 @@ saw3: syscon@9a10000 {
>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> +		cbf: clock-controller@9a11000 {
> +			compatible = "qcom,msm8996-cbf";
> +			reg = <0x09a11000 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_A_CLK_SRC>, <&apcs_glb>;
> +			#clock-cells = <0>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
