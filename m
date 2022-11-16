Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD8F62BC09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbiKPLeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbiKPLd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:33:28 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC47209BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:23:21 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id i21so26079045edj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+J/SdbEViUXyY/VUeChCmLVo4mO3vOtwEtzDloRYdM=;
        b=okELnb8eaaNB4E50NsZrZ3lFPDMdazxFdqdxxo7Mlbjixnr+uCKtrFGa19w9DSkMGb
         R+/WVwkLC2gtw9QJOAbw79wc2iQZJ+RoYQOiLgCJtsB/l1WQs4llY0gH1gYO5yc8qFO6
         771fN2VMS8hM+U24hy+Fgx/iXkJ6fkL6AnDoaf/wm0k56hN7AlnFadAAtitTFpo0Oy0m
         iXIsUvu8vxF/RqJlToxl5kxYCKy6ChSbESvptsvf5X/revOnbLZ4KtSCeB54xsjGB829
         HCQKmJcSmEhnl0rP78HyOrQh1axS6PwrsR2LyNZcdSxS2yk21ob1EYxhiyEcFe/RXCTG
         OcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+J/SdbEViUXyY/VUeChCmLVo4mO3vOtwEtzDloRYdM=;
        b=iw5ukLcqS9O0SR4PGVENPC621u6ADcD5MLVtW8IZmYFwPxw0pEYymYBq6g2cGewqbb
         KHOOCihyfhMHq5ER4WXRKQwTF21LijzTgu1vlbAdeRsXTDdyhh+r8+75s6f577ys+0er
         8wxyl3d45vbjJv0LE4AQwL9kOaNIQryBixEI8EdoNRKIhn0gaZStnfnjwc9vXDwjMFxh
         lYuzxCBbXJ5tlSOgmHxgsmnv+yMzNg927Eg9iuLzfZVL2lLadWZTIJe46OR+DS+Bdr0s
         ySXMUJ0W4PX054Lij5rRTiq/CtKc50bdsXr2UZiJNVPqWjSdHeSacXSqeflQmwC3PE9B
         +jsw==
X-Gm-Message-State: ANoB5plcNp1payib4QlBNV5zhZNxZ+nuWy6sGIEkAwbtQgpS9UFWazS7
        7rDGkMq9ldnEZ2Wy7Ku2fb81lg==
X-Google-Smtp-Source: AA0mqf6L3j4K6l4ggeXY5ki7+jE24lD4ek/f3w9lIh1wqj/7sbPQNOdA2Ov7fo0tAySe3mJw9qGO1A==
X-Received: by 2002:a05:6402:1495:b0:461:b506:6b8a with SMTP id e21-20020a056402149500b00461b5066b8amr18646832edv.208.1668597799798;
        Wed, 16 Nov 2022 03:23:19 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906218200b007aed2057ea1sm6151124eju.167.2022.11.16.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:23:19 -0800 (PST)
Message-ID: <9472d09b-b586-a687-86e9-feb0ad5972b6@linaro.org>
Date:   Wed, 16 Nov 2022 12:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] clk: qcom: Add LUCID_OLE PLL type for SM8550
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-4-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116104716.2583320-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 11:47, Abel Vesa wrote:
> Add a LUCID_OLE PLL type for SM8550 SoC from Qualcomm.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-alpha-pll.c | 16 ++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 1973d79c9465..f9e4cfd7261c 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -155,6 +155,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>   		[PLL_OFF_TEST_CTL_U] = 0x30,
>   		[PLL_OFF_TEST_CTL_U1] = 0x34,
>   	},
> +	[CLK_ALPHA_PLL_TYPE_LUCID_OLE] = {
> +		[PLL_OFF_OPMODE] = 0x04,
> +		[PLL_OFF_STATE] = 0x08,
> +		[PLL_OFF_STATUS] = 0x0c,
> +		[PLL_OFF_L_VAL] = 0x10,
> +		[PLL_OFF_ALPHA_VAL] = 0x14,
> +		[PLL_OFF_USER_CTL] = 0x18,
> +		[PLL_OFF_USER_CTL_U] = 0x1c,
> +		[PLL_OFF_CONFIG_CTL] = 0x20,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x24,
> +		[PLL_OFF_CONFIG_CTL_U1] = 0x28,
> +		[PLL_OFF_TEST_CTL] = 0x2c,
> +		[PLL_OFF_TEST_CTL_U] = 0x30,
> +		[PLL_OFF_TEST_CTL_U1] = 0x34,
> +		[PLL_OFF_TEST_CTL_U2] = 0x38,
> +	},
>   	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
>   		[PLL_OFF_OPMODE] = 0x04,
>   		[PLL_OFF_STATUS] = 0x0c,
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index f9524b3fce6b..2bdae362c827 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -18,6 +18,7 @@ enum {
>   	CLK_ALPHA_PLL_TYPE_AGERA,
>   	CLK_ALPHA_PLL_TYPE_ZONDA,
>   	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
> +	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
>   	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
>   	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
>   	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
> @@ -38,6 +39,8 @@ enum {
>   	PLL_OFF_TEST_CTL,
>   	PLL_OFF_TEST_CTL_U,
>   	PLL_OFF_TEST_CTL_U1,
> +	PLL_OFF_TEST_CTL_U2,
> +	PLL_OFF_STATE,
>   	PLL_OFF_STATUS,
>   	PLL_OFF_OPMODE,
>   	PLL_OFF_FRAC,
> @@ -160,7 +163,9 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
>   extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
>   extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
>   extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
> +#define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
>   extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
> +#define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
>   
>   extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>   #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
