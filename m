Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5CC660169
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 14:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjAFNjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 08:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAFNja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 08:39:30 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078DF65ACB
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 05:39:29 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id h6so682268iof.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ceg3VkOhpcJNdMZIgPdIbnXe0RLV55L3LTXGXOf9SIQ=;
        b=pyySRwGk2hxTT2bnXRV85gzXyrvH9lG610OVdZ0sBfIFhFye/qMiQA2wmS7gN92XS8
         doICUjM80sG45wlJ5XJsr+Oo7/WxnSFD5LuNj20Zzm0Jduh3nYrdYxHHgqrJiKAr9h8F
         ITV3WoZ0QZMQTo5p790GYm/uWQKrC7ILcj4X0g0q4EpzaGQNXYeRI85fodXlFcq0XGAp
         u15pX3g7vbbPl8jHwsAa9/GWx4bATYBLXCi8RRe7rQ9ocMb6Saf9kJRzjfslKTUUPL+A
         4xQHTzrCkvLGQQe0mMX91P4v9Yh5SwjqeRu9zAF2R9WX3u5qN5IIAfK4MMdw5B2LGUf/
         8+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ceg3VkOhpcJNdMZIgPdIbnXe0RLV55L3LTXGXOf9SIQ=;
        b=ivGBvXg8UImHGJAXfbHYYUHluHL4Ecn354xI+Aj0ujL+ZYAGpJdRaTVSy60AOp1jpd
         wwM3cmnd/MAdAOPGMcw5xtbaFkGuNJW3u6+gKoGuiCGJY/rkQAJS6c5Pr9R0u3KutShy
         JGaDVljdSTgGMoMw4RX9u1RitzIfuqULH1Mi4Hxn+F68fbRgX3s4Uo7Q/ulgrJarbEkQ
         kWHsit+ISUqNw9Eumzgv18KzMFaICNswev5o2rITtj7mmj8QJJEZS12qj96KiJ3UTmyJ
         gpb8cOxAxqwjDsI6CnSmva9b2MAkjBY5aqbP3DWGIMzET0G+38MtLGfMiuAfeBPM5YE0
         kZqQ==
X-Gm-Message-State: AFqh2kroWUwwfSjkjGG7sViniC9sOp6sbXKD3NaeSkJCVfXJmex6H3fa
        QxCuq8kQI+51hSwzzSM2PwHevg==
X-Google-Smtp-Source: AMrXdXsg+VHVt3KwLloLHaCCwaqFJNO0SSyRpzNvBxputGf6uvCknauXhpUJfR028Ff2Q7UeJJX7DA==
X-Received: by 2002:a05:6602:370a:b0:6ed:a708:7ed6 with SMTP id bh10-20020a056602370a00b006eda7087ed6mr37039786iob.9.1673012368365;
        Fri, 06 Jan 2023 05:39:28 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id o23-20020a02a1d7000000b0038437cba721sm346630jah.7.2023.01.06.05.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 05:39:27 -0800 (PST)
Message-ID: <927673c9-ce50-d03a-83f5-45d5416838d1@linaro.org>
Date:   Fri, 6 Jan 2023 07:39:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] clk: qcom: rpmh: define IPA clocks where required
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
 <20230106073313.1720029-2-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20230106073313.1720029-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/6/23 1:33 AM, Dmitry Baryshkov wrote:
> Follow the example of sc7180 and sdx55 and implement IP0 resource as
> clocks rather than interconnects.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

So this is simply adding these clocks?  Were they not
defined/implemented as interconnects before?  (It
isn't clear from your message above, and I just want
to be sure there's no duplication.)

					-Alex

> ---
>   drivers/clk/qcom/clk-rpmh.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 586a810c682c..5f914cf36b10 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -445,6 +445,7 @@ static struct clk_hw *sm8150_rpmh_clocks[] = {
>   	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>   	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
>   	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -484,6 +485,7 @@ static struct clk_hw *sc8180x_rpmh_clocks[] = {
>   	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
>   	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
>   	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -504,6 +506,7 @@ static struct clk_hw *sm8250_rpmh_clocks[] = {
>   	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
>   	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
>   	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -546,6 +549,7 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {

