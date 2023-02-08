Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B473868E9AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 09:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjBHIR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 03:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjBHIR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 03:17:26 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6E610F0
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 00:17:24 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so49405232ejb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgNVLPP81e/ZJyUA32o0ZH9mBi/iQe4yk7ouaJGZuy0=;
        b=ycOguIPKYX/vFlY/CaadB5taIqR8a5Z90ZR+FhhA0KfrTvQx7qS75v4O4A91qx+Ss2
         Qe2J2ZreNR8NHh7Ezzwwuvp9J2s3ea3G+ZC1fzhQmzgaN2xs33AC3qOL1YqWIUZw9XPe
         ENkoROCgHPYZvl55g7AQ1IzABLWOp0vAw3Go9Ti2Dx6YYEtqKuv4Fiagu+8l+VuORyO9
         Ih7tuU2LzAGgbY2znBewTxo1ulYH5lahSn+Y7WkecAa8+eukNAGlMYSlP70N28Oq81wr
         7Nb8pwcs706J+8BcOrV2fl9MBh4RUmEmeTAS5aD/Zgd6aMK/IU3deGZX9u6LVHQqZ0Mv
         +RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgNVLPP81e/ZJyUA32o0ZH9mBi/iQe4yk7ouaJGZuy0=;
        b=whQ7wuvidwOjzk0cyDJ057hJQYDZxEXI18/FuoBjqcB7TbnDflNpppEnwXNgfnxSFk
         Rkk4KWhsCbg/0IQRemkysZwiF3qBuWoflRYB9B0H+SrmmTRPil7sS22YxMhrEGpXo+ef
         hp8FvzhJD0r6x0yw+oqMUfE2Uq+ChOlq3NZ1LHog/ZWYURh33uC1i6Lg9nR8orVfIr6k
         rvptRVwa65zd2AcN6yJbo7HzYenpr8gqXWxyEGMZOFiLGwHgRf16gM54+fdAJxXJg9bh
         9Dh+S+5LFkNT9+bFKfDN/h539MHIqvvd5SgTeTMrP7MNLf2WDbNLPuIhVRp3QzlumHuJ
         6J7g==
X-Gm-Message-State: AO0yUKW78HX8m0XF2kBJnZu3nCmlR2OqM+A0Q+syPNMQWrKG8G6HNXz3
        jhidx8+7ecNpwWWyvdQZAAQHSw==
X-Google-Smtp-Source: AK7set+WYZqi41ew+EAKbO82xbTbuL+1CayQDZfUvoUbK1GE7bTWHRU6wKzSpURzm1/aC0UeSRXiCg==
X-Received: by 2002:a17:906:7952:b0:884:b467:ae4a with SMTP id l18-20020a170906795200b00884b467ae4amr8205385ejo.64.1675844243558;
        Wed, 08 Feb 2023 00:17:23 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906348400b007add62dafbasm7954162ejb.157.2023.02.08.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:17:23 -0800 (PST)
Message-ID: <79c1cc0e-137d-af37-0069-f01f9a25e99b@linaro.org>
Date:   Wed, 8 Feb 2023 09:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS
 rail more properly
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     mka@chromium.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207163550.1.I5ff72b7746d5fca8f10ea61351bde4150ed1a7f8@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230207163550.1.I5ff72b7746d5fca8f10ea61351bde4150ed1a7f8@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.02.2023 01:36, Douglas Anderson wrote:
> This is the equivalent of commit f5b4811e8758 ("arm64: dts: qcom:
> sc7180: Add trogdor eDP/touchscreen regulator off-on-time") and commit
> 23ff866987de ("arm64: dts: qcom: sc7180: Start the trogdor
> eDP/touchscreen regulator on"), but for herobrine instead of trogdor.
> 
> The motivations for herobrine are the same as for trogdor.
> 
> NOTES:
> * Currently for herobrine all boards are eDP, not MIPI. If/when we
>   have herobrine derivatives that are MIPI they we can evaluate
>   whether the same off-on-delay makes sense for them. For trogdor we
>   didn't add the delay to MIPI panels because the problem was found
>   late and nobody had complained about it. For herobrine defaulting to
>   assuming the same 500ms makes sense and if we find we need to
>   optimize later we can.
> * Currently there are no oddball herobrine boards like homestar where
>   the panel really likes to be power cycled. If we have an oddball
>   board it will need to split the eDP and touchscreen rail anyway
>   (like homestar did) and we'll have to delete the "regulator-boot-on"
>   from that board.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> This patch should be applied atop my recent series adjusting the
> herobrine touchscreen rails [1]. If I need to send a v2 of that series
> I will add this at the end of it as patch #8.
> 
> [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium.org/
> 
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index ded36b5d28c7..312cc0e1cbc7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -110,6 +110,22 @@ pp3300_left_in_mlb: pp3300-left-in-mlb-regulator {
>  
>  		regulator-enable-ramp-delay = <3000>;
>  
> +		/*
> +		 * eDP panel specs nearly always have a spec that says you
> +		 * shouldn't turn them off an on again without waiting 500ms.
> +		 * Add this as a board constraint since this rail is shared
> +		 * between the panel and touchscreen.
> +		 */
> +		off-on-delay-us = <500000>;
> +
> +		/*
> +		 * Stat the regulator on. This has the advantage of starting
> +		 * the slow process of powering the panel on as soon as we
> +		 * probe the regulator. It also avoids tripping the
> +		 * off-on-delay immediately on every bootup.
> +		 */
> +		regulator-boot-on;
> +
>  		vin-supply = <&pp3300_z1>;
>  	};
>  
