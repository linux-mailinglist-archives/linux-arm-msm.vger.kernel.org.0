Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC403148D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391317AbgAXSKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:10:14 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39140 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390926AbgAXSKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:10:14 -0500
Received: by mail-pg1-f195.google.com with SMTP id 4so1514495pgd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XCBGGNYfBCH7BJ+03SsqW1OQE87yKFpYTbTUE1RoAwQ=;
        b=qBvuvV0l6KIYyI1A4wNqaCpgeumrMByqCRhV6J+4MdDnjpyoQ7IJLIHe6eeTK10d7T
         2t4vbG7FzFfJ/+xt0hz9hxOxK2UxQU/K6/E9K7sSCLIUAwsP1niK523onHH0MXCgwwjv
         bPPLJPj+Gl+HOobYfJKl5vZXQ4ItmVuMG08rG70TbRuRxTSSdC/pj6NCjpDfmznCE786
         cynelBzOuOv7atjjWYEOwAvk/RDjBrdUAuqR1weYJy5R1oNKU9UIY3OMHS/PaXkXNnah
         qJWjfGzYkEm03h5we+bE2L6CcXgrURuBZm8lw3RYTR8g+cWeR1wu1Pu4N127Jd8uAxly
         bXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XCBGGNYfBCH7BJ+03SsqW1OQE87yKFpYTbTUE1RoAwQ=;
        b=VqcrdcfV+m1RRPTaVHIpfeMfIisCMArnmjbOiiQ+M0q7V+DE2ugEzy9yYveK5EgdOs
         fzc5aaL3JVX6iPGgd8j57WANU0iZ9ZeilhDQkQCcRKMell9/sR9zgPqTKiuMrVUmXYUK
         ZvDIopwZBg3PPsCerd95ibToRZVDiqbzRhfBtBQQDTwcHF38H3T2r8IWYqRKUE8TTBK+
         RUqqS0iU6g/PaiyAVpZZkdthTsKiAhwFZOSBUxnWoL3TnlU9ttMBV3x6OeObxa40zXHN
         bxqXNAPQZi+Fm9MII0KLsYf0K4BtABTd4eqLQ5W8mpEFTQ2cwSbPWKzSjgrGhf6XM6sV
         N6GA==
X-Gm-Message-State: APjAAAVdpsKSD4hTan+MlahwUEUD2n3u7bAyqnRCtLkmYgXoN3eulB3M
        zIUp8eA7WlwLSMDOMFq9L41nJ8ZraAQ=
X-Google-Smtp-Source: APXvYqz4ohlIdCY5C9kjnkjMMUsZo9niHNmEV3zB/P+OU+UI93BPAv/WHs/K5fHbMO+pbfSsb+7wIQ==
X-Received: by 2002:a62:4e42:: with SMTP id c63mr2158181pfb.86.1579889413402;
        Fri, 24 Jan 2020 10:10:13 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m128sm7010476pfm.183.2020.01.24.10.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:10:12 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:09:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] clk: qcom: rpmh: Add support for RPMH clocks on
 SM8250
Message-ID: <20200124180938.GQ1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> Add support for RPMH clocks on SM8250.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 593bfa4..0e45adf 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/clk-provider.h>
> @@ -404,6 +404,28 @@ static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
>  	.num_clks = ARRAY_SIZE(sc7180_rpmh_clocks),
>  };
>  
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> +
> +static struct clk_hw *sm8250_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> +	.clks = sm8250_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -490,6 +512,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>  	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>  	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
> +	{ .compatible = "qcom,sm8250-rpmh-clk",  .data = &clk_rpmh_sm8250},

Double space before .data

Apart from that
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
