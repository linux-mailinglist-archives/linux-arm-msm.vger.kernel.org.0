Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEBCB63FBE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 00:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiLAXWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 18:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiLAXWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 18:22:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7231413FAA;
        Thu,  1 Dec 2022 15:22:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E2DF621B7;
        Thu,  1 Dec 2022 23:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFF9C433C1;
        Thu,  1 Dec 2022 23:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669936963;
        bh=Tq4/vS4WOadYDdmm4cBARlvtMI2A8Xm8XMNbM+viXj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uMtK1UYHJtdAziisN3UXANhSGP0+QXCp6Za1c/kzyJsGXIa86Nh6/UIx9OQYLjWMI
         6vY2lzFV44m5f6f1E2ZCDvT0zh2F/09kQ/0dYk/7hNOnL5iqcXjK0Hs41Esz1mkVpU
         w9SGLGeA050t3wVrmS8p3EftV5eWS92hQCLkHyttEXg6sy3pGPVBlD+FFVyB3ki934
         bHD7pinv2CyO+BmiB8T2or/w8uJri6NjZUThE9Do14YtKOFAsfnAAqy34pJ+QjSQen
         gQV1u6TQKCj+yDR6W4/dHDLWDYxbU8SA3xvKmJoV6N077vS7IHZonnGyQRkIC8evyj
         iQiBQ4ieGjQRA==
Date:   Thu, 1 Dec 2022 17:22:40 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 4/8] clk: qcom: rpmh: remove platform names from BCM
 clocks
Message-ID: <20221201232240.7luz2hfsao345o6v@builder.lan>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 30, 2022 at 03:09:57PM +0200, Dmitry Baryshkov wrote:
> There are no platform-specific parts in the BCM clocks, drop the
> platform name from the clock definitions, replacing it with clk_rpmh to
> have the common prefix.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 00c0c8f851bd..5044f9fa156d 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -119,8 +119,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
> -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> +	static struct clk_rpmh clk_rpmh_##_name = {			\
>  		.res_name = _res_name,					\
>  		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>  		.div = 1,						\
> @@ -368,11 +368,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
>  
>  DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> -DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> +DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> +DEFINE_CLK_RPMH_BCM(ce, "CE0");
> +DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> +DEFINE_CLK_RPMH_BCM(hwkm, "HK0");

Would you mind sorting these alphabetically?

Thanks for cleaning this up!
Bjorn

>  
>  static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -387,8 +387,8 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
>  	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
>  	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> @@ -407,8 +407,8 @@ static struct clk_hw *sdm670_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> @@ -423,8 +423,8 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -463,7 +463,7 @@ static struct clk_hw *sc7180_rpmh_clocks[] = {
>  	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
>  	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> @@ -528,9 +528,9 @@ static struct clk_hw *sm8350_rpmh_clocks[] = {
>  	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
>  	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
>  	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> @@ -543,9 +543,9 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
>  	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
>  	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> @@ -568,7 +568,7 @@ static struct clk_hw *sm8450_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> @@ -587,9 +587,9 @@ static struct clk_hw *sc7280_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> +	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> @@ -626,8 +626,8 @@ static struct clk_hw *sdx65_rpmh_clocks[] = {
>  	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
>  	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
>  	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> -- 
> 2.35.1
> 
