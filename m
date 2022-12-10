Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA52648E55
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 12:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLJLFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 06:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiLJLFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 06:05:45 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF701E721
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 03:05:42 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h10so7487945ljk.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXt9l3h8UvC056p18+migPDLHDHm/JWJnpRirDbc2MY=;
        b=C82qGunJQ2dy9pwQdHEanL/NMVDY0YXEC6y+Dl0CoxD3IEhUtbTDVOGF+KZL3nUG78
         qLcFNyDAYiQEaffD4fJSd9K0L7lMhUxkWj+EMeBLUuHF13eZMssi8EkyP+63ziVoSsPm
         DbV3fdtWynxgFeuDjrNfzNhUD/QLhC4eASJXSB/Az4z6RAoozaqTXAkrUldN6dokx3AB
         sR2fxtOKbC1I0kOtnICRc5Di/+v2HEO9Vkx9dwa+/ktyk8Bd/Lsd13Zxf1l6ehWNEDF1
         ZcXhLjz+fAuE1ZXZSamZzMYcHD+e/KcBVYPPaIiud55+R4BgwNerJZpGR/T48ttnlc5v
         QH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXt9l3h8UvC056p18+migPDLHDHm/JWJnpRirDbc2MY=;
        b=MvhbOjz0051C9cjpNOZyVe2m0++WlpOTBpTBRClEzs6ZBVg9o/8sZERaO4RPf5qV4c
         eQs6YcssAnRS7ewlDJz5gaUiVlmyuvVCC6LOnAjutDQdngNGec/uLbRAvrsJWIad8IUf
         aoiAqRwHl94RIHC3WzxoUrW2vqbtJeM68QoXOeWqqcweQwOXzoCY7rGKQvugDiatf017
         HN6whPz4Hz4qNfoeNssEyP2vIVccw0VbfiFbIGs+/pQPhrOqb+og6SYhZBCq9gozPeFQ
         C3iAp6WhKvL6K5ZKwBPSLGj3GYJzr7E/ez3WeVWuWUGyBqcJdlkUfSHlMgso3q6702xC
         ihJA==
X-Gm-Message-State: ANoB5pkGZU9PvzQQYa1vSPR4YW1BkiOeV42Ncs3TSCDpgw7129zG1xMt
        vTzSEaiuXn1BnttGkWoKjFoNBQ==
X-Google-Smtp-Source: AA0mqf5Si5nKtGdnoatbchxOVi5LIC4FAgomZdP25gPowAC+O+GoQWEt5Yh3XnXrEgFDwaKkXOG7Dg==
X-Received: by 2002:a05:651c:894:b0:277:9f5:1e16 with SMTP id d20-20020a05651c089400b0027709f51e16mr3462870ljq.4.1670670340636;
        Sat, 10 Dec 2022 03:05:40 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id a25-20020a2e8619000000b00279b292115asm538527lji.109.2022.12.10.03.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 03:05:40 -0800 (PST)
Message-ID: <a333fef9-2cff-9a42-9368-b908f282137b@linaro.org>
Date:   Sat, 10 Dec 2022 12:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc7180: Bump up trogdor
 ts_reset_l drive strength
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     swboyd@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        mka@chromium.org, Yunlong Jia <ecs.beijing2022@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209171240.1614904-1-dianders@chromium.org>
 <20221209091234.v3.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221209091234.v3.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.12.2022 18:12, Douglas Anderson wrote:
> On at least one board (pazquel360) the reset line for the touchscreen
> was scoped and found to take almost 2 ms to fall when we drove it
> low. This wasn't great because the Linux driver for the touchscreen
> (the elants_i2c driver) thinks it can do a 500 us reset pulse. If we
> bump the drive strength to 8 mA then the reset line went down in ~421
> us.
> 
> NOTE: we could apply this fix just for pazquel360, but:
> * Probably other trogdor devices have similar timings and it's just
>   that nobody has noticed it before.
> * There are other trogdor boards using the same elan driver that tries
>   to do 500 us reset pulses.
> * Bumping the drive strength to 8mA across the board won't hurt. This
>   isn't a high speed signal or anything.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index f1defb94d670..ff1c7aa6a722 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -1376,7 +1376,15 @@ ts_reset_l: ts-reset-l-state {
>  		pins = "gpio8";
>  		function = "gpio";
>  		bias-disable;
> -		drive-strength = <2>;
> +
> +		/*
> +		 * The reset GPIO to the touchscreen takes almost 2ms to drop
> +		 * at the default drive strength. When we bump it up to 8mA it
> +		 * falls in under 500us. We want this to be fast since the Elan
> +		 * datasheet (and any drivers written based on it) talk about using
> +		 * a 500 us reset pulse.
> +		 */
> +		drive-strength = <8>;
>  	};
>  
>  	sdc1_on: sdc1-on-state {
