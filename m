Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC22D642E33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiLERFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbiLERFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:05:03 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7457118B14
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:05:01 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id r15so8622130qvm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRk2ugF6abqHYXdgYjZOKOW683OEeZUV1N0o+WkOrKo=;
        b=jK7358NoPyAhLGb+vbzrgAYMZyLLr2mbF+EAYxAsev3+NGzke3rc78NmwXOcxazsFm
         s6N+CzA4cy7mUhu4ZkpSmnwV9UCyq2wdB9yeFrA4hCK9hM3isqgpAVocaNCpzqFhMxSr
         m6hXwGm0u4YdhmPvKdwWRyOalJVITMv2Yyrny4WJgrel7SaZAht/xwNI51np7QN5xG3t
         HLCLqH/BDfD/GM2KTGr66sts8X2TYzHH8rz1WCKG1cyZHL6QIuZufB0/bzRZBCEnK9YM
         NtSLgNYTXkbAkrbdv3SQCSuGG+qjgY9r/mIg0VwjmSCVy010FtH0SofYQ81Rj6pQ78fY
         tKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRk2ugF6abqHYXdgYjZOKOW683OEeZUV1N0o+WkOrKo=;
        b=z1mqpC1iCx7X/uJM6Dj0S1FvZKsWaL/4jpI5jhkXcdtMhpSq1i3+iLxOfSOC/xQ/Ic
         nm2VRtiRZOPs4m11QcJOwQaM2RUSfrh4qisUJJZOd+rBB6+DIoGNk2cqbdm3jqfL0g6V
         obzFHWpyokzqV20ivCT71Ev9TzHxlGEqnPTQKaXImsgsSTMgz5UhgStlM+SOLEszRtht
         j4xJt7ufuBLiPGYuigWGTrltD8E3/wPvb2iKhdz1B0GvCsFJP8hTBxKVDXMgcgfNzmJF
         /5SUOklLDX/qo7OOvgYrOLI2+u8gRYqEAEihbh8viHCsOUbldixKHZHxn+gMee06AcJZ
         uViw==
X-Gm-Message-State: ANoB5pn4nrsSQ2UxWYdhBXQ7d2BgSmXtuM4RDkiBTbKvBNMJiqDSi4do
        LICEeVmTzbzSydW2rgWLhVFkCQ==
X-Google-Smtp-Source: AA0mqf67QDngS2K8NGVBF5+hSR1M7OHOh8pOcxu+zjMZOez3wdj1hlHoDZb+1s9vtFyQPE0V0j2TpA==
X-Received: by 2002:ad4:4e85:0:b0:4c6:fa37:1d16 with SMTP id dy5-20020ad44e85000000b004c6fa371d16mr35855327qvb.106.1670259900458;
        Mon, 05 Dec 2022 09:05:00 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05620a425100b006eef13ef4c8sm13198762qko.94.2022.12.05.09.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:05:00 -0800 (PST)
Message-ID: <8a4f20df-60cf-5898-10f4-91832354761c@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/16] clk: qcom: smd-rpm: move clock definitions together
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
 <20221203175808.859067-10-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-10-dmitry.baryshkov@linaro.org>
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

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> To ease review and reuse group all clock definitions together.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 130 +++++++++++++++------------------
>   1 file changed, 59 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 828cae6769f9..761a5b0b4b94 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -411,15 +411,73 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
>   };
>   
>   DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> +
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
> +
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2);
> +
>   DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
>   DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk, QCOM_SMD_RPM_BUS_CLK, 5);
> +
>   DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> +DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> +
> +DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
> +
> +DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
> +
> +DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
> +
> +DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
> +
> +DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
> +
>   DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
> -DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
> +
> +DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
> +
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
>   
>   static struct clk_smd_rpm *msm8909_clks[] = {
>   	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> @@ -487,8 +545,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
>   	.num_clks = ARRAY_SIZE(msm8916_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -
>   static struct clk_smd_rpm *msm8936_clks[] = {
>   	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
>   	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> @@ -523,19 +579,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
>   		.num_clks = ARRAY_SIZE(msm8936_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
> -DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
> -
>   static struct clk_smd_rpm *msm8974_clks[] = {
>   	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
>   	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> @@ -586,8 +629,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
>   	.num_clks = ARRAY_SIZE(msm8974_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
> -
>   static struct clk_smd_rpm *msm8976_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -622,14 +663,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
>   	.num_clks = ARRAY_SIZE(msm8976_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
> -
> -DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
> -
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk,
> -			  QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
>   static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -688,8 +721,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
>   	.num_clks = ARRAY_SIZE(msm8992_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
> -
>   static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -750,13 +781,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
>   	.num_clks = ARRAY_SIZE(msm8994_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
> -		   QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk,
> -			  QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk,
> -			  QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> -
>   static struct clk_smd_rpm *msm8996_clks[] = {
>   	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
>   	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> @@ -809,8 +833,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
>   	.num_clks = ARRAY_SIZE(msm8996_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> -
>   static struct clk_smd_rpm *qcs404_clks[] = {
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
> @@ -839,15 +861,6 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>   	.num_clks = ARRAY_SIZE(qcs404_clks),
>   };
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> -		   QCOM_SMD_RPM_AGGR_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
> -		   QCOM_SMD_RPM_AGGR_CLK, 2);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
> -
>   static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -1012,19 +1025,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
>   	.num_clks = ARRAY_SIZE(msm8953_clks),
>   };
>   
> -/* SM6125 */
> -DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
> -					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> -DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
> -						QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
> -						QCOM_SMD_RPM_BUS_CLK, 5);
> -
>   static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -1108,10 +1108,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   	.num_clks = ARRAY_SIZE(sm6115_clks),
>   };
>   
> -/* SM6375 */
> -DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
> -DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
>   static struct clk_smd_rpm *sm6375_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> @@ -1149,14 +1145,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   	.num_clks = ARRAY_SIZE(sm6375_clks),
>   };
>   
> -/* QCM2290 */
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
> -
> -DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
> -		   QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
> -		   QCOM_SMD_RPM_MEM_CLK, 2);
> -
>   static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,

