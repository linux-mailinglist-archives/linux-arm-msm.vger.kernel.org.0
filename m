Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8545F1B15
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiJAJPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJAJPd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:15:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13FD1274A
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:15:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k10so10184364lfm.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iB0ZOJ/EzFmy8M9eEoUTb+yBwqeKglSWW3sGNz4cu5Q=;
        b=pak97a+Lw6I/k8xhOBygrY7V1Ia+m20kIYnE6KJHT/ruDuZ7oArpWtxM8g95UUAVlT
         9g5awpmxoAE6TXsnkOdBa4oizCJzRsZGCLqK1z4NMdY9y7ocFc3xFJw9IPPZCIfynb4Y
         xUzn3PGxc+T9qE9+UM4Z5RwOs75+pcrgmsa3x0kTRdaKJR032i+mTE8c9Ubc7z/vFgUS
         oO0ppdC9COU+JI0w0bCvVQTFiboGQRngtVMo6cBk6kDiVqrIU18hFJjsKhvizOcs2eh2
         Y6/qTvlv3OBOYxeCNHWKEPvfhsld1k3YOikwApH/k+VT3/OQ5nCaXqnYGuDwgTZzHTYc
         DFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iB0ZOJ/EzFmy8M9eEoUTb+yBwqeKglSWW3sGNz4cu5Q=;
        b=ThRFzO5d0Dw0SDoG4TEE6+0c8oyGqYO/6035nNMBbQ0byH7AfqHrEWikLU39+kRlRe
         0El636VJWmQYfuQz+V82Ak84lRsaY97ReithLjLTRIQepICiADGVG4bEYpzOWM0xqr/I
         GrVXo/cOSNXGpQ/DQio0oJBz0yQl7HJeAGN1mfZC/zNExRI5hUDDCU5wXwarp1dWpiEU
         WWhVQQh0tZU8Pm6rOaCCde3v8pVYcxYv+CmPOkQIq9xmSLtIdq8iiFMfoUxox6j8F6b1
         G2D4LYD8v73BO2DT8Rcq8isYcDayB3JL/iC7ozFsXS2mDkXwpNHDdu+jdefFOlpVs1OS
         GqnA==
X-Gm-Message-State: ACrzQf3Q7irepMaGrAzLGjXeVCfW+HOBWpeU0EL3O8L2AsmHtRS++K6/
        V0Ehyq6Nx88gnojBiR4I5+VSLw==
X-Google-Smtp-Source: AMsMyM579fnuTY1d1c47LsKNK1446Uh3ikON5K1qHo2+iY+JiVXGzQC4zXVe/ycQJ9HAKDRJhIitFw==
X-Received: by 2002:a05:6512:b85:b0:499:202a:bde9 with SMTP id b5-20020a0565120b8500b00499202abde9mr4767002lfv.550.1664615724691;
        Sat, 01 Oct 2022 02:15:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p26-20020a056512313a00b004917a30c82bsm694177lfd.153.2022.10.01.02.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:15:24 -0700 (PDT)
Message-ID: <85d9efd8-41b2-f726-feb7-d934bde2c66a@linaro.org>
Date:   Sat, 1 Oct 2022 11:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 08/19] arm64: dts: qcom: qru1000-idp: Add RPMH regulators
 nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221001030656.29365-1-quic_molvera@quicinc.com>
 <20221001030656.29365-9-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030656.29365-9-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 05:06, Melody Olvera wrote:
> Add RPMH regulators for the QRU1000 IDP platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts | 200 +++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> index ddb4ea17f7d2..8d27923dc470 100644
> --- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> @@ -5,6 +5,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "qru1000.dtsi"
>  
>  / {
> @@ -19,6 +20,205 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	ppvar_sys: ppvar-sys-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ppvar_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&ppvar_sys>;
> +	};
> +};
> +
> +&apps_rsc {
> +	pm8150-rpmh-regulators {

regulators

Best regards,
Krzysztof

