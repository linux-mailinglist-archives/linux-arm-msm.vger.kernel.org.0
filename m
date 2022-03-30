Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAEC4ECA97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349257AbiC3R1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 13:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346580AbiC3R1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 13:27:34 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8426372
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 10:25:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id p15so42900123ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ywoW9d6iS1v9MqKMZLThlxZsRS/iSgOcBYL7HQFMb8w=;
        b=jXk62kaOb+JZKYyIu6K42PmmJIIdGtCx+R5cntWsvzNPATuN2iTuNHYp+Xv7eu8rNX
         zBBxcwEHW0KJvJ7FAmBCuXDPXBqUjHOU3EmkZnB28JQeKhKvKCNOH7AUFonVtWgn/lFm
         fRxBZMOPOE6IZsyQUWIz4nbh009mA9u6qOr2tmDHTx0txHOrL6wSdUtWD3J+R3sxt8mG
         fz1ht2TrYkbcCEsipaWGd3Wq05pEU1oyYUXJY88dSOGG7m7PZtT8nR8L2ytl0TxFGgbu
         qV0D5kIFVBokjp1U0w9N9N5gl1MdXm56QVlcjOhihrbLa/12jg0up/Ck+XN/5CN5uP1n
         Qh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ywoW9d6iS1v9MqKMZLThlxZsRS/iSgOcBYL7HQFMb8w=;
        b=ZmTQi4/fZVpF/EAsU+aFYqh+yXGNt+eeGagi+9gg6omwV19nSKU0dMrmB3c+7GdWPS
         zzG2rRyRVD0clqhdUU7iyU6+O8GZxa1OWmz+A1VJpe7xf6R46kqWWJKF1lSgBGxH0gPu
         1UiBia/oH4PoekwoKYPfoKqzfd7dUr+CgrjGgtKu4rDCrB+koYmh01mCsnUSqHvTBk9T
         xYf8XcBWguNxv8f6gDrytA3RKxCUW/ehBQI85pLQWbG7g+uGsMkIeF31GGKi/baBLxem
         AywUEf1YlIlmZ6Q5Zzoviv4aVKG7zOy2UzIEvxw0U2h9/AW1TbojQjkUcUKs2Bc2R+C4
         AWvg==
X-Gm-Message-State: AOAM531m+lAKeCAQpx8NFVgVzghvW7hsdGW3p4YyfwT8Er05y+/2OKRm
        ErJ8SBgLiUP0Gl6mJ7lXcRvgfw==
X-Google-Smtp-Source: ABdhPJxxOU49iYcKjfDnjlgu3KVv7WLRtGVL9RCQkhzwLgkyAXnZHHhNugRy23T450DuqxkqRAXkmw==
X-Received: by 2002:a17:907:1ca3:b0:6e0:5a9:37a1 with SMTP id nb35-20020a1709071ca300b006e005a937a1mr598108ejc.651.1648661146942;
        Wed, 30 Mar 2022 10:25:46 -0700 (PDT)
Received: from [192.168.0.164] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ds5-20020a170907724500b006df8f39dadesm8343734ejc.218.2022.03.30.10.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:25:46 -0700 (PDT)
Message-ID: <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org>
Date:   Wed, 30 Mar 2022 19:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
Content-Language: en-US
To:     Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        agross@kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2022 11:09, Mars Chen wrote:
> Initial attempt at Gelarshie device tree.
> 
> BUG=b:225756600
> TEST=emerge-strongbad chromeos-kernel-5_4
> 
> Signed-off-by: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sc7180-trogdor-gelarshie-r0.dts  |  15 +
>  .../dts/qcom/sc7180-trogdor-gelarshie.dtsi    | 304 ++++++++++++++++++
>  3 files changed, 320 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f9e6343acd03..cf8f88b065c3 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -57,6 +57,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-gelarshie-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r4.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
> new file mode 100644
> index 000000000000..027d6d563a5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Gelarshie board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-gelarshie.dtsi"
> +
> +/ {
> +	model = "Google Gelarshie (rev0+)";
> +	compatible = "google,gelarshie", "qcom,sc7180";

Missing bindings. Please document the compatible.

Best regards,
Krzysztof
