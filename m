Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373A638862E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 06:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238795AbhESEyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 00:54:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43808 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhESEyM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 00:54:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621399973; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=biQAgZtIGeNKjHpI4mfXzWmFX5OBoK8r2h37DkAtphg=; b=hqEPQnDy6Icm9RY+R60SBxUwkWpaNGBCEafrs4uf38aKSwZMC6MBOzL97/E3IEX5zEov9plG
 JqnLOFTJSPjZcu36755lCNt4DCGgGHuZHmisGN5yIuIST2b3DyQQgMr1knb8gLZ+eqOPkzJ6
 9Zzet74r1R+bT3WmlGLc6SGL0gI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60a49994063320cd13776b5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 04:52:35
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 121C6C43460; Wed, 19 May 2021 04:52:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.101] (unknown [49.204.183.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9100C433D3;
        Wed, 19 May 2021 04:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9100C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210513175258.5842-1-jonathan@marek.ca>
 <20210513175258.5842-2-jonathan@marek.ca>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <8c3ccbab-4d5e-e968-4eb4-645136556333@codeaurora.org>
Date:   Wed, 19 May 2021 10:22:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513175258.5842-2-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/13/2021 11:22 PM, Jonathan Marek wrote:
> Ported over from the downstream driver. Will be used by SM8250 CAMCC.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 245 +++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |   6 +
>   2 files changed, 251 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index c6eb99169ddc..7b332a8935f4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -126,6 +126,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>   		[PLL_OFF_TEST_CTL_U] = 0x1c,
>   		[PLL_OFF_STATUS] = 0x2c,
>   	},
> +	[CLK_ALPHA_PLL_TYPE_ZONDA] =  {
> +		[PLL_OFF_L_VAL] = 0x04,
> +		[PLL_OFF_ALPHA_VAL] = 0x08,
> +		[PLL_OFF_USER_CTL] = 0x0c,
> +		[PLL_OFF_CONFIG_CTL] = 0x10,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x14,
> +		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
> +		[PLL_OFF_TEST_CTL] = 0x1c,
> +		[PLL_OFF_TEST_CTL_U] = 0x20,
> +		[PLL_OFF_TEST_CTL_U1] = 0x24,
> +		[PLL_OFF_OPMODE] = 0x28,
> +		[PLL_OFF_STATUS] = 0x38,
> +	},
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>   
> @@ -162,6 +175,11 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>   #define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
>   #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
>   
> +/* ZONDA PLL specific */
> +#define ZONDA_PLL_OUT_MASK	0xf
> +#define ZONDA_STAY_IN_CFA	BIT(16)
> +#define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
> +
>   #define pll_alpha_width(p)					\
>   		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>   				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> @@ -208,6 +226,9 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
>   #define wait_for_pll_enable_lock(pll) \
>   	wait_for_pll(pll, PLL_LOCK_DET, 0, "enable")
>   
> +#define wait_for_zonda_pll_freq_lock(pll) \
> +	wait_for_pll(pll, ZONDA_PLL_FREQ_LOCK_DET, 0, "freq enable")
> +
>   #define wait_for_pll_disable(pll) \
>   	wait_for_pll(pll, PLL_ACTIVE_FLAG, 1, "disable")
>   
> @@ -1398,6 +1419,13 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>   
> +const struct clk_ops clk_alpha_pll_postdiv_zonda_ops = {
> +	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
> +	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
> +	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_postdiv_zonda_ops);
> +
>   /**
>    * clk_lucid_pll_configure - configure the lucid pll
>    *
> @@ -1777,3 +1805,220 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
>   	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
>   };
>   EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> +
> +void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +				const struct alpha_pll_config *config)
> +{
> +	if (config->l)
> +		regmap_write(regmap, PLL_L_VAL(pll), config->l);
> +

Please use
clk_alpha_pll_write_config



         clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
         clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), 
config->alpha);
         clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
                                 config->config_ctl_val);
         clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
                                 config->config_ctl_hi_val);
         clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll),
                                 config->config_ctl_hi1_val);
         clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
                                 config->user_ctl_val);
         clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
                                 config->user_ctl_hi_val);
         clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll),
                                 config->user_ctl_hi1_val);
         clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
                                 config->test_ctl_val);
         clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
                                 config->test_ctl_hi_val);
         clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll),
                                 config->test_ctl_hi1_val);



> +	if (config->alpha)
> +		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +
> +	if (config->config_ctl_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL(pll),
> +				config->config_ctl_val);
> +
> +	if (config->config_ctl_hi_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> +				config->config_ctl_hi_val);
> +
> +	if (config->config_ctl_hi1_val)
> +		regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
> +				config->config_ctl_hi1_val);
> +
> +	if (config->user_ctl_val)
> +		regmap_write(regmap, PLL_USER_CTL(pll),
> +				config->user_ctl_val);
> +
> +	if (config->user_ctl_hi_val)
> +		regmap_write(regmap, PLL_USER_CTL_U(pll),
> +				config->user_ctl_hi_val);
> +
> +	if (config->user_ctl_hi1_val)
> +		regmap_write(regmap, PLL_USER_CTL_U1(pll),
> +				config->user_ctl_hi1_val);
> +
> +	if (config->test_ctl_val)
> +		regmap_write(regmap, PLL_TEST_CTL(pll),
> +				config->test_ctl_val);
> +
> +	if (config->test_ctl_hi_val)
> +		regmap_write(regmap, PLL_TEST_CTL_U(pll),
> +				config->test_ctl_hi_val);
> +
> +	if (config->test_ctl_hi1_val)
> +		regmap_write(regmap, PLL_TEST_CTL_U1(pll),
> +				config->test_ctl_hi1_val);
> +
> +	regmap_update_bits(regmap, PLL_MODE(pll),
> +			 PLL_BYPASSNL, 0);
> +
> +	/* Disable PLL output */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +	/* Set operation mode to OFF */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +	/* PLL should be in OFF mode before continuing */
> +	wmb();
> +
> +	/* Place the PLL in STANDBY mode */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +}
> +
> +static int clk_zonda_pll_enable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(regmap, PLL_MODE(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	/* If in FSM mode, just vote for it */
> +	if (val & PLL_VOTE_FSM_ENA) {
> +		ret = clk_enable_regmap(hw);
> +		if (ret)
> +			return ret;
> +		return wait_for_pll_enable_active(pll);
> +	}
> +
> +	/* Get the PLL out of bypass mode */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
> +
> +	/*
> +	 * H/W requires a 1us delay between disabling the bypass and
> +	 * de-asserting the reset.
> +	 */
> +	mb();
> +	udelay(1);
> +
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +
> +	/* Set operation mode to RUN */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +	ret = regmap_read(regmap, PLL_TEST_CTL(pll), &val);
> +	if (ret)
> +		return ret;
> +
> +	/* If cfa mode then poll for freq lock */
> +	if (val & ZONDA_STAY_IN_CFA)
> +		ret = wait_for_zonda_pll_freq_lock(pll);
> +	else
> +		ret = wait_for_pll_enable_lock(pll);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the PLL outputs */
> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +				 ZONDA_PLL_OUT_MASK, ZONDA_PLL_OUT_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the global PLL outputs */
> +	ret = regmap_update_bits(regmap, PLL_MODE(pll),
> +				 PLL_OUTCTRL, PLL_OUTCTRL);
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure that the write above goes through before returning. */
> +	mb();
> +
> +	return 0;
> +}
> +
> +static void clk_zonda_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct regmap *regmap = pll->clkr.regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(regmap, PLL_MODE(pll), &val);
> +	if (ret)
> +		return;
> +
> +	/* If in FSM mode, just unvote it */
> +	if (val & PLL_VOTE_FSM_ENA) {
> +		clk_disable_regmap(hw);
> +		return;
> +	}
> +
> +	/* Disable the global PLL output */
> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +	/* Disable the PLL outputs */
> +	regmap_update_bits(regmap, PLL_USER_CTL(pll), ZONDA_PLL_OUT_MASK, 0);
> +
> +	/* Put the PLL in bypass and reset */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N | PLL_BYPASSNL, 0);
> +
> +	/* Place the PLL mode in OFF state */
> +	regmap_write(regmap, PLL_OPMODE(pll), 0x0);
> +}
> +
> +static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long prate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	unsigned long rrate;
> +	u32 test_ctl_val;
> +	u32 l;
alpha_width = pll_alpha_width(pll);

> +	u64 a;
> +	int ret;
> +
> +	rrate = alpha_pll_round_rate(rate, prate, &l, &a, ALPHA_BITWIDTH);
> +

rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);

> +	ret = alpha_pll_check_rate_margin(hw, rrate, rate);
> +	if (ret < 0)
> +		return ret;
> +
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +
> +	/* Wait before polling for the frequency latch */
> +	udelay(5);
> +
> +	/* Read stay in cfa mode */
> +	ret = regmap_read(pll->clkr.regmap, PLL_TEST_CTL(pll), &test_ctl_val);
> +	if (ret)
> +		return ret;
> +
> +	/* If cfa mode then poll for freq lock */
> +	if (test_ctl_val & ZONDA_STAY_IN_CFA)
> +		ret = wait_for_zonda_pll_freq_lock(pll);
> +	else
> +		ret = wait_for_pll_enable_lock(pll);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for PLL output to stabilize */
> +	udelay(100);
> +	return 0;
> +}
> +
> +static unsigned long
> +clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	u32 l, frac;
> +
> +	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
> +
> +	return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_BITWIDTH);

alpha_width = pll_alpha_width(pll);

> +}
> +
> +const struct clk_ops clk_alpha_pll_zonda_ops = {
> +	.enable = clk_zonda_pll_enable,
> +	.disable = clk_zonda_pll_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = clk_zonda_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = clk_zonda_pll_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 6943e933be0f..4871af27cf76 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -16,6 +16,7 @@ enum {
>   	CLK_ALPHA_PLL_TYPE_TRION,
>   	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>   	CLK_ALPHA_PLL_TYPE_AGERA,
> +	CLK_ALPHA_PLL_TYPE_ZONDA,
>   	CLK_ALPHA_PLL_TYPE_MAX,
>   };
>   
> @@ -148,6 +149,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
>   extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
>   extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
>   
> +extern const struct clk_ops clk_alpha_pll_zonda_ops;
> +extern const struct clk_ops clk_alpha_pll_postdiv_zonda_ops;
> +
>   void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			     const struct alpha_pll_config *config);
>   void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> @@ -159,6 +163,8 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   #define clk_lucid_pll_configure(pll, regmap, config) \
>   	clk_trion_pll_configure(pll, regmap, config)
>   
> +void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +			     const struct alpha_pll_config *config);
>   
>   
>   #endif
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
