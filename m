Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E8869C868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 11:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbjBTKRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 05:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjBTKRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 05:17:35 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D8B1420A
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 02:17:34 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id f16so572349ljq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/mBL/s9w+zymmQfyS3pY3QfWP8+AdeFf5eGjucm2qQ=;
        b=K0DJ6JGrVOuibpGD9yC40OezN6wlr46KLSXOAhJ/xQXV4yUZSsxz+ErlGrfaYJ7C18
         SMZwk+EkgOJQuLyOGio2KcqOMwJ01JsCf3eCHlZ1bpyEZm+/JTes23QciSGvEixNtxEs
         FSGwouwqpkoGnM0RDBoEaZyHKRrKKNIWl/A/jMDxdSruvWRRqO9S6fZAAOCdqXNgHFHH
         a7O9cLMVOEJTCRDPY+IOSflkkjhCLtuIY4pVk35KBOarD8YAFpddKbZR4KBmrTTnvAKZ
         PPl5Jf2jKzb8M2E9dJChb23I5v3U+p9ZAxry8qYu4JUY6am0be+j7wDk543sqvGml6xe
         aVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/mBL/s9w+zymmQfyS3pY3QfWP8+AdeFf5eGjucm2qQ=;
        b=GbNdvxwXO8zY58WsVsMAeArarxPDBk7RsslLb9UTP5hFMnlIqWr2WE/61guRo+MMYB
         A02Kckh/qKJk8ftulk3xt4gKKijRlOUDZ0QmDyA8o9UA0zZWI4zVdYgO7hCcLI12Meou
         O3jZ1FzIEAg+NmtaLFdRfYrdPrB6fn5RmwKRsRJs0XL36gL4qv95tBwUSYz32sqOzczT
         pifLSRZNue/kiNgRgeI5FAtqydWsllxXnVAiZ4IeSkxQzJWGbq8y3Juwhn0WmelgNY8U
         XVEk1gMB0lYcKbpLdFv1rkmEgBQs8gVoXmQIt2YwR56wT3ou9f937A3TnTKQZclBVAxC
         Ob3Q==
X-Gm-Message-State: AO0yUKVaQIFMqOcBJsDJXV6sHIADNs74bxaBP3Xz6L5ymB0z7OBxMRKg
        h1oU/L+07/qebMdFfPv0ZJsEww==
X-Google-Smtp-Source: AK7set9te5orsT1nxfrNdKCa9pXCN/rIlq+CkslRUZs+CTQaSpFhy3Q0sLXDHcGtEax3mF2k8OS84Q==
X-Received: by 2002:a05:651c:1508:b0:28f:890b:c5fd with SMTP id e8-20020a05651c150800b0028f890bc5fdmr259549ljf.39.1676888252419;
        Mon, 20 Feb 2023 02:17:32 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id i62-20020a2e2241000000b002934d0ff439sm1472769lji.104.2023.02.20.02.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 02:17:32 -0800 (PST)
Message-ID: <be1201a5-f315-9125-8768-4719a92f07f9@linaro.org>
Date:   Mon, 20 Feb 2023 11:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845-oneplus: add alert-slider
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>
References: <cover.1676850819.git.soyer@irl.hu>
 <16e6c00389bf0ee881a055f81a3dbfd5bfc9c469.1676850819.git.soyer@irl.hu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <16e6c00389bf0ee881a055f81a3dbfd5bfc9c469.1676850819.git.soyer@irl.hu>
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



On 20.02.2023 01:13, Gergo Koteles wrote:
> The alert-slider is a tri-state sound profile switch found on the OnePlus 6,
> Android maps the states to "silent", "vibrate" and "ring". Expose them as
> ABS_SND_PROFILE events.
> The previous GPIO numbers were wrong. Update them to the correct
> ones.
> 
> Co-developed-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 43 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 64638ea94db7..ff982dd853a9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -52,6 +52,45 @@ key-vol-up {
>  		};
>  	};
>  
> +	alert-slider {
This is out of order, alphabetically.

> +		compatible = "gpio-keys";
> +		label = "Alert slider";
> +
> +		pinctrl-0 = <&alert_slider_default>;
> +		pinctrl-names = "default";
> +
> +		switch-top {
> +			label = "Silent";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <SND_PROFILE_SILENT>;
> +			gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
Is there a reason it can't be the default 5ms, since it should
more or less be a simple input ping to the userspace?

Other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +			linux,can-disable;
> +		};
> +
> +		switch-middle {
> +			label = "Vibrate";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <SND_PROFILE_VIBRATE>;
> +			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +			linux,can-disable;
> +
> +		};
> +
> +		switch-bottom {
> +			label = "Ring";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <SND_PROFILE_RING>;
> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +			linux,can-disable;
> +		};
> +	};
> +
>  	reserved-memory {
>  		/*
>  		 * The rmtfs_mem needs to be guarded due to "XPU limitations"
> @@ -753,8 +792,8 @@ &usb_1_hsphy {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> -	tri_state_key_default: tri-state-key-default-state {
> -		pins = "gpio40", "gpio42", "gpio26";
> +	alert_slider_default: alert-slider-default-state {
> +		pins = "gpio126", "gpio52", "gpio24";
>  		function = "gpio";
>  		drive-strength = <2>;
>  		bias-disable;
