Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A459A6C1DD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 18:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbjCTR06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 13:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjCTR0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 13:26:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A137E11A
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:22:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f18so15871643lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679332923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Raq8O1BpYR6JGiGBxCpGsCQBKvpbEqCHkdY+ulhmn9o=;
        b=NrVQeg8e3Geupb8DzXbFL2hkxp1Det1O3d8v4/zTPISko2/AS+CN7eWDVDGtt67ViQ
         UCK7rJ0Kx4cAe1j0UQMAiHV/fw+S2yCJv0DCA1YBaU/WIAk9ddBcBvYICQwYMq420f23
         tSWBe02xi7izadrMrMj5bkPdSjm7+rkjEF8m+doBmc1V3hi0kn/npYkKewpIx63fYcgp
         IMro2W5vpaCx7ngvfR/LC5TQLm8cCNvBpNNyGFEGuUSCT13k7cJVTCYgdr5jhCYkrSXI
         mAhmPra4bhJiDuGh46kIaHWCZdUiCtw4V3F0Q9hq1oLnsQuFkJK4qcZbWKlz8R9SdZxr
         AYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Raq8O1BpYR6JGiGBxCpGsCQBKvpbEqCHkdY+ulhmn9o=;
        b=3rvbL7K54JVfO17wHCYOWuyrNYgpb/SRXG6ir2tv9RVHJ+8VnF6/KjHF2wrN+vJ6s0
         7/b9wme83GLJWDm8spu8zrWZNrPHaBUEDZjbFVofi3Obx+BWQ/h4XJ3dthtxRsCyVHlj
         dUsMGL+nKuP6+p9HOvY/2jCopQLwb+VQB+C/muIXnDQphHiLEuXvvtmpmHdckIf7eri3
         dMk/UxlgE5UlVnlR6t/4Enrq6IK0hhc8h/3kHOoMsERud52Hh94pFZ/fb0LCaKky0+Kk
         pcbgalA0o+Cw6I1PXwGh8UClylBsk9C1InclNcsioD9kSF2WqEkQyaDYlUkmIMWSyu+m
         JpgA==
X-Gm-Message-State: AO0yUKXv/3wQyz977v++f7SgYeLkrJpLnWg6QAxB1HbnFAGJfzxVI8Mn
        ynOo5rcY6ktJ9F4lEYIUPin1IQ==
X-Google-Smtp-Source: AK7set8Z9rIrHdTAl6FJ9VY2Mz1u/zkoZnCob/B3dprt2/JyudxhZG9ghpnOh5oeCYSl9hYETPLoFQ==
X-Received: by 2002:ac2:5391:0:b0:4e8:410d:9aef with SMTP id g17-20020ac25391000000b004e8410d9aefmr234499lfh.54.1679332923461;
        Mon, 20 Mar 2023 10:22:03 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y6-20020ac255a6000000b004b5634f9b9dsm1771275lfg.115.2023.03.20.10.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:22:03 -0700 (PDT)
Message-ID: <bb0863ed-c232-f124-ad58-9a9c4cfffce5@linaro.org>
Date:   Mon, 20 Mar 2023 18:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 05/15] arm64: dts: qcom: sa8775p: add the spmi node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230320154841.327908-1-brgl@bgdev.pl>
 <20230320154841.327908-6-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320154841.327908-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.03.2023 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the SPMI PMIC Arbiter node for SA8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 797af99227e4..8218abb78ace 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -632,6 +632,28 @@ pdc: interrupt-controller@b220000 {
>  			interrupt-controller;
>  		};
>  
> +		spmi_bus: spmi@c440000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c440000 0x0 0x1100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x100000>,
> +			      <0x0 0x0e700000 0x0 0xa0000>,
> +			      <0x0 0x0c40a000 0x0 0x26000>;
> +			reg-names = "core",
> +				    "chnls",
> +				    "obsrvr",
> +				    "intr",
> +				    "cnfg";
> +			qcom,channel = <0>;
> +			qcom,ee = <0>;
> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "periph_irq";
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		tlmm: pinctrl@f000000 {
>  			compatible = "qcom,sa8775p-tlmm";
>  			reg = <0x0 0x0f000000 0x0 0x1000000>;
