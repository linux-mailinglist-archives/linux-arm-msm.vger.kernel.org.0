Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162D5678209
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjAWQoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbjAWQnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:43:46 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBD52BEED
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:43:28 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id tz11so32200283ejc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcXRJ0p9dSQwtYuK68UIrA1JOD2HVWbevssm1dEmW0s=;
        b=QEIJ9QPG8x8B6vjgAz7fPyws6isNOggbyH0HLKQSe+gmyg2CqI/dL2j9T2bUzQCJU2
         MbxF+0RmACrj0dSXZWId24OZo0NnvOFrTX7V897WOFSTvboJNdck4YnRpXg7sLKeK2qQ
         ovNU8m9YzvGwH1BBGY8KC691AR26y0wQ6z2CanipjgUTf/djQzz28y6P9DjX1VE9jiV9
         X7RHXODyBmHHbHhQb1oVVQJayVfQ+Zt/nNJEYX+axtmIHN8IhxuG2jsR5ydKLnhx2dGO
         4zGymTQXechEewDa9gMHqbqhusEjCSHG03m95r9dcSsAy7UvUehnAc/nW20M0BCx3pma
         F2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcXRJ0p9dSQwtYuK68UIrA1JOD2HVWbevssm1dEmW0s=;
        b=e4H++LNdNxeYoh6ElhBuFssaoqaNYrzNIeojZzD9B7XFVz9TIiz23icN7RtM7IV6yY
         gi+ChG8MM5ZenZ4wPCC7b8M/uRPVQSO3lDQuo1td3K64kmtbWDTW+gaq5b/6T47NsrSI
         9ybQqsAcQgdZwqAjxQS7Sym751Ab0jzzNCFhO0QxVGEi3SfSEjh53l6/UBM+HFafVUj7
         q4Jfpchcs0JnMKuyhpdzjdMH4aPAT0jv2+LaYMxxpOYlUY17JScwJewzcfv8a4rxKjzw
         M6AplgrcAH4ivNBkfccR7LzMGupUOsEHw3NQzoYdDdYQNCbYiGBBl9fDpofpYhbU+fuR
         +QRg==
X-Gm-Message-State: AFqh2krTLrS3ovVFBT5znzXKvalJAtQhNRWJ6uxctvfSkDKJtSTM1EI4
        U9FVh/em6xOJr6WYwagVCpTNpw==
X-Google-Smtp-Source: AMrXdXtx10wrmb6agMuWawS+yP9oB+G7IkK4ZBE+8ZSkgIfby3Or4KQEVfURmboAKIwz3mV1Rfoz/A==
X-Received: by 2002:a17:907:2119:b0:86e:d375:1f09 with SMTP id qn25-20020a170907211900b0086ed3751f09mr26068103ejb.67.1674492206500;
        Mon, 23 Jan 2023 08:43:26 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b0077a8fa8ba55sm22220825ejf.210.2023.01.23.08.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:43:26 -0800 (PST)
Message-ID: <d05b15d4-04d8-2dc2-91ec-b5df0154aef9@linaro.org>
Date:   Mon, 23 Jan 2023 17:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add backlight
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-4-4049f565c24c@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122-msm8974-bacon-features-v1-4-4049f565c24c@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.01.2023 17:48, Luca Weiss wrote:
> Add the node for the lm3630 that is used to control backlight.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> index 10ba3c94e26d..ffb486ceb6a6 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> @@ -99,6 +99,21 @@ rmi4-f12@12 {
>  			syna,clip-y-high = <1920>;
>  		};
>  	};
> +
> +	led-controller@36 {
> +		compatible = "ti,lm3630a";
> +		reg = <0x36>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@0 {
> +			reg = <0>;
> +			led-sources = <0 1>;
> +			label = "lcd-backlight";
> +			default-brightness = <80>;
> +		};
> +	};
>  };
>  
>  &blsp1_i2c6 {
> 
