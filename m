Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839F6666528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbjAKU7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbjAKU6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:58:45 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A281C16
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:58:44 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so25428278lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1qg3MzVfQG7C7y0cUB5oRHh9eT6BZD3jl2UT/xoGjs=;
        b=BvukW3P64NhAhmFOm28uOJJbV90VwwhrXhNwfSVTFohbNNNbzgFvhJEMYD9s5MWibw
         yYjHEmRWN7luvJPpSEbN64flIBPbU+t3OiALXa7xLhwXRb7qU/nM3umY24B65ulcWfNz
         xqDf74wSfKBMJSvoFZWVdZCEovpGtZ6ntrJL3Ifhi+GXNP1GUxQes1OTMQBRVTynQg/U
         7EcFB5NNbEkOmRQT9m0Eddx6imponcd8xK9ER0eNp75I2Rga/2Nvh+Vc2DUE4AenkcHu
         X4f3SQYdcWlb5dMv4n2Zxv6cphWtdsydbEy1Ey4tUmoKPw6WMS5cnWjvBZB4gHAzEdWP
         9eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1qg3MzVfQG7C7y0cUB5oRHh9eT6BZD3jl2UT/xoGjs=;
        b=eOQDO46mAbQvUuVezL8im4x5+fBTGApBUj1rZuIff/HS2tSQA22eJgFEwwlMfL0Bj0
         E0XoLFNqFA28aOcg3uySrY6fF+0HMT9RwbJQI+10xxj+FR2Q+JqE7ZjNmolQmisQ0D3Y
         GvjOlnFfmmtsxN9VE8jSm/OUTwBkPQb59Wi6dy1Yar4NBaODnVqc/8DA1EG4fZneNKie
         ZcbYYcII5KNpKutmk2pXvayQw20V86ucBr7ju33lbOS2y01BHXV4P6cbz45YDgOTtX8O
         XnWRfk5VIeeUhdJX0tN5ZYrQTEm+XNlOL2YmBN564AKO8nbJ2J37kd2mHLGBsK9BdOjQ
         04YA==
X-Gm-Message-State: AFqh2koYItSFDzkCQNZlIE+sAPypJxmfxjlfrxJjkTGhb+PTSq+1szR6
        wn6XkeL2SY25PHbz5LWKdoIMsw==
X-Google-Smtp-Source: AMrXdXsSS5FclZVCexFPArBynZHjA700yX0BGqWI6iWjVOOucKnolvHb1Gz7toaVKu+g4Xq99+4Fxw==
X-Received: by 2002:a05:6512:3e24:b0:4cb:c11:d01f with SMTP id i36-20020a0565123e2400b004cb0c11d01fmr19983280lfv.22.1673470722512;
        Wed, 11 Jan 2023 12:58:42 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512078300b004b40c2fccfdsm2898708lfr.59.2023.01.11.12.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 12:58:41 -0800 (PST)
Message-ID: <9a3071e1-0e3f-ae87-0574-7659c52bc884@linaro.org>
Date:   Wed, 11 Jan 2023 21:58:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 03/13] clk: qcom: cpu-8996: fix the init clock rate
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
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



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> Change PLL programming to let both power and performance cluster clocks
> to start from the maximum common frequency.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Can you point me to the source of this? My local random msm-3.18 has this at 60.

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index ed8cb558e1aa..d51965fda56d 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>  /* PLLs */
>  
>  static const struct alpha_pll_config hfpll_config = {
> -	.l = 60,
> +	.l = 54,
>  	.config_ctl_val = 0x200d4828,
>  	.config_ctl_hi_val = 0x006,
>  	.test_ctl_val = 0x1c000000,
