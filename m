Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0BF0642758
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiLELSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiLELSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:18:16 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A2DB7DE
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:18:14 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so26925498ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db5MDGvZdRFWAguNVtlY7UtCxLbgyuTkIB8PW/8ApO0=;
        b=vEsyodnoVzfNyuHF+Qc0e2BrYGWqkPjxBOt8dWt1ugx5Av70euvmQx2muHPT6/mdVG
         oabgRIvK26F1RPgL1q5WGePGIXMCNrjAt0+PQHjJFSNHiqtzqmka0xZCF1YiUG4EL6Lr
         c7wYPWUpIZynQYdmPCymJI7KEWTKtKZamQQoZKEsdzl8aCyt8Ztp03pD6nu7DVVcZ4Iq
         72pbF9xK9QrRoP4oQXsJYvwmM6xykKoUVvVFIAH4pWoZbQBvZfBSGjqtaJE9L0ZQDQgH
         C3wzf05XnYCLMv7G3OSi4qNIv+ugsAliE20C0xo1RXiCgWuSshIqLqTyUI6UhPwUhOFD
         WZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=db5MDGvZdRFWAguNVtlY7UtCxLbgyuTkIB8PW/8ApO0=;
        b=k9JSliTMK6cpdJo3dZf/xvPNsTLSVg5Ovwo1DAtSqk3PSqbTXOonZBaMHYhbK15nMI
         3nAeBglqFhk7shOpE9roCbeRqiDFY7iGzloHsE3a7WCwjFkyYMFA1PujHevh+/BK/jq+
         dcKqbMh3QrtwDioZSCb5As+kQqDtsApJtmgWakAnUi9ryKzyCsjOvuuq3FjqkkkFEuuL
         Q4/NQQPrhqgdgJzOthWwuLX+OT4pZQ6xKuPlCwdU902iqv/MHrnXH8yoylKN0Gllcob3
         8rrQju7HvcQ3EczXJ7WcQqnYIA3xp7e8t1d145yukkdb6yVCJJjTzpl1gtqHpvu8q7pT
         Z5Ug==
X-Gm-Message-State: ANoB5pmMwMlXHgfhb5Vy1koUp1YE5+kT7kF2JCRfrB+KfZ5mhHUJxvMr
        k1RFSq/ibOfI8vLZKWWs+d8PAw==
X-Google-Smtp-Source: AA0mqf7kNfq0vfJRP76ej/1OufVwTkEK3av366RBP3Opm3bwTs1BlDfLKEKR2JYco9ccvw5ruo2hGg==
X-Received: by 2002:a17:906:50f:b0:78d:ad5d:75e with SMTP id j15-20020a170906050f00b0078dad5d075emr70262262eja.172.1670239093359;
        Mon, 05 Dec 2022 03:18:13 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id z17-20020a17090655d100b0078df26efb7dsm6115680ejp.107.2022.12.05.03.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:18:12 -0800 (PST)
Message-ID: <7dd47f45-5ad9-249f-8f5c-82be3b215966@linaro.org>
Date:   Mon, 5 Dec 2022 12:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 05/16] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for
 qcm2290 SoC
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> The qcm2290's ln_bb_clk2 is identical to the freshly added msm8998's
> ln_bb_clk2 one. Use the latter and drop the SoC-specific version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 42d55bf35a33..6af0753454ea 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1167,7 +1167,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   };
>   
>   /* QCM2290 */
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
> @@ -1184,8 +1183,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
> -	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
>   	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
>   	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
