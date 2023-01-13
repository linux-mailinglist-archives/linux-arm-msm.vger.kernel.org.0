Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5371A6699E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241581AbjAMOQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjAMOOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:14:10 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA2665E2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:13:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g18so452557lfh.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2wb4QzlfSFMGgz56I7id9+tIGfaOAlRVUGG8w11u8o=;
        b=ZWQNSfyOd39xTZ3DRL56NNpdR56QqBXBinp+KZVXMAygER4G/XUuQfUmeV12Dc6D4F
         Uzqa/4cwcvjzu2lUDvNlXrGItuNETCby03gW2vLDxI4qDf5Qfi3UKoCtpDISlcJ6QNE9
         l1X7lLg3JgNKlSz2jlLHzMmAQ1aPHFb8/piCGBhI4k/i2lU9TufSiM7LdybFO+662S3n
         Qc/gmd5B3BhJM0gtTYS6sx3hXdMIZ2K+N+2rSVeCueFL+bKmAIY1t+BAIzHr7gQabIYJ
         d8MwHrb/DqfzRiiFtGNAxs8xwu9UdL0IG2Q85H1oZl1pWnCo7oW4eBXlFwUlcJfmFdvh
         AR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2wb4QzlfSFMGgz56I7id9+tIGfaOAlRVUGG8w11u8o=;
        b=rbpG/KfhQo232Xrffo0Obqdt11oqTIEyGkonBjACR1b/t21cq3MIJtlGfMCG9bBRvl
         zvibsBb31Kt1ObQyicHxr/xe7vrhRDidUDF14Qk31iNsq9NnTQvNQVTDO2lt/UObT/Ly
         gUO0PSSsnMECLRUR8iBxW7zVlNvfmCgxewQiYKFeyCTjQvPtiQ24BiKIrlnl+Q+AMU+5
         QSwqepyUetzKnSlamjrH8IWRxeVw9lZWbInH9k/Q8AyVVwU3WztfyHIzJa+TV3vNEWsx
         zSalq8itctQdZ212GBYhgxLQYU6/6JBCXtyXQ8NgdBNj7CnVDaGf+z2h8hiXjVYPDj+m
         SFUA==
X-Gm-Message-State: AFqh2kp3KfFi6A8OAGEraRHMFqCqwPcKTZQsnThSRaYYJcZa3njr1EEc
        Gxq4pm+UBHUoO/aQs4u+T0Yx7A==
X-Google-Smtp-Source: AMrXdXsaVwUWjQciY3aaXpukAVwX0uZxWa/SibAxvjD8ggD7osAzON+ONUEySVL9kUu6+RWd+UPd1w==
X-Received: by 2002:a05:6512:23a3:b0:4cb:6bcb:de4e with SMTP id c35-20020a05651223a300b004cb6bcbde4emr11066117lfv.24.1673619223899;
        Fri, 13 Jan 2023 06:13:43 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id r16-20020ac252b0000000b004cc716da978sm3769961lfm.209.2023.01.13.06.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:13:42 -0800 (PST)
Message-ID: <498801bc-64c4-df76-8683-999f3a14afa5@linaro.org>
Date:   Fri, 13 Jan 2023 15:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/14] clk: qcom: cpu-8996: fix PLL clock ops
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
 <20230113120544.59320-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 13:05, Dmitry Baryshkov wrote:
> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
> better.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index c471c6836c63..b99a47aca478 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
>  		.name = "pwrcl_pll",
>  		.parent_data = pll_parent,
>  		.num_parents = ARRAY_SIZE(pll_parent),
> -		.ops = &clk_alpha_pll_huayra_ops,
> +		.ops = &clk_alpha_pll_hwfsm_ops,
>  	},
>  };
>  
> @@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
>  		.name = "perfcl_pll",
>  		.parent_data = pll_parent,
>  		.num_parents = ARRAY_SIZE(pll_parent),
> -		.ops = &clk_alpha_pll_huayra_ops,
> +		.ops = &clk_alpha_pll_hwfsm_ops,
>  	},
>  };
>  
