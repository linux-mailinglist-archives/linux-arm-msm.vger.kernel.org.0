Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7073D7C0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 19:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhG0RTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 13:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhG0RTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 13:19:04 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7284C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 10:19:03 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e5so16888627ljp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EMKWXZtE5RzPWua1cq/oXCQ10pVyhkDWH2JkBv8IzRE=;
        b=WDylNfEoqUnBJgtw5pd2YnP89bIdjwjaAHabyeAKLlcxUC35meTxrsF9izCvbb5Icw
         7VPug7fz6lRT5Q2DPJRTS4rqbbAd/whmzeu0r6ho8LHAUHjN5m8DO1EmORbCTQXGF7cf
         vJoeBKx1gi63AHPmkm4/4TwsArRZ5NP6TtQLpH4HTM2nxgN6MOBj/VIqFSBug1sCGK69
         zxl0NuvTI+g0EOt9VSIMVje0CxHI570XIeqt/nouCUSF9X+oHkTUykWu6GbiijAEJQoL
         2s84nezCRx+bjmt6OAcKVdryjdZvni4JTVQ7+X+QpfppmCLiO1TFEt9n/ImLAjydxX8u
         wz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EMKWXZtE5RzPWua1cq/oXCQ10pVyhkDWH2JkBv8IzRE=;
        b=UtXLiCDZHvsxsxMLasZ9sHvh2f1bjw9Z9KPK4JgggmUYXLt4RhkgbPWvcLcM9LRNm4
         K0s3uRf5qrFTwQD7mUlZ2pcm+5TslKYEr/I6SLqGzTLu2eQmPG4qUJwgFyCOrDNxtki6
         irzofQrGXJnL9brkd/hp+vWVEKlqKC+fXOHUdDzL7/0ZnWAS6esUMPyruii9mtp7L/vg
         w7XHli5yA+ztbrP1vTJlKzgwrh8KZUhp7FiZ+0Vo9Eav9StJTsBe3Se7xLrPrIaP4jYJ
         QMD79MHPsFGJ8th9Fy/RR7NwRFNc6g2wS7+K8kj6bJWpZ2OzN1fC1IzP1rD7Jhl0XqcM
         Rg1Q==
X-Gm-Message-State: AOAM533K0hXl+wJThsSqWJ+AsagXQDwI2tsnyax8LJ3YSH4H7R8bmK0N
        zeFJkB+kTJYJ/oI1CXfNWEWt9g==
X-Google-Smtp-Source: ABdhPJyRpUWScg+dO+hqpBI6/lrusL5mh299ENzytzR1KCmx8DwDzev4pUnPm/k7xL1JggxRjD7BOg==
X-Received: by 2002:a05:651c:10a2:: with SMTP id k2mr16075335ljn.89.1627406342156;
        Tue, 27 Jul 2021 10:19:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1sm373727lfb.300.2021.07.27.10.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 10:19:01 -0700 (PDT)
Subject: Re: [PATCH] clk: qcom: dispcc-sm8250: Add additional parent clocks
 for DP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210721224610.3035258-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <963af972-5061-5375-aee3-34c0571975d8@linaro.org>
Date:   Tue, 27 Jul 2021 20:19:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721224610.3035258-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/07/2021 01:46, Bjorn Andersson wrote:
> The clock controller has two additional clock source pairs, in order to
> support more than a single DisplayPort PHY. List these, so it's possible
> to describe them all.
> 
> Also drop the unnecessary freq_tbl for the link clock sources, to allow
> these parents to be used.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index 601c7c0ba483..bf9ffe1a1cf4 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -26,6 +26,10 @@ enum {
>   	P_DISP_CC_PLL1_OUT_MAIN,
>   	P_DP_PHY_PLL_LINK_CLK,
>   	P_DP_PHY_PLL_VCO_DIV_CLK,
> +	P_DPTX1_PHY_PLL_LINK_CLK,
> +	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
> +	P_DPTX2_PHY_PLL_LINK_CLK,
> +	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
>   	P_EDP_PHY_PLL_LINK_CLK,
>   	P_EDP_PHY_PLL_VCO_DIV_CLK,
>   	P_DSI0_PHY_PLL_OUT_BYTECLK,
> @@ -98,12 +102,20 @@ static const struct parent_map disp_cc_parent_map_0[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_DP_PHY_PLL_LINK_CLK, 1 },
>   	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> +	{ P_DPTX1_PHY_PLL_LINK_CLK, 3 },
> +	{ P_DPTX1_PHY_PLL_VCO_DIV_CLK, 4 },
> +	{ P_DPTX2_PHY_PLL_LINK_CLK, 5 },
> +	{ P_DPTX2_PHY_PLL_VCO_DIV_CLK, 6 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_0[] = {
>   	{ .fw_name = "bi_tcxo" },
>   	{ .fw_name = "dp_phy_pll_link_clk" },
>   	{ .fw_name = "dp_phy_pll_vco_div_clk" },
> +	{ .fw_name = "dptx1_phy_pll_link_clk" },
> +	{ .fw_name = "dptx1_phy_pll_vco_div_clk" },
> +	{ .fw_name = "dptx2_phy_pll_link_clk" },
> +	{ .fw_name = "dptx2_phy_pll_vco_div_clk" },
>   };
>   
>   static const struct parent_map disp_cc_parent_map_1[] = {
> @@ -269,20 +281,11 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
>   	},
>   };
>   
> -static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] = {
> -	F(162000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(270000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(540000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(810000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	{ }
> -};
> -
>   static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
>   	.cmd_rcgr = 0x220c,
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_0,
> -	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_link1_clk_src",
>   		.parent_data = disp_cc_parent_data_0,
> @@ -296,7 +299,6 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_0,
> -	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_link_clk_src",
>   		.parent_data = disp_cc_parent_data_0,
> 


-- 
With best wishes
Dmitry
