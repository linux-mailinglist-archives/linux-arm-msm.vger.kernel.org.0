Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9864C649063
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiLJTbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLJTbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:31:02 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8178B167CD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:30:57 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z4so8422297ljq.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHUxrTWEyWCbMTjMFrOhcmmMYjloA5mjsislly9TIB4=;
        b=r8p55zxMDjZM/wWGpK5vatZJhI3dlsRyV1znBd/7pvjIFDNZLsi4Ggrgpr/JeAKgP3
         ozrkfHzLD2YEV3ecJ7xLCQ3dM3wbgzMTOf2F8yiqdYiBJMmbXhBKfpPBXl0OATMD0ta4
         tljuJkS1W2WyGLNjtNvqcj0fxcbQOhu6UnuitOcDwebor2uBX/9WUpG6jEbM0cBxpBfV
         m261jgTnf6Nc+ti/c34Oux99Fl7BQaBdl54ald24T7yBfsNq6kZZRzF41SBGXwK1Vzb9
         07u76A4NNse2LF0GO1BxJMX7QM/z9U+95teB8twoDikUWAPl6E4/jLneLy1Ei1VJYLua
         ytMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHUxrTWEyWCbMTjMFrOhcmmMYjloA5mjsislly9TIB4=;
        b=0qNSQtUSwBBLMoEe9NOsDoC0oeCQfKL88f8aOila36b++cguptoPwussYhPJweTJ4Q
         E+JncoZL+GTEPOc5xiAERSvQ9z3Fq+DJ4Obe2xtLXcR0r4N1/axQZkhJKxJxWkSInBAE
         PHa5MoPJS/hNTIxR70FKVsvg16ay1NHBJvZnXdfwa33AbxTa3HodcaNrcFpmGUjmniTH
         NuRCpz4C5b++UYpKSqmctzp3cqLQYj6vFPQjQIQT5P6+9PJu08w1J+5+UbigxujlBWM0
         RGMuDe/qvpFOtD3UnvWR7gbw/+WE39qog6FK5ITG7hTF1EP/VAvhFWGkhJq4D+mh/MKa
         Dymw==
X-Gm-Message-State: ANoB5pnpbykMc6M2Jz79PJpkxI7ydGVQseTH8cgrF7Gw+H8bO6dQnUbj
        ykHajiPrJRIXDZmh9aLPVn/xAQ==
X-Google-Smtp-Source: AA0mqf69x4E/NiIiGUwEelaF4HvuZxMhRIuAwLYpKJRUEHG+Xt9uo17Cr9Bo2q8BQ/By7Lc34BoRgg==
X-Received: by 2002:a05:651c:551:b0:277:44ca:5dc7 with SMTP id q17-20020a05651c055100b0027744ca5dc7mr3502132ljp.9.1670700654864;
        Sat, 10 Dec 2022 11:30:54 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id k5-20020a05651c10a500b0026e04cc88cfsm718747ljn.124.2022.12.10.11.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 11:30:54 -0800 (PST)
Message-ID: <b8575c43-44e0-de44-344f-47b0c4a31879@linaro.org>
Date:   Sat, 10 Dec 2022 20:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/3] clk: qcom: dispcc-sm6115: use parent_hws for
 disp_cc_mdss_rot_clk
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
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



On 10.12.2022 20:07, Dmitry Baryshkov wrote:
> Rework disp_cc_mdss_rot_clk to use parent_hws instead of parent_names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/dispcc-sm6115.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
> index 818bb8f4637c..1937edf23f21 100644
> --- a/drivers/clk/qcom/dispcc-sm6115.c
> +++ b/drivers/clk/qcom/dispcc-sm6115.c
> @@ -466,8 +466,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "disp_cc_mdss_rot_clk",
> -			.parent_names = (const char *[]){
> -				"disp_cc_mdss_rot_clk_src",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&disp_cc_mdss_rot_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
