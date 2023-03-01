Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E680E6A7691
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 23:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjCAWDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 17:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjCAWDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 17:03:54 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779401F93B
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 14:03:52 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b10so15671863ljr.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677708231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzvShTAj0cwRWIJCePRoadDuQMAg/IBm1ylhKAgJkfE=;
        b=hGzfnSG1mvuUk80VAecRy9IDhJW7vCwuOsWBERGKpDCfL07sUl8rq5tqFQGWZYup6R
         Xqm7pc9NyYc36k4TYMVSJ23PMj2bqPkrGMn1iuqt9ok1/J67ZASgamiqhe+Qc+ZiqwxH
         WQ7AXDztiIi/Pj2Izz0kF5PNOhp2TW1OfnWut3prPEq0TOT37wb3i477Cqk0IIjUhm06
         YnOpjVp626gsp8qbWUQYT1jRv1hwPiVGE64O2pAbTUJGoj7pnHr1DQhkHXcrDoo2A7u9
         Xl2kExze5z0RnLKZwLtTKHNQ0xSEGrSFo7LBjmjK+nddp1kV70ZzEjy9K0x0GiihaM+6
         bGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677708231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzvShTAj0cwRWIJCePRoadDuQMAg/IBm1ylhKAgJkfE=;
        b=vhADx+cyBduIcRe/XT5Rt2L83Q1VeZO5ru7iDfjf+OWEZNQ+5ScQmy5+9fbLhhidWU
         jN35bPK2CaZA0ZJXKUZO/Mt5SW6CdSxskx9gH+XQ2XsgOhy7Oo4cmBDo6DWXAQrUdG9p
         fxbgSUKTq3fiAwArML1lzc6Z0JG6PGCVQY3h8Qxxl0Er7yKZyk9MFKhMudJpVABIaK33
         9Ms+zBck70ZDjndw0PekRS4wztc/2IfLNaz17S14jdjg72kGtXnbzcT/i3GaBnAiKDjc
         5OHm3W3fVpCNwmGP5iRO3Ag/6a5d8rZiack/uyWZnm3vcAd4yHIjdHmUlWGXA4k2G0TR
         P+Hw==
X-Gm-Message-State: AO0yUKVllkCSs8fdsVjqnkynFUoSdr+N5O0/C5P3fG/rGhTaX0NWrMei
        /wONFKxXQV9NdHliYYqr/QorFg==
X-Google-Smtp-Source: AK7set+P7wcp+WdMgcs59PdnhgNC35rtBAHuCC4wyVC7KcUWIn/sMnPbFe8Yjg0FrFZO9Ul6efWN4A==
X-Received: by 2002:a05:651c:222:b0:295:a3aa:e7c2 with SMTP id z2-20020a05651c022200b00295a3aae7c2mr2415942ljn.36.1677708230726;
        Wed, 01 Mar 2023 14:03:50 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id be35-20020a05651c172300b002934a7c04efsm1839708ljb.98.2023.03.01.14.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 14:03:50 -0800 (PST)
Message-ID: <4ed12ffe-d4d8-ebfa-bfb5-f869c671be37@linaro.org>
Date:   Wed, 1 Mar 2023 23:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7180: Delete lazor-rev0
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230301185007.1101006-1-dianders@chromium.org>
 <20230301104859.3.I30128a6f4b60b096770186430036afb40ede6f70@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230301104859.3.I30128a6f4b60b096770186430036afb40ede6f70@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.03.2023 19:50, Douglas Anderson wrote:
> lazor-rev0 was a pile of parts. While I kept the pile of parts for
> lazor running on my desk for longer than I usually do, those days are
> still long past. Let's finally delete support for lazor-rev0.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  1 -
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 34 -------------------
>  2 files changed, 35 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 3ce51093ed8f..e4190a648335 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -84,7 +84,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r4.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> deleted file mode 100644
> index d49de65aa960..000000000000
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Google Lazor board device tree source
> - *
> - * Copyright 2020 Google LLC.
> - */
> -
> -/dts-v1/;
> -
> -#include "sc7180-trogdor.dtsi"
> -#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> -#include "sc7180-trogdor-lazor.dtsi"
> -
> -/ {
> -	model = "Google Lazor (rev0)";
> -	compatible = "google,lazor-rev0", "qcom,sc7180";
> -};
> -
> -&sn65dsi86_out {
> -	/*
> -	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
> -	 * that the cable is canon and in -rev1+ we'll make a board change
> -	 * that means we no longer need the swizzle.
> -	 */
> -	lane-polarities = <1 0>;
> -};
> -
> -&usb_hub_2_x {
> -	 vdd-supply = <&pp3300_l7c>;
> -};
> -
> -&usb_hub_3_x {
> -	 vdd-supply = <&pp3300_l7c>;
> -};
