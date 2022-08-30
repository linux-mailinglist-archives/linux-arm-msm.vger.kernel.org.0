Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989545A5B11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 07:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiH3FZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 01:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiH3FZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 01:25:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB24A248C8;
        Mon, 29 Aug 2022 22:25:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70D4A612D6;
        Tue, 30 Aug 2022 05:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B15AC433C1;
        Tue, 30 Aug 2022 05:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661837130;
        bh=Hh7bnQCDCSt3C486NoFQsf6r4Qajsoy/eBJ7UtkwRks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YNjQjEGEtHM2qpGA60LXoviJw2eA21I3I0I3IFRxGEJ+HJjBDIMAyxdNb3ORcHKti
         IKZzUubUKT5V29hXFm6xVIpsX0fThNaXjtGRXtlRCRKZLaY4eP4c332iyEvL0jd1qu
         KnAcJJPso3THYXjMzvpvniqLZauuJ3U3NbZ+8yw3ngeA/kjNa/eoqw8O23GBk982Sz
         AiW+ua20YzlKDT27RW3NshTLut7938c5Jy4ew3Qk72UbzkUqX2gNtvwa6/QEp+AtvH
         Au/JZ3YmMSKowQJSwV8j2ZTmRnrgt5kPVPNocUHHv+lw+CeI2wGvLMZDsM+0e0I74e
         f9WPLWbFXe/lw==
Date:   Tue, 30 Aug 2022 10:55:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: asm9260: use new helper for fixed rate clock
 creation
Message-ID: <Yw2fRVsnkHYhcmSy@matsya>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
 <20220708135450.2845810-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708135450.2845810-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-07-22, 16:54, Dmitry Baryshkov wrote:
> The __clk_hw_register_fixed_rate() is an internal API, which is better
> not to be called directly. Add new helper to create fixed rate clocks
> using parent clock accuracy.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/clk-asm9260.c    |  6 ++----
>  include/linux/clk-provider.h | 14 ++++++++++++++
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
> index bacebd457e6f..0609b661ff5a 100644
> --- a/drivers/clk/clk-asm9260.c
> +++ b/drivers/clk/clk-asm9260.c
> @@ -276,10 +276,8 @@ static void __init asm9260_acc_init(struct device_node *np)
>  
>  	/* TODO: Convert to DT parent scheme */
>  	ref_clk = of_clk_get_parent_name(np, 0);
> -	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
> -			ref_clk, NULL, NULL, 0, rate, 0,
> -			CLK_FIXED_RATE_PARENT_ACCURACY);
> -
> +	hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, ref_clk,
> +							0, rate);

Should this not be described in DT instead, resolve the todo :-)

>  	if (IS_ERR(hw))
>  		panic("%pOFn: can't register REFCLK. Check DT!", np);
>  
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 72d937c03a3e..659ef5a77246 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
>  	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
>  				     (parent_data), NULL, (flags),	      \
>  				     (fixed_rate), (fixed_accuracy), 0)
> +/**
> + * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
> + * the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @fixed_rate: non-adjustable clock rate
> + */
> +#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_name,    \
> +						   flags, fixed_rate)	      \
> +	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
> +				     NULL, NULL, (flags), (fixed_rate), 0,    \
> +				     CLK_FIXED_RATE_PARENT_ACCURACY)
>  
>  void clk_unregister_fixed_rate(struct clk *clk);
>  void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
> -- 
> 2.35.1

-- 
~Vinod
