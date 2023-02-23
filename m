Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22F86A1293
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 23:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjBWWId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 17:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjBWWIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 17:08:32 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF3A52DF8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 14:08:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bp25so15725106lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 14:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677190109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpIYBvef67KIJ3NnrbVSWmzC1ty4BZYEeYQF6vvBuHs=;
        b=rRNgN1gWU08liue17+9XjEUEG1VeOfSTgo5yvd8qehur7BM4JCRdUN5mWf4VfLAW8a
         +Enuu6PZljKldSlsmUssms6QePHt9i/uuTne6UHlJ26Lg5lwO6Qf6GHvFpn3bWytmor7
         fAQekJette0EwPBd/0blN0Tln8JyUewTruJNRA1rctEtAyr+C5gj/ZQVUe8i6rFgKWoO
         qzmWzKfRyuSyG3EV+A513f/+vVxLW4qazldgdWp2LFio4BYwFRwlhGPUVq1JJSy0ZRC/
         +uqLFaC6MMW0VQnaGsMJdyYgT/7RnsT9N5PltQ7euPmwMqInTU2otcxeWVQ56ja9rpVB
         Q7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677190109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpIYBvef67KIJ3NnrbVSWmzC1ty4BZYEeYQF6vvBuHs=;
        b=xSo219xLnbPDCaA/FCwpxIWHHy2cPAKtF5pkKqCofiaLgtU/FBkg2abSQok0yfb7un
         mt93GNYDJ27dCdBXau9PeWXaiapwHxGbbPaV6h94f9nZSSQerjesEJhb0dyO7F5QkU/d
         nsiBm8rhcuk/TuQiFmtr7qGO7M4Z9fbIuYNr/D6eLKI+E732CXUel7mfT3nSNo2wb6/V
         T0ucvH1M785etICWa6brUTb8uJttEjcVInk1NJ2HBWX55yWoQrZbkEMOBSy7/8qA5eg1
         b/qkgWNIDdWN6smBGhvESM+GJiGNntnt5Sc7Y68IG7x3UvUCjyg/rcjQMMrWExhbA1QN
         uxTw==
X-Gm-Message-State: AO0yUKXumvGHREDtQ7+HBGPWLTkohG143MBpo3yVvX8t6R4B1CAxmcmO
        rEOBkSKcW1si8P6ejHU2bBDQ/A==
X-Google-Smtp-Source: AK7set8PwnvNKjEm2ttWdokuKDX5spkhC6lDHrpgx7wKKTnT4YwMbOYFGseNvXa6+hiHRE6AQhdwAg==
X-Received: by 2002:ac2:5e84:0:b0:4dd:9f73:f3f7 with SMTP id b4-20020ac25e84000000b004dd9f73f3f7mr2185244lfq.64.1677190109505;
        Thu, 23 Feb 2023 14:08:29 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651238c900b004dda87e7de7sm65321lft.81.2023.02.23.14.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 14:08:29 -0800 (PST)
Message-ID: <907731c3-c37e-6ab0-4985-6b43e8d0a120@linaro.org>
Date:   Thu, 23 Feb 2023 23:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/4] clk: qcom: smd-rpm: Add clocks for MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230223180935.60546-1-otto.pflueger@abscue.de>
 <20230223180935.60546-5-otto.pflueger@abscue.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223180935.60546-5-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.02.2023 19:09, Otto Pflüger wrote:
> MSM8917 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3 and
> IPA_CLK and additionally has the BIMC_GPU clock.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in v2:
>  - Rebased onto linux-next-20230223
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 198886c1b6c8..ae6559c7efab 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -573,6 +573,40 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
>  	.num_clks = ARRAY_SIZE(msm8916_clks),
>  };
>  
> +static struct clk_smd_rpm *msm8917_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
> +	[RPM_SMD_PNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
> +	[RPM_SMD_PNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
> +	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
> +	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK]		= &clk_smd_rpm_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK]	= &clk_smd_rpm_bimc_gpu_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]		= &clk_smd_rpm_bus_2_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK]	= &clk_smd_rpm_bus_2_sysmmnoc_a_clk,
> +	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
> +	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
> +	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
> +	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
> +	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
> +	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
> +	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
> +	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
> +	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
> +	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
> +	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
> +	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
> +	.clks = msm8917_clks,
> +	.num_clks = ARRAY_SIZE(msm8917_clks),
> +};
> +
>  static struct clk_smd_rpm *msm8936_clks[] = {
>  	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
>  	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
> @@ -1228,6 +1262,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
>  	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
>  	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
>  	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
> +	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
>  	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
>  	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
>  	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
