Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037C57A78DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 12:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbjITKPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 06:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbjITKPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 06:15:07 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3D4AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 03:15:00 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a9f139cd94so915160766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695204899; x=1695809699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mZqf86pDWOD/601uuBDOEbjatLYGf0C2OZfOrIlKtE=;
        b=kmXu4C8kZ0hGAg1DeVAt7O2XiyWjG3Z16TRyluuSySQJ0sxmuLRTdOJAdK4BRBevyc
         gNLxDRSGpe1I7ERvpHUzNMVEbsNiKM0qPb8Ut4MNdHp+bZEpFas9FvGpGLqBmcYoetmm
         DrZom8VzBqvSWRTMxf0iJgTfaj0vQ1oEc9HmJ3d1FB1rbQKz6Oz7adGx5iSJF9SCd67H
         tkYKRLN+XdPL+BKkNvkzWr4GExQiluuBItwNmocJaIxHQis2vn3oxtSK/lHRvfe0g2BJ
         XV2NrCpEWa3gQwfMU12DO5Mb5yHATdwk+TvW5C4/T2dWWRh0i5sPYkBiVmK5sXvLpjwJ
         gw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204899; x=1695809699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mZqf86pDWOD/601uuBDOEbjatLYGf0C2OZfOrIlKtE=;
        b=k83iZJWp4/EMObxGIwoKezhbtBsBxuSEzY8ZdMaC34FFu1r665o86taIAtcFLYGvSl
         BKhHmVeQQDRLHvDagQzZ7emgkAgb3AybedsYyRAPcDnpaVYVLAScxA5Mb+XHDf9sxg22
         ypQ435Nr/F8ZIul0xF0oijIbuAteQeB2uVaks391iZ24MjNRYkXfRFKO1PKp1SHzdP3b
         dypfHVGi3aIn4yEkMi22410a6M3Uh7gnf7IhwD+3AYo9fWeoTsQ7kHtbUAtckFCi8dfO
         jzQ25Ov40AvFxvuW1XkingIZr9qRacdjv172tpHXg3wezKfn4Rui7nQP6F84inGtwDIB
         R9+w==
X-Gm-Message-State: AOJu0YwEUB3FjHlXcnY3lce+gage5cdU5UysdE+nPUJUnIHzsNCvnSP5
        t+yfgdt2oKPGsojYAK2FDg638g==
X-Google-Smtp-Source: AGHT+IErDzQjZ+K58/UpSu8O8qdmGRhWMWecc+OmIf04JHEc3evawqV8aeI1xjeHIg0cpLMPHURYYw==
X-Received: by 2002:a17:907:a0c6:b0:9a1:688f:cf2d with SMTP id hw6-20020a170907a0c600b009a1688fcf2dmr1475764ejc.39.1695204898449;
        Wed, 20 Sep 2023 03:14:58 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id re20-20020a170906d8d400b0099bc8bd9066sm9199112ejb.150.2023.09.20.03.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 03:14:58 -0700 (PDT)
Message-ID: <479ce1da-10e5-589d-cb98-e7fef98c5543@linaro.org>
Date:   Wed, 20 Sep 2023 12:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: sm4450: Add apps_rsc and cmd_db
 node
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, tglx@linutronix.de, maz@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc:     geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        quic_ajipan@quicinc.com, kernel@quicinc.com
References: <20230920065459.12738-1-quic_tengfan@quicinc.com>
 <20230920065459.12738-3-quic_tengfan@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920065459.12738-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/20/23 08:54, Tengfei Fan wrote:
> From: Ajit Pandey <quic_ajipan@quicinc.com>
> 
> Add apps_rsc node and cmd_db memory region for sm4450.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm4450.dtsi | 35 ++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> index c4e5b33f5169..3d9d3b5e9510 100644
> --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
>   
>   / {
>   	interrupt-parent = <&intc>;
> @@ -328,6 +329,18 @@
>   		};
>   	};
>   
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		aop_cmd_db_mem: cmd-db@80860000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x80860000 0x0 0x20000>;
> +			no-map;
> +		};
> +	};
> +
>   	soc: soc@0 {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -419,6 +432,28 @@
>   				status = "disabled";
>   			};
>   		};
> +
> +		apps_rsc: rsc@17a00000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0 0x17a00000 0 0x10000>,
> +			      <0 0x17a10000 0 0x10000>,
> +			      <0 0x17a20000 0 0x10000>;
0x0 for consistency

> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			label = "apps_rsc";
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS    2>, <SLEEP_TCS     3>,
> +					  <WAKE_TCS      3>, <CONTROL_TCS   0>;
You haven't addressed Bjorn's comment about the number of
CONTROL_TCSes, are you sure 0 is correct?

Konrad
