Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC09731C08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 16:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241244AbjFOO7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 10:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344812AbjFOO64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 10:58:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187842D43
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 07:58:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so10703287e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686841131; x=1689433131;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uft+CVcyQtvxjPemL6r4Oh7qCEnxqfPWZRaOgMtD3t8=;
        b=b3WfLv+Lup6DOzdHe6Srfh5BAIcCWkvoc2mcUHk0r60aOiS6EdMlX867mXgJXqWLQ6
         k1JJVDc++3yUZ8iXTutAiMLLJhpAi1qBDYxvOGYM2aBBd/H4lSJp3Sbox+zMjzUqA9Af
         KO3cZx9U39Bl5YxppN6kl8+Qx32cHhmVuhEfTXkgdP8UhDJj8clisCDarAhOSa0pk1Xw
         zlgAxuxt2wEM20wCjzL/958QAm9+yPyJhVCaNGCJsdomIVROfAaey7GPZxJhIqRh94sj
         2sI/9wwlZ0F0/ejs8vjm5GjhG6XkKU0uLAe+jVrqZs2RrWycJVp0LoLkEWBUZNInOuRr
         5RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841131; x=1689433131;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uft+CVcyQtvxjPemL6r4Oh7qCEnxqfPWZRaOgMtD3t8=;
        b=jQr0nCegiBtcp1XSwIW2erDwguYZtY3SAVIWIn0/Em4TTE1ynf/iFABiHho8sDOCy7
         kkL/kp17lWkJOJpj3c9bAR115lJuF5XLIFh4Mk82B7mfTbGCPeuaeVAH2h1NMm10UUiB
         dUi0PXcLKG19Qo4PvP2QqjV71Iqe5YN2RRezs/GISVXdnGQLGtY6l8zltIEmfxRAyLpq
         r2qsHd9mFE/PBZUwRi1lI1XS/jbP54SlwNdpFK7dSDbnKJhLdNKR7j5Xpj1D6BAwsvto
         jkoCnLaa11PrMZ4kuGJp9UpETYi8lJNV/Cux41oe0HZDZPQYN3mqUFQhyRlv+o7UTIig
         gSzw==
X-Gm-Message-State: AC+VfDzLTsVcZ+ioyH9IRQiMpcfsFfUAcRyrrqQ5KIFhVkfyji1L0wfu
        i93zYB0HlCCSPdIwTYHXQgK2KA==
X-Google-Smtp-Source: ACHHUZ6Wq8XrZsTRpYQDYV7g30Miws2XrVRZhDeCyISNAUewWWsY494u23i/SZrxY4QmWtbZF+UUng==
X-Received: by 2002:a19:e019:0:b0:4f3:ac64:84d9 with SMTP id x25-20020a19e019000000b004f3ac6484d9mr11836666lfg.20.1686841131255;
        Thu, 15 Jun 2023 07:58:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p3-20020ac246c3000000b004f004c0498esm2604065lfo.71.2023.06.15.07.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 07:58:50 -0700 (PDT)
Message-ID: <8a4f8af5-c181-6e30-bfb5-be25f77a51a0@linaro.org>
Date:   Thu, 15 Jun 2023 16:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: ipq9574: enable GPIO based LEDs
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230615145311.2776-1-quic_sridsn@quicinc.com>
 <20230615145311.2776-3-quic_sridsn@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615145311.2776-3-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.06.2023 16:53, Sridharan S N wrote:
> Add support for wlan-2g LED on GPIO 64.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> ---
Same comments as on patch 1.

Konrad
> Changes in V2:
> 	- Updated commit message 
> 
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index fd5326dc1773..25424cecd834 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -34,6 +34,18 @@
>  			debounce-interval = <60>;
>  		};
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&gpio_leds_default>;
> +		pinctrl-names = "default";
> +
> +		led-0 {
> +			gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "phy0tx";
> +			default-state = "off";
> +		};
> +	};
>  };
>  
>  &blsp1_spi0 {
> @@ -137,6 +149,14 @@
>  		drive-strength = <8>;
>  		bias-pull-up;
>  	};
> +
> +	gpio_leds_default: gpio-leds-default-state {
> +		pins = "gpio64";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
>  };
>  
>  &xo_board_clk {
