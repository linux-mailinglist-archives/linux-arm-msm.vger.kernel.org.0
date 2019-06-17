Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D10B64795E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 06:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfFQE1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 00:27:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37093 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfFQE1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 00:27:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so4934246pfa.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 21:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5qgzRnTwZ7FtFwZOU+qTtQKChjBDOB5x4Llf0yxx6b8=;
        b=H/R982RwyR0I6XYbqdeqJDv1GUYVOIzWAfsvHLzIm/e/jZZZcXvLRyuPiowvWP368J
         GovOR51IK3hRrS9xCpj/xwaJd7jORnXpuS8zYaBwQI07YHFwmprSWSjXytg7+APpYxKK
         Pj3M8OB2aq7cmczvjKvUEen5RKi+B/F1UZcfqkXbDpXbN2JrtsPGmYLoEvm5CzUNDOj5
         QemIwmCj9EjD5M2LGX6O8kctyGv9HLsKu7hhUxON8/tZnW0V1YS9bZ8pwfKTI3Qhz0nM
         SQXuzUrRt/KSHcxcUumBmnPe7X+Kx023NDloZaPWTN4H5uMVEWrrQPsRraa4tvbOpmtX
         VVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5qgzRnTwZ7FtFwZOU+qTtQKChjBDOB5x4Llf0yxx6b8=;
        b=FNFT/PDgG9sgOltrI18tXTbDZz8V0X8BrYS0fFjrm40zDuRiltvCoKOb/e0eUmHQX+
         CHZHD3wwnK7F9TOS5oLkQv3Cix9ydGcadtg541Zg5wRSk72SbovHsoTUZJqfnI2yvQm3
         IIpR+cR5Iqoh9+eqVO24EvEIckNoQQ6+qlCgLrhfRDvjmNt8OLIoBnExRH9kFIWVtbOV
         agqtcuuPhkjzfo9Ps5fgjsMOqzLu6/iisnLFv4vED1CuOOR4pW6kZBUhPwqRAPlU0l2r
         S4L95XsWRrUCeTBWacVGuGTsAs3pTIyiXy+U60mR31PLXWsHBOEfredn/Pr+MYXLPALo
         VsMA==
X-Gm-Message-State: APjAAAW28q4yeW/c1XsEo0YqTUfpjEnjbCb//Pw3qi0jYBDMyDwbiAzz
        CMoTCfYQftP7DsfZEwsSMRx6Ww==
X-Google-Smtp-Source: APXvYqwozCNH33lvb2buafYwWs0k3/dkAS5T1YAfsM8xG7pjgIEkQGCh0uZcOBUNb6wTCKDL4bKVPg==
X-Received: by 2002:a63:1208:: with SMTP id h8mr45853756pgl.377.1560745656729;
        Sun, 16 Jun 2019 21:27:36 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p65sm11149648pfp.58.2019.06.16.21.27.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:27:36 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:28:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190617042825.GG750@tuxbook-pro>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612091722.9377-3-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:

> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index b48707693ffd..2c6773188761 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1036,11 +1036,6 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
>  	u32 i, div = 1, val;
>  	int ret;
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
>  	if (ret)
>  		return ret;
> @@ -1063,11 +1058,6 @@ static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
>  {
>  	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	return divider_round_rate(hw, rate, prate, pll->post_div_table,
>  				pll->width, CLK_DIVIDER_ROUND_CLOSEST);
>  }
> @@ -1089,11 +1079,6 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
>  	if (val & PLL_VOTE_FSM_ENA)
>  		return 0;
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	div = DIV_ROUND_UP_ULL(parent_rate, rate);
>  	for (i = 0; i < pll->num_post_div; i++) {
>  		if (pll->post_div_table[i].div == div) {
> -- 
> 2.20.1
> 
