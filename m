Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32786A8217
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 13:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCBMYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 07:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCBMYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 07:24:32 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27D94393B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 04:24:30 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h3so17374810lja.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 04:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677759869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqLaFAf1dwFLOItVe5wlOCtA9xzVuz14IXVrHD4e9hQ=;
        b=SCy9XQG4sAQBw5N9xulyUEbXfQ9s3TwWBLjm/6BJsGVh7UhK3pipzRPmqwqfH2W49T
         88EhqbADfKCL4WJqNw6ZEp1Qf87PfKIg3pSwq5r6cxEWBifg/DoFHrC6A5ntFQJFlPJt
         tVkZqXT++yG4nnR3Cxi1MidPP1NqgEhozA83E6bWqFTuaioWok6O2I6GgZIbZjpxVH3b
         rVkxaFeUFhsQxoqCwXjjNgUk+EC+470nrNUre0bBKjqqGCfhWcBBS1/BA+5QgCr4o+Lx
         7M/5fTYAliJtEBzKL2gZvSmCRh4uSB+fhsEa1z+vk21uviwER96L3Lxfxu4QpeGbEsyG
         Oezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677759869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqLaFAf1dwFLOItVe5wlOCtA9xzVuz14IXVrHD4e9hQ=;
        b=ZDzcTWEFlqvk+Tsh4V6yEvliplmgEj624cAYo41hZG90a6r3tRB3PlLGC9mGhMOEgM
         FDOvGzxCCr9cW+WBTW0gC1OJlba+TUTBkq90Ba126uxUQtO5QVQvs8NFOLKM2bdQ5fJJ
         izQU7GKe1hm8mV8pmscASOqbFhJeureTxhNLJ7cGh/rb6kD5SucJUpKSM+4j+twwkf8G
         6srvq1wXtgHh1jONGpxY6pzwl5Ae1SiLPrsicIYuJCfD4lm85YsrkMBEDVtx+TATb85D
         +YgGQDjEGdBjsqnESBEGlC2jzGXQ26yV/Z2D8C2krG65UIzKFn9bQcUE4P6gYWsBw04V
         NHew==
X-Gm-Message-State: AO0yUKVypX3pGl1eZJSVgOQSGtmtNxTUzyDk2Kw2fnIBI51nnZ/Moxhd
        vw8mDVW14gwQ4hfv3OBam2OEfg==
X-Google-Smtp-Source: AK7set8v63cnwxRzLSgnDdG75WJ17xPX4+FoIllQ8pmdRjckLu3wRwUVTnV0Yvkwzp1mA0COPLCbNg==
X-Received: by 2002:a2e:bc0b:0:b0:295:ba22:360 with SMTP id b11-20020a2ebc0b000000b00295ba220360mr4692390ljf.42.1677759869138;
        Thu, 02 Mar 2023 04:24:29 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e4611000000b002934be1a0a4sm2097125lja.70.2023.03.02.04.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 04:24:28 -0800 (PST)
Message-ID: <8e3af5b2-d012-9919-afc5-5fb374b556cc@linaro.org>
Date:   Thu, 2 Mar 2023 13:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc8280xp: fix lpass tx macro clocks
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
 <20230302115741.7726-3-srinivas.kandagatla@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230302115741.7726-3-srinivas.kandagatla@linaro.org>
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



On 2.03.2023 12:57, Srinivas Kandagatla wrote:
> Tx macro soundwire clock is for some reason is incorrectly assigned to
> va macro, fix this and use tx macro clock instead.
> 
> Fixes: 1749a8ae49a3 ("arm64: dts: qcom: sc8280xp: add SoundWire and LPASS")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 022b0c041341..fc1504de6890 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2020,7 +2020,7 @@
>  					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "core", "wake";
>  
> -			clocks = <&vamacro>;
> +			clocks = <&txmacro>;
>  			clock-names = "iface";
>  			label = "TX";
>  			#sound-dai-cells = <1>;
