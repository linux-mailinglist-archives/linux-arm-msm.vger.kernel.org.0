Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A6969FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 02:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731734AbfGPAIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 20:08:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42343 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfGPAIt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 20:08:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8167268pff.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2019 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kk3hDSABrXyhJx+RdNn1+ivrgUHefpZGD1c1iLoa0N0=;
        b=xlCtHr7+WOhi6zpv0qk1hlbCtEAcsLff6PlIV7Hgg1x3nX99k9m6kINeaLrh3G6WXm
         RCGBjjJBeJP5FJBj0dQRSebDVJ1dfT2tA8UWCehnU+FDYu/oCl8q68U9+RbECeCJsRFv
         UmDLN5tXD8p+7ytzu5Bh/TaUmhywBAQE39ysW/A7JTpxMdjhTIzKDaq5AbI9dnfAPqTo
         MmveLbaO9wQpgTWVxxV845DuaDCVSckWQ+pdu0nxzG5qy8yem4LPGmI0cqOC2ckRDc22
         l51WZ9B4xYiTYeHPnqX1bC9UMLv6Zc3aK3G6sK5kWVLoON4akqQ9F4n0CvXXZYMqq8J4
         YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kk3hDSABrXyhJx+RdNn1+ivrgUHefpZGD1c1iLoa0N0=;
        b=pk8MJYINXNPgTQIWIc1Umq+xSoGCAIcDO3nAazjrkM2NZwslA5dxrHTDVi5XIi3Zad
         YM1j13PUxJQ0uakLYL/0Nqmfzt6kD0UYILa6pqYTyHwlrEuPIHIS61P2mrT3cMJnE6Rk
         +zw3F1dgrKYdwamvjRzR408x/QLobHTjucHdTPUHIMJwg0m72+Xoj316FSA2evtaMaPt
         hIVpKeQhcd4dv6I25w2p23zOnHTTWXDTjPpSPO0slKugaI0m8cZ5JsnPZkGENOvSPcFZ
         qtnnvZMcOG66NapjiZhJ9IpujXNDfyUGjB92K0hdvlkY4kfUH9C9yGa/wQSUazobpBFs
         mU+w==
X-Gm-Message-State: APjAAAXQTY0zaot55gG4S4h30P2v+/QHE93v2EyzNog4cP7MF8gdFXIU
        elrpFDUTrhHJZemzIGc00fpQnw==
X-Google-Smtp-Source: APXvYqxmRb5etB4ZLrSsh/m4KCj26VPMF/xZbe6AYHNcjVcNxM46c+cfVSVKO6XPvzqIr43bQjrWYw==
X-Received: by 2002:a63:6904:: with SMTP id e4mr2421242pgc.321.1563235728962;
        Mon, 15 Jul 2019 17:08:48 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q126sm19513616pfq.123.2019.07.15.17.08.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 17:08:48 -0700 (PDT)
Date:   Mon, 15 Jul 2019 17:08:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190716000846.GK30636@minitux>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625063140.17106-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 Jun 23:31 PDT 2019, Vinod Koul wrote:

> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.

s/reply/rely/

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
