Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF0878967B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 14:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbjHZMHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 08:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbjHZMHE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 08:07:04 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD16BDC
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:07:01 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bcb54226e7so21153301fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051620; x=1693656420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxY8GzOUSjJpbnpDLCF9tnnYblSq+xTqK+i5DsaGhz0=;
        b=xPuwmgJqltwIl5qjdyaSFaAR3hozi7pzkl283hOFK2jHekRzRsO8UHXQKXUT3J0+1Y
         ZnK6qysEPNN4NykZwfy62Uh8JVXrzq9ggqjA1hnHMcMnxQSy6mgi2ELATbtP5Qha3msE
         mLdGWbliwXX9E7N9R6L3LplGJcvOupwA1BQ5P801jz7bPEForgun34tFdCjt9eiU1MdV
         Y7KDgjfmuWwO6nEdZyJb3gbMFLwg4fh7PsaqgKeLJYFRvM0196Lb/gBglNhelyJFw0LL
         Ed8A64GJYi1w8qD1g41u5UyAw+tdlRvhehKumf7PFonAdcfMtwCDZv9bs0Ac/r23YXsU
         tXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051620; x=1693656420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxY8GzOUSjJpbnpDLCF9tnnYblSq+xTqK+i5DsaGhz0=;
        b=djByuOMmSEdKFt5BrFTCc+0y/zCIO1RQgO4bbuXjgBvHyPpPrv9mm86aXTfSraYKrX
         1a+RvKeAYJiT08y62kYj6WfXiOJngnkPDfumcJRD73ktFQhjD0ACNWuKa6fpgwiOHLbI
         3c64Vwb3VfzFPiuKMp4exBqyrUFV4TAl0nVlxRgjrvy2zggAvOkMu2gO/QRiSzcJsyiJ
         DyDI4zY65DqRMtzV3j+yduAGZk6dZ3TSRvQAbpm0gCtidq5IYq02HHFpw1K5gVMw9lX0
         8gWJCv5+7Fk5jUoA0ZCwzZ/7NXFoBSboBOmwg1ATRIoqjO5xDKhaanLM3kf51DpXFnYL
         ykRw==
X-Gm-Message-State: AOJu0YyCz6pzfoTgv5da8NTAh9D5RL0Tt1SPJARfqGP1gDZpf7ghMNWJ
        dR0gtz8VXAQ8u+VNY1tnRG/Pig==
X-Google-Smtp-Source: AGHT+IH8TVip4xI95ezyyOf6FmQm74KohrLqFBiRaCOmUZfCvyGjphngtDD9yytWeUO2Vl23ErGyrg==
X-Received: by 2002:a2e:b0c3:0:b0:2bc:c4fa:489c with SMTP id g3-20020a2eb0c3000000b002bcc4fa489cmr6166606ljl.8.1693051620086;
        Sat, 26 Aug 2023 05:07:00 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
        by smtp.gmail.com with ESMTPSA id a8-20020a2e88c8000000b002b9f0b25ff6sm776135ljk.4.2023.08.26.05.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:06:59 -0700 (PDT)
Message-ID: <cca2a215-e71d-4e8c-a5d9-93aa870b7995@linaro.org>
Date:   Sat, 26 Aug 2023 14:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/2] arm64: dts: qcom: msm8939-longcheer-l9100:
 Add initial device tree
Content-Language: en-US
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230815-bq_m5-v3-0-fd26d7c76a1f@apitzsch.eu>
 <20230815-bq_m5-v3-2-fd26d7c76a1f@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230815-bq_m5-v3-2-fd26d7c76a1f@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.08.2023 21:49, André Apitzsch wrote:
> This dts adds support for BQ Aquaris M5 (Longcheer L9100) released in
> 2015.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI
> - WCNSS (BT/WIFI)
> - Accelerometer/Magnetometer
> - Vibrator
> - Touchscreen
> - Front flash
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---> +	light-sensor@23 {
> +		compatible = "liteon,ltr559";
> +		reg = <0x23>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l5>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <113 IRQ_TYPE_EDGE_FALLING>;
interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;

> +
> +		pinctrl-0 = <&light_int_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	imu@68 {
> +		compatible = "bosch,bmi160";
> +		reg = <0x68>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +	};
> +};
> +
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		reg = <0x4a>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
similarly here

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
