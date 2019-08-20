Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C02C95679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 07:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfHTFIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 01:08:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42922 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbfHTFIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 01:08:02 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so2103854plp.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 22:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X0RALe/oCLLbFYKOz+mFdGYTmz4Bg6uXMn9I91aUmVQ=;
        b=yoStAr6ymurtV2ikx4ft95lv5WFYdKXAOmLgGdPFwmAIKWHkr3/vRYJ6g6fMOGVnvf
         zBisfnxERsNRNYh51te6OMltVF+PeFfr0P/2MvaO77Kp6K0xraqJAlCm+d/hHE4jfBl+
         ZYnTrek4iwdH9zr7nZSK8L+FFYpvgVjVDlsSBKW5QGeIOv5aEe2FGKj5mxqV+4VS14O/
         buL2/RKNI2B8mu6F1e+c+5Gmw4yMgOs4nP4rSdeNLEyxWOWOjiN7zmOvopCpjuYqmrFu
         E8TMwa9NxV2zMdXcQGf1CI78FM7zGMkd7R3tnkMXT15CZDcWr/8TLvVmQ8ZKMh02Lrm9
         LRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X0RALe/oCLLbFYKOz+mFdGYTmz4Bg6uXMn9I91aUmVQ=;
        b=AMaf8RLfyPu4STK+Pfl/1MVmcJaFHT5/YKPDJRyH7OtT9NR4Z16XU2cj1o+Y/kAIQG
         RTGPCoCpLqWSOqlbO+x/l5wGkgv587N31tX2trP1K9el+G2tDX7WqF6qVWD0yuLCEp2R
         z1RAG32M5FYT2x/kEZDzs4NxNW1YUDDL5N+nkeryLv9HDcMaLLWxVsGo88lOKxfXjr4S
         fE43EBvU3u5tgiRO7Kia2kWaFwEaTtpxrR3l304BizgZaVFRN2KawTm4zhwqK1LFyAIU
         8wjntGlZdfnNPtkl4l6qksXVg2pVr8mZCWDz2vw1+GRo9DvaL0Rh7I4d66Qyi19VVnOz
         ypIQ==
X-Gm-Message-State: APjAAAXL3oFwJsi2MxcwKDKQ4Sm/hqa8w+z4A6di1o0on5X8mSWYGP2E
        9j5Z+Bz/RnvCu0WxWFniZTqYzg==
X-Google-Smtp-Source: APXvYqxnbtpYfHf4DI7CzWwEfyLBSbbPObmlVar90y00ULixju4JrpyOcJKYoSXXPw0x1oXHjOOnAQ==
X-Received: by 2002:a17:902:288b:: with SMTP id f11mr42667plb.13.1566277681833;
        Mon, 19 Aug 2019 22:08:01 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y68sm8288666pfy.25.2019.08.19.22.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 22:08:01 -0700 (PDT)
Date:   Mon, 19 Aug 2019 22:09:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Message-ID: <20190820050944.GL26807@tuxbook-pro>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819073947.17258-5-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:

> Add support for rpmh clocks found in SM8150
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 16d689e5bb3c..3b304a3fb5c9 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -374,6 +374,32 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>  	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
>  };
>  
> +DEFINE_CLK_RPMH_ARC(sm8150, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sm8150, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(sm8150, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> +
> +static struct clk_hw *sm8150_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sm8150_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sm8150_bi_tcxo_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sm8150_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sm8150_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sm8150_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sm8150_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &sm8150_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sm8150_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sm8150_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sm8150_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]		= &sm8150_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &sm8150_rf_clk3_ao.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> +	.clks = sm8150_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
> +};

Maybe an empty line here?

>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -453,6 +479,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> +	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> -- 
> 2.20.1
> 
