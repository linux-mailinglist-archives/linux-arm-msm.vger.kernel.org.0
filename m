Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E3C642E28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiLEREi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiLEREe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:34 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953CB167CD
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:33 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id q10so8601644qvt.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMudJkmHXx0RSiG1AIGL5sbbU53DzHdSasiAqN0q8ok=;
        b=xpkVUmU41OOMmlFrpGXcAQ70Fo8PrELMSWmg6+rLDyNOpWbkfqasJwqnmI/JKBrrul
         OhjlrDpjbe+xl+nDyeDAxZWcen7t5MaVoiX7a8KnsVmwSWqah1ER+oTAP5dOUzMlcCHW
         2euY7cNsS7EAa3bpj7OIIESi6RWA5b54sn3jym0+n3SZZOwPLVi0/jGQ5a4zX9DOSQcc
         txMtJX8jgVyXki+9bMAvOqovuH7QD6m7kZw+5pTaRhFabLQOgmnXvMnjnyzXC68yHs2J
         TaIEhslgEIGzVQkiWZqdlhHOaiaiEWfR8YQcomxVizFMkLxVpkqS77o/4lxKNur2UfZQ
         ocLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMudJkmHXx0RSiG1AIGL5sbbU53DzHdSasiAqN0q8ok=;
        b=epP7PFtaW2NQiDghzMxCY2/f9nO+6qhunFgmdItfGx/es5KST2vNNJcFjsLGpQjCwN
         YX8IfPMrGsLhBKPCATW0iY3BHIu8JMWJ0ootjkXp8XnzQa/DB3cP/o8QUzlb70GKutWc
         L5Z+JVOTfJBrZgq9xK8d1vklVygf9wX9RD4+CVfWeDrs+wtK4tTlPnO/2t6qHXNThNgz
         +bOB9OIemDFjv1LM+KkdeM0ZBl0zjHkDJyHXliPoEaT1AH+Y3ouZR2qZpkpEI7bFHOLv
         uBe3njJEklax2rqfg17VZLj08hhD9+aK3jUZl5FdXlX0feC6zFmmU0PLw/0tMqJ4Wmjr
         uCmw==
X-Gm-Message-State: ANoB5plpkDLqRmUF2MYreNzhptOTOCZyt+pkzUMc8IwhDZStQ9Vhk5iM
        rXcBRGfuN+pRKg/D42M98Yyo6g==
X-Google-Smtp-Source: AA0mqf6Ttj5i03cxv28AgsW2U3ORm0VSpNiek7FOXsQ8p3C4CYKcvJwOF9lGdOGCzhg+QNdKBQT0lQ==
X-Received: by 2002:a0c:ea88:0:b0:4c7:87f:f11b with SMTP id d8-20020a0cea88000000b004c7087ff11bmr29687913qvp.115.1670259873170;
        Mon, 05 Dec 2022 09:04:33 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id t27-20020a05622a181b00b0039cc0fbdb61sm10245759qtc.53.2022.12.05.09.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:32 -0800 (PST)
Message-ID: <d1386fa7-9e9a-68a2-9eed-538a36ed706d@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/16] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
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

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
> clocks. The driver already uses proper clock indices
> (RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.

Should these lines be deleted also?

DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);

DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, 
bb_clk1_a_pin, 1, 19200000);
DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, 
bb_clk2_a_pin, 2, 19200000);

					-Alex

> 
> Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
> Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 26c4738eaacf..42d55bf35a33 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>   	.num_clks = ARRAY_SIZE(qcs404_clks),
>   };
>   
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> @@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
> @@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>   	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> -	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
>   	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   };
> @@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,

