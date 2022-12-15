Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056CC64DC1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 14:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiLONTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 08:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiLONTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 08:19:47 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AE62C130
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 05:19:46 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c1so15615909lfi.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cF1K8h19SwoaL+H+wMzf1igK2zwK+4CVmKGZfHMVXA0=;
        b=CYhqFp9awOtIqq88padY/BvYAEbNELfE1BReY1kkBo0kwVO4/9gAhkVxYepRGZH5s3
         O8uks3Ia6HvRGgxX4NQjcAtFd4QyR2tAftLa8ZatC9gtLhbimhSKd7b1m2rxI8NXAVce
         pnsCqs9+wUxXrhUrgMJMomMPTm3sJbU0ukgBUxPBv36UkvlBDs0w8IccGoBV3wB+ytcW
         yIluAPF96EsEpFbHoSYnYBOn7ekh1mJrcyWvEfdPX4oEWnpsZaBHg7/4Djhdr7FQKfVt
         PRkw/B+h6y7KgfikAbTAw9S1yR0SAiRjZz/pFVZ3Ke2ZigjEbs0Vuhe894OhbjJYW2lv
         nF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cF1K8h19SwoaL+H+wMzf1igK2zwK+4CVmKGZfHMVXA0=;
        b=H2ncgXDsImPSttPgYpAV/wIzheqipJX76wQkutyX8iqh+IP4RMB0uGoOaa17aHTg59
         VYVW+7LcNtecQhz4iWYdtRQZDAO5bhrFYGZ4kB+VuSh7BUWF2EXkpcfQ5PDFLRZ3h7r8
         HpM65qRP4V2dHidxfUnAiQN3YZTsxaTmVxtp/hcbkb9Zor0h7GIGBMTXO5NhSTJ628HR
         gK5M2ijZQl7G7Jqbw6oHFfWaDrR7OAlu8+2DPVA9XvmFyQyaqcQVRitHc0A6lrYK7gjZ
         g9WfdbSVsx/qfMxcX8iDuMFlWk06DFHTixkfABltgOLQBjhaqXLjnE2Rmpwl6k5Hqs/P
         +LHQ==
X-Gm-Message-State: ANoB5pkm2FM+SDb7w4UyfU3zMrN6U4vZjS0oPmrBTJxn3ePBosX0iD5N
        ZW78Zlykrpt7LqLB9zyHMVKZeAkQrHaIWO41
X-Google-Smtp-Source: AA0mqf4Im1g9A1hT9ddgBaf9F7aGA+qWQlnhSMZrmcYwrVqvzzJwnWohYxeeekauBPQZmn/wu/Aj/A==
X-Received: by 2002:a05:6512:3d2a:b0:4b5:98ca:548 with SMTP id d42-20020a0565123d2a00b004b598ca0548mr11228556lfv.39.1671110384410;
        Thu, 15 Dec 2022 05:19:44 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b12-20020a0565120b8c00b0048a8c907fe9sm1157238lfv.167.2022.12.15.05.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 05:19:43 -0800 (PST)
Message-ID: <60a40ace-d4e9-df74-88f9-4354d80efaac@linaro.org>
Date:   Thu, 15 Dec 2022 14:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8976: Declare and use SDC1 pins
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214232049.703484-1-marijn.suijten@somainline.org>
 <20221214232049.703484-5-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221214232049.703484-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.12.2022 00:20, Marijn Suijten wrote:
> Add the pinctrl states for SDC1 and use them on sdhc_1.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 55 +++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 05dcb30b0779..7d4c7548882c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -508,6 +508,56 @@ tlmm: pinctrl@1000000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> +			sdc1_off_state: sdc1-off-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_on_state: sdc1-on-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
>  			spi1_default: spi0-default-state {
>  				spi-pins {
>  					pins = "gpio0", "gpio1", "gpio3";
> @@ -680,6 +730,11 @@ sdhc_1: mmc@7824000 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
> +
> +			pinctrl-0 = <&sdc1_on_state>;
> +			pinctrl-1 = <&sdc1_off_state>;
> +			pinctrl-names = "default", "sleep";
pinctrl-names usually goes before pinctrl-N

Konrad
> +
>  			status = "disabled";
>  		};
>  
