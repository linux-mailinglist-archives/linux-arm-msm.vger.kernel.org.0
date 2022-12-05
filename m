Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D479764276C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbiLELXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiLELXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:23:43 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DC81839B
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:23:41 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id x22so4597316ejs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/me1UgJReDwqHZBeoMdvRpFG02HhCW+W5Yst451/QU=;
        b=TVATkGlpdES9N/fsZBgGJ3uYhsjmck/LpNG9/vXMapCB8lqFuuprBegzW0gLEMeBKk
         o2eHZTIYYxSCgzc1waO8zgL9Ila7b0dt+qm+Bg0XoiZh1BGMYdnNtwpw1kfXmeqIlbFG
         JpVSFEsMp2rWlLSIu2B/4kXOszeO8/5x/cFvf6/YO5u0lzKpsAVypFN9gGucUGVwzk6M
         kokOxtnQdi5rVhVz8JqUbwojo3Tt1+A6IxLrZ5KRY9xNYRwLS3+sWgjwESbmW1M/7Unh
         xEAVuc+5Up2gKx9kzc2rbpBogO/7OC57+0d2foT/b8eUu2ov16+qCOT9SMyNx4P/dTyY
         AWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/me1UgJReDwqHZBeoMdvRpFG02HhCW+W5Yst451/QU=;
        b=lm0hIJu2WHI2CwpIAQEG5Z3byLbbDS8sBCSata3l7UmrkdAxo7X0x7M5sGtqZviA2j
         uJK79JjUzT2dMWMRQytCWMcJvVXPgwMKRnujyfrdREyIxew9KBVCrVd4gx1+rvRi9zKA
         A/kgPdBqR6cnrz3LxpnRWLCVrvhErULTEp1BXVjl1AajTPNIuaWa7MwRXynBJ75o0vw9
         7CPWSa5xjC9Ja2aooU15+B7u7AeYtmg9IsVET13cFu9tdt6428L94KrDSIJurlppkGOd
         j74zDImdnMM9FEKoHLw0bj0UelHiU9SAeiOIKfGxtdV9jZP3HK1rGvwcmevAHAgXzUpR
         b47Q==
X-Gm-Message-State: ANoB5pmRtGJT9+fbe6G4EXISyETtk/QlXN8/Kr23Q2zw+X83egS5ys6N
        96DjMDgpktGm0QFD7nvHkZn6B9eJ00aBG6gG2v0=
X-Google-Smtp-Source: AA0mqf5XBKo2xmZDjAOBHKoyfXMgN4QXZvXamOZZD/Z3b1nNRMewYnP4D2pUshEbVhFjshd++HFusg==
X-Received: by 2002:a17:906:a387:b0:78d:946e:f65d with SMTP id k7-20020a170906a38700b0078d946ef65dmr69686747ejz.365.1670239420197;
        Mon, 05 Dec 2022 03:23:40 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b007b9269a0423sm6139429ejd.172.2022.12.05.03.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:23:39 -0800 (PST)
Message-ID: <a6b009c1-e398-7661-6298-c67d8fbaee1f@linaro.org>
Date:   Mon, 5 Dec 2022 12:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 09/16] clk: qcom: smd-rpm: move clock definitions together
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-10-dmitry.baryshkov@linaro.org>
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
> To ease review and reuse group all clock definitions together.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
