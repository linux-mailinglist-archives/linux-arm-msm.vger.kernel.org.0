Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD84479E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 08:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfFQGKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 02:10:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59034 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfFQGKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 02:10:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C409160850; Mon, 17 Jun 2019 06:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560751852;
        bh=hm976eJArDfkwucpdPYJteQCcqFBN+pn5yhcfp+pTlI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Yr3iR32oRloOx/ZT0cVaP7e5torZF9D31j6hv5JUqR6h9bY0pAx/U86Xx/RiQR34J
         Z2mHFidLERzkzgvBWRDe+g96v51BJyqz7KIBm6lpS7AIn2PynMddvjxjtVCKhlLSln
         LDitSA0OaPoWK63K5db2eWnxxA9oZ/KrXDTJ49Uw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BECD2602F1;
        Mon, 17 Jun 2019 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560751851;
        bh=hm976eJArDfkwucpdPYJteQCcqFBN+pn5yhcfp+pTlI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VGRY2Y6vMshvBdzzEMVmUJdUOxDmtSkLMn+G1b8RduVXr+VWqnJNsxLNJeVPUzRNx
         Jrx4q6oJuGBRCchz/cZlQhNlZJS2zZYVNeRMb7vWr4QyjkWFnZEIQ1ETA5LjTUL4tx
         qOYE45z204VmWoE670ZZRLgYJTLgjPNYaAfKPT/I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BECD2602F1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 4/5] clk: qcom: clk-alpha-pll: Add support for Trion
 PLLs
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-5-vkoul@kernel.org>
 <c7be6307-51cd-46ce-8d1c-b464e510e3f7@codeaurora.org>
 <20190614054201.GA2962@vkoul-mobl>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <51ec56b7-a276-67e6-c196-ac80281c65e1@codeaurora.org>
Date:   Mon, 17 Jun 2019 11:40:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614054201.GA2962@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 6/14/2019 11:12 AM, Vinod Koul wrote:
> Hi Taniya,
> 
> On 13-06-19, 08:34, Taniya Das wrote:
>> Hi Vinod,
>>
>> The trion PLL needs to be configured before it is enabled. The PLL cannot
>> LOCK without the calibration.
>>
>> Could you please add "clk_trion_pll_configure()" function?
> 
> First it is not recommended to top post! Please reply inline.
> 
> Yes I did see that, I will check that. Is there any way to find PLL is
> configured or not? I want to avoid using inited variable as done in
> downstream.
> 

These PLLs which are controlled by High Level OS would not be configured 
and we should not rely on the configurations which are done previously 
for these PLLs.

> Thanks
> 
>> On 6/12/2019 2:47 PM, Vinod Koul wrote:
>>> From: Deepak Katragadda <dkatraga@codeaurora.org>
>>>
>>> Add programming sequence support for managing the Trion
>>> PLLs.
>>>
>>> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
>>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>>> [vkoul: Fix style and format issues
>>>     convert to use pll type infrastructure
>>>     remove unnecessary checks in code
>>>     remove unused code]
>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>> ---
>>>    drivers/clk/qcom/clk-alpha-pll.c | 228 +++++++++++++++++++++++++++++++
>>>    drivers/clk/qcom/clk-alpha-pll.h |   7 +
>>>    2 files changed, 235 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>> index 2c6773188761..30210f5c6726 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -32,6 +32,7 @@
>>>    # define PLL_LOCK_DET		BIT(31)
>>>    #define PLL_L_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_L_VAL])
>>> +#define PLL_CAL_L_VAL(p)	((p)->offset + (p)->regs[PLL_OFF_CAL_L_VAL])
>>>    #define PLL_ALPHA_VAL(p)	((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL])
>>>    #define PLL_ALPHA_VAL_U(p)	((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL_U])
>>> @@ -44,14 +45,17 @@
>>>    # define PLL_VCO_MASK		0x3
>>>    #define PLL_USER_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_USER_CTL_U])
>>> +#define PLL_USER_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_USER_CTL_U1])
>>>    #define PLL_CONFIG_CTL(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
>>>    #define PLL_CONFIG_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
>>> +#define PLL_CONFIG_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U11])
>>>    #define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
>>>    #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
>>>    #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
>>>    #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>>>    #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>>> +#define PLL_CAL_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
>>>    const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>>>    	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
>>> @@ -96,6 +100,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>>>    		[PLL_OFF_OPMODE] = 0x2c,
>>>    		[PLL_OFF_FRAC] = 0x38,
>>>    	},
>>> +	[CLK_ALPHA_PLL_TYPE_TRION] = {
>>> +		[PLL_OFF_L_VAL] = 0x04,
>>> +		[PLL_OFF_CAL_L_VAL] = 0x08,
>>> +		[PLL_OFF_USER_CTL] = 0x0c,
>>> +		[PLL_OFF_USER_CTL_U] = 0x10,
>>> +		[PLL_OFF_USER_CTL_U1] = 0x14,
>>> +		[PLL_OFF_CONFIG_CTL] = 0x18,
>>> +		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
>>> +		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
>>> +		[PLL_OFF_TEST_CTL] = 0x24,
>>> +		[PLL_OFF_TEST_CTL_U] = 0x28,
>>> +		[PLL_OFF_STATUS] = 0x30,
>>> +		[PLL_OFF_OPMODE] = 0x38,
>>> +		[PLL_OFF_ALPHA_VAL] = 0x40,
>>> +		[PLL_OFF_CAL_VAL] = 0x44,
>>> +	},
>>>    };
>>>    EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>>> @@ -120,6 +140,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>>>    #define FABIA_PLL_OUT_MASK	0x7
>>>    #define FABIA_PLL_RATE_MARGIN	500
>>> +#define TRION_PLL_STANDBY	0x0
>>> +#define TRION_PLL_RUN		0x1
>>> +#define TRION_PLL_OUT_MASK	0x7
>>> +
>>>    #define pll_alpha_width(p)					\
>>>    		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>>>    				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
>>> @@ -730,6 +754,130 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
>>>    	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
>>>    }
>>> +static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
>>> +				struct regmap *regmap)
>>> +{
>>> +	u32 mode_regval, opmode_regval;
>>> +	int ret;
>>> +
>>> +	ret = regmap_read(regmap, PLL_MODE(pll), &mode_regval);
>>> +	ret |= regmap_read(regmap, PLL_OPMODE(pll), &opmode_regval);
>>> +	if (ret)
>>> +		return 0;
>>> +
>>> +	return ((opmode_regval & TRION_PLL_RUN) && (mode_regval & PLL_OUTCTRL));
>>> +}
>>> +
>>> +static int clk_trion_pll_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>> +
>>> +	return trion_pll_is_enabled(pll, pll->clkr.regmap);
>>> +}
>>> +
>>> +static int clk_trion_pll_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>> +	struct regmap *regmap = pll->clkr.regmap;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = regmap_read(regmap, PLL_MODE(pll), &val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* If in FSM mode, just vote for it */
>>> +	if (val & PLL_VOTE_FSM_ENA) {
>>> +		ret = clk_enable_regmap(hw);
>>> +		if (ret)
>>> +			return ret;
>>> +		return wait_for_pll_enable_active(pll);
>>> +	}
>>> +
>>> +	/* Set operation mode to RUN */
>>> +	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
>>> +
>>> +	ret = wait_for_pll_enable_lock(pll);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Enable the PLL outputs */
>>> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
>>> +				 TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Enable the global PLL outputs */
>>> +	return regmap_update_bits(regmap, PLL_MODE(pll),
>>> +				 PLL_OUTCTRL, PLL_OUTCTRL);
>>> +}
>>> +
>>> +static void clk_trion_pll_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>> +	struct regmap *regmap = pll->clkr.regmap;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = regmap_read(regmap, PLL_MODE(pll), &val);
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	/* If in FSM mode, just unvote it */
>>> +	if (val & PLL_VOTE_FSM_ENA) {
>>> +		clk_disable_regmap(hw);
>>> +		return;
>>> +	}
>>> +
>>> +	/* Disable the global PLL output */
>>> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	/* Disable the PLL outputs */
>>> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
>>> +				 TRION_PLL_OUT_MASK, 0);
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	/* Place the PLL mode in STANDBY */
>>> +	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_STANDBY);
>>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>>> +}
>>> +
>>> +static unsigned long
>>> +clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>> +{
>>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>> +	struct regmap *regmap = pll->clkr.regmap;
>>> +	u32 l, frac;
>>> +	u64 prate = parent_rate;
>>> +
>>> +	regmap_read(regmap, PLL_L_VAL(pll), &l);
>>> +	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
>>> +
>>> +	return alpha_pll_calc_rate(prate, l, frac, ALPHA_REG_16BIT_WIDTH);
>>> +}
>>> +
>>> +static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +				     unsigned long *prate)
>>> +{
>>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>> +	unsigned long min_freq, max_freq;
>>> +	u32 l;
>>> +	u64 a;
>>> +
>>> +	rate = alpha_pll_round_rate(rate, *prate,
>>> +				    &l, &a, ALPHA_REG_16BIT_WIDTH);
>>> +	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
>>> +		return rate;
>>> +
>>> +	min_freq = pll->vco_table[0].min_freq;
>>> +	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
>>> +
>>> +	return clamp(rate, min_freq, max_freq);
>>> +}
>>> +
>>>    const struct clk_ops clk_alpha_pll_ops = {
>>>    	.enable = clk_alpha_pll_enable,
>>>    	.disable = clk_alpha_pll_disable,
>>> @@ -760,6 +908,15 @@ const struct clk_ops clk_alpha_pll_hwfsm_ops = {
>>>    };
>>>    EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
>>> +const struct clk_ops clk_trion_fixed_pll_ops = {
>>> +	.enable = clk_trion_pll_enable,
>>> +	.disable = clk_trion_pll_disable,
>>> +	.is_enabled = clk_trion_pll_is_enabled,
>>> +	.recalc_rate = clk_trion_pll_recalc_rate,
>>> +	.round_rate = clk_trion_pll_round_rate,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_trion_fixed_pll_ops);
>>> +
>>>    static unsigned long
>>>    clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>    {
>>> @@ -1053,6 +1210,77 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
>>>    	return (parent_rate / div);
>>>    }
>>> +static unsigned long
>>> +clk_trion_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>> +{
>>> +	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
>>> +	struct regmap *regmap = pll->clkr.regmap;
>>> +	u32 i, div = 1, val;
>>> +
>>> +	regmap_read(regmap, PLL_USER_CTL(pll), &val);
>>> +
>>> +	val >>= pll->post_div_shift;
>>> +	val &= PLL_POST_DIV_MASK(pll);
>>> +
>>> +	for (i = 0; i < pll->num_post_div; i++) {
>>> +		if (pll->post_div_table[i].val == val) {
>>> +			div = pll->post_div_table[i].div;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return (parent_rate / div);
>>> +}
>>> +
>>> +static long
>>> +clk_trion_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +				 unsigned long *prate)
>>> +{
>>> +	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
>>> +
>>> +	return divider_round_rate(hw, rate, prate, pll->post_div_table,
>>> +				  pll->width, CLK_DIVIDER_ROUND_CLOSEST);
>>> +};
>>> +
>>> +static int
>>> +clk_trion_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +			       unsigned long parent_rate)
>>> +{
>>> +	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
>>> +	struct regmap *regmap = pll->clkr.regmap;
>>> +	int i, val = 0, div, ret;
>>> +
>>> +	/*
>>> +	 * If the PLL is in FSM mode, then treat the set_rate callback
>>> +	 * as a no-operation.
>>> +	 */
>>> +	ret = regmap_read(regmap, PLL_MODE(pll), &val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (val & PLL_VOTE_FSM_ENA)
>>> +		return 0;
>>> +
>>> +	div = DIV_ROUND_UP_ULL(parent_rate, rate);
>>> +	for (i = 0; i < pll->num_post_div; i++) {
>>> +		if (pll->post_div_table[i].div == div) {
>>> +			val = pll->post_div_table[i].val;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return regmap_update_bits(regmap, PLL_USER_CTL(pll),
>>> +				  PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_SHIFT,
>>> +				  val << PLL_POST_DIV_SHIFT);
>>> +}
>>> +
>>> +const struct clk_ops clk_trion_pll_postdiv_ops = {
>>> +	.recalc_rate = clk_trion_pll_postdiv_recalc_rate,
>>> +	.round_rate = clk_trion_pll_postdiv_round_rate,
>>> +	.set_rate = clk_trion_pll_postdiv_set_rate,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_trion_pll_postdiv_ops);
>>> +
>>>    static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
>>>    				unsigned long rate, unsigned long *prate)
>>>    {
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
>>> index 66755f0f84fc..15f27f4b06df 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>>> @@ -13,22 +13,27 @@ enum {
>>>    	CLK_ALPHA_PLL_TYPE_HUAYRA,
>>>    	CLK_ALPHA_PLL_TYPE_BRAMMO,
>>>    	CLK_ALPHA_PLL_TYPE_FABIA,
>>> +	CLK_ALPHA_PLL_TYPE_TRION,
>>>    	CLK_ALPHA_PLL_TYPE_MAX,
>>>    };
>>>    enum {
>>>    	PLL_OFF_L_VAL,
>>> +	PLL_OFF_CAL_L_VAL,
>>>    	PLL_OFF_ALPHA_VAL,
>>>    	PLL_OFF_ALPHA_VAL_U,
>>>    	PLL_OFF_USER_CTL,
>>>    	PLL_OFF_USER_CTL_U,
>>> +	PLL_OFF_USER_CTL_U1,
>>>    	PLL_OFF_CONFIG_CTL,
>>>    	PLL_OFF_CONFIG_CTL_U,
>>> +	PLL_OFF_CONFIG_CTL_U1,
>>>    	PLL_OFF_TEST_CTL,
>>>    	PLL_OFF_TEST_CTL_U,
>>>    	PLL_OFF_STATUS,
>>>    	PLL_OFF_OPMODE,
>>>    	PLL_OFF_FRAC,
>>> +	PLL_OFF_CAL_VAL,
>>>    	PLL_OFF_MAX_REGS
>>>    };
>>> @@ -117,5 +122,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>    			     const struct alpha_pll_config *config);
>>>    void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>    				const struct alpha_pll_config *config);
>>> +extern const struct clk_ops clk_trion_fixed_pll_ops;
>>> +extern const struct clk_ops clk_trion_pll_postdiv_ops;
>>>    #endif
>>>
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>
>> --
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
