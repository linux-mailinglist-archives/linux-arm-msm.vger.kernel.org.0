Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CAF6A8E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 01:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCCAs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 19:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCCAss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 19:48:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5B516AD7
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 16:48:46 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f18so1610196lfa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 16:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677804524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g47XOfqIXPkQMg71PkE7DzCjUvdWFH0DgrcS34td7Co=;
        b=fdbbJhBW2+uvzmJhzQqzt4BgJb4DujrRU47JnUORcVpjv7MqscGt4E03Lb0nUTuaXM
         6Q024tYyRVPNuNfcaLt78AgS6OF+Xr94k4bLlVVhBYAv0QkXEHc9RqwcnUUL0Hpu53FI
         hdpMmxIKXGO1SyFeceeZE+/+WkF0cxasJuIYwaRHLl+QAXrKt8/fDUx4by6VFp7wiy+m
         pX8aOrdru0a/EhncNSs+LdbrZoUxXhHxsG4SvqIzkzMNwA/D/1NrASwS42Nc+6UkS9dg
         2ri0Hs9y3eKsFHPV9Rzay5Xwi8JtxEvfP355hGQUBsuQ4lVdpMBUJOPzCg0EuB77t2og
         bbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677804524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g47XOfqIXPkQMg71PkE7DzCjUvdWFH0DgrcS34td7Co=;
        b=ynOxsCwAWEpXMXySfRUGalwBPCPPIAcKFWngLoSy7vLN0WeRF7oPBrHDWrIcLpVb19
         1mr7lTkiAebrkhP5C/9y7uYlfGug0gr0dOUhIABpiICCEBGzCHmBNNwEWYW5NeIl4OQS
         BE1wtAqEOqC+hwdjfNUc9it9m5SWFVpPBni9LksXvluHhe2xO4qH3Jjb+bDAMhoBGeWX
         MN19J11IrrTphtU8JT0FffN8OxeMuAQoFuTttNynk3NZM6xKPyS6/MEzbbqkYVPaW0GY
         H0EDPCQGBGsn9bk4FUep27UxHmPPlyrN3XKAoDYikM3a3QNn45+vy+yF2nSF42TEddyX
         luHg==
X-Gm-Message-State: AO0yUKWsslR529CBKRnQBgzwTWa3LGOVJSG4r31FBpQTrFgRADQABkn8
        ibV+irhZLpAWDBf0RPsxFYG7uw==
X-Google-Smtp-Source: AK7set/YNUcS82YI7uO90LDx8Hq3KifrZ8RGQCEhiaKfz50dnn7BBBZFfSH/FCqVoovYtl+LgvamUQ==
X-Received: by 2002:a19:c511:0:b0:4dd:9ddc:4461 with SMTP id w17-20020a19c511000000b004dd9ddc4461mr41665lfe.17.1677804524510;
        Thu, 02 Mar 2023 16:48:44 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id y23-20020a197517000000b004db4fa67bf1sm151236lfe.157.2023.03.02.16.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 16:48:44 -0800 (PST)
Message-ID: <9f56fb51-d4c6-8c14-76b2-c07959d3cc36@linaro.org>
Date:   Fri, 3 Mar 2023 01:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7180: Delete kingoftown-rev0
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230302211108.2129598-1-dianders@chromium.org>
 <20230302131031.v2.2.I68cbe5d5d45074428469da8c52f1d6a78bdc62fc@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230302131031.v2.2.I68cbe5d5d45074428469da8c52f1d6a78bdc62fc@changeid>
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



On 2.03.2023 22:11, Douglas Anderson wrote:
> The earliest kingoftown that I could find in my pile of boards was
> -rev2 and even that revision looks pretty rough (plastics on the case
> are very unfinished). Though I don't actually have details about how
> many -rev0 devices were produced, I can't imagine anyone still using
> one. Let's delete support.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes in v2:
> - Get rid of kingoftown.dtsi and merge into dts (Konrad)
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  3 +-
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts | 38 -------------------
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts | 17 ---------
>  ...own.dtsi => sc7180-trogdor-kingoftown.dts} | 10 ++++-
>  4 files changed, 10 insertions(+), 58 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
>  delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
>  rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-kingoftown.dtsi => sc7180-trogdor-kingoftown.dts} (95%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a51060378ddc..3ce51093ed8f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -83,8 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r4.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown-r0.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown-r1.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
> deleted file mode 100644
> index 3abd6222fe46..000000000000
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Google Kingoftown board device tree source
> - *
> - * Copyright 2021 Google LLC.
> - */
> -
> -/dts-v1/;
> -
> -#include "sc7180-trogdor.dtsi"
> -#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> -#include "sc7180-trogdor-kingoftown.dtsi"
> -
> -/ {
> -	model = "Google Kingoftown (rev0)";
> -	compatible = "google,kingoftown-rev0", "qcom,sc7180";
> -};
> -
> -/*
> - * In rev1+, the enable pin of pp3300_fp_tp will be tied to pp1800_l10a
> - * power rail instead, since kingoftown does not have FP.
> - */
> -&pp3300_fp_tp {
> -	gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> -	enable-active-high;
> -
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&en_fp_rails>;
> -};
> -
> -&tlmm {
> -	en_fp_rails: en-fp-rails-state {
> -		pins = "gpio74";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-disable;
> -	};
> -};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
> deleted file mode 100644
> index e0752ba7df11..000000000000
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Google Kingoftown board device tree source
> - *
> - * Copyright 2021 Google LLC.
> - */
> -
> -/dts-v1/;
> -
> -#include "sc7180-trogdor.dtsi"
> -#include "sc7180-trogdor-parade-ps8640.dtsi"
> -#include "sc7180-trogdor-kingoftown.dtsi"
> -
> -/ {
> -	model = "Google Kingoftown (rev1+)";
> -	compatible = "google,kingoftown", "qcom,sc7180";
> -};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
> similarity index 95%
> rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
> rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
> index 315ac5eb5f78..36326ef972dc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts
> @@ -5,10 +5,18 @@
>   * Copyright 2021 Google LLC.
>   */
>  
> -/* This file must be included after sc7180-trogdor.dtsi */
> +/dts-v1/;
> +
> +#include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
>  #include <arm/cros-ec-keyboard.dtsi>
>  #include "sc7180-trogdor-lte-sku.dtsi"
>  
> +/ {
> +	model = "Google Kingoftown";
> +	compatible = "google,kingoftown", "qcom,sc7180";
> +};
> +
>  &alc5682 {
>  	compatible = "realtek,rt5682s";
>  	/delete-property/ VBAT-supply;
