Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B80A63D4A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiK3Lct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbiK3LcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:32:20 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD35E86A30
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:30:44 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id h10so3812916ljk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwImYC7W7ZZuKVqcGDzmbuBlb7N4Pu6f1S4cC8DOdRk=;
        b=KZaG9Lue8nCFAyPP7V2g1X6m30n7QLpXq2inp3WhIHGnhbTiQPvwqX2Tu6h5Gj9Lxv
         kyo90KWwiJYBC3H824AIGlqpI5Ex6LHagP5zPas+exajYibmWxRpte2B23TePmFpRgsC
         Aqz55FYfKYS21xQQ3IcP0Fenq86y45JUznXXVVbHXNsvHg6RQ38QHL92DCLi1o0UVRT0
         hsBOp7makj8w72dMPKBx4T5nV8LfGsUY/xaWZkH6aur4wmCL06uEkaR2PtBajLOKVhec
         GxbKJQMC1YN7XBs2i6fXv3T3ZOVs2QFUOgmriZjsKlcIrvD0kVstEA+EegKr+I18Xg+U
         oL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwImYC7W7ZZuKVqcGDzmbuBlb7N4Pu6f1S4cC8DOdRk=;
        b=rceQv6GtdT9RYmW6lgxVP2dhr0FtyXtgWT6vz0e8qOWY3h6+tua/wwJfSXaH0LWMaT
         YZtc04yL9X1nQ6lZT2VUm1myDllXtwKdYAKExwnJbyAGa1Gh6liHFl8yPctNk6ho2/s7
         ly8niD3QgfuouiU51NxxDDJT7/hKJod7Xvg743HKwjP/IgEzEymhcvW2yIdGl0GcvJtJ
         nkaVUMVzi1Zv332GI72U2st+ZYhB92naIH7j4cnY3PNzzl9Of4TtMCMryHi59+D+LSCR
         DWJY88EcvuJV8hOBAJvnMS7XRoBSxv0+xIDC3bacCTTHw6nnB62T21VIGRFG8i0JMM+T
         G7jA==
X-Gm-Message-State: ANoB5pmoHdUWfJZrWGD5R8qeMTo1LU1G1T49BeO0jl+2VIunQM4Sizmi
        3xRA+7QZdCqOHBoiMi8O+70Lkg==
X-Google-Smtp-Source: AA0mqf4pqWBeREzjKvW67NtvR30uj8LXyAM6/326FvEy9mtPtKdoyTAUX5VlAmr2ybct6m71fwD05g==
X-Received: by 2002:a2e:b943:0:b0:277:1d7e:9f6b with SMTP id 3-20020a2eb943000000b002771d7e9f6bmr18030040ljs.421.1669807839966;
        Wed, 30 Nov 2022 03:30:39 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id a22-20020a056512201600b004a2588520f5sm219999lfb.166.2022.11.30.03.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 03:30:37 -0800 (PST)
Message-ID: <e3268c45-b97f-1eea-c0a2-752cac714397@linaro.org>
Date:   Wed, 30 Nov 2022 12:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/9] clk: qcom: gdsc: Increase status poll timeout
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
 <20221130112852.2977816-4-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130112852.2977816-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.11.2022 12:28, Abel Vesa wrote:
> The SM8550 GCC GDSCs need a higher timeout value when polling for status,
> so increase it to 1500us, while leaving the delay between disable-enable
> sequence for votable gdscs to stay the same.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gdsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 0f21a8a767ac..9e4d6ce891aa 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -46,6 +46,7 @@
>  #define RETAIN_MEM		BIT(14)
>  #define RETAIN_PERIPH		BIT(13)
>  
> +#define STATUS_POLL_TIMEOUT_US	1500
>  #define TIMEOUT_US		500
>  
>  #define domain_to_gdsc(domain) container_of(domain, struct gdsc, pd)
> @@ -107,7 +108,7 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  	do {
>  		if (gdsc_check_status(sc, status))
>  			return 0;
> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
>  
>  	if (gdsc_check_status(sc, status))
>  		return 0;
