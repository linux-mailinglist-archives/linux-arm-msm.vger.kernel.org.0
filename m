Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0426168A4A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 22:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbjBCV3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 16:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjBCV3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 16:29:35 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899006A738
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 13:29:34 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qw12so18986875ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 13:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LNA5ppOx7S6cnwpf94/Rxg4C6FV6ETyiGp8YYuCm5hU=;
        b=LMvxDnmUw3el8LJIeYxiF/YTdVkfXYCYpEwcbLcQr7J+jVaCTGnX1MZyIkgNeRJrBi
         oC8DYaJWMvOqBOKLWnZXz6zfXE7gT+NFEpsMc6CbjKxmTzFRFWVaresIjCrErpXhqgG6
         GlxAcukdyemNlsGH+PUgEO2RnR2JSdALeUvdahHt38cgbOIGPtLP2Ph6F1H0R1yaZchK
         4pnVT9he4sOnIweY3Yw8DzTSNoxfh1bL1ydT3XFzloaTKs8YkgRlb5BaC4VhNWqYymeN
         HrIQ4i3VGnruZcr42lGv0Wr+ygDQGGt8eZbkMwoGbILQ7QOnVvp5P2CwwRbv4jAdGahW
         8DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNA5ppOx7S6cnwpf94/Rxg4C6FV6ETyiGp8YYuCm5hU=;
        b=vx3yQaNGEmR5CV0YxC3AraRKiL3oeRolchMXHmsGX0RB5xKlwnJoIO0HZzYmnGw2cz
         qXYJ0Q5aEOzxNcMjXJRfaInxbn2hh+RWnqYNm+ZV8pvfCvUluIbnDW50B574r0rQbDzc
         eOWIllD5vOlbx5GqbfrUJ5QFWvagro+pGLUZJA3TS03T6LNMKlKzXCFUYVIPR+d7dtsC
         LcjySovdJJTNN/ihXNG3pRZXJDQLOd+GxZ4vzVQCepiIGHyvlDD48kAatOStGCpdpiqB
         W24oP2hYu8GJw4x7hji8F9SARX/oSxPCQpJR88EX+VKI+8zDbPse7+9gh+aHFnt6RTtm
         0DvA==
X-Gm-Message-State: AO0yUKWagiVnshfnuDyN2RPAXyDBTYMHhcYFbn3yODVKKPIXW+jTuvde
        d3/zd8xche7nBq/QdJtfhifSzA==
X-Google-Smtp-Source: AK7set9bOkoeISqbcYTVLeRtbQoOkoDlN6XAqzL8OhFgP8IkASk+eKqZ+N1SKyKcv2qwUUtkJhQiIA==
X-Received: by 2002:a17:907:c14:b0:890:4731:d1bc with SMTP id ga20-20020a1709070c1400b008904731d1bcmr247944ejc.38.1675459773038;
        Fri, 03 Feb 2023 13:29:33 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id lt14-20020a170906fa8e00b00880dbd4b6d7sm1914070ejb.170.2023.02.03.13.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 13:29:32 -0800 (PST)
Message-ID: <73576b5c-ef8f-1712-ae77-ae19448822bf@linaro.org>
Date:   Fri, 3 Feb 2023 22:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] pinctrl: qcom: sm8450-lpass-lpi: correct swr_rx_data
 group
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20230203165054.390762-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230203165054.390762-1-krzysztof.kozlowski@linaro.org>
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



On 3.02.2023 17:50, Krzysztof Kozlowski wrote:
> According to hardware programming guide, the swr_rx_data pin group has
> only two pins (GPIO5 and GPIO6).  This is also visible in "struct
> sm8450_groups" in the driver - GPIO15 does not have swr_rx_data
> function.
> 
> Fixes: ec1652fc4d56 ("pinctrl: qcom: Add sm8450 lpass lpi pinctrl driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> index c3c8c34148f1..e22d03ce292e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> @@ -105,7 +105,7 @@ static const struct pinctrl_pin_desc sm8450_lpi_pins[] = {
>  static const char * const swr_tx_clk_groups[] = { "gpio0" };
>  static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
>  static const char * const swr_rx_clk_groups[] = { "gpio3" };
> -static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5", "gpio15" };
> +static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>  static const char * const dmic1_clk_groups[] = { "gpio6" };
>  static const char * const dmic1_data_groups[] = { "gpio7" };
>  static const char * const dmic2_clk_groups[] = { "gpio8" };
