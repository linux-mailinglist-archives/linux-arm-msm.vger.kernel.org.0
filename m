Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8BC649065
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiLJTbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLJTbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:31:10 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051D3167D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:31:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id c1so12176681lfi.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBUPWMXH8iRSCcgzepxUdF/j8g+GS5ukyojVVIhhu3M=;
        b=y6lHw1KuKVu+NoL28vrwtbDpXL/YfiIsba5gF3JYqR/bUkh+OLhZI2PqOBG/L0uZCt
         UdiRueuVuPK86V6PtPpsBGVFxMcSubJAd4zfgXCQi1Ym1h+oXmAX8T2sACAFc/gJ3I6e
         ZNq6fxxGEtTQwaYT/UI+HbHe9AgZ1HuCj42Rvn8/oK9a0ddXCZl92dOxoURWFlfputYY
         3nZsW/mSYMlFrA4NNcOxJPia7PPSp6ntQeu36fSF2uSxZqSpvbrpbIl61uk/uUCHzCMS
         hygVdT192mUqj1WtD+iCkxfEcnJOrDt/OEXlnRcOVxut/93hRpHCzA9ohwHNpcWJRmy4
         Hx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBUPWMXH8iRSCcgzepxUdF/j8g+GS5ukyojVVIhhu3M=;
        b=QrKQzs9rsJtnJjhzOb9xjaPHFd5yC6I/XE/JCEx7H7+WCH7rdXmMVUOE2+5dckcCCc
         SSSJyBeb6/e2ST5wushRQCQgugkXfYgAaADfmAKBA/UmshtzMRCZJMrgCh8CJConEPAs
         K6Ey0TcRKH9QN4N1oq0/dEx9og9lbBVyG8OmLcOkuDTZ+GVIrmni2Sy3vSBRX6AH5QUs
         CvEjCM4YiXjcVIE0qh7b3o/TgOE7QVa1KJXi+ceD45eRSGjKyp4rbp746yUH6eFDi1eC
         MyfUPkxulAKOT1ge47HwtvtvluQPCIKq8zVZc3cVPet3XBNf+JRG39uieffnjPo/GJiG
         9Jkg==
X-Gm-Message-State: ANoB5pnFuXbRgneCxKixuhvemrPEi5nqPDtXj0aqwV2moSSnmkqMvmez
        ohU+pcUIQ2kiadsEs6QYAbQEqw==
X-Google-Smtp-Source: AA0mqf6GN2UJFrbfak4FnxglDKqQ9HfQGGSCUQAmkyDnNV7X0m021Yotir7hcHUvP8t8sO/5GBuDjA==
X-Received: by 2002:ac2:43d8:0:b0:4ab:7f8d:472 with SMTP id u24-20020ac243d8000000b004ab7f8d0472mr2418846lfl.65.1670700667302;
        Sat, 10 Dec 2022 11:31:07 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512361100b004b373f61a60sm828189lfs.96.2022.12.10.11.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 11:31:06 -0800 (PST)
Message-ID: <f9eb2503-9d84-ad73-09e0-3ffeef1e674c@linaro.org>
Date:   Sat, 10 Dec 2022 20:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sm6375: use parent_hws for
 gcc_disp_gpll0_div_clk_src
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
 <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
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
> Change gpll0 to use parent_hws instead of parent_names for
> gcc_disp_gpll0_div_clk_src clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm6375.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index 89a1cc90b145..6d75f735a7a6 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -2330,8 +2330,9 @@ static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
>  	.width = 2,
>  	.clkr.hw.init = &(struct clk_init_data) {
>  		.name = "gcc_disp_gpll0_clk_src",
> -		.parent_names =
> -			(const char *[]){ "gpll0" },
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpll0.clkr.hw,
> +		},
>  		.num_parents = 1,
>  		.ops = &clk_regmap_div_ops,
>  	},
