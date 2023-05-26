Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EAD712DE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjEZTud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjEZTuc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:50:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022EEBD
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:50:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4eed764a10cso1203364e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130629; x=1687722629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bptdLRnlIF+oTqXFA/f6wS8sjlEr0Ke0jCvaGBA4+pE=;
        b=Bui0z+pRpvkINPAp8cS2BfqAj0tJiEpbXXMneIBGl3JEg7Pj/FoY4xunGNqZVB4jKa
         BPoNKhkx22Cn/tT2GZ1plWZx/v+ucMuHCsTPQ+VXxGdNAAdXC0NfhA3dQc0K+gXCAlzg
         Qx/x0o4/jp+TaH7M1PK+0M/2l4Pv+VdNGzajzlDEwkJ0gcmRIycY3Cza/TR1SNxyEwr5
         3vK7uWPkQuCcUPWgmlI/heNTerMkV6oFpaDZrMl+uaCjqolZrvCp4eF0BGB6+5cy9SfS
         inNwiyBCO6xW7MkwZY2aJUV5rxHIYFaMZZpbxqm3CmaP+zID87OVYSzUe/vtz0tLDVh2
         UomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130629; x=1687722629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bptdLRnlIF+oTqXFA/f6wS8sjlEr0Ke0jCvaGBA4+pE=;
        b=ZTHVoOsZKDb686ZV64zepkOXrZ8ylHgT/Ee3eIixd/yucbBTfpXXGfEpFg33vTVvZ3
         9lUOOh/MIo8+B7JCPDKODqGMgRQlQa1yl8RLMeSnMhFkz3xpuB9eI1Vj+yNbw0jXD28c
         rqeDgGX+l6RDpGGPpHGwk+KD44CDYcqeQfHpRPxOyT1d6LRl5200t92/GbHnk802GAjU
         lKgWuZGvXPgj0lJUEnrFw4nd8ThgHFj9n9hN7vrMm+VreSq6A1zESXGusCjGzZMP0T+t
         vOjl3mzRV8QHXd+8x0S9xyzxT3pXCZ0GKwjSpW54nFMf0m6Th9oquyrGaQ6VRhDA5dhe
         fN+g==
X-Gm-Message-State: AC+VfDyNq9VjnTA9PZA7OOJ0a/CsTn0IaU3tN6MCxcEN4VWNts8OCA5d
        ArHvEhDdUX8Zzyfhv3hSWC4h7Q==
X-Google-Smtp-Source: ACHHUZ7P53mmtIebsfVFiPAfw7IqoHPXyWIh60Vz4umL3ti79Xy60N1su2mzjUrd69LJuyDjzk1bIw==
X-Received: by 2002:ac2:5219:0:b0:4f3:8269:7228 with SMTP id a25-20020ac25219000000b004f382697228mr682943lfl.68.1685130629265;
        Fri, 26 May 2023 12:50:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id j5-20020ac253a5000000b004efae490c51sm750945lfh.240.2023.05.26.12.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:50:28 -0700 (PDT)
Message-ID: <e9adc0d3-922d-f4c8-6f09-94bdc44e6602@linaro.org>
Date:   Fri, 26 May 2023 21:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] arm64: dts: qcom: pm8550: add PWM controller
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-0-4d5d7602f290@linaro.org>
 <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-1-4d5d7602f290@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-1-4d5d7602f290@linaro.org>
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



On 25.05.2023 17:47, Neil Armstrong wrote:
> Add the PWM function to the pm8550 dtsi, this is usually used
> to drive RGB leds on platforms using this PMIC.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8550.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
> index 33f357a80636..db3d5c17a77d 100644
> --- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
> @@ -61,5 +61,15 @@ pm8550_flash: led-controller@ee00 {
>  			reg = <0xee00>;
>  			status = "disabled";
>  		};
> +
> +		pm8550_pwm: pwm {
> +			compatible = "qcom,pm8550-pwm", "qcom,pm8350c-pwm";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#pwm-cells = <2>;
> +
> +			status = "disabled";
> +		};
>  	};
>  };
> 
