Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E41969E730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjBUSNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjBUSNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:13:30 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DF72CFEC
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:13:11 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a30so5443343ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXFB1ToLiLOsDJMDgKAuDm5MOLci1wrrick0YVwQiJc=;
        b=NjUU6gRBlv2TilWVZfYaP5EBPvIcGZSwgW+TBylRo6mmWfx4+T4ezlltBKE4Bqgk4C
         4RsuMouFIsuQCGrpNq+sOeoFVfyuM5c1FMA3rJNjvMY2mBidwcmODpu6T6rMj39JdJM2
         0Juhps+AmCvjqRHVAAgfPq2JwrLN4zlW+Oj+sUqMTcoKIteLtB53nU0xAnTM6Fyv/RuP
         3T+G9vQxxlWCqOOBRaMp6rCUYTym6pTv0kPzm1VQTctbEyy80s4yV4znnPcqdPvvfwHs
         MOWpBNSLzN64ns7ceObRw9i5ziZ6NNZTQupZxDMU/BmzjonDldZLYhdtkIxkAq+sCuU0
         /QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXFB1ToLiLOsDJMDgKAuDm5MOLci1wrrick0YVwQiJc=;
        b=UiscaSWUJIK7u3hbpPPjG0DZsHXryuFolz5Z3s3UGDrgs3o4VAmsFAwmHdKas6phOp
         IyaCuYePd4xMvKN2GJCrolzrjiJErWPOnj7ddU8RUfxJT8LzXuUDBQ4FQ6Lj6y+o4V5W
         bm7Iw+CqLe/Ixnc2rs87FwalMYIn/NdLaKHxrMhPnBk/99XOF2cK5B1INs8h+l3VtMtp
         yAl3+O54PS4gWJPe3u2YzjeTqxVftPjPeyd8dE1tD7MHt0RoDDO5eY8ZaaIaHJ67dbgL
         YIq5/jSjVsOmUGsiSFJ+bkOQpqAy6t2HHpLeTWUcHkI4aN2+PeY7xD3hwO0dODJ0alB/
         ANug==
X-Gm-Message-State: AO0yUKW0pQ+onDXC+4oP19UfkkYyopEsiWqcrQ5ZMHPJTog5kgY19AtW
        4KzthgEHyM2oMEmrs6J5/Y3FeA==
X-Google-Smtp-Source: AK7set9yU/LbJ9XKViRJMa7U9bqS5w3dJFuc/kNh33HC4Bqa8++9D8ijVzUljlBoHTL2htF8gQ+9wg==
X-Received: by 2002:a05:651c:11c1:b0:290:5d54:fedb with SMTP id z1-20020a05651c11c100b002905d54fedbmr2126296ljo.31.1677003141226;
        Tue, 21 Feb 2023 10:12:21 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id i15-20020a2e940f000000b00295744b701esm422489ljh.66.2023.02.21.10.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:12:20 -0800 (PST)
Message-ID: <aa2643b3-f973-6d15-de61-96d4aa9302fb@linaro.org>
Date:   Tue, 21 Feb 2023 19:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] clk: qcom: smd-rpm: Add clocks for MSM8917
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
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-5-otto.pflueger@abscue.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230221174909.164029-5-otto.pflueger@abscue.de>
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



On 21.02.2023 18:49, Otto Pflüger wrote:
> MSM8917 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3 and
> additionally has the BIMC_GPU clock.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
This is based on an old Linux tree, the names you're referencing
no longer exist.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/qcom/clk-smd-rpm.c?h=next-20230221

Konrad
>  drivers/clk/qcom/clk-smd-rpm.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..616f3a1bcad8 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -850,6 +850,40 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>  	.num_clks = ARRAY_SIZE(qcs404_clks),
>  };
>  
> +static struct clk_smd_rpm *msm8917_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
> +	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK]		= &qcs404_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK]	= &qcs404_bimc_gpu_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
> +	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
> +	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
> +	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
> +	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
> +	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
> +	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
> +	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
> +	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
> +	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
> +	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
> +	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
> +	.clks = msm8917_clks,
> +	.num_clks = ARRAY_SIZE(msm8917_clks),
> +};
> +
>  DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
>  DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> @@ -1223,6 +1257,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
>  	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
>  	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
>  	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
> +	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
>  	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
>  	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
>  	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
