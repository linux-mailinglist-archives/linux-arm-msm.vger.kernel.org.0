Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDA6148DD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389571AbgAXSdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:33:14 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46384 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389846AbgAXSdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:33:14 -0500
Received: by mail-pf1-f194.google.com with SMTP id n9so1500143pff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M9K8Ws6PGDEAiuOC8pxYgV2G+nJuWk2QWvGQvZxz5Oc=;
        b=FD+f9onxUWkb2Png4FGOSt5OExc3OwaU4sEJH6qswZtGeve87cxt5AogJLd66OYnkc
         K1nWqy6Ki2sURw1rybL/NcFicb1yf6YY5OOTyXSDAqKshKgTuqL3wrpa8UgH9qkD7orx
         CyyOsGrjr/GwvC1fwWg9to7HquDEGph0e5Vqi6OOfmZa/ZlCRWOJEayWDAKuriH1X+1A
         Z1cAhnjg13rM8KguzNKpx1WoPdHXs77HduChTKWctNg7aV5Q7kZBlSEYdxluRcYAKzhF
         yUzeYZWCB+Noy3A4wEW/ex+hb2ex5vwWe3Yqc6qoaVB+zFcpXWyB0rO52KKN/LFV/+rV
         Cyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M9K8Ws6PGDEAiuOC8pxYgV2G+nJuWk2QWvGQvZxz5Oc=;
        b=LDMvhRRym/I/deSUS+CRrHCYpow/n7lZQYBSaPwOw/dsKg/WmdDg1Uelv4/B0RYMlz
         WOWiF+QEeNwCMIwD6ayfJRsnBI8VfvEg7sRu/TErqeNKbhXWXrrB1vBagEGybpxSXAfy
         XXmsrWtk7eomHS7w7SCiQ83HJjBCEYluLprfcj844z3JHzROGlgUIVU6AxUiaroKuaFW
         Tv7IKA+Gp/ez4Qra8bQrXRYI3qLHpVEHsw5L/jUd3rk9D4LDBV1qBfLkh/ek7vyw6A8h
         r2Ab6SGuU7gavgECJ/T4xJ64Nf5pTUHMkRVYyhI5r6pFDmUuPragXv+yAhbziDgT//lW
         ECGQ==
X-Gm-Message-State: APjAAAWV7o+/via9yxabfuomYb683jGct2j2FsFWmgH+nPFXqHR54sM8
        JBEStLH9q4QaRo+XMhsmkr8rQg==
X-Google-Smtp-Source: APXvYqyEuql70A3w9RtYWXqNwMOWyQce9+nGGvvbYnYxj1UINIwCPf4LTF6H4u/qJKPnQHIzIfA+ZQ==
X-Received: by 2002:aa7:98c7:: with SMTP id e7mr2937846pfm.230.1579890793726;
        Fri, 24 Jan 2020 10:33:13 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o134sm7299880pfg.137.2020.01.24.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:33:12 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:32:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: clk-alpha-pll: Refactor and cleanup trion
 PLL
Message-ID: <20200124183238.GV1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-4-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-4-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> The PLL run and standby modes are similar across the PLLs, thus rename
> and refactor the code accordingly.
> 
> Remove duplicate function for calculating the round rate of PLL and also
> update the trion pll ops to use the common function.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 71 +++++++++++++---------------------------
>  1 file changed, 22 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 7c2936d..1b073b2 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -134,15 +134,10 @@
>  #define PLL_HUAYRA_N_MASK		0xff
>  #define PLL_HUAYRA_ALPHA_WIDTH		16
>  
> -#define FABIA_OPMODE_STANDBY	0x0
> -#define FABIA_OPMODE_RUN	0x1
> -
> -#define FABIA_PLL_OUT_MASK	0x7
> -#define FABIA_PLL_RATE_MARGIN	500
> -
> -#define TRION_PLL_STANDBY	0x0
> -#define TRION_PLL_RUN		0x1
> -#define TRION_PLL_OUT_MASK	0x7
> +#define PLL_STANDBY		0x0
> +#define PLL_RUN			0x1
> +#define PLL_OUT_MASK		0x7
> +#define PLL_RATE_MARGIN		500
>  
>  #define pll_alpha_width(p)					\
>  		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
> @@ -765,7 +760,7 @@ static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
>  	if (ret)
>  		return 0;
>  
> -	return ((opmode_regval & TRION_PLL_RUN) && (mode_regval & PLL_OUTCTRL));
> +	return ((opmode_regval & PLL_RUN) && (mode_regval & PLL_OUTCTRL));
>  }
>  
>  static int clk_trion_pll_is_enabled(struct clk_hw *hw)
> @@ -795,7 +790,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
>  	}
>  
>  	/* Set operation mode to RUN */
> -	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
>  
>  	ret = wait_for_pll_enable_lock(pll);
>  	if (ret)
> @@ -803,7 +798,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
>  
>  	/* Enable the PLL outputs */
>  	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> -				 TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
> +				 PLL_OUT_MASK, PLL_OUT_MASK);
>  	if (ret)
>  		return ret;
>  
> @@ -836,12 +831,12 @@ static void clk_trion_pll_disable(struct clk_hw *hw)
>  
>  	/* Disable the PLL outputs */
>  	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> -				 TRION_PLL_OUT_MASK, 0);
> +				 PLL_OUT_MASK, 0);
>  	if (ret)
>  		return;
>  
>  	/* Place the PLL mode in STANDBY */
> -	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_STANDBY);
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>  	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>  }
>  
> @@ -849,33 +844,12 @@ static void clk_trion_pll_disable(struct clk_hw *hw)
>  clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  {
>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -	struct regmap *regmap = pll->clkr.regmap;
> -	u32 l, frac;
> -	u64 prate = parent_rate;
> -
> -	regmap_read(regmap, PLL_L_VAL(pll), &l);
> -	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
> -
> -	return alpha_pll_calc_rate(prate, l, frac, ALPHA_REG_16BIT_WIDTH);
> -}
> -
> -static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -				     unsigned long *prate)
> -{
> -	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -	unsigned long min_freq, max_freq;
> -	u32 l;
> -	u64 a;
> -
> -	rate = alpha_pll_round_rate(rate, *prate,
> -				    &l, &a, ALPHA_REG_16BIT_WIDTH);
> -	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
> -		return rate;
> +	u32 l, frac, alpha_width = pll_alpha_width(pll);
>  
> -	min_freq = pll->vco_table[0].min_freq;
> -	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
> +	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
>  
> -	return clamp(rate, min_freq, max_freq);
> +	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
>  }
>  
>  const struct clk_ops clk_alpha_pll_fixed_ops = {
> @@ -921,7 +895,7 @@ static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	.disable = clk_trion_pll_disable,
>  	.is_enabled = clk_trion_pll_is_enabled,
>  	.recalc_rate = clk_trion_pll_recalc_rate,
> -	.round_rate = clk_trion_pll_round_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_trion_fixed_pll_ops);
>  
> @@ -1088,14 +1062,14 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
>  		return ret;
>  
>  	/* Skip If PLL is already running */
> -	if ((opmode_val & FABIA_OPMODE_RUN) && (val & PLL_OUTCTRL))
> +	if ((opmode_val & PLL_RUN) && (val & PLL_OUTCTRL))
>  		return 0;
>  
>  	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
> +	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>  	if (ret)
>  		return ret;
>  
> @@ -1104,7 +1078,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_RUN);
> +	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
>  	if (ret)
>  		return ret;
>  
> @@ -1113,7 +1087,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
>  		return ret;
>  
>  	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> -				 FABIA_PLL_OUT_MASK, FABIA_PLL_OUT_MASK);
> +				 PLL_OUT_MASK, PLL_OUT_MASK);
>  	if (ret)
>  		return ret;
>  
> @@ -1143,13 +1117,12 @@ static void alpha_pll_fabia_disable(struct clk_hw *hw)
>  		return;
>  
>  	/* Disable main outputs */
> -	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), FABIA_PLL_OUT_MASK,
> -				 0);
> +	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
>  	if (ret)
>  		return;
>  
>  	/* Place the PLL in STANDBY */
> -	regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>  }
>  
>  static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
> @@ -1178,7 +1151,7 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>  	 * Due to limited number of bits for fractional rate programming, the
>  	 * rounded up rate could be marginally higher than the requested rate.
>  	 */
> -	if (rrate > (rate + FABIA_PLL_RATE_MARGIN) || rrate < rate) {
> +	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
>  		pr_err("Call set rate on the PLL with rounded rates!\n");
>  		return -EINVAL;
>  	}
> @@ -1227,7 +1200,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
>  	 * Due to a limited number of bits for fractional rate programming, the
>  	 * rounded up rate could be marginally higher than the requested rate.
>  	 */
> -	if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq)
> +	if (rrate > (cal_freq + PLL_RATE_MARGIN) || rrate < cal_freq)
>  		return -EINVAL;
>  
>  	/* Setup PLL for calibration frequency */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
