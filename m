Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CADA35501CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 04:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbiFRCAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 22:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbiFRCAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 22:00:06 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C046B7CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 19:00:05 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c196so5569579pfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 19:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9vWf7hBuaO9v1OHnPsprHq+uO23AnZheoUT3MIHR4+Q=;
        b=J8vg2GyXWbL7qKgW3l1JGZ4K+sz5iYtw0a0FWcihzOdB39i2CuFQdhL0cILyMPD49D
         EoNwTLKre6GKMd8w1Oar8Y33lGXeiVG1yDEZFpcr/CXcKJwUnP77I0TKV0XMKMFAolEt
         gNr8tWC1U/indyKuJmb44tpBEEKNtlYLHZZsWPet86PqGthjXggY/Imt2Tkpkd4f6uvk
         sHFGSs145gO9Aw/iXEx5bGFhITbLL1Dkw6cYJNzpZZ9KEqAwt3LCZbHhpSChlPU7C9oY
         9LQo2a4PiZKZrl1t2qxPdeFcpS4d9m65U4rVram45fXIEbphNA9ewgn2qnFsX8iEU0Ip
         O7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vWf7hBuaO9v1OHnPsprHq+uO23AnZheoUT3MIHR4+Q=;
        b=QFfrq0gP/SueAEXLwqKg0ZPXHo6ni+922jkCKNFb645hZ8IbV4jNRmuLGN+G5AoOZ8
         62jmJ2j+kjAYMTOVUyr7j8AvO+7+YIfJlKOQDO4rR7p2INPAT0u0KGaEdQ+uRUqZz7Gn
         0uA/HUZnlCh/PNmROR64NlTXCRW/Tp9I1mxXal34TEclScavFxvD5IO8da6P1wwoDdhB
         wNi1A0fIDJJdRMtWqB/XJl/DSaPsnT2cFGd0K1GYRCEA39kvUoDbl8wNEYpEQ/lk4bz+
         +7UKprW6UBYbgg05Tke/13R90BoLPCjeikujx0rjgcUNMzJqH/F1vPojtWOURNADKx8/
         URJg==
X-Gm-Message-State: AJIora/AmGUX97gBGWhbn3YKN5kWIr+3T8/pS6Ri2uMdMb5FMSWvahGI
        cbpFB6QIiP5eZRWaMeFW7UgYDg==
X-Google-Smtp-Source: AGRyM1u576Di/I66uWDptW3RZT/Fxeg5xfKlrmxl63OcZKK2u1JgeWls8YZxU8G4w+MplCdpX/25gQ==
X-Received: by 2002:a62:1dc7:0:b0:51b:a56e:35c3 with SMTP id d190-20020a621dc7000000b0051ba56e35c3mr13002085pfd.45.1655517605150;
        Fri, 17 Jun 2022 19:00:05 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id x14-20020a62fb0e000000b0051bb1785286sm4270329pfm.167.2022.06.17.19.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 19:00:04 -0700 (PDT)
Message-ID: <9bf584a1-bab9-33f3-02b6-6b10a7cfb043@linaro.org>
Date:   Fri, 17 Jun 2022 19:00:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] arm64: dts: qcom: starqltechn: add initial device tree
 for starqltechn
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220617110130.2300438-1-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617110130.2300438-1-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2022 04:01, Dzmitry Sankouski wrote:
> New device support - Samsung S9 (SM-G9600) phone
> What works:
> - simple framebuffer
> - storage (both main and sdcard)
> - ramoops
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v2:
> - rebase on Linus's master branch
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sdm845-samsung-starqltechn.dts   |  45 ++
>  .../dts/qcom/sdm845-samsung-starqltechn.dtsi  | 448 ++++++++++++++++++
>  3 files changed, 494 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 2f8aec2cc6db..85140db507b6 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-samsung-starqltechn.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akari.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akatsuki.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-apollo.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> new file mode 100644
> index 000000000000..53bb2ebf0061
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 Samsung S9 (SM-G9600) (starqltechn) specific device tree
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include "sdm845-samsung-starqltechn.dtsi"
> +
> +/ {
> +	model = "Samsung S9 SM-G9600";
> +	compatible = "samsung,starqltechn", "qcom,sdm845";

Missing documentation. I guess you should rebase on my series adding
compatibles for sdm845.

Bjorn, can we get my series merged? It's really more and more DTs
needing it.

https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/

> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		bootargs = "console=tty1 loglevel=15 clk_ignore_unused PMOS_NO_OUTPUT_REDIRECT";

This should not be in DTS. Especially debugging stuff... console should
be selected by stdout-path.

> +		framebuffer: framebuffer@9D400000 {

lowercase addresses everywhere

> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9D400000 0 (2960 * 1440 * 4)>;//2400000
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +

Just one blank line.

> +	reserved-memory {
> +		framebuffer_region@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x02400000>;
> +			no-map;
> +		};
> +
> +		ramoops@A1300000 {

lowercase hex. In entire file.

> +			compatible = "ramoops";
> +			reg = <0x0 0xa1300000 0x0 0x100000>;
> +			record-size = <0x40000>;
> +			console-size = <0x40000>;
> +			ftrace-size = <0x40000>;
> +			pmsg-size = <0x40000>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtsi b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtsi
> new file mode 100644
> index 000000000000..1d640d88c61a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtsi

Why do you have DTSI for one DTS?


> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 Samsung S9 (SM-G9600) (starqltechn / star2qltechn) common device tree source
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sdm845.dtsi"
> +
> +/ {
> +	chassis-type = "handset";
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	/*
> +	 * Apparently RPMh does not provide support for PM8998 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8998-smps4 {

Consistent naming. Please apply all comments from your other patchset...

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +

One blank line.

> +&apps_rsc {
> +	pm8998-rpmh-regulators {
> +		compatible = "qcom,pm8998-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +



Best regards,
Krzysztof
