Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D5A747221
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 15:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjGDNEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 09:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjGDNEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 09:04:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414141994
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 06:03:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso5615220e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688475829; x=1691067829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqNFEYbfaetiBaaCCq5dlakPJ6xMPu9fuyjq6ckqKKI=;
        b=hcWyPQJ0Scl6T5c9hS3B0rqtUiBam2Y7usGDUzf4ClQ4w6B/M+6MqkIWISX7OogugX
         G/jc/k7X1HV72yHe3qM7MadmKRrQIQ6X7EPqmoqY7PW//UZV83JLqUt00rrL4fP6NL0E
         KpSjPiPapK9MPceps9hH8zF9TOLKHA4NpGcSh8brnm2EGpb0vQCpWKPX9uJkoDv3mbrc
         Rn3AGofTA5NuZttoAuClwy4n/zypIcNZ6w1UWVnk9k4mTPFiF4B786MIdRNqFJ83zQLn
         FSaMKddJc52zTuArIa0cKKQcVfqjTmUdJPpk4642oUtjY4vnuqH5MHUiRAHc77vohDOG
         hWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475829; x=1691067829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqNFEYbfaetiBaaCCq5dlakPJ6xMPu9fuyjq6ckqKKI=;
        b=gD3FZEF4zbIFlZaBEQZf8IwmFbuGx3PZTmYUhl5E5CwakdjVS4jppQwRCgnk+J7vHm
         bK9rKvZ1G8aoOux3C2jOLhubaowWMi/OvrAvDx80kQl8FOmWEA3oOnXhpdwf/qbYR43+
         Jr4XF6xF4n2/qRl2J1wdPHSENYD3Fz8m5VHO5umvIn063OmmrQSTgAwc1m6j7PVqAEw5
         U8+TkG3GGzViFOjY/wlg/WoKVx9lZQ+4SgR0a9kK1DHtAwzyB4PhETws/NawcaU0ZClX
         PXzxkwJtHS1fuTzEZsxLaUBRREA7x7h/BqFMH7vS89s8Kxt6/s0rpq+55/KYw1aU9fAP
         NpPQ==
X-Gm-Message-State: ABy/qLaf46ryPZ/h0IIYQnYLAdhdQYDgD7DY0v6qOaWVPwfdMZWzrCzN
        dAq/RTwyLb+2F5P78mWtPsZ2hg==
X-Google-Smtp-Source: APBJJlGmV/GZ2Ck0zw2BnJTKC08EED8fq31PqMjpTN0JsiZC+ceHVBFuI3LhL1kcgRR62d6BniwVlQ==
X-Received: by 2002:a05:6512:3b8b:b0:4fb:774f:9a84 with SMTP id g11-20020a0565123b8b00b004fb774f9a84mr10863098lfv.13.1688475828935;
        Tue, 04 Jul 2023 06:03:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id j12-20020a19f50c000000b004fbbd81856asm341134lfb.143.2023.07.04.06.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 06:03:48 -0700 (PDT)
Message-ID: <971262d5-98b3-c48e-89fd-ce107275008a@linaro.org>
Date:   Tue, 4 Jul 2023 15:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 4/8] ARM: dts: qcom: msm8960-cdp: constraint cpufreq
 regulators
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
 <20230702175045.122041-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702175045.122041-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2.07.2023 19:50, Dmitry Baryshkov wrote:
> Add additional constraints to the CPUfreq-related regulators, it is
> better be safe than sorry there.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I'm squinting quite hard at

https://github.com/LineageOS/sony-kernel-msm8960/blob/jb-dev/arch/arm/mach-msm/acpuclock-8960.c

but I can't figure out where these min values came from

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> index 414881d34c60..cba0d1e460a1 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> @@ -131,7 +131,7 @@ pm8921_s2: s2 {
>  		};
>  
>  		pm8921_s3: s3 {
> -			regulator-min-microvolt = <500000>;
> +			regulator-min-microvolt = <950000>;
>  			regulator-max-microvolt = <1150000>;
>  			qcom,switch-mode-frequency = <4800000>;
>  			bias-pull-down;
> @@ -287,7 +287,7 @@ pm8921_l23: l23 {
>  		};
>  
>  		pm8921_l24: l24 {
> -			regulator-min-microvolt = <750000>;
> +			regulator-min-microvolt = <1050000>;
>  			regulator-max-microvolt = <1150000>;
>  			bias-pull-down;
>  		};
