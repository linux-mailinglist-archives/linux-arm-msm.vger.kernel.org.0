Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36E83A9F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 17:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbhFPPfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 11:35:15 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:42855 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbhFPPfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 11:35:15 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 92DB13F5F8;
        Wed, 16 Jun 2021 17:33:06 +0200 (CEST)
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <780fd0b4-fffc-5afb-e546-86ba75bad9f9@somainline.org>
Date:   Wed, 16 Jun 2021 17:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616141107.291430-3-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 16.06.2021 16:10, Robert Foss wrote:
> These changes are ported from the downstream driver, and are used on SM8350
> for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg.h  | 4 ++++
>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 99efcc7f8d88..a1f05281d950 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -149,6 +149,10 @@ struct clk_rcg2 {
>  	const struct freq_tbl	*freq_tbl;
>  	struct clk_regmap	clkr;
>  	u8			cfg_off;
> +	u8			flags;
> +#define FORCE_ENABLE_RCG	BIT(0)
> +#define HW_CLK_CTRL_MODE	BIT(1)
> +#define DFS_SUPPORT		BIT(2)
>  };
>  
>  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 42f13a2d1cc1..ed2c9b6659cc 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>  	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>  	if (rcg->mnd_width && f->n && (f->m != f->n))
>  		cfg |= CFG_MODE_DUAL_EDGE;
> +	if (rcg->flags & HW_CLK_CTRL_MODE)
> +		cfg |= CFG_HW_CLK_CTRL_MASK;
> +
>  	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
>  					mask, cfg);
>  }

What about code for handling other flags? If it's not a part of the series,

I don't think it makes sense to define them. Or perhaps you sent the

wrong revision?


Konrad

