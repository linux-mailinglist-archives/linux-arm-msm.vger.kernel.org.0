Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F38A6BB929
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 17:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbjCOQKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 12:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbjCOQJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 12:09:46 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCE73A9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:09:15 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eg48so18335006edb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678896551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGlOw94M1bjV558+SSqH2l1uEWI6x6BMDe5Gqn6Ht4o=;
        b=iELiNFHPcviGR6KfXPNwBddxGNJi5S2lRxo6xkuHqim9zJSyRx1SDoxqzFgt4yr4qb
         j3mRtXcaJjjUqF54bdk/OfbPw8IfdfvbhIbgd4Sr8+lqtKlIzAX3D276PIOyM8JZ2Y/j
         5hnN6owOgO0ShEb+rsseYEtfRM1+trw1sBXD/7sXCirhV3ICWu5OhTHFks03veLFGf+/
         2b9K5PR34t0W52nT9JN73/Wmrrn6gall2fFOC93+bWiUBZkW2lD7nBje9TZHsWuQBhWb
         8TpJUwU8ehs+3p13Pjb2x6WTbq6BbFRfLqKpPfRAm5a6Ds6N/hDRJ5SIZ6UlayU8aDvO
         Xf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGlOw94M1bjV558+SSqH2l1uEWI6x6BMDe5Gqn6Ht4o=;
        b=V9hv482PKYYpCFA1lVaa43f+oGNf6yEaYrr5yhZutnFdkUMqz7ONcJKrsis1CmQxsn
         rxSAtJYaN2BeEQ+v5Lk4HB0WbEqMNvWRVJ3+UQF7bEBR39b/yKdKNswnYzrBD1w8Nb0W
         jus1j3rwvoVil9KoOz0MgKsCJ9y/V8h9akPtSTFLceQseU1vCv1lMIkWfswgPc26rZQn
         4Ooczg6sfwXVHxQhlSD7CIGWP/qk1LgSOX7YQtviu3YKetu+KOGvyTsanrzzasHOmWaD
         tMyfLGsSC9AG7NtCC8GRF3vo0YoROV8Zgj+bYgzkuOwVqT5jZXRsjacnv+urhTEtttFY
         pPTQ==
X-Gm-Message-State: AO0yUKWPdyhz6D48xI9n5RxG+sWyWRfEDhUdO8nhOZ3lPZ8XaFtWV4c5
        UD01iTS/HRG3dnK+WBv65RZV8Q==
X-Google-Smtp-Source: AK7set8LUkWeJloO5KR5GyPPOMoKiiOcGekqj2CyNfvSioiDmDjUmwnMAhyBOqaN6/icF6ds1q4JkA==
X-Received: by 2002:a17:907:d13:b0:922:8fc9:d235 with SMTP id gn19-20020a1709070d1300b009228fc9d235mr8669194ejc.9.1678896551674;
        Wed, 15 Mar 2023 09:09:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id rq4-20020a17090788c400b00927341bf69dsm2701737ejc.88.2023.03.15.09.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 09:09:11 -0700 (PDT)
Message-ID: <b8805711-d720-8f91-c198-10b0553417a4@linaro.org>
Date:   Wed, 15 Mar 2023 17:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add Acer Aspire 1
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, agross@kernel.org,
        andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230315154311.37299-1-nikita@trvn.ru>
 <20230315154311.37299-5-nikita@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315154311.37299-5-nikita@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/03/2023 16:43, Nikita Travkin wrote:
> Acer Aspire 1 is a WoA laptop based on Snapdragon 7c gen1 platform.
> 
> The laptop design is similar to trogdor in the choice of primary
> components but the specifics on usage of those differ slightly.
> 
> Add the devicetree for the laptop with support for most of the
> hardware present.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Changed in v2:
>  - Various styling, ordering and node naming issues fixed. (Krzysztof)
> 
> Changed in v3:
>  - Kepp camcc on, wakeup on touchpad, minor style issues. (Konrad)
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sc7180-acer-aspire1.dts     | 859 ++++++++++++++++++
>  2 files changed, 860 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 89e23a74bc7f..4bd4b4079b17 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> new file mode 100644
> index 000000000000..b4161f1f21a7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> @@ -0,0 +1,859 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc7180.dtsi"
> +
> +#include "pm6150.dtsi"
> +#include "pm6150l.dtsi"
> +
> +/delete-node/ &tz_mem;
> +/delete-node/ &ipa_fw_mem;
> +
> +/ {
> +	model = "Acer Aspire 1";
> +	compatible = "acer,aspire1", "qcom,sc7180";
> +	chassis-type = "laptop";
> +
> +	aliases {
> +		bluetooth0 = &bluetooth;
> +		hsuart0 = &uart3;
> +		serial0 = &uart8;
> +		wifi0 = &wifi;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {

I still don't think it is ordered by name.... "r" is definitely after "a".

Best regards,
Krzysztof

