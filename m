Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1321474EB52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 11:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjGKJ7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 05:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjGKJ7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 05:59:07 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12651735
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 02:57:38 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992acf67388so633836466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689069456; x=1691661456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWka34Gw82nr/cFSWzXWk0N4X377rpeIdKu/sRdqI3w=;
        b=E1S24mQwOCmHBBy4DRz23P23yqDhq4uQrWy8X+IpX1HgWvgkeoZGsrBB2i8xYNJHHM
         xlurGXGi5+SjP8v3G/hEvZe0C+M+f66ThjHsH4P+pX9c/3M8Fci/ZNBvMek7IyA4HTOJ
         MPMOXUu1nCzSWFL+cFpgZFhVMg5sftDhY0mCg11oRSjMlEK4wlQlhOuHPb19J12NtjU5
         1kVvl4of2Hl53/F0KLI/r7bxd+x3RAmU3+D3Adf/AvZZxcXSaFO1plhemYa++54LP1bY
         XjL25qbN6DhcAUZ0tjQ4rFYbrxcgRjqztmb0BYCyRB/+W7zvT4v7c25HXZYcgzLcsrTL
         Sp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069456; x=1691661456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWka34Gw82nr/cFSWzXWk0N4X377rpeIdKu/sRdqI3w=;
        b=RWFmQ5OFi9InBj30zg+aQefDZieoEKTjbznxoGS4nJlJZc7lL0fy9YHCWDA92p64mE
         YyX1Z+ESwnsjlPYCy29KTmhxkEig803GsSB3QrFXNSn7ZxbKBa9/JoyHIJEwZPzLUzcI
         FOBSiZzkaDEPhKn1DBBkvVW2XZSa1bgQ5pWzw+nPh8fpx9KJsXcLeq1Rtx0z7THQ1PUP
         mHE0otpnaIFA07QC2C2VSHB09qkcSRHKaJ/uhKcsFx+Oj8HijXd2YiQ0U2u5D/S7KEiB
         4PaYp92Lgvx7JDI8KX0W8ALasQcqiEFbVtBcsa+E+3b2KVpmh4Wiei/1fHOJp4PHrac7
         D+Ug==
X-Gm-Message-State: ABy/qLbEQbTu0/Mhacqc6x9yJsjKGR15UUY3qodKdXTKxKwVGbjmPXuD
        FIrR7y8mfLkjoIlXdV2qgP69ZQ==
X-Google-Smtp-Source: APBJJlGrct9CF3NdgozgtT88PsYl+iuo0rr8yPDlmRTaY5g+azPTKOqK7kxmUAT7dEu+Y7gYM6DatA==
X-Received: by 2002:a17:907:12ce:b0:983:cb6c:8aa3 with SMTP id vp14-20020a17090712ce00b00983cb6c8aa3mr13056484ejb.59.1689069456550;
        Tue, 11 Jul 2023 02:57:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s10-20020a170906354a00b00982be08a9besm926457eja.172.2023.07.11.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:57:36 -0700 (PDT)
Message-ID: <05554015-6b08-c194-9d27-af5539e3ce46@linaro.org>
Date:   Tue, 11 Jul 2023 11:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: ipq9574: Add support for nsscc node
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230711093529.18355-1-quic_devipriy@quicinc.com>
 <20230711093529.18355-6-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711093529.18355-6-quic_devipriy@quicinc.com>
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

On 11/07/2023 11:35, Devi Priya wrote:
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index f120c7c52351..257ce4a5bfd5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -10,6 +10,8 @@
>  #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
> +#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
> +#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -17,6 +19,30 @@
>  	#size-cells = <2>;
>  
>  	clocks {
> +		bias_pll_cc_clk: bias-pll-cc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1200000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		bias_pll_nss_noc_clk: bias-pll-nss-noc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <461500000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <353000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gcc_gpll0_out_aux: gcc-gpll0-out-aux {
> +			compatible = "fixed-clock";
> +			clock-frequency = <800000000>;
> +			#clock-cells = <0>;
> +		};

Isn't this GCC clock?

> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -620,6 +646,24 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		nsscc: nsscc@39b00000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

