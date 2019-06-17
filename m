Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3078147966
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 06:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbfFQEgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 00:36:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44302 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQEgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 00:36:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so4925879pfe.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 21:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LcVfoyx+IKUrcAoeMajo6YLem6IoPuW7TnJ7S24MVbI=;
        b=g0D7EoGxu+ZBE2XnqEGzHo+7FUECWykhUzh4IG5vbtgoaqZvr58pnKxaGSfcNKcYgO
         pLj7JMBVHqIajig6Cs0dFTNJ61WyRdpxs9qxmByWocFnSW5JF1UMirAXTSDiATD00ryI
         PCFSSFH9NtM4sLjJDDs460qF2Pxrj15OFC2CtMGDIIZtrT6XAiDG7M9slwaOqKRAj3eO
         WxfZigtUKWfgjPtflZAiuTNHIOkNfDIZfUB8C5UD9NczksrTN11lFiFASTgUbET20fFC
         v83ptHtINIVo6Eg0d6cOEL63ZmxepxU6rkPJKxpKPibf/99frwz1zbhzQQnctPCMitK+
         Qxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LcVfoyx+IKUrcAoeMajo6YLem6IoPuW7TnJ7S24MVbI=;
        b=jaYJWOHmjyWhw9B7qKvsRGys0sJrE+mE6FCdXIaVWnxDRXX7U/e4GQ641A01FHVUGt
         ahWzbDcp4fvdysJdzDWrfp1YSw+gt5L4AN6T3Hb2Dr6IVqYAzoxBmqzQVkPF6tAF31Uz
         TM3dvEZy2V9FFarNplY59fxqu6H2tOTYbro/EmJDgt+Fd6W9CIP8nD+k9t8vXgYrtnw0
         D2F88fflNQcRKdH8ut5TmlAWMmgaMmJLJSqcYYN9m84rrwzwEweSJGhE+mty4BDoLkwm
         CwWE1C5c3Iplu6Wb1IkIZS10ldHYkLX+hXl2LLzlnBuJBaK4geuexAfTscR5QTtzFDnz
         EdLA==
X-Gm-Message-State: APjAAAUp8W1zCvKXO8MXt3sTsbb1A7iAQpNYITmE7ezSSvqy+2m9n7r1
        UPazczrGIsuQR+VYtSWiGigN0Q==
X-Google-Smtp-Source: APXvYqwaXT1vWRfaUZBa3iao8TmQH3I7WTJSG1f7j0Qp94C/dS2RPdnTcYlCqDXB01aPXlXAre9TWw==
X-Received: by 2002:a63:6cc3:: with SMTP id h186mr46635775pgc.292.1560746205933;
        Sun, 16 Jun 2019 21:36:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c9sm11004164pfn.3.2019.06.16.21.36.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:36:45 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:37:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
Message-ID: <20190617043734.GH750@tuxbook-pro>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612091722.9377-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:

> We have couple of instances in the driver with unnecessary
> u64 casts, drop them.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 0ced4a5a9a17..b48707693ffd 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -832,7 +832,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
>  	int div;
>  
>  	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
> -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
> +	div = DIV_ROUND_UP_ULL(parent_rate, rate) - 1;

Afaict DIV_ROUND_UP_ULL() will first add "parent_rate" and "rate" and
then stash this in a unsigned long long and do the division. So what
happens if parent_rate + rate > 32 bits on a 32-bit target?

(Shouldn't there be a cast of (ll) in the macro to ULL?)

Regards,
Bjorn

>  
>  	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
>  				  PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_SHIFT,
> @@ -1094,7 +1094,7 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
>  		return -EINVAL;
>  	}
>  
> -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	div = DIV_ROUND_UP_ULL(parent_rate, rate);
>  	for (i = 0; i < pll->num_post_div; i++) {
>  		if (pll->post_div_table[i].div == div) {
>  			val = pll->post_div_table[i].val;
> -- 
> 2.20.1
> 
