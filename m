Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE2506606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 09:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349447AbiDSHif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 03:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349448AbiDSHid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 03:38:33 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F9522535
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:35:51 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g20so20111209edw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a+QTYrwAFOSdj+HO0jDyyYz3Rq8uobWXCZRRDSs0HW8=;
        b=Za/gh2JeihC5CqQTT7cfAfTRJLbYQzGR+qhKQ+h2yZoW32Cr8SBXVL5Ft34bVVGZRM
         EcFdtqW+RdAlu9sNt3WUv3wQ/TBlNgwa6Rjpf78+mTjnPeW0GWLor/xqWawikKKzQZGJ
         QZs8gPFIsXZR7ZKpTnMb4ihTwRW0AjjDKQooWgKo+u9L4/dksyhEE5Plm+Karl0V3rLO
         XLu6nMZ2Ge3vnkMPjIPciX6SIt4IcRUKHH1Z2Fh+oaL1T+VaDmUuHi4krnrPTQ9QKU+f
         Fuk+Ghfkljvng2dcWUDcBP3I7fJBohARiowY91PhSMLHmmD5G1btTZ4cXkW95UrDQzjK
         LR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a+QTYrwAFOSdj+HO0jDyyYz3Rq8uobWXCZRRDSs0HW8=;
        b=fFITaoAtDnhIx5bwX2Hk0ybPJec/9WMajQzdv/CZYnHvUO+Gq7d5AC7JJnPVtQ5K9X
         UAfMxq5A0PHObys2ld5hFv25sylU50PdDhtVEXLF8cnMtkN+Qryi9M57K5kBun604SRq
         Lm7vxpe38zJjQL+d55NgkBbECs1ZLpnAQpQBbvHxtWnOM/ZzSOIPZjVCqreWUvm6r/yP
         p+LvbEYB0bakFhRK7dOIkE0UIUOFj2Dyg9QMEm9kgofNSHlkpCXc9H86l9FGaNi5dtCZ
         NB4WyoLJ+UVTrXLJewp5canTH9RVs52swcG301IpQXTSw+yX9P7PWLxeb9PGvzGh+LhQ
         fITA==
X-Gm-Message-State: AOAM533fKEMiDfhmoMeWUiJS+n7VO6gK31teDLrCWzL5BZAq6twyPeCP
        zBVG6bACKmvPZErXnSJseoVuoA==
X-Google-Smtp-Source: ABdhPJxir5QFAKY03Mb+fblB+AU8kLc/73Tnx51jWfCk7swCwIZVx4UZiEvNrwg0RZiVRBKLAWuceA==
X-Received: by 2002:a05:6402:5186:b0:423:e004:ef1c with SMTP id q6-20020a056402518600b00423e004ef1cmr10618599edd.349.1650353750242;
        Tue, 19 Apr 2022 00:35:50 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7d65a000000b00424064b8ed2sm31911edr.33.2022.04.19.00.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 00:35:49 -0700 (PDT)
Message-ID: <a47a038b-6ed6-82b4-81b5-c60d6b1d46cc@linaro.org>
Date:   Tue, 19 Apr 2022 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/4] arm64: dts: Add aqp8039-t2 board
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 03:09, Bryan O'Donoghue wrote:
> The apq8039-t2 is an apq8039/msm8939 based board paired with a wcn3680b
> WiFi chipset.
> 
> Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Co-developed-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Co-developed-by: Benjamin Li <benl@squareup.com>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> Co-developed-by: James Willcox <jwillcox@squareup.com>
> Signed-off-by: James Willcox <jwillcox@squareup.com>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Co-developed-by: Joseph Gates <jgates@squareup.com>
> Signed-off-by: Joseph Gates <jgates@squareup.com>
> Co-developed-by: Max Chen <mchen@squareup.com>
> Signed-off-by: Max Chen <mchen@squareup.com>
> Co-developed-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

(...)

> +	pinctrl_panel: panel {
> +		pinmux {
> +			pins = "gpio25";
> +			function = "gpio";
> +		};
> +	};
> +
> +	msmgpio_spe_reg: msmgpio_spe_reg {

Same comments as for your patch 2.

> +		pinmux {
> +			pins = "gpio108";
> +			function = "gpio";
> +			output-high;
> +		};
> +	};

(...)

> +	lcd_iovcc_vreg: lcd-iovcc-vreg {

Generic node names, so if you need some specific prefix, at least follow
it with "regulator", so "lcd-iovcc-regulator"

> +		compatible = "regulator-fixed";
> +		regulator-name = "lcd_iovcc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_lcd_iovcc>;
> +		gpios = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <300>;
> +		enable-active-high;
> +	};
> +
> +	lcd_avdd_vreg: lcd-avdd-vreg {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcd_avdd";
> +		regulator-min-microvolt = <5600000>;
> +		regulator-max-microvolt = <5600000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_lcd_avdd>;
> +		gpios = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <300>;
> +		enable-active-high;
> +	};
> +
> +	lcd_avee_vreg: lcd-avee-vreg {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcd_avee";
> +		regulator-min-microvolt = <5600000>;
> +		regulator-max-microvolt = <5600000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_lcd_avee>;
> +		gpios = <&msmgpio 87 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <300>;
> +		enable-active-high;
> +	};
> +
> +	bl: backlight {
> +		compatible = "gpio-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		gpios = <&msmgpio 98 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	pp_spe_3v3_vreg: pp_spe_3v3_vreg {

Please apply all comments from patch 2.

Best regards,
Krzysztof
