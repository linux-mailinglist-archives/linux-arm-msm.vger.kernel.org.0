Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E383640E7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 20:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbiLBTaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 14:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbiLBTaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 14:30:06 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75974EC80E
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 11:30:04 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id l15so6595438qtv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 11:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FKT+Au2UnfjXYQ8dQb85SUF4VnyCTFd30FHBzSXLjQ=;
        b=nr7vFHwnCq1Q0Evz+rhRHlaJ/Wd7n6KxMiIRFwXA+tvT2QDbern7LyoHjIFhzii/cj
         w6014J+AoMGnqxUo1wAktuEy6r3IjSoA6WtRfFyzj6IeNf40+3Baz3+oSq45hQsyVezV
         BMtUmkc5JeUikeJ5TEh3Vsy0Wlqs0rVLy+S6zkk0PKK3gsvvnoIhWfPnqzeVuaMZUAn6
         UZBegQRSw3x/2ChNp2taBpVl2PsMvxU1OsR8PHyEuuKtxkDIIAR6qfsSfsfxUsjQwVxH
         Y92igtrdnGJezfUaVIXrjamoCLj0SGqv1QvuQbB09KUjzWr55i4pfKLArd9s1pVv4kNA
         Sz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FKT+Au2UnfjXYQ8dQb85SUF4VnyCTFd30FHBzSXLjQ=;
        b=AYKYk8UHqIim4PRR6ne4YjKkn2DYEtCnQcp0iHNavX5AkY/cKIBFd1hlCZakNaF8H2
         5WhSONvi5kcCAVdzfdnz5qJ6Y3fsqRuzEdh5WWN/f1lfkCbegBhpgGIF7BApEELxpmd3
         Nl0Ahi+r/yybunxv9cVIz0ooO72lr2LZTbHxcNnImY+fg7XqB4pXj8EdzKc1GyVKnEyY
         F9ZIIST3JHX2tQblzGSMcAsvdex+YC+ZL0LRip1pftaJpXn6nt0mW9AxSyLpss+AZP8U
         g1eEf3LxSFw4ucJY9ppnJJg4y61zZWgfBs9GL6A6L6Q4WI4ECKLaoXZnNphNJRZE26o+
         7mWA==
X-Gm-Message-State: ANoB5pmDT/89WIpXZ63kDCSIN5y5OzumVCA4iHghV7kF7r4wClp33ZdV
        fFOV1n56Q9A0wnl66gEWuZ/nBw==
X-Google-Smtp-Source: AA0mqf5xQ35dnYXCGGzhq1Bu73wIMae7miXxlYnIS0wgpHMKiLFZmR9qHss94R3IESVIQMn9Hbw5ow==
X-Received: by 2002:ac8:4688:0:b0:3a5:3622:6831 with SMTP id g8-20020ac84688000000b003a536226831mr56589824qto.479.1670009403912;
        Fri, 02 Dec 2022 11:30:03 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id f21-20020a05620a409500b006b953a7929csm6386050qko.73.2022.12.02.11.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 11:30:03 -0800 (PST)
Message-ID: <210696d8-edf9-6d42-6459-ac27939992f8@linaro.org>
Date:   Fri, 2 Dec 2022 13:30:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 8/8] clk: qcom: rpmh: remove usage of platform name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
 <20221202185843.721673-9-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221202185843.721673-9-dmitry.baryshkov@linaro.org>
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

On 12/2/22 12:58 PM, Dmitry Baryshkov wrote:
> Now that all clocks have individual names, remove the names of SoCs from
> the RPMH clock definitions. Replace it with the common clk_rpmh_ prefix.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I like it.  You can follow up later with alphabetizing the lists
as Bjorn suggested (or someone else can).

Thanks, I think your series is a good improvement.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 342 ++++++++++++++++++------------------
>   1 file changed, 171 insertions(+), 171 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index b543939de1c8..2c2ef4b6d130 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _clk_name, _res_name,	\
> +#define __DEFINE_CLK_RPMH(_name, _clk_name, _res_name,			\
>   			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_clk_name##_ao;		\
> -	static struct clk_rpmh _platform##_##_clk_name = {		\
> +	static struct clk_rpmh clk_rpmh_##_clk_name##_ao;		\
> +	static struct clk_rpmh clk_rpmh_##_clk_name = {			\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_clk_name##_ao,			\
> +		.peer = &clk_rpmh_##_clk_name##_ao,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   			.num_parents = 1,				\
>   		},							\
>   	};								\
> -	static struct clk_rpmh _platform##_##_clk_name##_ao= {		\
> +	static struct clk_rpmh clk_rpmh_##_clk_name##_ao= {		\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_clk_name,			\
> +		.peer = &clk_rpmh_##_clk_name,				\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>   		.hw.init = &(struct clk_init_data){			\
> @@ -111,12 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   		},							\
>   	}
>   
> -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
> +#define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
> +	__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,	\
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _suffix, _res_name, _div)	\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name##_suffix, _res_name,	\
> +#define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
> +	__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,		\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
>   #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> @@ -340,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>   };
>   
>   /* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
> -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 1);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, _a2, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, _a2, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, _a2, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
>   
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, _a4, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, _a4,  "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a4, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a4, "lnbclka2", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, _g4, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, _g4, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _g4, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _g4, "lnbclkg3", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, _a, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, _a, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, _a, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, _a, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, _a, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a, "rfclka5", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, _d, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, _d, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, _d, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, _d, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, _d, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, _div2, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>   
>   DEFINE_CLK_RPMH_BCM(ce, "CE0");
>   DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> @@ -375,18 +375,18 @@ DEFINE_CLK_RPMH_BCM(pka, "PKA0");
>   DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>   
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
> @@ -397,16 +397,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   };
>   
>   static struct clk_hw *sdm670_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>   };
> @@ -417,12 +417,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   };
>   
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
>   	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
> @@ -433,18 +433,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>   };
>   
>   static struct clk_hw *sm8150_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -453,16 +453,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>   };
>   
>   static struct clk_hw *sc7180_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
> @@ -472,18 +472,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>   };
>   
>   static struct clk_hw *sc8180x_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
> -	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3_d.hw,
> -	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_d_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -492,18 +492,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>   };
>   
>   static struct clk_hw *sm8250_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -512,22 +512,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   };
>   
>   static struct clk_hw *sm8350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_DIV_CLK1]		= &sm8350_div_clk1_div2.hw,
> -	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_div2_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
> -	[RPMH_RF_CLK5]		= &sm8350_rf_clk5_a.hw,
> -	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1_div2.hw,
> +	[RPMH_DIV_CLK1_A]	= &clk_rpmh_div_clk1_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
> +	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
> @@ -539,10 +539,10 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   };
>   
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_a2_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a2_ao.hw,
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> @@ -554,20 +554,20 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>   };
>   
>   static struct clk_hw *sm8450_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1_a4.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_a4_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2_a4.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_a4_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a4_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>   };
>   
> @@ -577,16 +577,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>   };
>   
>   static struct clk_hw *sc7280_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
> -	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2_a2.hw,
> -	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_a2_ao.hw,
> -	[RPMH_RF_CLK1]      = &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK3]      = &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_a_ao.hw,
> -	[RPMH_RF_CLK4]      = &sm8350_rf_clk4_a.hw,
> -	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_a_ao.hw,
> +	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
> +	[RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2_a2.hw,
> +	[RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_a2_ao.hw,
> +	[RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
>   	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
>   	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
> @@ -598,14 +598,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>   };
>   
>   static struct clk_hw *sm6350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2_g4.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_g4_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3_g4.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_g4_ao.hw,
> -	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
> -	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_g4_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
> +	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
> +	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> @@ -614,18 +614,18 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   };
>   
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
> -	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
> -	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1_a4.hw,
> -	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_a4_ao.hw,
> -	[RPMH_RF_CLK1]          = &sdm845_rf_clk1_a.hw,
> -	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_a_ao.hw,
> -	[RPMH_RF_CLK2]          = &sdm845_rf_clk2_a.hw,
> -	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_a_ao.hw,
> -	[RPMH_RF_CLK3]          = &sdm845_rf_clk3_a.hw,
> -	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_a_ao.hw,
> -	[RPMH_RF_CLK4]          = &sm8350_rf_clk4_a.hw,
> -	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_a_ao.hw,
> +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div4_ao.hw,
> +	[RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_a4_ao.hw,
> +	[RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3_a.hw,
> +	[RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_a_ao.hw,
> +	[RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4_a.hw,
> +	[RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_a_ao.hw,
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>   	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>   };
> @@ -636,8 +636,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>   };
>   
>   static struct clk_hw *qdu1000_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo_div1.hw,
> -	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_div1_ao.hw,
> +	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div1_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {

