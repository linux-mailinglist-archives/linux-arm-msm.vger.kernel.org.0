Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6290642772
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiLELZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiLELZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:25:40 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BC618370
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:25:39 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id td2so26950578ejc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+j99md1PjthuCbDREOpA8MPlPDakowiyrmj00xcxuM=;
        b=TJe6jjDigf6ailPy7ZVGgEH8tGD+mOM4Mzjr0g9OoNQAYgKh4xd9hB269S/5QrSUqO
         j0pYcvtre19ijSCDJqyGxyzxC+8cAGd9UyJxpSiZc4atK+6DSNK+hmaOtgv4cZCWeDQu
         7IH56qbqlYM3qDvMacYmsBCZ5xW5NOvUaBjv4bL9tANAXiGfZDjNdNiJPXVhuGzzNqcZ
         sqn53mHoV/+RoQxNAQviVvdcziF7mPE6zxx39InU1H5eDdne3gRxRFNyLuTBxlU42GTQ
         LVMzuu11IFTG0yPxkHBEOzAq7CplLfG5uTGMIBLxujg4Y6r2s579/KH+cmEOmlMhWr+Q
         L83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+j99md1PjthuCbDREOpA8MPlPDakowiyrmj00xcxuM=;
        b=6TRn7glhV9WVf1zpuiP/tcc2cuTIdTF6jPbRZZzhh0xgQO+Hp6G3tqMc90yxVbkWMa
         GgrFUJwjWJrbX8/nKQNVC2xHwFbpN81nDI7EQc0ZrMFrREJjWPdDFbqA0ngh6NHjJjP+
         xoCtGbGudiSR9m1rOiTmcnFZAf2YEPiMGL/eG1iazdliUYzNQW4L4oOXbtYFCONwvhFi
         54UQFkri2PzBZXXWF9pLaBRNGXyddHs8WiDfKe63/0IMTGxr26EHvDRE7+JwCOsrtVMa
         Q9CBVImcoTDq8g5nz+Ffv/vFt7KtnMJrYqTaJy6LBZV/sRbRsQvcpqjgTo4Ro4vEAOtQ
         5vRQ==
X-Gm-Message-State: ANoB5pmqv80c6d6KXre0cGfZ2cOQd6zkmxwDJYdkCX3mLVDfeRatSXWi
        gR1CRGUtgdQRqcMFYgD78h917Q==
X-Google-Smtp-Source: AA0mqf4szBxv1r84O03TkT5J0cOfasnInigLp0O3KwpoWrqSaEcTt1oj6jBfuohs6ZD2QXPzOIQUxA==
X-Received: by 2002:a17:906:240f:b0:7c0:9f04:1938 with SMTP id z15-20020a170906240f00b007c09f041938mr19479252eja.769.1670239538026;
        Mon, 05 Dec 2022 03:25:38 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id m2-20020aa7d342000000b0046b25b93451sm6121093edr.85.2022.12.05.03.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:25:37 -0800 (PST)
Message-ID: <46e9fe2a-bd91-d49e-68e5-e555d4112378@linaro.org>
Date:   Mon, 5 Dec 2022 12:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 10/16] clk: qcom: smd-rpm: rename some msm8974 active-only
 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:58, Dmitry Baryshkov wrote:
> Rename msm8974_diff_a_clk, msm8974_div_a_clk1 and msm8974_div_a_clk2 to
> move the _a suffix to the end of the name. This follows the patter used
> by other active-only clocks and thus makes it possible to simplify clock
> definitions.
> This changes the userspace-visible names for this clocks.
Hopefully this won't break NASA's Mars drone ;)

More seriously, I don't see a usecase where any of these clocks would be
controlled from userspace, not with the mainline kernel at least - we 
never know what crazy vendors do downstream..

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 761a5b0b4b94..cb47d69889fb 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -474,9 +474,9 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
>   
>   static struct clk_smd_rpm *msm8909_clks[] = {
> @@ -607,11 +607,11 @@ static struct clk_smd_rpm *msm8974_clks[] = {
>   	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
>   	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
>   	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
> -	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_a_clk,
> +	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_clk_a,
>   	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
>   	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
>   	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
>   	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
> @@ -653,7 +653,7 @@ static struct clk_smd_rpm *msm8976_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   };
> @@ -687,9 +687,9 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -745,9 +745,9 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -813,9 +813,9 @@ static struct clk_smd_rpm *msm8996_clks[] = {
>   	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>   	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> @@ -875,9 +875,9 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -945,7 +945,7 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
>   	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
>   	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> @@ -1013,7 +1013,7 @@ static struct clk_smd_rpm *msm8953_clks[] = {
>   	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
>   	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
>   	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
>   	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
>   	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
