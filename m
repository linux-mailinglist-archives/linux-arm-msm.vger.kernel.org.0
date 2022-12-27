Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B955656A39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiL0L65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiL0L6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:58:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF054B4A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:58:25 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z26so19330432lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/j0KJ5JXQooh1zf02bqcVkBk7WYYsJ6Q/cPhKQpZM8=;
        b=K0G7AbJmUWXMd8MH79aH0wTThrwPSjGsHhFy7bTwbRJC7WqvyMLqV0q2VBlxmfMRsV
         RZP4BgZzwutZBwgnqP7odHsRvThKo/wCtyHBf4EUtmch1GwzU98XGVePH3GvjLZfvCTJ
         5FbTt68/wWO4KtCjlVkHn6vuGAEWQQn+GxMpyCmZSc34p7ZMBQYXUxuPFLjHyrW5axCR
         iKiHBIIqce4IZ8u07ekvaQCOqQe4e9fFaMpGiSBw6w3UGTi6UuPWvt48rsaAHGEFhoTd
         N5LRebNSUQD/4yfZNEaK1KOTWdpIASUm4K7mRepndz3/EIBPAhgHNpzo9BhWM99MDbfn
         zJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/j0KJ5JXQooh1zf02bqcVkBk7WYYsJ6Q/cPhKQpZM8=;
        b=eAnBy5iCjxRIuxXOk5qwGPLjrj+TDzJxD81OLf48z+84Q+oUVYSp5Jk/+9z1BSxGQF
         WwIz7RrK4W5TmN6dBwFiXfZzauhhqQ76dqogEsnLYAlRJwBzjo3KxIYUNDLNIvxDwjcZ
         FdkoftzaSFEPowR+a3adaqMYpLp/3/VnpWuedP0I8leiZc2o+LX/gTtzzhN4j4L/KoA0
         U6TA5oGKZ+JKTHrRTiK42teEgmppRicgW2r3Df59lVad6o3j4U0w0wyAa89Bhd9/OEY9
         BMmK/hRJ/airh8auGAQBUWM3I5LP3nW7GfuHPFk0xwOqe8C+xtT1l3U1ObLFS+6WOoxE
         v36A==
X-Gm-Message-State: AFqh2krL5IQw67y9NGD6lwEXjSk/bsd5+Km3Uh7fQDHsTfC6noBjGjDC
        jX2yMbIpI4XvTVawuoBwB3XupA==
X-Google-Smtp-Source: AMrXdXvDkRaBJoRBdJwystIi7epS4lRyKYVY3xHASlnch5miQYUqadzzJZ1VgzKJ5DOIhUDWSe2xow==
X-Received: by 2002:ac2:43cf:0:b0:4b5:8298:5867 with SMTP id u15-20020ac243cf000000b004b582985867mr6847147lfl.66.1672142304248;
        Tue, 27 Dec 2022 03:58:24 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id f20-20020ac251b4000000b004b5785b1d9csm2233045lfk.302.2022.12.27.03.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:58:23 -0800 (PST)
Message-ID: <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
Date:   Tue, 27 Dec 2022 12:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 07/12] clk: qcom: gcc-apq8084: add
 GCC_MMSS_GPLL0_CLK_SRC
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227013225.2847382-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
> the multimedia subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I'm thinking whether it would maybe make sense to put 8974
and 8084 clocks in a single driver.. They seem close to identical.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
> index c26e222c78d4..7085d2ccae49 100644
> --- a/drivers/clk/qcom/gcc-apq8084.c
> +++ b/drivers/clk/qcom/gcc-apq8084.c
> @@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
>  	},
>  };
>  
> +static struct clk_regmap gcc_mmss_gpll0_clk_src = {
> +	.enable_reg = 0x1484,
> +	.enable_mask = BIT(26),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mmss_gpll0_vote",
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpll0_vote.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_branch_simple_ops,
> +	},
> +};
> +
>  static struct clk_branch gcc_bam_dma_ahb_clk = {
>  	.halt_reg = 0x0d44,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
>  	[GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
>  	[GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
>  	[GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
> +	[GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
>  };
>  
>  static struct gdsc *gcc_apq8084_gdscs[] = {
