Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCED66ACB25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 18:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjCFRrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 12:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjCFRrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 12:47:37 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BF56BC22
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 09:46:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j11so13792914lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 09:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678124796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iez5Cv7gRrdlfiQeXfEnRiE70CNF7dHomy8QTYT6wEo=;
        b=LiaIr3yWC4diYGZlpcnjyQ+ysdSZahUuTjd/17VwgHjhQ2vKo/yjtJjkIrSwhs93jp
         TTz+syci5ZGqSwRxF/FnOvCtBtVfCKCygoC3GNMyhNxqWfY+zb7dlTnQVGK1oWmkZHyh
         ViDhrxqxQo/hWXWeFOndoOkXCyc64cqOHc5gdSQ/b72cmFglipx3KtTDgZfkk8LnqrvV
         Expudpi57K7olGzOhxywrk/3yxahcC3H+DOatNTgc2sQKF+GoWTgTQPDk9mikhqqhOJ7
         mnMEZeTHNk8u0/6H22RdVCeIwjsKKKP0vp4OPaI6Pqf/xAAMvf4emYcmGg69gZRCJmkN
         Wvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iez5Cv7gRrdlfiQeXfEnRiE70CNF7dHomy8QTYT6wEo=;
        b=lqA1whXX9is0GZeHxH7q2WH3k/WhcYF2MTmX7p9YnyRBTLY+1wYZlvKNoK7P89yixL
         ZwNU/1jnpKzx1gYAsBoiaMX78CgZBBhXI4Mm8UiLjA3mgWGn2ce5doSr5m77pg8VS44G
         1qseGv4M1+MeMhnWLBu3U5J5mzl/sj1LC3E1fh4E35zfOKsPVix4LBlaO3xqZ1ldpmtU
         L0nLVohyRya1xybKt9HD+mC8yLzP440Ge8ue2SYGcONGWcp5qp8ulfBBMdDQsJNg42ZO
         JC2pnrbycCaU87MryJ8nrdHbFmT18xyLURNMcCtdd6lSYGeC8QptVdW4XPq1p1yXZ32T
         JIcw==
X-Gm-Message-State: AO0yUKWiKRiH6X6uI6z44eLBScRM/grI/L5/Xae2LHY7lPN8RnZe9Vt4
        IMOngfbaDMfqeYyz9oWniPqjGw==
X-Google-Smtp-Source: AK7set+Lxi8EIh3U2avNhydgx1vaJcqiER4wWgnpUdfUG6sGjE275HO3WpMmXUh/efUsfXGRAdU1tA==
X-Received: by 2002:ac2:5dd6:0:b0:4dd:ad4c:74b6 with SMTP id x22-20020ac25dd6000000b004ddad4c74b6mr3291459lfq.1.1678124796333;
        Mon, 06 Mar 2023 09:46:36 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id q8-20020ac246e8000000b004b6efcb7bb5sm1717494lfo.169.2023.03.06.09.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 09:46:35 -0800 (PST)
Message-ID: <32c77f79-e2c2-d4fe-7c17-2d8ae97cfdcd@linaro.org>
Date:   Mon, 6 Mar 2023 18:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: add Hall sensor
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230306174147.185239-1-soyer@irl.hu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230306174147.185239-1-soyer@irl.hu>
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



On 6.03.2023 18:41, Gergo Koteles wrote:
> Enable the Hall effect sensor (flip cover) for OnePlus 6/6T.
> The GPIO is mapped to SW_LID events as in msm8916, msm8994,
> msm8998 devices.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
One fun thing I discovered is that if suspend is broken for whatever
reason and you get a magnet close to a device with it mapped to SW_LID,
you'll essentially get a hang or a reboot lol

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 64638ea94db7..b01542d79ae2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -29,6 +29,23 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +		label = "Hall effect sensor";
> +
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +
> +		event-hall-sensor {
> +			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
> +			label = "Hall Effect Sensor";
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		label = "Volume keys";
> @@ -753,6 +770,14 @@ &usb_1_hsphy {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	hall_sensor_default: hall-sensor-default-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		input-enable;
> +	};
> +
>  	tri_state_key_default: tri-state-key-default-state {
>  		pins = "gpio40", "gpio42", "gpio26";
>  		function = "gpio";
